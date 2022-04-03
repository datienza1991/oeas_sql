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
-- Table structure for table `examAnswers`
--

DROP TABLE IF EXISTS `examAnswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examAnswers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userDetailId` int NOT NULL,
  `questionId` int NOT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `points` int DEFAULT NULL,
  `examId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `examAnswers_FK` (`userDetailId`),
  KEY `examAnswers_FK_1` (`questionId`),
  KEY `examAnswers_FK_2` (`examId`),
  CONSTRAINT `examAnswers_FK` FOREIGN KEY (`userDetailId`) REFERENCES `userDetails` (`id`),
  CONSTRAINT `examAnswers_FK_1` FOREIGN KEY (`questionId`) REFERENCES `questions` (`id`),
  CONSTRAINT `examAnswers_FK_2` FOREIGN KEY (`examId`) REFERENCES `exams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examAnswers`
--

LOCK TABLES `examAnswers` WRITE;
/*!40000 ALTER TABLE `examAnswers` DISABLE KEYS */;
INSERT INTO `examAnswers` VALUES (107,45,18,'<p><em><strong>teasdfasdf</strong></em></p>',0,19),(108,45,19,'<h1>asdf</h1>',0,19);
/*!40000 ALTER TABLE `examAnswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `startOn` datetime NOT NULL,
  `duration` int NOT NULL,
  `sectionId` int NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `instructions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userDetailId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exams_FK` (`sectionId`),
  KEY `exams_FK_1` (`userDetailId`),
  CONSTRAINT `exams_FK` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`),
  CONSTRAINT `exams_FK_1` FOREIGN KEY (`userDetailId`) REFERENCES `userDetails` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` VALUES (19,'Writing Exam','History','2022-04-28 08:00:00',10,3,1,'<h1><strong>This is the long instruction…</strong></h1>',23);
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `correctAnswer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `maxpoints` int NOT NULL,
  `examId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_FK` (`examId`),
  CONSTRAINT `questions_FK` FOREIGN KEY (`examId`) REFERENCES `exams` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (18,'<p><strong><span style=\"color:rgb(0, 0, 0);\"><span style=\"background-color:rgb(255, 255, 255);\">Lorem</span></span></strong><span style=\"color:rgb(0, 0, 0);\"><span style=\"background-color:rgb(255, 255, 255);\"> ipsum dolor sit amet, </span></span><u><span style=\"color:rgb(0, 0, 0);\"><span style=\"background-color:rgb(255, 255, 255);\">consectetur adipiscing elit. Aenean justo velit, malesuada ut massa quis, euismod tempor purus</span></span></u><span style=\"color:rgb(0, 0, 0);\"><span style=\"background-color:rgb(255, 255, 255);\">. Praesent ut leo hendrerit, hendrerit ante vel, elementum lorem. Proin dictum nisl id neque gravida, a tristique velit iaculis.</span></span></p><p><span style=\"color:rgb(0, 0, 0);\"><span style=\"background-color:rgb(255, 255, 255);\"> </span></span><s><span style=\"color:rgb(0, 0, 0);\"><span style=\"background-color:rgb(255, 255, 255);\">In et odio risus. Aliquam erat volutpat. Praesent non tempus sem</span></span></s><span style=\"color:rgb(0, 0, 0);\"><span style=\"background-color:rgb(255, 255, 255);\">. Sed rhoncus eros id erat ultrices, sed sagittis justo iaculis. Sed blandit accumsan sem ut ornare. Fusce maximus eros a posuere molestie. Cras venenatis tincidunt ligula, nec malesuada nunc bibendum a. Proin accumsan consectetur nulla, eget tristique eros vulputate non. Duis tristique tellus ut nibh imperdiet efficitur.</span></span></p>','<p><strong>Answer 1</strong></p>',60,19),(19,'Question 2','Answer 2',60,19);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
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
  `departmentId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sections_FK` (`departmentId`),
  CONSTRAINT `sections_FK` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (2,'Section 1',1),(3,'Section 2',1);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takerExams`
--

DROP TABLE IF EXISTS `takerExams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `takerExams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userDetailId` int NOT NULL,
  `examId` int NOT NULL,
  `recUrl` varchar(255) NOT NULL,
  `createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `takerExams_FK` (`userDetailId`),
  KEY `takerExams_FK_1` (`examId`),
  CONSTRAINT `takerExams_FK` FOREIGN KEY (`userDetailId`) REFERENCES `userDetails` (`id`),
  CONSTRAINT `takerExams_FK_1` FOREIGN KEY (`examId`) REFERENCES `exams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=384 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takerExams`
--

