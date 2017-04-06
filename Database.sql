CREATE DATABASE  IF NOT EXISTS `Notown` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `Notown`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: Notown
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Albums`
--

DROP TABLE IF EXISTS `Albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Albums` (
  `album_id` int(11) NOT NULL,
  `producer_id` char(6) NOT NULL,
  `release_date` date DEFAULT NULL,
  `album_title` varchar(30) NOT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `producer_id` (`producer_id`),
  CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`producer_id`) REFERENCES `Musicians` (`sin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Albums`
--

LOCK TABLES `Albums` WRITE;
/*!40000 ALTER TABLE `Albums` DISABLE KEYS */;
INSERT INTO `Albums` VALUES (1,'TWYGBW','2007-07-08','For Emma, Forever Ago',9.99),(2,'TWZL66','2016-09-30','The Altar',9.99),(3,'ULZAAX','2017-01-13','I See You',9.99),(4,'YHNCSV','2016-12-25','Run The Jewels 3',9.99),(5,'51B4YJ','2016-11-18','FREE 6LACK',6.99),(6,'1YMZ12','2015-08-28','Beauty Behind the Madness',10.99),(7,'TWYGBW','2011-11-29','Bon Iver (Deluxe)',11.99),(8,'LKC5AZ','2015-09-18','GO:OD AM',11.99),(9,'48TZQN','2010-01-01','Passive Me, Aggressive You',6.99),(10,'3Y8OJ5','2014-10-04','I\'ll Keep You In Mind',7.59),(11,'6AXP6G','2015-07-17','Currents',9.99),(12,'9S6YEA','2016-11-18','American Boyfriend',9.99),(13,'QMQJQG','2016-08-20','Blonde',9.99),(14,'DN6R0M','2013-01-01','Artpop',7.99),(15,'QT5IP5','2016-09-02','MY WOMAN',9.99),(16,'VYNZM4','2014-04-01','Salad Days',9.99),(17,'HNR553','2013-01-01','Siberia (Acoustic)',6.99),(18,'7H56JF','2015-04-08','Z',7.99),(19,'WWF634','2016-11-18','Woman',9.99),(20,'BDXQOL','2015-09-04','Rodeo (Deluxe)',10.99),(21,'YOWPMX','2016-06-08','Blank Face LP',12.99),(22,'0WPJVT','2012-09-18','An Awesome Wave',6.99),(23,'QVGC2D','2017-03-18','More Life',10.99);
/*!40000 ALTER TABLE `Albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Musicians`
--

DROP TABLE IF EXISTS `Musicians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Musicians` (
  `sin` char(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`sin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Musicians`
--

LOCK TABLES `Musicians` WRITE;
/*!40000 ALTER TABLE `Musicians` DISABLE KEYS */;
INSERT INTO `Musicians` VALUES ('0U6PHD','Ab-Soul'),('0WPJVT','Alt-J'),('1YMZ12','The Weeknd'),('3Y8OJ5','Moose Blood'),('48TZQN','The Naked and Famous'),('4DO311','Lil B'),('4LKO6R','Giggs'),('51B4YJ','6LACK'),('52HRYB','Future'),('6AXP6G','Tame Impala'),('7H56JF','SZA'),('7QJAJY','Anderson .Paak'),('8OS20F','Skepta'),('9IB8GT','Vince Staples'),('9S6YEA','Kevin Abstract'),('AU8EUF','R.Kelly'),('AVXT48','Hall and Oates'),('B329ZZ','2 Chainz'),('B7M268','Danny Brown'),('B7VT2W',' Chief Keef'),('BDXQOL','Travis Scott'),('BJCWEL','Black Coffee'),('DN6R0M','Lady Gaga'),('EBTQQC','Max Kerman'),('EMRVZI','Joi'),('ERB9D9','Quavo'),('FAE2JZ','Owl City'),('FCRHKN','Kendrick Lamar'),('G07IK5','Coeur de pirate'),('H54Y18','Miguel'),('H59PHG','Juicy J'),('HNR553','Lights'),('LFVRLX','Sampha'),('LKC5AZ','Mac Miller'),('MQMDNB','Young Thug'),('QMQJQG','Frank Ocean'),('QT5IP5','Angel Olsen'),('QVGC2D','Drake'),('RFJOLK','Lana Del Rey'),('T6N642',' Kacy Hill'),('TWYGBW','Bon Iver'),('TWZL66','Banks'),('ULZAAX','The xx'),('UOGFB7','BOOTS'),('UOZN7Y','Ed Sheeran'),('VEB4N4','Labrinth'),('VYNZM4','Mac DeMarco'),('WPB37F','Chance The Rapper'),('WWF634','Justice'),('YHNCSV','Run The Jewels'),('YOWPMX','Schoolboy Q'),('YS6O45','Isaiah Rashad'),('YSQX9N','Kanye West'),('ZYJ4RK','Swae Lee');
/*!40000 ALTER TABLE `Musicians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Perform`
--

DROP TABLE IF EXISTS `Perform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Perform` (
  `song_id` int(11) NOT NULL,
  `musician_id` char(6) NOT NULL,
  `album_id` int(11) NOT NULL,
  PRIMARY KEY (`musician_id`,`song_id`,`album_id`),
  KEY `song_id` (`song_id`),
  KEY `album_id` (`album_id`),
  CONSTRAINT `perform_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `Songs` (`song_id`),
  CONSTRAINT `perform_ibfk_2` FOREIGN KEY (`musician_id`) REFERENCES `Musicians` (`sin`),
  CONSTRAINT `perform_ibfk_3` FOREIGN KEY (`album_id`) REFERENCES `Albums` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Perform`
--

LOCK TABLES `Perform` WRITE;
/*!40000 ALTER TABLE `Perform` DISABLE KEYS */;
INSERT INTO `Perform` VALUES (1,'TWZL66',2),(2,'TWZL66',2),(3,'TWZL66',2),(4,'TWZL66',2),(5,'TWZL66',2),(6,'TWZL66',2),(7,'TWZL66',2),(8,'ULZAAX',3),(9,'ULZAAX',3),(10,'ULZAAX',3),(11,'ULZAAX',3),(12,'ULZAAX',3),(13,'ULZAAX',3),(14,'ULZAAX',3),(15,'AVXT48',3),(15,'ULZAAX',3),(16,'ULZAAX',3),(17,'ULZAAX',3),(18,'EMRVZI',4),(18,'YHNCSV',4),(19,'YHNCSV',4),(20,'YHNCSV',4),(21,'YHNCSV',4),(22,'B7M268',4),(22,'YHNCSV',4),(23,'YHNCSV',4),(24,'YHNCSV',4),(25,'UOGFB7',4),(25,'YHNCSV',4),(26,'51B4YJ',5),(27,'51B4YJ',5),(28,'51B4YJ',5),(29,'51B4YJ',5),(30,'51B4YJ',5),(31,'51B4YJ',5),(32,'51B4YJ',5),(33,'51B4YJ',5),(34,'1YMZ12',6),(35,'1YMZ12',6),(35,'VEB4N4',6),(36,'1YMZ12',6),(37,'1YMZ12',6),(38,'1YMZ12',6),(38,'UOZN7Y',6),(39,'1YMZ12',6),(39,'RFJOLK',6),(40,'1YMZ12',6),(41,'1YMZ12',6),(42,'1YMZ12',6),(43,'TWYGBW',7),(44,'TWYGBW',7),(45,'TWYGBW',7),(46,'TWYGBW',7),(47,'TWYGBW',7),(48,'TWYGBW',7),(49,'TWYGBW',7),(50,'TWYGBW',7),(51,'TWYGBW',7),(52,'LKC5AZ',8),(53,'LKC5AZ',8),(54,'LKC5AZ',8),(55,'0U6PHD',8),(55,'LKC5AZ',8),(56,'LKC5AZ',8),(57,'4DO311',8),(57,'LKC5AZ',8),(58,'H54Y18',8),(58,'LKC5AZ',8),(59,'LKC5AZ',8),(60,'48TZQN',9),(61,'48TZQN',9),(62,'48TZQN',9),(63,'48TZQN',9),(64,'48TZQN',9),(65,'48TZQN',9),(66,'48TZQN',9),(67,'48TZQN',9),(68,'3Y8OJ5',10),(69,'3Y8OJ5',10),(70,'3Y8OJ5',10),(71,'3Y8OJ5',10),(72,'3Y8OJ5',10),(73,'3Y8OJ5',10),(74,'3Y8OJ5',10),(75,'3Y8OJ5',10),(76,'3Y8OJ5',10),(77,'6AXP6G',11),(78,'6AXP6G',11),(79,'6AXP6G',11),(80,'6AXP6G',11),(81,'6AXP6G',11),(82,'6AXP6G',11),(83,'6AXP6G',11),(84,'6AXP6G',11),(85,'6AXP6G',11),(86,'9S6YEA',12),(87,'9S6YEA',12),(88,'9S6YEA',12),(89,'9S6YEA',12),(90,'9S6YEA',12),(91,'9S6YEA',12),(92,'9S6YEA',12),(93,'9S6YEA',12),(94,'9S6YEA',12),(95,'TWYGBW',1),(96,'TWYGBW',1),(97,'TWYGBW',1),(98,'TWYGBW',1),(99,'TWYGBW',1),(100,'TWYGBW',1),(101,'TWYGBW',1),(102,'TWYGBW',1),(103,'QMQJQG',13),(104,'QMQJQG',13),(105,'QMQJQG',13),(106,'QMQJQG',13),(107,'QMQJQG',13),(108,'QMQJQG',13),(109,'QMQJQG',13),(110,'QMQJQG',13),(111,'QMQJQG',13),(112,'QMQJQG',13),(113,'DN6R0M',14),(114,'DN6R0M',14),(115,'DN6R0M',14),(116,'AU8EUF',14),(116,'DN6R0M',14),(117,'DN6R0M',14),(118,'DN6R0M',14),(119,'DN6R0M',14),(120,'DN6R0M',14),(121,'QT5IP5',15),(122,'QT5IP5',15),(123,'QT5IP5',15),(124,'QT5IP5',15),(125,'QT5IP5',15),(126,'QT5IP5',15),(127,'QT5IP5',15),(128,'QT5IP5',15),(129,'VYNZM4',16),(130,'VYNZM4',16),(131,'VYNZM4',16),(132,'VYNZM4',16),(133,'VYNZM4',16),(134,'VYNZM4',16),(135,'VYNZM4',16),(136,'VYNZM4',16),(137,'VYNZM4',16),(138,'HNR553',17),(139,'FAE2JZ',17),(139,'HNR553',17),(140,'EBTQQC',17),(140,'HNR553',17),(141,'HNR553',17),(142,'HNR553',17),(143,'G07IK5',17),(143,'HNR553',17),(144,'HNR553',17),(145,'HNR553',17),(146,'HNR553',17),(147,'7H56JF',18),(148,'7H56JF',18),(148,'WPB37F',18),(149,'7H56JF',18),(150,'7H56JF',18),(150,'YS6O45',18),(151,'7H56JF',18),(152,'7H56JF',18),(153,'7H56JF',18),(153,'FCRHKN',18),(154,'7H56JF',18),(155,'WWF634',19),(156,'WWF634',19),(157,'WWF634',19),(158,'WWF634',19),(159,'WWF634',19),(160,'WWF634',19),(161,'WWF634',19),(162,'WWF634',19),(163,'BDXQOL',20),(163,'ERB9D9',20),(164,'52HRYB',20),(164,'B329ZZ',20),(164,'BDXQOL',20),(165,'H59PHG',20),(166,'BDXQOL',20),(166,'T6N642',20),(167,'1YMZ12',20),(167,'BDXQOL',20),(168,'B7VT2W',20),(168,'BDXQOL',20),(168,'ZYJ4RK',20),(169,'BDXQOL',20),(169,'YSQX9N',20),(170,'BDXQOL',20),(171,'YOWPMX',21),(172,'YOWPMX',21),(173,'YOWPMX',21),(173,'YSQX9N',21),(174,'9IB8GT',21),(174,'YOWPMX',21),(175,'YOWPMX',21),(176,'YOWPMX',21),(177,'7H56JF',21),(177,'YOWPMX',21),(178,'7QJAJY',21),(178,'YOWPMX',21),(179,'H54Y18',21),(179,'YOWPMX',21),(180,'0WPJVT',22),(181,'0WPJVT',22),(182,'0WPJVT',22),(183,'0WPJVT',22),(184,'0WPJVT',22),(185,'0WPJVT',22),(186,'0WPJVT',22),(187,'0WPJVT',22),(188,'0WPJVT',22),(189,'0WPJVT',22),(190,'0WPJVT',22),(191,'QVGC2D',23),(192,'4LKO6R',23),(192,'QVGC2D',23),(193,'QVGC2D',23),(194,'BJCWEL',23),(194,'QVGC2D',23),(195,'LFVRLX',23),(195,'QVGC2D',23),(196,'QVGC2D',23),(197,'8OS20F',23),(197,'QVGC2D',23),(198,'BDXQOL',23),(198,'ERB9D9',23),(198,'QVGC2D',23),(199,'B329ZZ',23),(199,'MQMDNB',23),(199,'QVGC2D',23);
/*!40000 ALTER TABLE `Perform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards` (
  `cc_id` int(11) NOT NULL,
  `cc_number` varchar(25) NOT NULL,
  `expiry` date NOT NULL,
  `security_code` int(3) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cc_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (1,'4646231902038295','2018-10-01',309,1),(2,'5923192180162932','2021-03-01',827,1),(3,'6518928128121729','2024-04-01',948,2),(4,'3221149329239239','2023-12-01',234,3),(5,'2931923882939239','2023-03-01',239,4),(6,'2323233232323232','2020-11-01',234,5),(7,'3412189239293912','2021-11-01',423,6),(8,'4723923819838182','2021-11-01',823,7),(9,'5293823818931293','2021-10-01',923,8),(10,'3483483842384328','2022-09-01',323,9),(11,'2322392139123901','2024-10-01',932,10),(12,'3239239229121921','2021-12-01',392,10),(13,'4343349223923922','2023-11-01',384,1);
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchases` (
  `user_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  `r_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`album_id`,`r_id`),
  KEY `album_id` (`album_id`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`),
  CONSTRAINT `purchases_ibfk_3` FOREIGN KEY (`r_id`) REFERENCES `receipts` (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (7,1,1),(10,2,13),(1,3,16),(8,3,11),(5,4,9),(2,5,5),(1,6,2),(9,6,12),(7,7,1),(1,8,3),(8,8,11),(1,9,3),(10,9,14),(2,11,4),(1,12,2),(2,12,4),(6,12,10),(8,12,11),(1,13,15),(2,13,4),(6,13,10),(3,14,6),(2,15,4),(9,16,12),(1,18,3),(10,19,13),(4,20,8),(5,20,9),(6,20,10),(9,20,12),(3,21,7),(4,21,8),(2,22,5),(3,22,6);
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipts`
--

DROP TABLE IF EXISTS `receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receipts` (
  `r_id` int(11) NOT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `purchased` datetime DEFAULT NULL,
  `cc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`r_id`),
  KEY `user_id` (`user_id`),
  KEY `cc_id` (`cc_id`),
  CONSTRAINT `receipts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `receipts_ibfk_2` FOREIGN KEY (`cc_id`) REFERENCES `cards` (`cc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipts`
--

LOCK TABLES `receipts` WRITE;
/*!40000 ALTER TABLE `receipts` DISABLE KEYS */;
INSERT INTO `receipts` VALUES (1,24.84,7,'2017-03-19 11:26:19',8),(2,23.71,1,'2017-03-19 22:53:20',1),(3,30.48,1,'2017-03-19 22:53:40',1),(4,45.15,2,'2017-03-19 22:54:14',3),(5,15.80,2,'2017-03-19 22:54:48',3),(6,16.93,3,'2017-03-19 22:58:12',4),(7,14.68,3,'2017-03-19 22:58:23',4),(8,27.10,4,'2017-03-19 23:06:48',5),(9,23.71,5,'2017-03-19 23:18:41',6),(10,35.00,6,'2017-03-19 23:23:47',7),(11,36.13,8,'2017-03-19 23:25:07',9),(12,36.13,9,'2017-03-19 23:25:46',10),(13,22.58,10,'2017-03-19 23:31:25',11),(14,7.90,10,'2017-03-20 09:09:50',12),(15,11.29,1,'2017-03-20 12:13:17',2),(16,11.29,1,'2017-03-20 12:23:09',13);
/*!40000 ALTER TABLE `receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs` (
  `song_id` int(11) NOT NULL,
  `author_id` char(6) NOT NULL,
  `song_title` varchar(30) NOT NULL,
  `album_id` int(11) NOT NULL,
  PRIMARY KEY (`song_id`),
  KEY `album_id` (`album_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `Albums` (`album_id`),
  CONSTRAINT `songs_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `Musicians` (`sin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,'TWZL66','Gemini Feed',2),(2,'TWZL66','Lovesick',2),(3,'TWZL66','Mind Games',2),(4,'TWZL66','Trainwreck',2),(5,'TWZL66','This is Not About Us',2),(6,'TWZL66','Weaker Girl',2),(7,'TWZL66','Mother Earth',2),(8,'ULZAAX','Dangerous',3),(9,'ULZAAX','Say Something Loving',3),(10,'ULZAAX','Lips',3),(11,'ULZAAX','A Violent Noise',3),(12,'ULZAAX','Performance',3),(13,'ULZAAX','Replica',3),(14,'ULZAAX','Brave for You',3),(15,'ULZAAX','On Hold',3),(16,'ULZAAX','I Dare You',3),(17,'ULZAAX','Test Me',3),(18,'YHNCSV','Down (feat. Joi)',4),(19,'YHNCSV','Talk to Me',4),(20,'YHNCSV','Legend Has It',4),(21,'YHNCSV','Call Ticketron',4),(22,'YHNCSV','Hey Kids [feat. Danny Brown]',4),(23,'YHNCSV','Stay Gold',4),(24,'YHNCSV','Don\'t Get Captured',4),(25,'YHNCSV','2100 (feat. BOOTS)',4),(26,'51B4YJ','Never Know',5),(27,'51B4YJ','Rules',5),(28,'51B4YJ','PRBLMS',5),(29,'51B4YJ','Free',5),(30,'51B4YJ','Learn Ya',5),(31,'51B4YJ','MTFU',5),(32,'51B4YJ','Luving U',5),(33,'51B4YJ','Gettin\' Old',5),(34,'1YMZ12','Real Life',6),(35,'1YMZ12','Losers (feat. Labrinth)',6),(36,'1YMZ12','Tell Your Friends',6),(37,'1YMZ12','The Hills',6),(38,'1YMZ12','Dark Times(feat. Ed Sheeran)',6),(39,'1YMZ12','Prisoner (feat. Lana Del Rey)',6),(40,'1YMZ12','Acquainted',6),(41,'1YMZ12','Can\'t Feel My Face',6),(42,'1YMZ12','In the Night',6),(43,'TWYGBW','Perth',7),(44,'TWYGBW','Minnesota, WI',7),(45,'TWYGBW','Holocene',7),(46,'TWYGBW','Towers',7),(47,'TWYGBW','Michicant',7),(48,'TWYGBW','Hinnom, TX',7),(49,'TWYGBW','Wash.',7),(50,'TWYGBW','Calgary',7),(51,'TWYGBW','Lisbon, OH',7),(52,'LKC5AZ','Doors',8),(53,'LKC5AZ','Brand Name',8),(54,'LKC5AZ','Rush Hour',8),(55,'LKC5AZ','Two Matches (ft. Ab-Soul)',8),(56,'LKC5AZ','100 Grandkids',8),(57,'LKC5AZ','Time Flies (feat. Lil B)',8),(58,'LKC5AZ','Weekend (feat. Miguel)',8),(59,'LKC5AZ','Clubhouse',8),(60,'48TZQN','All of This',9),(61,'48TZQN','Punching In a Dream',9),(62,'48TZQN','Frayed',9),(63,'48TZQN','Eyes',9),(64,'48TZQN','Young Blood',9),(65,'48TZQN','Jilted Lovers',9),(66,'48TZQN','Spank',9),(67,'48TZQN','Girls Like You',9),(68,'3Y8OJ5','Cherry',10),(69,'3Y8OJ5','Anyway',10),(70,'3Y8OJ5','I Hope You\'re Missing Me',10),(71,'3Y8OJ5','Chin Up',10),(72,'3Y8OJ5','Boston',10),(73,'3Y8OJ5','Gum',10),(74,'3Y8OJ5','Pups',10),(75,'3Y8OJ5','Swim Down',10),(76,'3Y8OJ5','Bukowski',10),(77,'6AXP6G','Let It Happen',11),(78,'6AXP6G','Nangs',11),(79,'6AXP6G','The Moment',11),(80,'6AXP6G','Yes I\'m Changing',11),(81,'6AXP6G','Eventually',11),(82,'6AXP6G','Gossip',11),(83,'6AXP6G','The Less I Know The Better',11),(84,'6AXP6G','Past Life',11),(85,'6AXP6G','Disciples',11),(86,'9S6YEA','Empty',12),(87,'9S6YEA','Blink',12),(88,'9S6YEA','Tattoo',12),(89,'9S6YEA','Yellow',12),(90,'9S6YEA','Runner',12),(91,'9S6YEA','Papercut',12),(92,'9S6YEA','Miserable America',12),(93,'9S6YEA','American Boyfriend',12),(94,'9S6YEA','Echo',12),(95,'TWYGBW','Flume',1),(96,'TWYGBW','Lump Sum',1),(97,'TWYGBW','Skinny Love',1),(98,'TWYGBW','Blindsided',1),(99,'TWYGBW','Creature Fear',1),(100,'TWYGBW','Team',1),(101,'TWYGBW','For Emma',1),(102,'TWYGBW','Re: Stacks',1),(103,'QMQJQG','Nikes',13),(104,'QMQJQG','Ivy',13),(105,'QMQJQG','Pink + White',13),(106,'QMQJQG','Solo',13),(107,'QMQJQG','Nights',13),(108,'QMQJQG','Skyline To',13),(109,'QMQJQG','White Ferrari',13),(110,'QMQJQG','Seigfried',13),(111,'QMQJQG','Godspeed',13),(112,'QMQJQG','Future Free',13),(113,'DN6R0M','Aura',14),(114,'DN6R0M','Venus',14),(115,'DN6R0M','G.U.Y.',14),(116,'DN6R0M','Do What U Want',14),(117,'DN6R0M','ARTPOP',14),(118,'DN6R0M','Swine',14),(119,'DN6R0M','Donatella',14),(120,'DN6R0M','Gypsy',14),(121,'QT5IP5','Intern',15),(122,'QT5IP5','Never Be Mine',15),(123,'QT5IP5','Shut Up Kiss Me',15),(124,'QT5IP5','Give It Up',15),(125,'QT5IP5','Not Gonna Kill You',15),(126,'QT5IP5','Heart Shaped Face',15),(127,'QT5IP5','Sister',15),(128,'QT5IP5','Those Were the Days',15),(129,'VYNZM4','Salad Days',16),(130,'VYNZM4','Blue Boy',16),(131,'VYNZM4','Brother',16),(132,'VYNZM4','Let Her Go',16),(133,'VYNZM4','Goodbye Weekend',16),(134,'VYNZM4','Let My Baby Stay',16),(135,'VYNZM4','Passing Out Pieces',16),(136,'VYNZM4','Treat Her Better',16),(137,'VYNZM4','Chamber of Reflection',16),(138,'HNR553','Banner (Acoustic)',17),(139,'HNR553','Cactus In the Valley',17),(140,'HNR553','Siberia',17),(141,'HNR553','Suspension',17),(142,'HNR553','Toes',17),(143,'HNR553','Peace Sign',17),(144,'HNR553','Heavy Rope',17),(145,'HNR553','Flux and Flow',17),(146,'HNR553','...And Counting',17),(147,'7H56JF','Ur',18),(148,'7H56JF','Childs Play',18),(149,'7H56JF','Julia',18),(150,'7H56JF','Warm Winds',18),(151,'7H56JF','Green Mile',18),(152,'7H56JF','HiiJack',18),(153,'7H56JF','Babylon',18),(154,'7H56JF','Sweet November',18),(155,'WWF634','Safe and Sound',19),(156,'WWF634','Pleasure',19),(157,'WWF634','Alakazam !',19),(158,'WWF634','Fire',19),(159,'WWF634','Stop',19),(160,'WWF634','Chorus',19),(161,'WWF634','Randy',19),(162,'WWF634','Heavy Metal',19),(163,'BDXQOL','Oh My Dis Side',20),(164,'BDXQOL','3500',20),(165,'BDXQOL','Wasted',20),(166,'BDXQOL','90210',20),(167,'BDXQOL','Pray 4 Love',20),(168,'BDXQOL','Nightcrawler',20),(169,'BDXQOL','On Your Grave',20),(170,'BDXQOL','Antidote',20),(171,'YOWPMX','Torch',21),(172,'YOWPMX','Lord Have Mercy',21),(173,'YOWPMX','That Part',21),(174,'YOWPMX','Ride Out',21),(175,'YOWPMX','By Any Means',21),(176,'YOWPMX','John Muir',21),(177,'YOWPMX','Neva Change',21),(178,'YOWPMX','Blank Face',21),(179,'YOWPMX','Overtime',21),(180,'0WPJVT','Intro',22),(181,'0WPJVT','Interlude 1',22),(182,'0WPJVT','Tessellate',22),(183,'0WPJVT','Breezeblocks',22),(184,'0WPJVT','Interlude 2',22),(185,'0WPJVT','Something Good',22),(186,'0WPJVT','Dissolve Me',22),(187,'0WPJVT','Matilda',22),(188,'0WPJVT','Ms',22),(189,'0WPJVT','Fitzpleasure',22),(190,'0WPJVT','BloodFloor',22),(191,'QVGC2D','Free Smoke',23),(192,'QVGC2D','No Long Talk',23),(193,'QVGC2D','PassionFruit',23),(194,'QVGC2D','Get It Together',23),(195,'QVGC2D','4422',23),(196,'QVGC2D','Blem',23),(197,'QVGC2D','Skepta Interlude',23),(198,'QVGC2D','Portland',23),(199,'QVGC2D','Sacrifices',23);
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` char(255) NOT NULL,
  `address` varchar(75) DEFAULT NULL,
  `phone_number` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'gdmurray','password','27 Broadfield Dr','4167950927'),(2,'claudiaw','soccer','31 Lorene Dr.','4160392391'),(3,'charm','123','123 Laurier. Dr','1233022022'),(4,'ksanwal','meechie','332 King Street North','4163923912'),(5,'sbrach','bongo','333 King Street North','4162732736'),(6,'abatia','password','333 King Street W.','4167950237'),(7,'mdurigon','luxe1105','333 King Street N.','4169230918'),(8,'spuri','password','283 WLU Ct.','5192329823'),(9,'mfalzone','dishes','333 King Street N.','3729239238'),(10,'msolski','justice','48 Albert St.','7292932931');
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

-- Dump completed on 2017-03-20 13:27:10
