-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 18, 2022 at 07:52 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cricbuzz`
--

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `teamId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `title`, `thumbnail`, `createdAt`, `teamId`) VALUES
(1, 'England vs India, 3rd ODI', 'https://www.cricbuzz.com/a/img/v1/300x170/i1/c239296/england-vs-india-3rd-odi.jpg', '2022-07-18 17:02:35', 1),
(2, 'England vs India, 2nd ODI, Lord\'s', 'https://www.cricbuzz.com/a/img/v1/300x170/i1/c239004/england-vs-india-2nd-odi-lor.jpg', '2022-07-18 17:02:35', 1);

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`) VALUES
(1, 'Jayanth'),
(2, 'Vijay Tagore');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `venue` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `team1` varchar(15) NOT NULL,
  `team2` varchar(15) NOT NULL,
  `teamId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `title`, `venue`, `date`, `team1`, `team2`, `teamId`) VALUES
(1, '1st ODI', 'Port of Spain, Trinidad ', '2022-07-22 13:30:10', 'WI', 'IND', 1),
(2, '2nd ODI', 'Port of Spain, Trinidad ', '2022-07-24 13:30:10', 'WI', 'IND', 1),
(3, '2nd ODI', 'Port of Spain, Trinidad ', '2022-07-27 13:30:10', 'WI', 'IND', 1);

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `albumId` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `title`, `image`, `albumId`, `createdAt`) VALUES
(1, 'The returning Siraj picked up two wickets in just the second over of the game.', 'https://www.cricbuzz.com/a/img/v1/650x0/i1/c239296/the-returning-siraj-picked-up.jpg', 1, '2022-07-18 17:26:06'),
(2, 'Jason Roy counterattacked to rescue England.', 'https://www.cricbuzz.com/a/img/v1/650x0/i1/c239302/jason-roy-counterattacked-to-r.jpg', 1, '2022-07-18 17:26:06'),
(3, 'India opted to field first.', 'https://www.cricbuzz.com/a/img/v1/650x0/i1/c239004/india-opted-to-field-first.jpg', 2, '2022-07-18 17:27:30'),
(4, 'Hardik Pandya got India the first breakthrough.', 'https://www.cricbuzz.com/a/img/v1/650x0/i1/c239001/hardik-pandya-got-india-the-fi.jpg', 2, '2022-07-18 17:27:30');

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `miniContent` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `authorId` int(11) DEFAULT NULL,
  `tags` varchar(255) NOT NULL,
  `teamId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stories`
--

