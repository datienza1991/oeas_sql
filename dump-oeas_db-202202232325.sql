-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: oeas_db
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Grad School'),(2,'Others');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,'--'),(2,'Section 1');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userDetails`
--

DROP TABLE IF EXISTS `userDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userDetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `middleName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contactNumber` varchar(255) NOT NULL,
  `departmentId` int DEFAULT NULL,
  `sectionId` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  `contactNumberPrefix` varchar(255) DEFAULT NULL,
  `user_type_id` int NOT NULL,
  `isResetPassword` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userDetails_FK_1` (`sectionId`),
  KEY `userDetails_FK_department` (`departmentId`),
  KEY `userDetails_FK_2` (`user_type_id`),
  KEY `userDetails_FK` (`user_id`),
  CONSTRAINT `userDetails_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `userDetails_FK_1` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `userDetails_FK_2` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`),
  CONSTRAINT `userDetails_FK_department` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userDetails`
--

LOCK TABLES `userDetails` WRITE;
/*!40000 ALTER TABLE `userDetails` DISABLE KEYS */;
INSERT INTO `userDetails` VALUES (23,'johndoe@batstate-u.edu.ph','John','Anton','Doe','Batangas City','9501743188',1,1,2,1,'+63',1,0),(32,'faculty@batstate-u.edu.ph','Faculty','User','Account','Batangas City','95012345678',1,1,18,1,'+63',1,0),(33,'student@batstate-u.edu.ph','Student','User','Account','Batangas City','95012345678',1,2,19,1,'+63',3,0),(34,'student2@batstate-u.edu.ph','Student2','User','Account','Batangas City','95012345678',1,1,20,1,'+63',3,0),(35,'student3@batstate-u.edu.ph','Student3','User','Account','Batangas City','95012345678',1,2,21,0,'+63',3,1);
/*!40000 ALTER TABLE `userDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_types`
--

LOCK TABLES `user_types` WRITE;
/*!40000 ALTER TABLE `user_types` DISABLE KEYS */;
INSERT INTO `user_types` VALUES (1,'Admin'),(2,'Faculty'),(3,'Student');
/*!40000 ALTER TABLE `user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'admin','$2y$10$uFhjWszhZUWsEkR1Q0GZRuQ9KqOy2JkBqJyE7Bvb1sOaWSRJ8SSXS'),(18,'12-3456','$2y$10$7wfIpIj9Ij4BVtjARPoume9HCC3O7vvwm4IOfzd32XZrrNrR91.Wi'),(19,'12-12345','$2y$10$UsKYqQCs1Mn7A0bqhIOeXesjNy5FkME4knEytBj4RUOuB0P7XBaLa'),(20,'12-123456','$2y$10$kicEQwjtrIrA1cguBXQ82uG3mI/3dj.bliW9N6ue2OtUR2cThv2y.'),(21,'12-33333','$2y$10$sh5gMKTbSi0jYLsCAR4p4.W5YAc6JX.XaIzc/YB7UT2HeKjAFN/dC');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_user_details`
--

DROP TABLE IF EXISTS `v_user_details`;
/*!50001 DROP VIEW IF EXISTS `v_user_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_user_details` (
  `id` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `firstName` tinyint NOT NULL,
  `middleName` tinyint NOT NULL,
  `lastName` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `contactNumber` tinyint NOT NULL,
  `departmentId` tinyint NOT NULL,
  `departmentName` tinyint NOT NULL,
  `sectionId` tinyint NOT NULL,
  `sectionName` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `isActive` tinyint NOT NULL,
  `contactNumberPrefix` tinyint NOT NULL,
  `userType` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'oeas_db'
--

--
-- Final view structure for view `v_user_details`
--

/*!50001 DROP TABLE IF EXISTS `v_user_details`*/;
/*!50001 DROP VIEW IF EXISTS `v_user_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`oeas_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_user_details` AS select `userDetails`.`id` AS `id`,`userDetails`.`email` AS `email`,`userDetails`.`firstName` AS `firstName`,`userDetails`.`middleName` AS `middleName`,`userDetails`.`lastName` AS `lastName`,`userDetails`.`address` AS `address`,`userDetails`.`contactNumber` AS `contactNumber`,`userDetails`.`departmentId` AS `departmentId`,`d`.`name` AS `departmentName`,`userDetails`.`sectionId` AS `sectionId`,`s`.`name` AS `sectionName`,`userDetails`.`user_id` AS `user_id`,`userDetails`.`isActive` AS `isActive`,`userDetails`.`contactNumberPrefix` AS `contactNumberPrefix`,`ut`.`name` AS `userType` from (((`userDetails` join `departments` `d` on((`userDetails`.`departmentId` = `d`.`id`))) join `sections` `s` on((`userDetails`.`sectionId` = `s`.`id`))) join `user_types` `ut` on((`userDetails`.`user_type_id` = `ut`.`id`))) */;
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

-- Dump completed on 2022-02-23 23:25:21
