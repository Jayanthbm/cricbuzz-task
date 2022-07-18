const express = require("express");
const app = express();
const mysql = require("mysql2/promise");
const port = process.env.PORT || 3000;

const APPURL = `http://localhost:${port}/api`;

// Mysql connection
async function connect() {
  try {
    const connection = await mysql.createConnection({
      host: "localhost",
      user: "root",
      database: "cricbuzz",
    });
    return connection;
  } catch (error) {
    console.log("Error connecting to database: ", error);
  }
}

async function getTeamNameById(id) {
  const connection = await connect();
  const [rows] = await connection.execute("SELECT * FROM teams WHERE id = ?", [
    id,
  ]);
  return rows[0].name;
}

async function getAuthorNameById(id) {
  const connection = await connect();
  const [rows] = await connection.execute(
    "SELECT * FROM authors WHERE id = ?",
    [id]
  );
  return rows[0].name;
}

// Get all teams
app.get("/api/teamDetails", async (req, res) => {
  try {
    const connection = await connect();
    const [rows] = await connection.execute(
      "SELECT id,name FROM teams ORDER BY id ASC"
    );
    let result = rows;
    for (let i = 0; i < result.length; i++) {
      result[i].teamDetails = APPURL + "/teamDetails/" + result[i].id;
      delete result[i].id;
    }
    res.send(result);
  } catch (error) {
    console.log("Error in fetching team details", error);
    return res.status(500).send({
      message: "Error in fetching team details",
    });
  }
});

// Get Team Details By Id
app.get("/api/teamDetails/:id", async (req, res) => {
  let id = req.params.id;
  let storylimit = req.query.storylimit || 4;
  let videolimit = req.query.videolimit || 4;
  let albumlimit = req.query.albumlimit || 4;
  const teamName = await getTeamNameById(id);
  const connection = await connect();
  let result = {};
  Object.assign(result, { teamName });
  let [stories] = await connection.execute(
    "SELECT id,title,miniContent,thumbnail,createdAt,authorId,teamId FROM stories WHERE teamId = ? LIMIT ?",
    [id, storylimit]
  );
  for (let i = 0; i < stories.length; i++) {
    let authorName = await getAuthorNameById(stories[i].authorId);
    delete stories[i].authorId;
    delete stories[i].teamId;
    stories[i].authorName = authorName;
    stories[i].fullContent = APPURL + "/storyDetails/" + stories[i].id;
    //Converting date to readable format
    stories[i].createdAt = new Date(stories[i].createdAt).toDateString();
  }
  Object.assign(result, { stories });
  let [videos] = await connection.execute(
    "SELECT * FROM videos WHERE teamId = ? LIMIT ?",
    [id, videolimit]
  );
  for (let i = 0; i < videos.length; i++) {
    videos[i].isPremium = videos[i].isPremium == 1 ? true : false;
    videos[i].createdAt = new Date(stories[i].createdAt).toDateString();
    delete videos[i].teamId;
  }
  Object.assign(result, { videos });
  let [albums] = await connection.execute(
    "SELECT * FROM albums WHERE teamId = ? LIMIT ?",
    [id, albumlimit]
  );
  for (let i = 0; i < albums.length; i++) {
    albums[i].allPhotos = APPURL + "/albumDetails/" + albums[i].id;
    albums[i].createdAt = new Date(stories[i].createdAt).toDateString();
  }
  Object.assign(result, { albums });
  let [matches] = await connection.execute(
    "SELECT * FROM matches WHERE teamId = ? ORDER BY date ASC;",
    [id]
  );
  for (let i = 0; i < matches.length; i++) {
    let date = new Date(matches[i].date);
    matches[i].date = date.toDateString() + " " + date.toLocaleTimeString();
    delete matches[i].teamId;
  }
  Object.assign(result, { matches });
  res.send(result);
});

// Full story By Id
app.get("/api/storyDetails/:id", async (req, res) => {
  try {
    const connection = await connect();
    const [rows] = await connection.execute(
      "SELECT * FROM stories WHERE id = ?",
      [req.params.id]
    );
    let result = rows[0];
    let authorName = await getAuthorNameById(result.authorId);
    result.authorName = authorName;
    result.createdAt = new Date(result.createdAt).toDateString();
    delete result.authorId;
    delete result.teamId;
    delete result.miniContent;
    res.send(result);
  } catch (error) {
    console.log("Error in fetching story details", error);
    return res.status(500).send({
      message: "Error in fetching story details",
    });
  }
});

// Get all photos by album id
app.get("/api/albumDetails/:id", async (req, res) => {
  try {
    const connection = await connect();
    const limit = req.query.limit || 10;
    const [rows] = await connection.execute(
      "SELECT * FROM photos WHERE albumId = ? ORDER BY createdAt DESC LIMIT ?",
      [req.params.id, limit]
    );
    let result = rows;
    for (let i = 0; i < result.length; i++) {
      result[i].createdAt = new Date(result[i].createdAt).toDateString();
      delete result[i].albumId;
    }
    res.send(result);
  } catch (error) {
    console.log("Error in fetching photos", error);
    return res.status(500).send({
      message: "Error in fetching photos",
    });
  }
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
