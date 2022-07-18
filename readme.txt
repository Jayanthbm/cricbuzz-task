The task is built using the following technologies

Node JS wih Express for the backend
Mysql for the database

To run the app

  First install the dependencies using npm install
  Then run the app using node app.js

  The app will be available at http://localhost:3000

The app will have the following endpoints

  /api/teamDetails - GET - returns all teams in the database
  /api//api/teamDetails/:id - GET - returns a team Details with the given id
  /api/storyDetails/:id - GET - returns a story Details with the given id
  /api/albumDetails/:id - GET - returns all photos for the given album id

The app will have the following database tables
  1. teams
  2. stories
  3. albums
  4. photos
  5. authors
  6. matches
  7. videos

The dump of the database is available at root/cricbuzz.sql

Output of Each Endpoint is stored in the root/output folder