LOCK TABLES `takerExams` WRITE;
/*!40000 ALTER TABLE `takerExams` DISABLE KEYS */;
INSERT INTO `takerExams` VALUES (383,45,19,'http://localhost:8081/uploads/1648968206502.webm','2022-04-03 06:42:58');
/*!40000 ALTER TABLE `takerExams` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userDetails`
--

LOCK TABLES `userDetails` WRITE;
/*!40000 ALTER TABLE `userDetails` DISABLE KEYS */;
INSERT INTO `userDetails` VALUES (23,'johndoe@batstate-u.edu.ph','John','Anton','Doe','Batangas City','9501743188',1,NULL,2,1,'+63',1,0),(32,'faculty1@batstate-u.edu.ph','Faculty1','User1','Account1','Batangas City','95012345679',1,NULL,18,1,'+63',1,0),(33,'student@batstate-u.edu.ph','Student','User','Account','Batangas City','95012345678',1,2,19,1,'+63',3,0),(34,'student2@batstate-u.edu.ph','Student2','User','Account','Batangas City','95012345678',1,NULL,20,1,'+63',3,0),(35,'student3@batstate-u.edu.ph','Student3','User','Account','Batangas City','95012345678',1,2,21,1,'+63',3,0),(36,'johndoe@batstate-u.edu.ph','John2','Anton2','Doe2','Batangas City Batangas','9501743187',2,NULL,2,1,'+63',2,0),(37,'darren1@batstate-u.edu.ph','x','x','x','x','95012345678',1,NULL,NULL,1,'+63',1,0),(38,'darren2@batstate-u.edu.ph','x','x','x','x','95012345678',1,NULL,NULL,1,'+63',1,0),(39,'darre3@batstate-u.edu.ph','x','x','x','x','95012345678',1,NULL,NULL,1,'+63',1,0),(45,'darren@batstate-u.edu.ph','Darren','Comia','Atienza','Batangas City','95012345678',1,3,22,1,'+63',3,0),(46,'darren5@batstate-u.edu.ph','12-123123','12-123123','12-123123','Batangas City','123456789',1,2,23,0,'+63',3,0),(47,'darren@batstate-u.edu.ph','ab','cdef','ghi','123456789','123456789',1,2,24,1,'+63',3,0),(48,'test@email.com','test1','test1','test1','Batangas Test','123456789',1,3,25,1,'+63',3,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'admin','$2y$10$BwM9DL1jy8z5pZv58R.eYeURBDzDYIBq23H9EZwBKqrGbttX9odP2'),(18,'12-3456','$2y$10$Dvytd2AaeNXPwKWTCe6UCe/Ll38CjR9EYAt6hY8doPB/Dk.7woXNK'),(19,'12-12345','$2y$10$WLutC6F5EQTJW0lrHAdXaeGiKBGsjt3iW42Fm9n8J6wd3/74xzrQS'),(20,'12-123456','$2y$10$SErr2Xuo07gZCZrfDPkBhuwL5gV6USvg9BYstU1mGVo3awqn.fnNu'),(21,'12-33333','$2y$10$6uFEPzZsUmPR/xs.jFbx/OO9EYXa/MJerPki.JkO805rlk/FumdCG'),(22,'darren','$2y$10$NAhFeBpxbA4HWdLDaOZD5uDRXdIa6XBoTJLgqZjCscoGnmj0kqRVW'),(23,'12-123123','$2y$10$95YKpxX.iBFn0tc6YTtJZeYMbpegIm9ExeiNqa7lyDHNk9RW0Xi12'),(24,'ab-cdef','$2y$10$SKNQspSXMlwb/ehDecWt1..KXnSfMLN46TKe2efElMalzkBssxXhm'),(25,'test','$2y$10$ajR6MwsCv6fxW6NExl0x.uaoVS8fAtGzqsM1OAOa3B9gm6nZHJCWe');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vExams`
--

DROP TABLE IF EXISTS `vExams`;
/*!50001 DROP VIEW IF EXISTS `vExams`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vExams` (
  `id` tinyint NOT NULL,
  `passers` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vQuestions`
--

DROP TABLE IF EXISTS `vQuestions`;
/*!50001 DROP VIEW IF EXISTS `vQuestions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vQuestions` (
  `id` tinyint NOT NULL,
  `question` tinyint NOT NULL,
  `examId` tinyint NOT NULL,
  `userDetailId` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vTakersQuestions`
--

DROP TABLE IF EXISTS `vTakersQuestions`;
/*!50001 DROP VIEW IF EXISTS `vTakersQuestions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vTakersQuestions` (
  `id` tinyint NOT NULL,
  `question` tinyint NOT NULL,
  `examId` tinyint NOT NULL,
  `userDetailId` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
-- Final view structure for view `vExams`
--

/*!50001 DROP TABLE IF EXISTS `vExams`*/;
/*!50001 DROP VIEW IF EXISTS `vExams`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`oeas_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vExams` AS select `x`.`id` AS `id`,(select sum(`ea`.`points`) from `examAnswers` `ea` where (`ea`.`examId` = `x`.`id`)) AS `passers` from `exams` `x` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vQuestions`
--

/*!50001 DROP TABLE IF EXISTS `vQuestions`*/;
/*!50001 DROP VIEW IF EXISTS `vQuestions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`oeas_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vQuestions` AS select `q`.`id` AS `id`,`q`.`question` AS `question`,`q`.`examId` AS `examId`,`ea2`.`userDetailId` AS `userDetailId` from (`questions` `q` left join `examAnswers` `ea2` on((`q`.`id` = `ea2`.`questionId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vTakersQuestions`
--

/*!50001 DROP TABLE IF EXISTS `vTakersQuestions`*/;
/*!50001 DROP VIEW IF EXISTS `vTakersQuestions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`oeas_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vTakersQuestions` AS select `vq`.`id` AS `id`,`vq`.`question` AS `question`,`vq`.`examId` AS `examId`,`vq`.`userDetailId` AS `userDetailId` from `vQuestions` `vq` where exists(select 1 from `examAnswers` `ea` where (`vq`.`id` = `ea`.`questionId`)) is false */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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

-- Dump completed on 2022-04-03 15:16:52
