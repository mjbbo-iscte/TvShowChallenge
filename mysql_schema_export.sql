CREATE DATABASE  IF NOT EXISTS `tvshowdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tvshowdb`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tvshowdb
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (326,'Reece Shearsmith'),(327,'Steve Pemberton'),(328,'Abbi Jacobson'),(329,'Ilana Glazer'),(330,'Hannibal Buress'),(331,'John Gemberling'),(332,'Arturo Castro'),(333,'Paul W. Downs'),(334,'Stephen Schneider'),(335,'Nicole Drespel'),(336,'Janeane Garofalo'),(337,'Chris Gethard'),(338,'Carrie Brownstein'),(339,'Fred Armisen'),(340,'Tom Burke'),(341,'Santiago Cabrera'),(342,'Howard Charles'),(343,'Luke Pasqualino'),(344,'Hugo Speer'),(345,'Ryan Gage'),(346,'Alexandra Dowling'),(347,'Tamla Kari'),(348,'Maimie McCoy'),(349,'Peter Capaldi'),(350,'Marc Warren'),(351,'Matthew McNulty'),(352,'Rupert Everett');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episodes`
--

DROP TABLE IF EXISTS `episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tvshow` int DEFAULT NULL,
  `season_number` int DEFAULT NULL,
  `episode_number` int DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `episodes_ibfk_1` (`id_tvshow`),
  CONSTRAINT `episodes_ibfk_1` FOREIGN KEY (`id_tvshow`) REFERENCES `tvshows` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=376 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episodes`
--

