-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: cit381-assign08-model
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `user_id` int NOT NULL,
  `item_type_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`item_type_id`),
  KEY `fk_user_has_table1_table11_idx` (`item_type_id`),
  KEY `fk_user_has_table1_user_idx` (`user_id`),
  CONSTRAINT `fk_user_has_table1_table11` FOREIGN KEY (`item_type_id`) REFERENCES `item_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_has_table1_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,2),(4,2),(1,3),(2,3),(3,3),(6,3),(2,4),(4,4),(2,5),(3,6),(3,7),(4,7),(6,7),(1,8),(6,8),(5,9),(2,10),(6,10);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_type`
--

DROP TABLE IF EXISTS `item_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) NOT NULL,
  `max_item` int NOT NULL,
  `rarity` decimal(3,2) NOT NULL,
  `limited_event_id` int DEFAULT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `item_name_UNIQUE` (`type_name`),
  KEY `limited_event_idx` (`limited_event_id`),
  CONSTRAINT `limited_event` FOREIGN KEY (`limited_event_id`) REFERENCES `limited_event` (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_type`
--

LOCK TABLES `item_type` WRITE;
/*!40000 ALTER TABLE `item_type` DISABLE KEYS */;
INSERT INTO `item_type` VALUES (1,'oak chair',30,0.20,NULL),(2,'pumpkin pie',15,0.45,22),(3,'red shit',50,0.10,NULL),(4,'ruby',10,0.85,NULL),(5,'diamond ring',10,0.95,NULL),(6,'snowman',15,0.45,18),(7,'cherry blossom',15,0.45,20),(8,'jackolatern',15,0.45,17),(9,'cake',99,1.00,19),(10,'beach ball',25,0.60,21);
/*!40000 ALTER TABLE `item_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `limited_event`
--

DROP TABLE IF EXISTS `limited_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `limited_event` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_name` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `event_name_UNIQUE` (`event_name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limited_event`
--

LOCK TABLES `limited_event` WRITE;
/*!40000 ALTER TABLE `limited_event` DISABLE KEYS */;
INSERT INTO `limited_event` VALUES (17,'halloween','2022-10-01','2022-11-01'),(18,'winter','2022-12-01','2023-03-01'),(19,'anniversary','2023-04-08','2023-04-15'),(20,'spring','2023-03-01','2023-06-01'),(21,'summer','2023-06-01','2023-09-01'),(22,'fall','2023-09-01','2023-12-01');
/*!40000 ALTER TABLE `limited_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'wumbsie','password'),(2,'girlhelp','password'),(3,'uhhh8','password'),(4,'stella9','password'),(5,'hello_world','password'),(6,'eggman','password');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_getquantityavalible`
--

DROP TABLE IF EXISTS `vw_getquantityavalible`;
/*!50001 DROP VIEW IF EXISTS `vw_getquantityavalible`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_getquantityavalible` AS SELECT 
 1 AS `type_name`,
 1 AS `quantity_avalible`,
 1 AS `max_item`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'cit381-assign08-model'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_item` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_item`(user_id int, item_type_id int)
BEGIN
INSERT INTO `cit381-assign08-model`.`item` (`user_id`, `item_type_id`) VALUES (user_id, item_type_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_getquantityavalible`
--

/*!50001 DROP VIEW IF EXISTS `vw_getquantityavalible`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_getquantityavalible` AS select `it`.`type_name` AS `type_name`,(`it`.`max_item` - count(`i`.`item_type_id`)) AS `quantity_avalible`,`it`.`max_item` AS `max_item` from (`item_type` `it` left join (`item` `i` join `user` `u` on((`i`.`user_id` = `u`.`user_id`))) on((`i`.`item_type_id` = `it`.`type_id`))) group by `it`.`type_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-03 21:19:05
