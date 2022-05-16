-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: 
-- ------------------------------------------------------
-- Server version	10.7.3-MariaDB-1:10.7.3+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `star_wars`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `star_wars` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `star_wars`;

--
-- Table structure for table `character`
--

DROP TABLE IF EXISTS `character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character` (
  `idCharacter` int(11) NOT NULL AUTO_INCREMENT,
  `objectId` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `gender` text DEFAULT NULL,
  `skinColor` text DEFAULT NULL,
  `hairColor` text DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `eyeColor` text DEFAULT NULL,
  `mass` int(11) DEFAULT NULL,
  `birthYear` text DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `idPlanet` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCharacter`),
  UNIQUE KEY `character_objectId_uindex` (`objectId`) USING HASH,
  KEY `character_planet_idPlanet_fk` (`idPlanet`),
  CONSTRAINT `character_planet_idPlanet_fk` FOREIGN KEY (`idPlanet`) REFERENCES `planet` (`idPlanet`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character`
--

LOCK TABLES `character` WRITE;
/*!40000 ALTER TABLE `character` DISABLE KEYS */;
INSERT INTO `character` VALUES
(83,'nxpAPnATEb','Obi-Wan Kenobi','male','fair','auburn, white',182,'blue-gray',77,'57BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',684),
(84,'2INvsFHinF','Leia Organa','female','light','brown',150,'brown',49,'19BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',630),
(85,'FHPqlIexEv','Wicket Systri Warrick','male','brown','brown',88,'brown',20,'8BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',640),
(86,'u1kwpbPJPA','C-3PO',NULL,'gold',NULL,167,'yellow',75,'112BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',629),
(87,'3dtywptX5F','R2-D2',NULL,'white, blue',NULL,96,'red',32,'33BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',636),
(88,'1bnytxJvoC','Beru Whitesun lars','female','light','brown',165,'blue',75,'47BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',629),
(89,'oL9jCiMoLI','Padmé Amidala','female','light','brown',185,'brown',45,'46BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',636),
(90,'GtJFN6i9Jo','Owen Lars','male','light','brown, grey',178,'blue',120,'52BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',629),
(91,'gCL58ti9rQ','Bib Fortuna','male','pale','none',180,'pink',NULL,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',674),
(92,'C5Ar7rTHAz','Nien Nunb','male','grey','none',160,'black',68,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',645),
(93,'vaOWPFwVEq','Grievous','male','brown, white','none',216,'green, yellow',159,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',685),
(94,'0vkKBoC2mB','Taun We','female','grey','none',213,'black',NULL,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',642),
(95,'wdewqb9hu5','Boba Fett','male','fair','black',183,'brown',78,'31.5BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',642),
(96,'gyZon7lc9S','Mas Amedda','male','blue','none',196,'blue',NULL,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',675),
(97,'OVh4Yg0wfz','Lobot','male','light','none',175,'blue',79,'37BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',633),
(98,'iGdx5UYmNU','Wat Tambor','male','green, grey','none',193,NULL,48,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',648),
(99,'GDiOUvFWpg','Sly Moore','female','pale','none',178,'white',48,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',647),
(100,'LeJqCLjGzL','Biggs Darklighter','male','light','black',183,'brown',84,'24BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',629),
(101,'7aWfTTVBst','Zam Wesell','female','fair, green, yellow','blonde',168,'yellow',55,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',650),
(102,'0teUVBC5WU','Darth Vader','male','white','none',202,'yellow',136,'41.9BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',629),
(103,'6o86LGdASP','Yarael Poof','male','white','none',264,'yellow',NULL,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',654),
(104,'UfuAjFNzgc','Lama Su','male','grey','none',229,'black',88,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',642),
(105,'CE5mHKOuZd','Palpatine','male','pale','grey',170,'yellow',75,'82BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',636),
(106,'9Lu3hWBWxa','Tarfful','male','brown','brown',234,'blue',136,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',686),
(107,'QnjNjWUB9p','Dexter Jettster','male','brown','none',198,'yellow',102,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',661),
(108,'6sE2oKoUzf','Tion Medon','male','grey','none',206,'black',80,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',632),
(109,'OzKSDT3MuT','Poggle the Lesser','male','green','none',183,'yellow',80,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',634),
(110,'ASUKSjTyGL','Jek Tono Porkins','male','fair','brown',180,'blue',110,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',671),
(111,'DT85pY7jMm','Raymus Antilles','male','light','brown',188,'brown',79,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',630),
(112,'qLgUk6I4jh','Watto','male','blue, grey','black',137,'yellow',NULL,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',666),
(113,'KXxAhWYcms','Jar Jar Binks','male','orange','none',196,'orange',66,'52BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',636),
(114,'uFjDJRxIRO','Han Solo','male','fair','brown',180,'brown',80,'29BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',681),
(115,'VHNcHrqIkC','Sebulba','male','grey, red','none',112,'orange',40,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',643),
(116,'BWtaxWrsSy','Rugor Nass','male','green','none',206,'orange',NULL,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',636),
(117,'9ydEn9uEPr','Luminara Unduli','female','yellow','black',170,'blue',56,'58BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',641),
(118,'aHi8DkVdCL','Shaak Ti','female','red, blue, white','none',178,'black',57,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',676),
(119,'VkGbeqSDEd','Yoda','male','green','white',66,'brown',17,'896BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',673),
(120,'xdyCPBdU5q','Shmi Skywalker','female','fair','black',163,'brown',NULL,'72BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',629),
(121,'OPaE40IScs','Lando Calrissian','male','dark','black',177,'brown',79,'31BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',646),
(122,'FGL7xipkOO','Ben Quadinaros','male','grey, green, yellow','none',163,'orange',65,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',655),
(123,'k9aoLmL6df','Nute Gunray','male','mottled green','none',191,'red',90,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',639),
(124,'a2CEYyEWfF','Ackbar','male','brown mottle','none',180,'orange',83,'41BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',644),
(125,'tsKWrvOV89','Dooku','male','fair','white',193,'brown',80,'102BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',653),
(126,'E50udf4uQE','Mace Windu','male','dark','none',188,'brown',84,'72BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',683),
(127,'JFC94Dkuke','IG-88','none','metal','none',200,'red',140,'15BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',673),
(128,'KpigKjIB6J','Anakin Skywalker','male','fair','blond',188,'blue',84,'41.9BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',629),
(129,'NEvDrgJ1l8','Wilhuff Tarkin','male','fair','auburn, grey',180,'blue',NULL,'64BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',667),
(130,'WoqNGersBy','Plo Koon','male','orange','none',188,'black',80,'22BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',679),
(131,'laadAzRTGc','Ric Olié','male','fair','brown',183,'blue',NULL,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',636),
(132,'G4s2waH7wE','Eeth Koth','male','brown','black',171,'brown',NULL,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',638),
(133,'LPEUlwy4RJ','Luke Skywalker','male','fair','blond',172,'blue',77,'19BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',629),
(134,'Pzb5344m9Q','Gregar Typho','male','dark','black',185,'brown',85,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',636),
(135,'dKlPZIXAYT','Jocasta Nu','female','fair','white',167,'blue',NULL,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',631),
(136,'soYe1MeBeb','Arvel Crynyd','male','fair','brown',NULL,'brown',NULL,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',673),
(137,'P5lWMFInNN','Kit Fisto','male','green','none',196,'black',87,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',665),
(138,'1NXrmiChSe','Saesee Tiin','male','pale','none',188,'orange',NULL,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',657),
(139,'cu4zjDaXfr','R4-P17','female','silver, red','none',96,'red, blue',NULL,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',673),
(140,'9rhfYf4tGR','Gasgano','male','white, blue','none',122,'black',NULL,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',656),
(141,'c9LOg1t3As','Cordé','female','light','brown',157,'brown',NULL,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',636),
(142,'R0McYE66gy','San Hill','male','grey','none',191,'gold',NULL,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',651),
(143,'iwAusGiDCf','Quarsh Panaka','male','dark','black',183,'brown',NULL,'62BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',636),
(144,'4ce6iNwMJk','R5-D4',NULL,'white, red',NULL,97,'red',32,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',629),
(145,'YD2KryeEYu','Ratts Tyerel','male','grey, blue','none',79,NULL,15,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',658),
(146,'LS6YVwh4bD','Ayla Secura','female','blue','none',178,'hazel',55,'48BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',674),
(147,'zAMkPZYQXf','Bossk','male','green','none',190,'red',113,'53BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',652),
(148,'0jnD4Dkq32','Barriss Offee','female','yellow','black',166,'blue',50,'40BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',641),
(149,'26ro24HNce','Chewbacca','male',NULL,'brown',228,'blue',112,'200BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',686),
(150,'MVX5XcZg1T','Wedge Antilles','male','fair','brown',170,'hazel',77,'21BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',681),
(151,'uVEZCGWfAm','Bail Prestor Organa','male','tan','black',191,'brown',NULL,'67BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',630),
(152,'FUgb7NeYl8','Darth Maul','male','red','none',175,'yellow',80,'54BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',663),
(153,'1oc8F4xS7t','Adi Gallia','female','dark','none',184,'blue',50,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',631),
(154,'AfMOqnIIBI','Dud Bolt','male','blue, grey','none',94,'yellow',45,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',668),
(155,'LZuFvEayY1','Dormé','female','light','brown',165,'brown',NULL,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',636),
(156,'jimrhYkMSO','Cliegg Lars','male','fair','brown',183,'blue',NULL,'82BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',629),
(157,'V5CA4gq96l','Finis Valorum','male','fair','blond',170,'blue',NULL,'91BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',631),
(158,'kzkQn1jtND','Jabba Desilijic Tiure','hermaphrodite','green-tan, brown',NULL,175,'orange',NULL,'600BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',672),
(159,'rrAdAIJiSm','Ki-Adi-Mundi','male','pale','white',198,'yellow',82,'92BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',670),
(160,'4gc8DvI4Dw','Jango Fett','male','tan','black',183,'brown',79,'66BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',680),
(161,'me9LL0DKdJ','Qui-Gon Jinn','male','fair','brown',193,'blue',89,'92BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',673),
(162,'rAd55y31Tk','Greedo','male','green',NULL,173,'black',74,'44BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',678),
(163,'3p1fbNLGwf','Roos Tarpals','male','grey','none',224,'orange',82,NULL,'2019-12-13 19:42:36','2019-12-13 19:42:36',636),
(164,'Kmu4muWCCF','Mon Mothma','female','fair','auburn',150,'blue',NULL,'48BBY','2019-12-13 19:42:36','2019-12-13 19:42:36',660);
/*!40000 ALTER TABLE `character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_planet`
--

DROP TABLE IF EXISTS `character_planet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_planet` (
  `idCharacter` int(11) NOT NULL,
  `idPlanet` int(11) NOT NULL,
  PRIMARY KEY (`idCharacter`,`idPlanet`),
  KEY `character_planet_planet_idPlanet_fk` (`idPlanet`),
  CONSTRAINT `character_planet_character_idCharacter_fk` FOREIGN KEY (`idCharacter`) REFERENCES `character` (`idCharacter`),
  CONSTRAINT `character_planet_planet_idPlanet_fk` FOREIGN KEY (`idPlanet`) REFERENCES `planet` (`idPlanet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_planet`
--

LOCK TABLES `character_planet` WRITE;
/*!40000 ALTER TABLE `character_planet` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_planet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_specie`
--

DROP TABLE IF EXISTS `character_specie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_specie` (
  `idCharacter` int(11) NOT NULL,
  `idSpecie` int(11) NOT NULL,
  PRIMARY KEY (`idCharacter`,`idSpecie`),
  KEY `character_specie_specie_idSpecie_fk` (`idSpecie`),
  CONSTRAINT `character_specie_character_idCharacter_fk` FOREIGN KEY (`idCharacter`) REFERENCES `character` (`idCharacter`),
  CONSTRAINT `character_specie_specie_idSpecie_fk` FOREIGN KEY (`idSpecie`) REFERENCES `specie` (`idSpecie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_specie`
--

LOCK TABLES `character_specie` WRITE;
/*!40000 ALTER TABLE `character_specie` DISABLE KEYS */;
INSERT INTO `character_specie` VALUES
(85,304),
(86,307),
(87,307),
(91,319),
(92,308),
(93,338),
(94,336),
(96,334),
(98,326),
(101,330),
(103,329),
(104,336),
(106,315),
(107,335),
(108,332),
(109,328),
(112,311),
(113,303),
(115,314),
(116,303),
(117,333),
(118,337),
(119,306),
(122,316),
(123,309),
(124,310),
(125,302),
(127,307),
(130,327),
(132,323),
(135,302),
(137,321),
(138,325),
(140,320),
(142,331),
(144,307),
(145,312),
(146,319),
(147,305),
(148,333),
(149,315),
(151,302),
(152,323),
(153,324),
(154,318),
(155,302),
(158,317),
(159,322),
(162,313),
(163,303);
/*!40000 ALTER TABLE `character_specie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_starship`
--

DROP TABLE IF EXISTS `character_starship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_starship` (
  `idCharacter` int(11) NOT NULL,
  `idStarship` int(11) NOT NULL,
  PRIMARY KEY (`idCharacter`,`idStarship`),
  KEY `character_starship_starship_idStarship_fk` (`idStarship`),
  CONSTRAINT `character_starship_character_idCharacter_fk` FOREIGN KEY (`idCharacter`) REFERENCES `character` (`idCharacter`),
  CONSTRAINT `character_starship_starship_idStarship_fk` FOREIGN KEY (`idStarship`) REFERENCES `starship` (`idStarship`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_starship`
--

LOCK TABLES `character_starship` WRITE;
/*!40000 ALTER TABLE `character_starship` DISABLE KEYS */;
INSERT INTO `character_starship` VALUES
(83,232),
(83,233),
(83,236),
(83,237),
(83,242),
(89,226),
(89,229),
(89,237),
(92,214),
(93,242),
(95,215),
(100,210),
(102,212),
(110,210),
(114,208),
(114,214),
(121,214),
(128,229),
(128,232),
(128,236),
(130,233),
(131,227),
(133,208),
(133,210),
(134,229),
(136,222),
(149,208),
(149,214),
(150,210),
(152,228);
/*!40000 ALTER TABLE `character_starship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_vehicle`
--

DROP TABLE IF EXISTS `character_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_vehicle` (
  `idCharacter` int(11) NOT NULL,
  `idVehicle` int(11) NOT NULL,
  PRIMARY KEY (`idCharacter`,`idVehicle`),
  KEY `character_vehicle_vehicle_idVehicle_fk` (`idVehicle`),
  CONSTRAINT `character_vehicle_character_idCharacter_fk` FOREIGN KEY (`idCharacter`) REFERENCES `character` (`idCharacter`),
  CONSTRAINT `character_vehicle_vehicle_idVehicle_fk` FOREIGN KEY (`idVehicle`) REFERENCES `vehicle` (`idVehicle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_vehicle`
--

LOCK TABLES `character_vehicle` WRITE;
/*!40000 ALTER TABLE `character_vehicle` DISABLE KEYS */;
INSERT INTO `character_vehicle` VALUES
(83,211),
(84,219),
(93,226),
(101,205),
(125,234),
(128,198),
(128,228),
(133,219),
(133,231),
(149,233),
(150,231),
(152,202),
(161,211);
/*!40000 ALTER TABLE `character_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film` (
  `idFilm` int(11) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `objectId` text DEFAULT NULL,
  `episodeId` int(11) DEFAULT NULL,
  `releaseDate` datetime DEFAULT NULL,
  `producer` text DEFAULT NULL,
  `director` text DEFAULT NULL,
  `openingCrawl` text DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`idFilm`),
  UNIQUE KEY `film_objectId_uindex` (`objectId`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES
(91,NULL,'GteveE4ytb',4,'1977-05-25 00:00:00','Gary Kurtz, Rick McCallum','George Lucas','It is a period of civil war.\r\nRebel spaceships, striking\r\nfrom a hidden base, have won\r\ntheir first victory against\r\nthe evil Galactic Empire.\r\n\r\nDuring the battle, Rebel\r\nspies managed to steal secret\r\nplans to the Empire\'s\r\nultimate weapon, the DEATH\r\nSTAR, an armored space\r\nstation with enough power\r\nto destroy an entire planet.\r\n\r\nPursued by the Empire\'s\r\nsinister agents, Princess\r\nLeia races home aboard her\r\nstarship, custodian of the\r\nstolen plans that can save her\r\npeople and restore\r\nfreedom to the galaxy....','2019-12-13 19:42:35','2019-12-13 19:42:35'),
(92,NULL,'fMoDABNwV9',1,'1999-05-19 00:00:00','Rick McCallum','George Lucas','Turmoil has engulfed the\r\nGalactic Republic. The taxation\r\nof trade routes to outlying star\r\nsystems is in dispute.\r\n\r\nHoping to resolve the matter\r\nwith a blockade of deadly\r\nbattleships, the greedy Trade\r\nFederation has stopped all\r\nshipping to the small planet\r\nof Naboo.\r\n\r\nWhile the Congress of the\r\nRepublic endlessly debates\r\nthis alarming chain of events,\r\nthe Supreme Chancellor has\r\nsecretly dispatched two Jedi\r\nKnights, the guardians of\r\npeace and justice in the\r\ngalaxy, to settle the conflict....','2019-12-13 19:42:35','2019-12-13 19:42:35'),
(93,NULL,'SFHc9Y4gXA',6,'1983-05-25 00:00:00','Howard G. Kazanjian, George Lucas, Rick McCallum','Richard Marquand','Luke Skywalker has returned to\r\nhis home planet of Tatooine in\r\nan attempt to rescue his\r\nfriend Han Solo from the\r\nclutches of the vile gangster\r\nJabba the Hutt.\r\n\r\nLittle does Luke know that the\r\nGALACTIC EMPIRE has secretly\r\nbegun construction on a new\r\narmored space station even\r\nmore powerful than the first\r\ndreaded Death Star.\r\n\r\nWhen completed, this ultimate\r\nweapon will spell certain doom\r\nfor the small band of rebels\r\nstruggling to restore freedom\r\nto the galaxy...','2019-12-13 19:42:35','2019-12-13 19:42:35'),
(94,NULL,'RbyX4ouadm',3,'2005-05-19 00:00:00','Rick McCallum','George Lucas','War! The Republic is crumbling\r\nunder attacks by the ruthless\r\nSith Lord, Count Dooku.\r\nThere are heroes on both sides.\r\nEvil is everywhere.\r\n\r\nIn a stunning move, the\r\nfiendish droid leader, General\r\nGrievous, has swept into the\r\nRepublic capital and kidnapped\r\nChancellor Palpatine, leader of\r\nthe Galactic Senate.\r\n\r\nAs the Separatist Droid Army\r\nattempts to flee the besieged\r\ncapital with their valuable\r\nhostage, two Jedi Knights lead a\r\ndesperate mission to rescue the\r\ncaptive Chancellor....','2019-12-13 19:42:35','2019-12-13 19:42:35'),
(95,NULL,'NtEIWnlRYH',2,'2002-05-16 00:00:00','Rick McCallum','George Lucas','There is unrest in the Galactic\r\nSenate. Several thousand solar\r\nsystems have declared their\r\nintentions to leave the Republic.\r\n\r\nThis separatist movement,\r\nunder the leadership of the\r\nmysterious Count Dooku, has\r\nmade it difficult for the limited\r\nnumber of Jedi Knights to maintain \r\npeace and order in the galaxy.\r\n\r\nSenator Amidala, the former\r\nQueen of Naboo, is returning\r\nto the Galactic Senate to vote\r\non the critical issue of creating\r\nan ARMY OF THE REPUBLIC\r\nto assist the overwhelmed\r\nJedi....','2019-12-13 19:42:35','2019-12-13 19:42:35'),
(96,NULL,'mRAWzGNBfG',5,'1980-05-17 00:00:00','Gary Kurtz, Rick McCallum','Irvin Kershner','It is a dark time for the\r\nRebellion. Although the Death\r\nStar has been destroyed,\r\nImperial troops have driven the\r\nRebel forces from their hidden\r\nbase and pursued them across\r\nthe galaxy.\r\n\r\nEvading the dreaded Imperial\r\nStarfleet, a group of freedom\r\nfighters led by Luke Skywalker\r\nhas established a new secret\r\nbase on the remote ice world\r\nof Hoth.\r\n\r\nThe evil lord Darth Vader,\r\nobsessed with finding young\r\nSkywalker, has dispatched\r\nthousands of remote probes into\r\nthe far reaches of space....','2019-12-13 19:42:35','2019-12-13 19:42:35');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_character`
--

DROP TABLE IF EXISTS `film_character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_character` (
  `idFilm` int(11) DEFAULT NULL,
  `idCharacter` int(11) NOT NULL,
  UNIQUE KEY `film_character_pk` (`idFilm`,`idCharacter`),
  KEY `film_character_character_idCharacter_fk` (`idCharacter`),
  CONSTRAINT `film_character_character_idCharacter_fk` FOREIGN KEY (`idCharacter`) REFERENCES `character` (`idCharacter`),
  CONSTRAINT `film_character_film_idFilm_fk` FOREIGN KEY (`idFilm`) REFERENCES `film` (`idFilm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_character`
--

LOCK TABLES `film_character` WRITE;
/*!40000 ALTER TABLE `film_character` DISABLE KEYS */;
INSERT INTO `film_character` VALUES
(91,83),
(91,84),
(91,86),
(91,87),
(91,88),
(91,90),
(91,100),
(91,102),
(91,110),
(91,111),
(91,114),
(91,129),
(91,133),
(91,144),
(91,149),
(91,150),
(91,158),
(91,162),
(92,83),
(92,86),
(92,87),
(92,89),
(92,96),
(92,103),
(92,105),
(92,112),
(92,113),
(92,115),
(92,116),
(92,119),
(92,120),
(92,122),
(92,123),
(92,126),
(92,128),
(92,130),
(92,131),
(92,132),
(92,137),
(92,138),
(92,140),
(92,143),
(92,145),
(92,146),
(92,152),
(92,153),
(92,154),
(92,157),
(92,158),
(92,159),
(92,161),
(92,163),
(93,83),
(93,84),
(93,85),
(93,86),
(93,87),
(93,91),
(93,92),
(93,95),
(93,102),
(93,105),
(93,114),
(93,119),
(93,121),
(93,124),
(93,133),
(93,136),
(93,149),
(93,150),
(93,158),
(93,164),
(94,83),
(94,84),
(94,86),
(94,87),
(94,88),
(94,89),
(94,90),
(94,93),
(94,99),
(94,102),
(94,105),
(94,106),
(94,108),
(94,109),
(94,111),
(94,117),
(94,118),
(94,119),
(94,123),
(94,125),
(94,126),
(94,128),
(94,129),
(94,130),
(94,132),
(94,133),
(94,137),
(94,138),
(94,139),
(94,146),
(94,149),
(94,151),
(94,153),
(94,159),
(95,83),
(95,86),
(95,87),
(95,88),
(95,89),
(95,90),
(95,94),
(95,95),
(95,96),
(95,98),
(95,99),
(95,101),
(95,104),
(95,105),
(95,107),
(95,109),
(95,112),
(95,113),
(95,117),
(95,118),
(95,119),
(95,120),
(95,123),
(95,125),
(95,126),
(95,128),
(95,130),
(95,134),
(95,135),
(95,137),
(95,139),
(95,141),
(95,142),
(95,146),
(95,148),
(95,151),
(95,155),
(95,156),
(95,159),
(95,160),
(96,83),
(96,84),
(96,86),
(96,87),
(96,95),
(96,97),
(96,102),
(96,105),
(96,114),
(96,119),
(96,121),
(96,127),
(96,133),
(96,147),
(96,149),
(96,150);
/*!40000 ALTER TABLE `film_character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_planet`
--

DROP TABLE IF EXISTS `film_planet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_planet` (
  `idFilm` int(11) NOT NULL,
  `idPlanet` int(11) NOT NULL,
  PRIMARY KEY (`idFilm`,`idPlanet`),
  KEY `film_planet_planet_idPlanet_fk` (`idPlanet`),
  CONSTRAINT `film_planet_film_idFilm_fk` FOREIGN KEY (`idFilm`) REFERENCES `film` (`idFilm`),
  CONSTRAINT `film_planet_planet_idPlanet_fk` FOREIGN KEY (`idPlanet`) REFERENCES `planet` (`idPlanet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_planet`
--

LOCK TABLES `film_planet` WRITE;
/*!40000 ALTER TABLE `film_planet` DISABLE KEYS */;
INSERT INTO `film_planet` VALUES
(91,627),
(91,629),
(91,630),
(92,629),
(92,631),
(92,636),
(93,628),
(93,629),
(93,631),
(93,636),
(93,640),
(94,628),
(94,629),
(94,630),
(94,631),
(94,632),
(94,636),
(94,637),
(94,639),
(94,662),
(94,669),
(94,677),
(94,682),
(94,686),
(95,629),
(95,631),
(95,634),
(95,636),
(95,642),
(96,628),
(96,633),
(96,635),
(96,664);
/*!40000 ALTER TABLE `film_planet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_specie`
--

DROP TABLE IF EXISTS `film_specie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_specie` (
  `idFilm` int(11) NOT NULL,
  `idSpecie` int(11) NOT NULL,
  PRIMARY KEY (`idFilm`,`idSpecie`),
  KEY `file_specie_specie_idSpecie_fk` (`idSpecie`),
  CONSTRAINT `file_specie_film_idFilm_fk` FOREIGN KEY (`idFilm`) REFERENCES `film` (`idFilm`),
  CONSTRAINT `file_specie_specie_idSpecie_fk` FOREIGN KEY (`idSpecie`) REFERENCES `specie` (`idSpecie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_specie`
--

LOCK TABLES `film_specie` WRITE;
/*!40000 ALTER TABLE `film_specie` DISABLE KEYS */;
INSERT INTO `film_specie` VALUES
(91,302),
(91,307),
(91,313),
(91,315),
(91,317),
(92,302),
(92,303),
(92,306),
(92,307),
(92,309),
(92,311),
(92,312),
(92,314),
(92,316),
(92,318),
(92,319),
(92,320),
(92,321),
(92,322),
(92,323),
(92,324),
(92,325),
(92,327),
(92,329),
(92,334),
(93,302),
(93,304),
(93,306),
(93,307),
(93,308),
(93,310),
(93,315),
(93,317),
(93,319),
(94,302),
(94,306),
(94,307),
(94,315),
(94,316),
(94,319),
(94,322),
(94,324),
(94,325),
(94,326),
(94,327),
(94,328),
(94,329),
(94,330),
(94,331),
(94,332),
(94,333),
(94,334),
(94,337),
(94,338),
(95,302),
(95,303),
(95,306),
(95,307),
(95,311),
(95,319),
(95,326),
(95,328),
(95,330),
(95,331),
(95,333),
(95,335),
(95,336),
(95,337),
(96,302),
(96,305),
(96,306),
(96,307),
(96,315);
/*!40000 ALTER TABLE `film_specie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_starship`
--

DROP TABLE IF EXISTS `film_starship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_starship` (
  `idFilm` int(11) NOT NULL,
  `idStarship` int(11) NOT NULL,
  PRIMARY KEY (`idFilm`,`idStarship`),
  KEY `film_starship_starship_idStarship_fk` (`idStarship`),
  CONSTRAINT `film_starship_film_idFilm_fk` FOREIGN KEY (`idFilm`) REFERENCES `film` (`idFilm`),
  CONSTRAINT `film_starship_starship_idStarship_fk` FOREIGN KEY (`idStarship`) REFERENCES `starship` (`idStarship`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_starship`
--

LOCK TABLES `film_starship` WRITE;
/*!40000 ALTER TABLE `film_starship` DISABLE KEYS */;
INSERT INTO `film_starship` VALUES
(91,207),
(91,209),
(91,210),
(91,211),
(91,212),
(91,214),
(91,219),
(91,220),
(92,224),
(92,225),
(92,227),
(92,228),
(92,229),
(93,207),
(93,208),
(93,209),
(93,210),
(93,211),
(93,213),
(93,214),
(93,216),
(93,217),
(93,218),
(93,221),
(93,222),
(94,209),
(94,224),
(94,230),
(94,231),
(94,232),
(94,233),
(94,234),
(94,236),
(94,237),
(94,238),
(94,239),
(94,242),
(95,215),
(95,223),
(95,224),
(95,226),
(95,229),
(95,233),
(95,235),
(95,240),
(95,241),
(96,207),
(96,208),
(96,210),
(96,211),
(96,213),
(96,214),
(96,215),
(96,217),
(96,218);
/*!40000 ALTER TABLE `film_starship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_vehicle`
--

DROP TABLE IF EXISTS `film_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film_vehicle` (
  `idFilm` int(11) NOT NULL,
  `idVehicle` int(11) NOT NULL,
  PRIMARY KEY (`idFilm`,`idVehicle`),
  KEY `table_name_vehicle_idVehicle_fk` (`idVehicle`),
  CONSTRAINT `film_vehicle_film_idFilm_fk` FOREIGN KEY (`idFilm`) REFERENCES `film` (`idFilm`),
  CONSTRAINT `table_name_vehicle_idVehicle_fk` FOREIGN KEY (`idVehicle`) REFERENCES `vehicle` (`idVehicle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_vehicle`
--

LOCK TABLES `film_vehicle` WRITE;
/*!40000 ALTER TABLE `film_vehicle` DISABLE KEYS */;
INSERT INTO `film_vehicle` VALUES
(91,199),
(91,200),
(91,201),
(91,220),
(92,197),
(92,202),
(92,206),
(92,207),
(92,211),
(92,213),
(92,232),
(93,196),
(93,199),
(93,203),
(93,208),
(93,209),
(93,219),
(93,230),
(93,233),
(94,204),
(94,206),
(94,212),
(94,215),
(94,216),
(94,217),
(94,218),
(94,221),
(94,222),
(94,224),
(94,225),
(94,226),
(94,229),
(95,198),
(95,200),
(95,204),
(95,205),
(95,214),
(95,221),
(95,223),
(95,224),
(95,227),
(95,228),
(95,234),
(96,196),
(96,199),
(96,208),
(96,210),
(96,231),
(96,233);
/*!40000 ALTER TABLE `film_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planet`
--

DROP TABLE IF EXISTS `planet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planet` (
  `idPlanet` int(11) NOT NULL AUTO_INCREMENT,
  `objectId` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `climate` text DEFAULT NULL,
  `terrain` text DEFAULT NULL,
  `surfaceWater` text DEFAULT NULL,
  `diameter` int(11) DEFAULT NULL,
  `rotationPeriod` int(11) DEFAULT NULL,
  `gravity` text DEFAULT NULL,
  `orbitalPeriod` int(11) DEFAULT NULL,
  `population` bigint(20) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`idPlanet`),
  UNIQUE KEY `planet_objectId_uindex` (`objectId`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=688 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planet`
--

LOCK TABLES `planet` WRITE;
/*!40000 ALTER TABLE `planet` DISABLE KEYS */;
INSERT INTO `planet` VALUES
(627,'JNgiSeuJwR','Yavin IV','temperate,tropical','jungle,rainforests','8',10200,24,'1 standard',4818,1000,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(628,'lZHyO0MIr6','Dagobah','murky','swamp,jungles','8',8900,23,NULL,341,NULL,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(629,'PL36fSGLoW','Tatooine','arid','desert','1',10465,23,'1 standard',304,200000,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(630,'43NzGsaO90','Alderaan','temperate','grasslands,mountains','40',12500,24,'1 standard',364,2000000000,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(631,'AmxEngCKLr','Coruscant','temperate','cityscape,mountains',NULL,12240,24,'1 standard',368,1000000000000,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(632,'3M3m6D09tw','Utapau','temperate,arid,windy','scrublands,savanna,canyons,sinkholes','0.9',12900,27,'1 standard',351,95000000,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(633,'vGTILbhPdN','Bespin','temperate','gas giant','0',118000,12,'1.5 (surface), 1 standard (Cloud City)',5110,6000000,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(634,'nn4RvL2myQ','Geonosis','temperate,arid','rock,desert,mountain,barren','5',11370,30,'0.9 standard',256,100000000000,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(635,'hQRmOitrd4','Hoth','frozen','tundra,ice caves,mountain ranges','100',7200,23,'1.1 standard',549,NULL,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(636,'6EhvyQR6tl','Naboo','temperate','grassy hills,swamps,forests,mountains','12',12120,26,'1 standard',312,4500000000,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(637,'gklElx7jRT','Saleucami','hot','caves,desert,mountains,volcanoes',NULL,14920,26,NULL,392,1400000000,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(638,'1YfnDESFrB','Iridonia','','rocky canyons,acid pools',NULL,NULL,29,NULL,413,NULL,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(639,'Jt7sJ8ZI7t','Cato Neimoidia','temperate,moist','mountains,fields,forests,rock arches',NULL,0,25,'1 standard',278,10000000,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(640,'XkKWE6DYG2','Endor','temperate','forests,mountains,lakes','8',4900,18,'0.85 standard',402,30000000,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(641,'OasAWgeN2p','Mirial','','deserts',NULL,NULL,NULL,NULL,NULL,NULL,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(642,'z2uJ1N7RUj','Kamino','temperate','ocean','100',19720,27,'1 standard',463,1000000000,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(643,'71987spC7M','Malastare','arid,temperate,tropical','swamps,deserts,jungles,mountains',NULL,18880,26,'1.56',201,2000000000,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(644,'EY3gbE2taR','Mon Cala','temperate','oceans,reefs,islands','100',11030,21,'1',398,27000000000,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(645,'BHaIFQtv7i','Sullust','superheated','mountains,volcanoes,rocky deserts','5',12780,20,'1',263,18500000000,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(646,'MkXwqjoOVG','Socorro','arid','deserts,mountains',NULL,0,20,'1 standard',326,300000000,'2019-12-13 19:42:32','2019-12-13 19:42:32'),
(647,'LmdXkjBVMi','Umbara','','',NULL,NULL,NULL,NULL,NULL,NULL,'2019-12-13 19:42:32','2019-12-13 19:42:32'),
(648,'81Z42snwmA','Skako','temperate','urban,vines',NULL,NULL,27,'1',384,500000000000,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(649,'8hp7YqVxyG','Tholoth','','',NULL,NULL,NULL,NULL,NULL,NULL,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(650,'RWSfQanzkC','Zolan','','',NULL,NULL,NULL,NULL,NULL,NULL,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(651,'vDGo92KQPT','Muunilinst','temperate','plains,forests,hills,mountains','25',13800,28,'1',412,5000000000,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(652,'1YIAHpQAZF','Trandosha','arid','mountains,seas,grasslands,deserts',NULL,0,25,'0.62 standard',371,42000000,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(653,'T37misMaSB','Serenno','','rainforests,rivers,mountains',NULL,NULL,NULL,NULL,NULL,NULL,'2019-12-13 19:42:32','2019-12-13 19:42:32'),
(654,'ICyD92JiTe','Quermia','','',NULL,NULL,NULL,NULL,NULL,NULL,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(655,'AQHJndEr19','Tund','','barren,ash',NULL,12190,48,NULL,1770,0,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(656,'6M9weFJ7bG','Troiken','','desert,tundra,rainforests,mountains',NULL,NULL,NULL,NULL,NULL,NULL,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(657,'OpLqGkPBu4','Iktotch','arid,rocky,windy','rocky',NULL,NULL,22,'1',481,NULL,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(658,'IV6wThNACG','Aleen Minor','','',NULL,NULL,NULL,NULL,NULL,NULL,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(659,'VhTkTAACOz','Dantooine','temperate','oceans,savannas,mountains,grasslands',NULL,9830,25,'1 standard',378,1000,'2019-12-13 19:42:31','2019-12-13 19:42:31'),
(660,'uucu3Oy9LO','Chandrila','temperate','plains,forests','40',13500,20,'1',368,1200000000,'2019-12-13 19:42:32','2019-12-13 19:42:32'),
(661,'gAy3fHM7d2','Ojom','frigid','oceans,glaciers','100',NULL,NULL,NULL,NULL,500000000,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(662,'ubZP8dWW5W','Polis Massa','artificial temperate ','airless asteroid','0',0,24,'0.56 standard',590,1000000,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(663,'nwcgkmfQnB','Dathomir','temperate','forests,deserts,savannas',NULL,10480,24,'0.9',491,5200,'2019-12-13 19:42:32','2019-12-13 19:42:32'),
(664,'8v6oV8B1vV','Ord Mantell','temperate','plains,seas,mesas','10',14050,26,'1 standard',334,4000000000,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(665,'w04mDHwm4E','Glee Anselm','tropical,temperate','lakes,islands,swamps,seas','80',15600,33,'1',206,500000000,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(666,'nFLrjhrAnU','Toydaria','temperate','swamps,lakes',NULL,7900,21,'1',184,11000000,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(667,'mgbTNcGfBu','Eriadu','polluted','cityscape',NULL,13490,24,'1 standard',360,22000000000,'2019-12-13 19:42:32','2019-12-13 19:42:32'),
(668,'rfyNcjTeGz','Vulpter','temperate,artic','urban,barren',NULL,14900,22,'1',391,421000000,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(669,'EDefVfBjfK','Mygeeto','frigid','glaciers,mountains,ice canyons',NULL,10088,12,'1 standard',167,19000000,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(670,'jhdx7YIGef','Cerea','temperate','verdant','20',NULL,27,'1',386,450000000,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(671,'VVWsTazBP0','Bestine IV','temperate','rocky islands,oceans','98',6400,26,NULL,680,62000000,'2019-12-13 19:42:32','2019-12-13 19:42:32'),
(672,'YGflaUC1Kg','Nal Hutta','temperate','urban,oceans,swamps,bogs',NULL,12150,87,'1 standard',413,7000000000,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(673,'udrPy9AkhD',NULL,'','',NULL,0,0,NULL,0,NULL,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(674,'hLoKcYf27J','Ryloth','temperate,arid,subartic','mountains,valleys,deserts,tundra','5',10600,30,'1',305,1500000000,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(675,'4m1OB1jIjC','Champala','temperate','oceans,rainforests,plateaus',NULL,NULL,27,'1',318,3500000000,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(676,'Xu82yRBXgZ','Shili','temperate','cities,savannahs,seas,plains',NULL,NULL,NULL,'1',NULL,NULL,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(677,'KhAN9CBelR','Felucia','hot,humid','fungus forests',NULL,9100,34,'0.75 standard',231,8500000,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(678,'yOswX1MpKK','Rodia','hot','jungles,oceans,urban,swamps','60',7549,29,'1 standard',305,1300000000,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(679,'amNSuY5YKH','Dorin','temperate','',NULL,13400,22,'1',409,NULL,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(680,'D23qC9QM5p','Concord Dawn','','jungles,forests,deserts',NULL,NULL,NULL,NULL,NULL,NULL,'2019-12-13 19:42:32','2019-12-13 19:42:32'),
(681,'eukAnISjbt','Corellia','temperate','plains,urban,hills,forests','70',11000,25,'1 standard',329,3000000000,'2019-12-13 19:42:32','2019-12-13 19:42:32'),
(682,'O0AF6Vm9y8','Mustafar','hot','volcanoes,lava rivers,mountains,caves','0',4200,36,'1 standard',412,20000,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(683,'nKFt540DDl','Haruun Kal','temperate','toxic cloudsea,plateaus,volcanoes',NULL,10120,25,'0.98',383,705300,'2019-12-13 19:42:32','2019-12-13 19:42:32'),
(684,'Fwz1bh8rSD','Stewjon','temperate','grass',NULL,0,NULL,'1 standard',NULL,NULL,'2019-12-13 19:42:32','2019-12-13 19:42:32'),
(685,'FR8HGCrbyi','Kalee','arid,temperate,tropical','rainforests,cliffs,canyons,seas',NULL,13850,23,'1',378,4000000000,'2019-12-13 19:42:33','2019-12-13 19:42:33'),
(686,'EvtUWbZuHM','Kashyyyk','tropical','jungle,forests,lakes,rivers','60',12765,26,'1 standard',381,45000000,'2019-12-13 19:42:35','2019-12-13 19:42:35'),
(687,'111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `planet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planet_specie`
--

DROP TABLE IF EXISTS `planet_specie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planet_specie` (
  `idPlanet` int(11) NOT NULL,
  `idSpecie` int(11) NOT NULL,
  PRIMARY KEY (`idPlanet`,`idSpecie`),
  KEY `planet_specie_specie_idSpecie_fk` (`idSpecie`),
  CONSTRAINT `planet_specie_planet_idPlanet_fk` FOREIGN KEY (`idPlanet`) REFERENCES `planet` (`idPlanet`),
  CONSTRAINT `planet_specie_specie_idSpecie_fk` FOREIGN KEY (`idSpecie`) REFERENCES `specie` (`idSpecie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planet_specie`
--

LOCK TABLES `planet_specie` WRITE;
/*!40000 ALTER TABLE `planet_specie` DISABLE KEYS */;
INSERT INTO `planet_specie` VALUES
(631,302),
(632,332),
(634,328),
(636,303),
(638,323),
(639,309),
(640,304),
(641,333),
(642,336),
(643,314),
(644,310),
(645,308),
(648,326),
(649,324),
(650,330),
(651,331),
(652,305),
(654,329),
(655,316),
(656,320),
(657,325),
(658,312),
(661,335),
(665,321),
(666,311),
(668,318),
(670,322),
(672,317),
(673,306),
(674,319),
(675,334),
(676,337),
(678,313),
(679,327),
(685,338),
(686,315);
/*!40000 ALTER TABLE `planet_specie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specie`
--

DROP TABLE IF EXISTS `specie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specie` (
  `idSpecie` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `objectId` text DEFAULT NULL,
  `eyeColors` text DEFAULT NULL,
  `skinColors` text DEFAULT NULL,
  `hairColors` text DEFAULT NULL,
  `classification` text DEFAULT NULL,
  `designation` text DEFAULT NULL,
  `language` text DEFAULT NULL,
  `averageLifespan` int(11) DEFAULT NULL,
  `averageHeight` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`idSpecie`),
  UNIQUE KEY `specie_objectId_uindex` (`objectId`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specie`
--

LOCK TABLES `specie` WRITE;
/*!40000 ALTER TABLE `specie` DISABLE KEYS */;
INSERT INTO `specie` VALUES
(302,'Human','fqQdXdCHzs','brown,blue,green,hazel,grey,amber','caucasian,black,asian,hispanic','blonde,brown,black,red','mammal','sentient','Galactic Basic',120,180,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(303,'Gungan','BGcZHFZFY2','orange','brown,green','none','amphibian','sentient','Gungan basic',NULL,190,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(304,'Ewok','2GFwsvrHL6','orange,brown','brown','white,brown,black','mammal','sentient','Ewokese',NULL,100,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(305,'Trandoshan','yIDav7gj5a','yellow,orange','brown,green','none','reptile','sentient','Dosh',NULL,200,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(306,'Yoda\'s species','P9XQ0KxkvS','brown,green,yellow','green,yellow','brown,white','mammal','sentient','Galactic basic',900,66,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(307,'Droid','5ZKmevbH7l','','','','artificial','sentient',NULL,NULL,NULL,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(308,'Sullustan','BFHuhuVNAI','black','pale','none','mammal','sentient','Sullutese',NULL,180,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(309,'Neimodian','r0aI0EA25O','red,pink','grey,green','none',NULL,'sentient','Neimoidia',NULL,180,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(310,'Mon Calamari','AANjhB1bPT','yellow','red,blue,brown,magenta','none','amphibian','sentient','Mon Calamarian',NULL,160,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(311,'Toydarian','kOkqJvezFV','yellow','blue,green,grey','none','mammal','sentient','Toydarian',91,120,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(312,'Aleena','6hYc0wSwEI','','blue,gray','none','reptile','sentient','Aleena',79,80,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(313,'Rodian','8iMHl5QIZb','black','green,blue','','sentient','reptilian','Galatic Basic',NULL,170,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(314,'Dug','KxocRyt7eo','yellow,blue','brown,purple,grey,red','none','mammal','sentient','Dugese',NULL,100,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(315,'Wookie','Tg2ABs3sco','blue,green,yellow,brown,golden,red','gray','black,brown','mammal','sentient','Shyriiwook',400,210,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(316,'Toong','jgC9lT6Xff','orange','grey,green,yellow','none',NULL,'sentient','Tundan',NULL,200,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(317,'Hutt','DMwLWstosP','yellow,red','green,brown,tan','','gastropod','sentient','Huttese',1000,300,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(318,'Vulptereen','UZN9cHUblo','yellow','grey','none',NULL,'sentient','vulpterish',NULL,100,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(319,'Twi\'lek','rZoyjN5Eoc','blue,brown,orange,pink','orange,yellow,blue,green,pink,purple,tan','none','mammals','sentient','Twi\'leki',NULL,200,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(320,'Xexto','BobYKmivC3','black','grey,yellow,purple','none',NULL,'sentient','Xextese',NULL,125,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(321,'Nautolan','Neaerczm0T','black','green,blue,brown,red','none','amphibian','sentient','Nautila',70,180,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(322,'Cerean','HTSKBLxUq4','hazel','pale pink','red,blond,black,white','mammal','sentient','Cerean',NULL,200,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(323,'Zabrak','t48lV4Tx27','brown,orange','pale,brown,red,orange,yellow','black','mammal','sentient','Zabraki',NULL,180,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(324,'Tholothian','nAlqt8LgM1','blue,indigo','dark','','mammal','sentient',NULL,NULL,NULL,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(325,'Iktotchi','yyeDuukY4A','orange','pink','none',NULL,'sentient','Iktotchese',NULL,180,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(326,'Skakoan','WwMu5FXuSq','','grey,green','none','mammal','sentient','Skakoan',NULL,NULL,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(327,'Kel Dor','7O2h8IfBnB','black,silver','peach,orange,red','none',NULL,'sentient','Kel Dor',70,180,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(328,'Geonosian','t9VERDgOgj','green,hazel','green,brown','none','insectoid','sentient','Geonosian',NULL,178,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(329,'Quermian','CEyGcnzQpK','yellow','white','none','mammal','sentient','Quermian',86,240,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(330,'Clawdite','9SVromrYyh','yellow','green,yellow','none','reptilian','sentient','Clawdite',70,180,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(331,'Muun','tOY4tiDR6K','black','grey,white','none','mammal','sentient','Muun',100,190,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(332,'Pau\'an','wWmtNJCE0R','black','grey','none','mammal','sentient','Utapese',700,190,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(333,'Mirialan','3CeApAuCII','blue,green,red,yellow,brown,orange','yellow,green','black,brown','mammal','sentient','Mirialan',NULL,180,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(334,'Chagrian','4NgpbeTTAz','blue','blue','none','amphibian','sentient','Chagria',NULL,190,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(335,'Besalisk','lEmwwnRnnD','yellow','brown','none','amphibian','sentient','besalisk',75,178,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(336,'Kaminoan','Z7FCUAttDc','black','grey,blue','none','amphibian','sentient','Kaminoan',80,220,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(337,'Togruta','aAVx282OGJ','red,orange,yellow,green,blue,black','red,white,orange,yellow,green,blue','none','mammal','sentient','Togruti',94,180,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(338,'Kaleesh','8xpEumjqbB','yellow','brown,orange,tan','none','reptile','sentient','Kaleesh',80,170,'2019-12-13 19:42:37','2019-12-13 19:42:37');
/*!40000 ALTER TABLE `specie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `starship`
--

DROP TABLE IF EXISTS `starship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `starship` (
  `idStarship` int(11) NOT NULL AUTO_INCREMENT,
  `objectId` text DEFAULT NULL,
  `consumables` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `cargoCapacity` bigint(20) DEFAULT NULL,
  `passengers` int(11) DEFAULT NULL,
  `maxAtmospheringSpeed` int(11) DEFAULT NULL,
  `crew` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `model` text DEFAULT NULL,
  `costInCredits` bigint(20) DEFAULT NULL,
  `manufacturer` text DEFAULT NULL,
  `MGLT` int(11) DEFAULT NULL,
  `starshipClass` text DEFAULT NULL,
  `hyperdriveRating` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`idStarship`),
  UNIQUE KEY `table_name_objectId_uindex` (`objectId`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `starship`
--

LOCK TABLES `starship` WRITE;
/*!40000 ALTER TABLE `starship` DISABLE KEYS */;
INSERT INTO `starship` VALUES
(207,'F5l2KSa4Xk','1 week','Y-wing',110,0,NULL,2,14,'BTL Y-wing',134999,'Koensayr Manufacturing',80,'assault starfighter',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(208,'GyKsQsPAiW','2 months','Imperial shuttle',80000,20,850,6,20,'Lambda-class T-4a shuttle',240000,'Sienar Fleet Systems',50,'Armed government transport',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(209,'Or6puNLEn5','1 year','CR90 corvette',3000000,600,950,NULL,150,'CR90 corvette',3500000,'Corellian Engineering Corporation',60,'corvette',2,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(210,'ERk3O2ELin','1 week','X-wing',110,0,1050,1,13,'T-65 X-wing',149999,'Incom Corporation',100,'Starfighter',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(211,'g9bAc5wnTN','2 years','Star Destroyer',36000000,NULL,975,NULL,NULL,'Imperial I-class Star Destroyer',150000000,'Kuat Drive Yards',60,'Star Destroyer',2,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(212,'RTHryjQp6d','5 days','TIE Advanced x1',150,0,1200,1,9,'Twin Ion Engine Advanced x1',NULL,'Sienar Fleet Systems',105,'Starfighter',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(213,'eC4XhsytIo','2 years','EF76 Nebulon-B escort frigate',6000000,75,800,854,300,'EF76 Nebulon-B escort frigate',8500000,'Kuat Drive Yards',40,'Escort ship',2,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(214,'ZwoZE4IXAr','2 months','Millennium Falcon',100000,6,1050,4,34,'YT-1300 light freighter',100000,'Corellian Engineering Corporation',75,'Light freighter',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(215,'Dp5YCEIXR3','1 month','Slave 1',70000,6,1000,1,22,'Firespray-31-class patrol and attack',NULL,'Kuat Systems Engineering',70,'Patrol craft',3,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(216,'SmAGL2YRes','2 years','Calamari Cruiser',NULL,1200,NULL,5400,1200,'MC80 Liberty type Star Cruiser',104000000,'Mon Calamari shipyards',60,'Star Cruiser',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(217,'PHCjzxmE2l','6 years','Executor',250000000,38000,NULL,NULL,19000,'Executor-class star dreadnought',1143350000,'Kuat Drive Yards, Fondor Shipyards',40,'Star dreadnought',2,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(218,'utk70kfdBh','6 months','Rebel transport',19000000,90,650,6,90,'GR-75 medium transport',NULL,'Gallofree Yards, Inc.',20,'Medium transport',4,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(219,'deSSraPLXL','1 month','Sentinel-class landing craft',180000,75,1000,5,38,'Sentinel-class landing craft',240000,'Sienar Fleet Systems, Cyngus Spaceworks',70,'landing craft',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(220,'xrnyX0HUG9','3 years','Death Star',1000000000000,NULL,NULL,NULL,120000,'DS-1 Orbital Battle Station',1000000000000,'Imperial Department of Military Research, Sienar Fleet Systems',10,'Deep Space Mobile Battlestation',4,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(221,'xgGROzsSND','1 week','B-wing',45,0,950,1,17,'A/SF-01 B-wing starfighter',220000,'Slayn & Korpil',91,'Assault Starfighter',2,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(222,'zfyE9VfkZj','1 week','A-wing',40,0,1300,1,10,'RZ-1 A-wing Interceptor',175000,'Alliance Underground Engineering, Incom Corporation',120,'Starfighter',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(223,'p5HhbwwBGu',NULL,'AA-9 Coruscant freighter',NULL,30000,NULL,NULL,390,'Botajef AA-9 Freighter-Liner',NULL,'Botajef Shipyards',NULL,'freighter',NULL,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(224,'n18UV3HGbg','500 days','Droid control ship',4000000000,139000,NULL,175,3170,'Lucrehulk-class Droid Control Ship',NULL,'Hoersch-Kessel Drive, Inc.',NULL,'Droid control ship',2,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(225,'9lTVqvWu97',NULL,'Republic Cruiser',NULL,16,900,9,115,'Consular-class cruiser',NULL,'Corellian Engineering Corporation',NULL,'Space cruiser',2,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(226,'bHPFB3mOuL',NULL,'H-type Nubian yacht',NULL,NULL,8000,4,48,'H-type Nubian yacht',NULL,'Theed Palace Space Vessel Engineering Corps',NULL,'yacht',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(227,'zcFdsEk27W',NULL,'Naboo Royal Starship',NULL,NULL,920,8,76,'J-type 327 Nubian royal starship',NULL,'Theed Palace Space Vessel Engineering Corps, Nubia Star Drives',NULL,'yacht',2,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(228,'nY2fTXX1F1','30 days','Scimitar',2500000,6,1180,1,27,'Star Courier',55000000,'Republic Sienar Systems',NULL,'Space Transport',2,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(229,'nYhnGcgBDc','7 days','Naboo fighter',65,0,1100,1,11,'N-1 starfighter',200000,'Theed Palace Space Vessel Engineering Corps',NULL,'Starfighter',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(230,'78QvzwEkoC','2 years','Republic attack cruiser',20000000,2000,975,7400,1137,'Senator-class Star Destroyer',59000000,'Kuat Drive Yards, Allanteen Six shipyards',NULL,'star destroyer',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(231,'kSnCBuvjnO','15 hours','V-wing',60,0,1050,1,8,'Alpha-3 Nimbus-class V-wing starfighter',102500,'Kuat Systems Engineering',NULL,'starfighter',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(232,'hoJsNB1dYq','4 years','Trade Federation cruiser',50000000,48247,1050,600,1088,'Providence-class carrier/destroyer',125000000,'Rendili StarDrive, Free Dac Volunteers Engineering corps.',NULL,'capital ship',2,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(233,'PcHTkdaQZM','7 days','Jedi starfighter',60,0,1150,1,8,'Delta-7 Aethersprite-class interceptor',180000,'Kuat Systems Engineering',NULL,'Starfighter',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(234,'PzM6RB4tW9','2 years','Banking clan frigte',40000000,NULL,NULL,200,825,'Munificent-class star frigate',57000000,'Hoersch-Kessel Drive, Inc, Gwori Revolutionary Industries',NULL,'cruiser',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(235,'GLTYEk8zyL','1 year','J-type diplomatic barge',NULL,10,2000,5,39,'J-type diplomatic barge',2000000,'Theed Palace Space Vessel Engineering Corps, Nubia Star Drives',NULL,'Diplomatic barge',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(236,'mYHlk0khPd','2 days','Jedi Interceptor',60,0,1500,1,5,'Eta-2 Actis-class light interceptor',320000,'Kuat Systems Engineering',NULL,'starfighter',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(237,'isut9lrQGD',NULL,'Naboo star skiff',NULL,3,1050,3,29,'J-type star skiff',NULL,'Theed Palace Space Vessel Engineering Corps/Nubia Star Drives, Incorporated',NULL,'yacht',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(238,'5q1xW3G5MP','56 days','Theta-class T-2c shuttle',50000,16,2000,5,19,'Theta-class T-2c shuttle',1000000,'Cygnus Spaceworks',NULL,'transport',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(239,'QjOyk3CH8K','5 days','arc-170',110,0,1000,3,15,'Aggressive Reconnaissance-170 starfighte',155000,'Incom Corporation, Subpro Corporation',100,'starfighter',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(240,'7bbrEEnPp3','2 years','Republic Assault ship',11250000,16000,NULL,700,752,'Acclamator I-class assault ship',NULL,'Rothana Heavy Engineering',NULL,'assault ship',1,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(241,'I7KA16svWR','7 days','Solar Sailer',240,11,1600,3,15,'Punworcca 116-class interstellar sloop',35700,'Huppla Pasa Tisc Shipwrights Collective',NULL,'yacht',2,'2019-12-13 19:42:37','2019-12-13 19:42:37'),
(242,'udnaqe2L4V','7 days','Belbullab-22 starfighter',140,0,1100,1,7,'Belbullab-22 starfighter',168000,'Feethan Ottraw Scalable Assemblies',NULL,'starfighter',6,'2019-12-13 19:42:37','2019-12-13 19:42:37');
/*!40000 ALTER TABLE `starship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle` (
  `idVehicle` int(11) NOT NULL AUTO_INCREMENT,
  `objectId` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `cargoCapacity` int(11) DEFAULT NULL,
  `column_5` int(11) DEFAULT NULL,
  `maxAtmospheringSpeed` int(11) DEFAULT NULL,
  `crew` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `model` text DEFAULT NULL,
  `manufacturer` text DEFAULT NULL,
  `vehicleClass` text DEFAULT NULL,
  PRIMARY KEY (`idVehicle`),
  UNIQUE KEY `vehicle_objectId_uindex` (`objectId`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES
(196,'GKADuoyFth','AT-AT',1000,NULL,60,5,20,'All Terrain Armored Transport','Kuat Drive Yards, Imperial Department of Military Research','assault walker'),
(197,'AkwpyZDVub','C-9979 landing craft',1800000,NULL,587,140,210,'C-9979 landing craft','Haor Chall Engineering','landing craft'),
(198,'eBd6n35xfU','Zephyr-G swoop bike',200,NULL,350,1,4,'Zephyr-G swoop bike','Mobquet Swoops and Speeders','repulsorcraft'),
(199,'DJIm9mYksz','TIE/LN starfighter',65,NULL,1200,1,6,'Twin Ion Engine/Ln Starfighter','Sienar Fleet Systems','starfighter'),
(200,'SLxC6CPcEL','Sand Crawler',50000,NULL,30,46,37,'Digger Crawler','Corellia Mining Corporation','wheeled'),
(201,'51N0xPOb9B','T-16 skyhopper',50,NULL,1200,1,10,'T-16 skyhopper','Incom Corporation','repulsorcraft'),
(202,'KMVlBMNvE4','Sith speeder',2,NULL,180,1,2,'FC-20 speeder bike','Razalon','speeder'),
(203,'eNPTgZTlWE','Bantha-II cargo skiff',135000,NULL,250,5,10,'Bantha-II','Ubrikkian Industries','repulsorcraft cargo skiff'),
(204,'QPQRVV8W2K','AT-TE',10000,NULL,60,6,13,'All Terrain Tactical Enforcer','Rothana Heavy Engineering, Kuat Drive Yards','walker'),
(205,'RG7c1jYBpa','Koro-2 Exodrive airspeeder',80,NULL,800,1,7,'Koro-2 Exodrive airspeeder','Desler Gizh Outworld Mobility Corporation','airspeeder'),
(206,'f1oyRd3bJt','Vulture Droid',0,NULL,1200,0,4,'Vulture-class droid starfighter','Haor Chall Engineering, Baktoid Armor Workshop','starfighter'),
(207,'I7hL5RqIOf','Armored Assault Tank',NULL,NULL,55,4,10,'Armoured Assault Tank','Baktoid Armor Workshop','repulsorcraft'),
(208,'AtFEKIwfzK','TIE bomber',NULL,NULL,850,1,8,'TIE/sa bomber','Sienar Fleet Systems','space/planetary bomber'),
(209,'teHFkyAqy0','TIE/IN interceptor',75,NULL,1250,1,10,'Twin Ion Engine Interceptor','Sienar Fleet Systems','starfighter'),
(210,'rKF6mcUesc','Storm IV Twin-Pod cloud car',10,NULL,1500,2,7,'Storm IV Twin-Pod','Bespin Motors','repulsorcraft'),
(211,'NdKhSWkcGj','Tribubble bongo',1600,NULL,85,1,15,'Tribubble bongo','Otoh Gunga Bongameken Cooperative','submarine'),
(212,'pCVeRYzs6x','Corporate Alliance tank droid',NULL,NULL,100,0,11,'NR-N99 Persuader-class droid enforcer','Techno Union','droid tank'),
(213,'ICWlyWg0Mu','Multi-Troop Transport',12000,NULL,35,4,31,'Multi-Troop Transport','Baktoid Armor Workshop','repulsorcraft'),
(214,'utGgMTDozL','SPHA',500,NULL,35,25,140,'Self-Propelled Heavy Artillery','Rothana Heavy Engineering','walker'),
(215,'aoewlvkIz9','AT-RT',20,NULL,90,1,3,'All Terrain Recon Transport','Kuat Drive Yards','walker'),
(216,'VYcFeVcevK','Droid tri-fighter',0,NULL,1180,1,5,'tri-fighter','Colla Designs, Phlac-Arphocc Automata Industries','droid starfighter'),
(217,'d8vCtlRaAB','Droid gunship',0,NULL,820,0,12,'HMP droid gunship','Baktoid Fleet Ordnance, Haor Chall Engineering','airspeeder'),
(218,'Ai2rkPnjvF','Clone turbo tank',30000,NULL,160,20,49,'HAVw A6 Juggernaut','Kuat Drive Yards','wheeled walker'),
(219,'2RMOc7zzkj','Imperial Speeder Bike',4,NULL,360,1,3,'74-Z speeder bike','Aratech Repulsor Company','speeder'),
(220,'WsfCvLenTA','X-34 landspeeder',5,NULL,250,1,3,'X-34 landspeeder','SoroSuub Corporation','repulsorcraft'),
(221,'zFQDtCX4GD','LAAT/i',170,NULL,620,6,17,'Low Altitude Assault Transport/infrantry','Rothana Heavy Engineering','gunship'),
(222,'8cPVBOgBwJ','Oevvaor jet catamaran',50,NULL,420,2,15,'Oevvaor jet catamaran','Appazanna Engineering Works','airspeeder'),
(223,'24cHAlVrrd','Geonosian starfighter',NULL,NULL,20000,1,10,'Nantex-class territorial defense','Huppla Pasa Tisc Shipwrights Collective','starfighter'),
(224,'KVXGWeGIij','Neimoidian shuttle',1000,NULL,880,2,20,'Sheathipede-class transport shuttle','Haor Chall Engineering','transport'),
(225,'avmXmWsDDJ','Raddaugh Gnasp fluttercraft',20,NULL,310,2,7,'Raddaugh Gnasp fluttercraft','Appazanna Engineering Works','air speeder'),
(226,'eC9Nji4J6z','Tsmeu-6 personal wheel bike',10,NULL,330,1,4,'Tsmeu-6 personal wheel bike','Z-Gomot Ternbuell Guppat Corporation','wheeled walker'),
(227,'rhIDTEgYLy','LAAT/c',40000,NULL,620,1,29,'Low Altitude Assault Transport/carrier','Rothana Heavy Engineering','gunship'),
(228,'iJreBMeM4k','XJ-6 airspeeder',NULL,NULL,720,1,6,'XJ-6 airspeeder','Narglatch AirTech prefabricated kit','airspeeder'),
(229,'na3XbtzcDN','Emergency Firespeeder',NULL,NULL,NULL,2,NULL,'Fire suppression speeder',NULL,'fire suppression ship'),
(230,'YuPUPmlg2r','Sail barge',2000000,NULL,100,26,30,'Modified Luxury Sail Barge','Ubrikkian Industries Custom Vehicle Division','sail barge'),
(231,'8deZC3YjGb','Snowspeeder',10,NULL,650,2,5,'t-47 airspeeder','Incom corporation','airspeeder'),
(232,'pMwZsyHn9F','Single Trooper Aerial Platform',NULL,NULL,400,1,2,'Single Trooper Aerial Platform','Baktoid Armor Workshop','repulsorcraft'),
(233,'zPueYdAR01','AT-ST',200,NULL,90,2,2,'All Terrain Scout Transport','Kuat Drive Yards, Imperial Department of Military Research','walker'),
(234,'Ip1tgAaydW','Flitknot speeder',NULL,NULL,634,1,2,'Flitknot speeder','Huppla Pasa Tisc Shipwrights Collective','speeder');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-16 19:37:18