LOCK TABLES `episodes` WRITE;
/*!40000 ALTER TABLE `episodes` DISABLE KEYS */;
INSERT INTO `episodes` VALUES (165,374,1,1,'Sardines','2014-02-05'),(166,374,1,2,'A Quiet Night In','2014-02-12'),(167,374,1,3,'Tom and Gerri','2014-02-19'),(168,374,1,4,'Last Gasp','2014-02-26'),(169,374,1,5,'The Understudy','2014-03-05'),(170,374,1,6,'The Harrowing','2014-03-12'),(171,374,2,1,'La Couchette','2015-03-26'),(172,374,2,2,'The 12 Days of Christine','2015-04-02'),(173,374,2,3,'The Trial of Elizabeth Gadge','2015-04-09'),(174,374,2,4,'Cold Comfort','2015-04-16'),(175,374,2,5,'Nana\'s Party','2015-04-23'),(176,374,2,6,'Seance Time','2015-04-29'),(177,374,3,1,'The Devil of Christmas','2016-12-27'),(178,374,3,2,'The Bill','2017-02-21'),(179,374,3,3,'The Riddle of the Sphinx','2017-02-28'),(180,374,3,4,'Empty Orchestra','2017-03-07'),(181,374,3,5,'Diddle Diddle Dumpling','2017-03-14'),(182,374,3,6,'Private View','2017-03-21'),(183,374,4,1,'Zanzibar','2018-01-02'),(184,374,4,2,'Bernie Clifton\'s Dressing Room','2018-01-09'),(185,374,4,3,'Once Removed','2018-01-16'),(186,374,4,4,'To Have and to Hold','2018-01-23'),(187,374,4,5,'And the Winner Is...','2018-01-30'),(188,374,4,6,'Tempting Fate','2018-02-06'),(189,374,5,1,'The Referee\'s a W***er','2020-02-03'),(190,374,5,2,'Death Be Not Proud','2020-02-10'),(191,374,5,3,'Love\'s Great Adventure','2020-02-17'),(192,374,5,4,'Misdirection','2020-02-24'),(193,374,5,5,'Thinking Out Loud','2020-03-02'),(194,374,5,6,'The Stakeout','2020-03-09'),(195,374,6,1,'Wuthering Heist','2021-05-10'),(196,374,6,2,'Simon Says','2021-05-17'),(197,374,6,3,'Lip Service','2021-05-24'),(198,374,6,4,'Hurry Up and Wait','2021-05-31'),(199,374,6,5,'How Do You Plead','2021-06-07'),(200,374,6,6,'Last Night of the Proms','2021-06-14'),(201,374,7,1,'Merrily, Merrily','2022-04-20'),(202,374,7,2,'Mr. King','2022-04-27'),(203,374,7,3,'Nine Lives Kat','2022-05-11'),(204,374,7,4,'Kid/Nap','2022-05-18'),(205,374,7,5,'A Random Act of Kindness','2022-05-25'),(206,374,7,6,'Wise Owl','2022-06-01'),(207,374,8,1,'The Bones of St Nicholas','2022-12-22'),(208,374,8,2,'Mother\'s Ruin','2023-04-27'),(209,374,8,3,'Paraskevidekatriaphobia','2023-05-04'),(210,374,8,4,'Love Is a Stranger','2023-05-11'),(211,374,8,5,'3 by 3','2023-05-18'),(212,374,8,6,'The Last Weekend','2023-05-25'),(213,374,9,1,'Boo to a Goose','2024-05-08'),(214,374,9,2,'The Trolley Problem','2024-05-15'),(215,374,9,3,'Mulberry Close','2024-05-22'),(216,374,9,4,'CTRL/ALT/ESC','2024-05-29'),(217,374,9,5,'Curse of the Ninth','2024-06-05'),(218,374,9,6,'Plodding On','2024-06-12'),(219,375,1,1,'What a Wonderful World','2014-01-22'),(220,375,1,2,'Pu$$y Weed','2014-01-29'),(221,375,1,3,'Working Girls','2014-02-05'),(222,375,1,4,'The Lockout','2014-02-12'),(223,375,1,5,'Fattest Asses','2014-02-19'),(224,375,1,6,'Stolen Phone','2014-02-26'),(225,375,1,7,'Hurricane Wanda','2014-03-05'),(226,375,1,8,'Destination: Wedding','2014-03-12'),(227,375,1,9,'Apartment Hunters','2014-03-19'),(228,375,1,10,'The Last Supper','2014-03-26'),(229,375,2,1,'In Heat','2015-01-14'),(230,375,2,2,'Mochalatta Chills','2015-01-21'),(231,375,2,3,'Wisdom Teeth','2015-01-28'),(232,375,2,4,'Knockoffs','2015-02-04'),(233,375,2,5,'Hashtag FOMO','2015-02-11'),(234,375,2,6,'The Matrix','2015-02-18'),(235,375,2,7,'Citizen Ship','2015-02-25'),(236,375,2,8,'Kirk Steele','2015-03-04'),(237,375,2,9,'Coat Check','2015-03-11'),(238,375,2,10,'St. Marks','2015-03-18'),(239,375,3,1,'Two Chainz','2016-02-17'),(240,375,3,2,'Co-Op','2016-02-24'),(241,375,3,3,'Game Over','2016-03-02'),(242,375,3,4,'Rat Pack','2016-03-09'),(243,375,3,5,'2016','2016-03-16'),(244,375,3,6,'Philadelphia','2016-03-23'),(245,375,3,7,'B&B-NYC','2016-03-30'),(246,375,3,8,'Burning Bridges','2016-04-06'),(247,375,3,9,'Getting There','2016-04-13'),(248,375,3,10,'Jews on a Plane','2016-04-20'),(249,375,4,1,'Sliding Doors','2017-09-13'),(250,375,4,2,'Twaining Day','2017-09-20'),(251,375,4,3,'Just the Tips','2017-09-27'),(252,375,4,4,'Mushrooms','2017-10-11'),(253,375,4,5,'Abbi\'s Mom','2017-10-18'),(254,375,4,6,'Witches','2017-10-25'),(255,375,4,7,'Florida','2017-11-08'),(256,375,4,8,'House-Sitting','2017-11-15'),(257,375,4,9,'Bedbugs','2017-11-29'),(258,375,4,10,'Friendiversary','2017-12-06'),(259,375,5,1,'Stories','2019-01-24'),(260,375,5,2,'Shework and Shit Bucket','2019-01-31'),(261,375,5,3,'Bitcoin & the Missing Girl','2019-02-07'),(262,375,5,4,'Make the Space','2019-02-14'),(263,375,5,5,'Artsy Fartsy','2019-02-21'),(264,375,5,6,'Lost and Found','2019-02-28'),(265,375,5,7,'Shenanigans','2019-03-07'),(266,375,5,8,'Sleep No More','2019-03-14'),(267,375,5,9,'Along Came Molly','2019-03-21'),(268,375,5,10,'Broad City','2019-03-28'),(269,376,1,1,'Farm','2011-01-21'),(270,376,1,2,'A Song for Portland','2011-01-28'),(271,376,1,3,'Aimee','2011-02-04'),(272,376,1,4,'Mayor is Missing','2011-02-11'),(273,376,1,5,'Baseball','2011-02-18'),(274,376,1,6,'Blunderbuss','2011-02-25'),(275,376,2,1,'Mixology','2012-01-06'),(276,376,2,2,'One Moore Episode','2012-01-13'),(277,376,2,3,'Cool Wedding','2012-01-20'),(278,376,2,4,'Grover','2012-01-27'),(279,376,2,5,'Cops Redesign','2012-02-03'),(280,376,2,6,'Cat Nap','2012-02-10'),(281,376,2,7,'Motorcycle','2012-02-17'),(282,376,2,8,'Feminist Bookstore\'s 10th Anniversary','2012-02-24'),(283,376,2,9,'No Olympics','2012-03-02'),(284,376,2,10,'Brunch Village','2012-03-09'),(285,376,3,1,'Winter in Portlandia','2012-12-14'),(286,376,3,2,'Take Back MTV','2013-01-04'),(287,376,3,3,'Missionaries','2013-01-04'),(288,376,3,4,'Nina\'s Birthday','2013-01-11'),(289,376,3,5,'Squiggleman','2013-01-18'),(290,376,3,6,'Off the Grid','2013-01-25'),(291,376,3,7,'The Temp','2013-02-01'),(292,376,3,8,'Soft Opening','2013-02-08'),(293,376,3,9,'Alexandra','2013-02-15'),(294,376,3,10,'No-Fo-O-Fo-Bridge','2013-02-22'),(295,376,3,11,'Blackout','2013-03-01'),(296,376,4,1,'Sharing Finances','2014-02-27'),(297,376,4,2,'Ecoterrorists','2014-03-06'),(298,376,4,3,'Celery Guy','2014-03-13'),(299,376,4,4,'Pull-Out King','2014-03-20'),(300,376,4,5,'Spyke Drives','2014-03-27'),(301,376,4,6,'Bahama Knights','2014-04-03'),(302,376,4,7,'Trail Blazers','2014-04-10'),(303,376,4,8,'Late in Life Drug Use','2014-04-17'),(304,376,4,9,'3D Printer','2014-04-24'),(305,376,4,10,'Getting Away','2014-05-01'),(306,376,5,1,'The Story of Toni and Candace','2015-01-08'),(307,376,5,2,'The Fiancée','2015-01-15'),(308,376,5,3,'Healthcare','2015-01-22'),(309,376,5,4,'Seaworld','2015-01-29'),(310,376,5,5,'4th of July','2015-02-05'),(311,376,5,6,'Fashion','2015-02-12'),(312,376,5,7,'Doug Becomes a Feminist','2015-02-19'),(313,376,5,8,'House for Sale','2015-02-26'),(314,376,5,9,'You Can Call Me Al','2015-03-05'),(315,376,5,10,'Dead Pets','2015-03-12'),(316,376,6,1,'Pickathon','2016-01-21'),(317,376,6,2,'Going Gray','2016-01-28'),(318,376,6,3,'Shville','2016-02-04'),(319,376,6,4,'Weirdo Beach','2016-02-11'),(320,376,6,5,'Breaking Up','2016-02-18'),(321,376,6,6,'TADA','2016-02-25'),(322,376,6,7,'Family Emergency','2016-03-03'),(323,376,6,8,'First Feminist City','2016-03-10'),(324,376,6,9,'Lance is Smart','2016-03-17'),(325,376,6,10,'Noodle Monster','2016-03-24'),(326,376,7,1,'The Storytellers','2017-01-05'),(327,376,7,2,'Carrie Dates a Hunk','2017-01-12'),(328,376,7,3,'Fred\'s Cell Phone Company','2017-01-19'),(329,376,7,4,'Separation Anxiety','2017-01-26'),(330,376,7,5,'Amore','2017-02-02'),(331,376,7,6,'Friend Replacement','2017-02-09'),(332,376,7,7,'Portland Secedes','2017-02-16'),(333,376,7,8,'Ants','2017-02-23'),(334,376,7,9,'Passenger Rating','2017-03-02'),(335,376,7,10,'Misunderstood Miracles','2017-03-09'),(336,376,8,1,'Riot Spray','2018-01-18'),(337,376,8,2,'Shared Workspace','2018-01-25'),(338,376,8,3,'No Thank You','2018-02-01'),(339,376,8,4,'Abracadabra','2018-02-08'),(340,376,8,5,'Open Relationship','2018-02-15'),(341,376,8,6,'You Do You','2018-02-22'),(342,376,8,7,'Most Pro City','2018-03-01'),(343,376,8,8,'Peter Follows P!nk','2018-03-08'),(344,376,8,9,'Long Way Back','2018-03-15'),(345,376,8,10,'Rose Route','2018-03-22'),(346,377,1,1,'Friends and Enemies','2014-01-19'),(347,377,1,2,'Sleight of Hand','2014-01-26'),(348,377,1,3,'Commodities','2014-02-02'),(349,377,1,4,'The Good Soldier','2014-02-09'),(350,377,1,5,'The Homecoming','2014-02-23'),(351,377,1,6,'The Exiles','2014-03-02'),(352,377,1,7,'A Rebellious Woman','2014-03-09'),(353,377,1,8,'The Challenge','2014-03-16'),(354,377,1,9,'Knight Takes Queen','2014-03-23'),(355,377,1,10,'Musketeers Don\'t Die Easily','2014-03-30'),(356,377,2,1,'Keep Your Friends Close','2015-01-02'),(357,377,2,2,'An Ordinary Man','2015-01-09'),(358,377,2,3,'The Good Traitor','2015-01-16'),(359,377,2,4,'Emilie','2015-01-30'),(360,377,2,5,'The Return','2015-02-13'),(361,377,2,6,'Through a Glass Darkly','2015-02-20'),(362,377,2,7,'A Marriage of Inconvenience','2015-02-27'),(363,377,2,8,'The Prodigal Father','2015-03-06'),(364,377,2,9,'The Accused','2015-03-20'),(365,377,2,10,'Trial and Punishment','2015-03-27'),(366,377,3,1,'Spoils of War','2016-05-28'),(367,377,3,2,'The Hunger','2016-06-11'),(368,377,3,3,'Brothers in Arms','2016-06-20'),(369,377,3,4,'The Queen\'s Diamonds','2016-06-25'),(370,377,3,5,'To Play the King','2016-07-03'),(371,377,3,6,'Death of a Hero','2016-07-09'),(372,377,3,7,'Fool\'s Gold','2016-07-16'),(373,377,3,8,'Prisoner of War','2016-07-23'),(374,377,3,9,'The Prize','2016-07-30'),(375,377,3,10,'We Are the Garrison','2016-08-01');
/*!40000 ALTER TABLE `episodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Genre_name` (`genre_name`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (102,'Action'),(103,'Crime'),(99,'Drama'),(104,'Horror'),(105,'Romance'),(100,'Science-Fiction'),(101,'Thriller');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvshow_actors`
--

DROP TABLE IF EXISTS `tvshow_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvshow_actors` (
  `id_tvshow` int NOT NULL,
  `id_actor` int NOT NULL,
  PRIMARY KEY (`id_tvshow`,`id_actor`),
  KEY `tvshow_actors_ibfk_2` (`id_actor`),
  CONSTRAINT `tvshow_actors_ibfk_1` FOREIGN KEY (`id_tvshow`) REFERENCES `tvshows` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tvshow_actors_ibfk_2` FOREIGN KEY (`id_actor`) REFERENCES `actors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshow_actors`
--

LOCK TABLES `tvshow_actors` WRITE;
/*!40000 ALTER TABLE `tvshow_actors` DISABLE KEYS */;
INSERT INTO `tvshow_actors` VALUES (374,326),(374,327),(375,328),(375,329),(375,330),(375,331),(375,332),(375,333),(375,334),(375,335),(375,336),(375,337),(376,338),(376,339),(377,340),(377,341),(377,342),(377,343),(377,344),(377,345),(377,346),(377,347),(377,348),(377,349),(377,350),(377,351),(377,352);
/*!40000 ALTER TABLE `tvshow_actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvshow_genres`
--

DROP TABLE IF EXISTS `tvshow_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvshow_genres` (
  `id_tvshow` int NOT NULL,
  `id_genre` int NOT NULL,
  PRIMARY KEY (`id_tvshow`,`id_genre`),
  KEY `tvshow_genres_ibfk_2` (`id_genre`),
  CONSTRAINT `tvshow_genres_ibfk_1` FOREIGN KEY (`id_tvshow`) REFERENCES `tvshows` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tvshow_genres_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genres` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshow_genres`
--

LOCK TABLES `tvshow_genres` WRITE;
/*!40000 ALTER TABLE `tvshow_genres` DISABLE KEYS */;
INSERT INTO `tvshow_genres` VALUES (374,99),(376,99),(377,99),(374,100),(375,100),(377,100),(374,101),(375,102),(377,102),(375,103),(376,104),(376,105);
/*!40000 ALTER TABLE `tvshow_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tvshows`
--

DROP TABLE IF EXISTS `tvshows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tvshows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `description` text,
  `rating` decimal(2,1) DEFAULT NULL,
  `release_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tvshows`
--

LOCK TABLES `tvshows` WRITE;
/*!40000 ALTER TABLE `tvshows` DISABLE KEYS */;
INSERT INTO `tvshows` VALUES (374,'Under the Dome','<p><b>Under the Dome</b> is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome. The town\'s inhabitants must deal with surviving the post-apocalyptic conditions while searching for answers about the dome, where it came from and if and when it will go away.</p>',6.5,'2013-06-24 01:00:00'),(375,'Person of Interest','<p>You are being watched. The government has a secret system, a machine that spies on you every hour of every day. I know because I built it. I designed the Machine to detect acts of terror but it sees everything. Violent crimes involving ordinary people. People like you. Crimes the government considered \"irrelevant\". They wouldn\'t act so I decided I would. But I needed a partner. Someone with the skills to intervene. Hunted by the authorities, we work in secret. You\'ll never find us. But victim or perpetrator, if your number is up, we\'ll find you.</p>',8.8,'2011-09-22 01:00:00'),(376,'Bitten','<p>Based on the critically acclaimed series of novels from Kelley Armstrong. Set in Toronto and upper New York State, <b>Bitten</b> follows the adventures of 28-year-old Elena Michaels, the world\'s only female werewolf. An orphan, Elena thought she finally found her \"happily ever after\" with her new love Clayton, until her life changed forever. With one small bite, the normal life she craved was taken away and she was left to survive life with the Pack.</p>',7.5,'2014-01-11 00:00:00'),(377,'Arrow','<p>After a violent shipwreck, billionaire playboy Oliver Queen was missing and presumed dead for five years before being discovered alive on a remote island in the Pacific. He returned home to Starling City, welcomed by his devoted mother Moira, beloved sister Thea and former flame Laurel Lance. With the aid of his trusted chauffeur/bodyguard John Diggle, the computer-hacking skills of Felicity Smoak and the occasional, reluctant assistance of former police detective, now beat cop, Quentin Lance, Oliver has been waging a one-man war on crime.</p>',7.4,'2012-10-10 01:00:00');
/*!40000 ALTER TABLE `tvshows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_favourites`
--

DROP TABLE IF EXISTS `user_favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_favourites` (
  `id_user` int NOT NULL,
  `id_tvshow` int NOT NULL,
  PRIMARY KEY (`id_user`,`id_tvshow`),
  KEY `id_tvshow` (`id_tvshow`),
  CONSTRAINT `user_favourites_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_favourites_ibfk_2` FOREIGN KEY (`id_tvshow`) REFERENCES `tvshows` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_favourites`
--

LOCK TABLES `user_favourites` WRITE;
/*!40000 ALTER TABLE `user_favourites` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'maria','pass');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-31 15:16:37