INSERT INTO `stories` (`id`, `title`, `miniContent`, `content`, `thumbnail`, `createdAt`, `authorId`, `tags`, `teamId`) VALUES
(1, 'Domestic season high on July 21 Apex Council agenda', 'The 2021-22 Ranji Trophy season was completed successfully either side of IPL 2022', 'The upcoming domestic season is on top of the agenda of the Apex Council Meeting of the Board of Control for Cricket in India (BCCI) on July 21. The meeting, held almost every month, will be happening in the physical presence of the members in Mumbai. For a long time, these meetings have been conducted rather virtually.\r\n\r\n\"Update on the domestic season 2022-23: (a) \"Procurement of new equipment; (b) format and timelines,\" reads item No 7 in the 12-point agenda for the meeting. The BCCI successfully completed the last season\'s domestic matches with the Ranji Trophy, the Blue Riband competition of the domestic structure, held in two phases -- on either side of the IPL.\r\n\r\nThat was necessitated due to the shortened window in view of the pandemic earlier this year. How will the BCCI approach the new season is the point of discussion at the meeting and it is likely that there will be normalcy this time around.\r\n\r\n\r\nAnother point is about the sponsorship of Byju\'s (Think & Learn Private Limited) and Paytm (ONE97 Communication Limited). The former are the sponsors of the Indian team jersey and the latter are the title sponsors of India\'s international and domestic games. Both the firms recently renewed their association with the BCCI but the nature of the discussions at the meeting is yet to be confirmed. Messages to the BCCI office-bearers remained unanswered.\r\n\r\nThe BCCI will take stock of the situation on the developments at the National Cricket Academy (NCA) in Bengaluru. The NCA has been a dream project of the Indian board and a lot of investment, planning and efforts have gone in to make it a model high-performance centre of Indian cricket.\r\n\r\nThe Apex Council also will have to approve the increase in the monthly gratis, or pension, for the retired cricketers, which was announced last month. \"Production related services for the IPL and the BCCI domestic matches, ratifications for the expenses incurred towards contribution to other sports (Olympics)/contribution during pandemic\" are some other points in the agenda.\r\n\r\nThe Apex Council will also take up an update on the bank guarantee from Star India Private Limited. Star are the broadcasters of all Indian matches, as well as the IPL.\r\n\r\n', 'https://www.cricbuzz.com/a/img/v1/595x396/i1/c239462/the-apex-council-meeting-will.jpg', '2022-07-18 16:09:01', 1, 'India,Cricket', 1),
(2, 'Hardik pleased to \'fill the big shoes\' of Bumrah', 'With Bumrah not playing, Hardik had to step up with the ball and he showed his ability to adjust to different conditions with vital wickets', 'After putting on a brilliant show with both the bat and ball in the third and final ODI against England at Old Trafford, Hardik Pandya was pleased to have contributed in different departments of the game. India sealed a five-wicket win to clinch the series 2-1.\r\n\r\nWhen Hardik came out to bat, India were in a spot of bother having lost four wickets in a chase of 260. At that juncture, Hardik played with positive intent and stitched a game-breaking stand of 133 with Rishabh Pant. Hardik didn\'t just crack a volley of shots but also juxtaposed his aggressive play with singles and twos to put in a complete performance with the bat.\r\n\r\n\"It is always very good to contribute in all the departments, I think that has given me a lot of confidence in the past, it adds more layers to my game and to my confidence,\" he said in the post-match presser on Sunday (July 17). \"And Rishabh... his innings was very important for us, the partnership as well and obviously the way he finished, we all know what kind of talent he has, it is just when it comes out, it is very easy to the eye, and also gives a lot of people... you know their heartbeat also goes up. But at the same time, it gives the eyeballs as well... all the kinds of shots he plays,\" he added.', 'https://www.cricbuzz.com/a/img/v1/595x396/i1/c239444/on-a-track-that-offered-some-b.jpg', '2022-07-18 16:13:19', 2, 'India,India tour of England, 2022', 1),
(3, 'Pant, Hardik set new template for pressure situations', 'It was India\'s first century partnership against England in England for the fifth wicket in nearly 8 years, effectively sealing the chase', 'Rohit Sharma, Shikhar Dhawan and Virat Kohli, between them, have 42 centuries in run-chases batting in the top three positions in ODI cricket. But the last time Kohli registered a three-figure score in a chase was in August 2019, Rohit last struck a ton going after a target in January 2020 while Dhawan\'s recent century in the second innings came as far back as September 2018. Since the end of the 2019 World Cup till the start of the ODI series against England, India had chased 12 times and tasted success in only half the number of games. Two of their five losses came against Australia in November 2020, they also lost both times they chased during the 0-3 loss to South Africa early in 2022 while they had also fallen behind in a chase against New Zealand back in February 2020.\r\n\r\nSince the end of the ODI on January 19, 2020 in Bengaluru - when Rohit struck 119 against Australia - until the start of third ODI against England on Sunday (July 17, 2022), not a single member of the Indian team managed a three-figure score in a chase, with Hardik Pandya\'s 90 coming in a losing cause against Australia in Sydney in November 2020 being the highest score within these parameters. Outside of the top three, the last centurion for India in a chase was Kedar Jadhav, who scored 120 batting at No.6 against England in Pune in January 2017.', 'https://www.cricbuzz.com/a/img/v1/980x654/i1/c239442/hardik-and-pant-with-their-ma.jpg', '2022-07-18 16:13:19', 1, 'India, England, India tour of England, 2022', 1),
(4, 'Hardik, Pant put on a show as India clinch series', 'While Hardik shone with both bat and ball, Pant hit his maiden ODI century in India\'s successful chase', 'An allround effort from Hardik Pandya and a maiden ODI hundred from Rishabh Pant helped India swat England aside in the final ODI at Old Trafford to clinch the series 2-1. Hardik first starred with the ball to register his best bowling figures in the format before joining forces with Pant at a crucial juncture in the run chase as the two batters added 133 for the fifth wicket to set up India\'s five-wicket win.\r\n\r\nIndia got off to the worst possible start in the run chase when Reece Topley haunted them again. Shikhar Dhawan found the fielder at backward point and Rohit Sharma edged one to the slip fielder. Virat Kohli once again flattered to deceive as Topley made it three in three by bowling just outside off that took the batsman\'s outside edge. Reduced to 38/3 in a chase of 260, India had their task cut out before Pant counter-attacked. But a few overs later, England struck again as a similar pattern to the first innings unfolded. Craig Overton got one to bounce a bit more than usual as Suryakumar Yadav failed in his attempt to glance it down to third man and ended up edging it behind.\r\n\r\n', 'https://www.cricbuzz.com/a/img/v1/595x396/i1/c239380/rishabh-pant-scored-his-maiden.jpg', '2022-07-18 16:14:28', 2, 'India,England,Rishabh Pant ,Hardik Pandya ,India tour of England 2022, 3rd ODI India tour of England 2022', 1),
(5, 'Hardik shines as England fold for 259\r\n', 'Jos Buttler hit a fifty but didn\'t find support from the other end in the series decider', 'Hardik Pandya stood tall with a four-wicket haul as England once again put up a not-so-convincing performance with the bat in the series decider at Old Trafford on Sunday (July 17). Skipper Jos Buttler was the only batter to go past 50 as the rest of the lineup failed to provide the supporting act.\r\n\r\nIndia had no hesitation in opting to bowl first with the series on the line as England went in with an unchanged lineup. The visitors however were forced to bring in Mohammed Siraj in place of Jasprit Bumrah, who had to be rested as a result of a niggle. However, it was Siraj who hurt England the most at the start with the new ball as he got rid of Jonny Bairstow and Joe Root in just the second over. Even though Jason Roy started proceedings with three boundaries in the first over, England found themselves in trouble losing two key batters for ducks.\r\n\r\nBen Stokes and Roy then counter-punched their way out of trouble with a flurry of boundaries to catch the new ball bowlers off guard. Roy in particular was looking in ominous touch but once again India found an answer to end the assault as Hardik came into the attack and struck straightaway. Cramping the batter for room throughout the over, Hardik built up the pressure that resulted in Roy top-edging a pull shot. Two overs later, the allrounder struck again and this time, another short ball did the trick as Stokes came down the wicket, found himself in a tangle that resulted in Hardik taking a return catch.\r\n\r\n\r\nAt 74/4, England needed a partnership to bail themselves out of trouble and Buttler found an able partner in the form of Moeen Ali. The allrounder went into a shell at the start, taking 26 deliveries for just 5 runs. With the run rate taking a massive dip, both Buttler and Moeen finally broke the shackles with a few boundaries on the trot. While Buttler took on Chahal for a six over long on, Moeen punished Siraj for a couple of fours and a six. Two more sixes followed off Chahal as the pair raised a half-century stand to get England back on track. Against the run of play, India struck again as Moeen edged one behind down leg off Ravindra Jadeja.\r\n\r\nEven though Buttler and Liam Livingstone did ready themselves for a final flourish, Hardik came back into the attack to remove both the set batsmen in the same over to severely dent England\'s chances of getting closer to 300. On both occasions, Jadeja\'s excellent fielding skills came to the fore. Once Hardik registered his best ODI figures, David Willey and Craig Overton hung in for a while to drag the hosts past the 250-run mark before Chahal redeemed himself by polishing off the tail.\r\n\r\nBrief scores: England 259 in 45.5 overs (Jos Buttler 60, Jason Roy 41; Hardik Pandya 4/24, Yuzvendra Chahal 3/60) vsIndia', 'https://www.cricbuzz.com/a/img/v1/205x152/i1/c239228/cms-img.jpg', '2022-07-18 17:17:22', 2, 'India,England ,Hardik Pandya, India tour of England 2022', 1);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'India National Cricket Team', '2022-07-18 15:51:23', '2022-07-18 15:51:23'),
(2, 'Australia National Cricket Team', '2022-07-18 15:51:23', '2022-07-18 15:51:23');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `thumbnail` varchar(255) NOT NULL,
  `videoLink` varchar(255) NOT NULL,
  `isPremium` tinyint(1) NOT NULL DEFAULT 0,
  `teamId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `title`, `content`, `createdAt`, `thumbnail`, `videoLink`, `isPremium`, `teamId`) VALUES
(1, 'England v India, 3rd ODI: Full Highlights', 'From Hardik\'s all-round show to Rishabh Pant\'s magnificent knock. Watch all the highlights from the series decider here', '2022-07-18 16:59:24', 'https://www.cricbuzz.com/a/img/v1/205x152/i1/c239405/cms-img.jpg', 'https://www.cricbuzz.com/cricket-videos/56766/england-v-india-3rd-odi-full-highlights', 1, 1),
(2, 'Pant\'s match-winning ton a template of how one should finish games: Zaheer Khan', 'Rishabh Pant & Hardik Pandya\'s 133-run stand helped India chase down 260 in style & clinch the 3rd ODI. Zaheer Khan & Joy Bhattacharjya hail the duo, on Cricbuzz Live', '2022-07-18 16:59:24', 'https://www.cricbuzz.com/a/img/v1/205x152/i1/c239433/cms-img.jpg', 'https://www.cricbuzz.com/cricket-videos/56775/pants-match-winning-ton-a-template-of-how-one-should-finish-games-zaheer-khan', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `albums_teamId` (`teamId`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matches_team_id` (`teamId`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photo_album_id` (`albumId`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `story_id_team_id` (`teamId`),
  ADD KEY `story_id_author_id` (`authorId`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_teamId` (`teamId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `albums_teamId` FOREIGN KEY (`teamId`) REFERENCES `teams` (`id`);

--
-- Constraints for table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_team_id` FOREIGN KEY (`teamId`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photo_album_id` FOREIGN KEY (`albumId`) REFERENCES `albums` (`id`);

--
-- Constraints for table `stories`
--
ALTER TABLE `stories`
  ADD CONSTRAINT `story_id_author_id` FOREIGN KEY (`authorId`) REFERENCES `authors` (`id`),
  ADD CONSTRAINT `story_id_team_id` FOREIGN KEY (`teamId`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `video_teamId` FOREIGN KEY (`teamId`) REFERENCES `teams` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
