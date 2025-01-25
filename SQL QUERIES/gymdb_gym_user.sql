-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: gymdb
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `gym_user`
--

DROP TABLE IF EXISTS `gym_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_user` (
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_user`
--

LOCK TABLES `gym_user` WRITE;
/*!40000 ALTER TABLE `gym_user` DISABLE KEYS */;
INSERT INTO `gym_user` VALUES ('abc','adishjainansh@gmail.com','customer2','jain','$2a$10$I/v3CBEBtUgCMPmhg6MGMuniKm9QAGj2B4bVI3rXpQcGlERSkK.pG','Customer'),('admin','admin@gmail.com','admin','user','$2a$10$UDIlDPBPjjO4rwCgdm3imOC1z.Qa3K6x26xg7ad8diObAaFCckbD.','Admin'),('ansh','adishjainansh@gmail.com','Adish ','Jain ','$2a$10$NrPRjo6h7tM.i4DoX0t4M.LmhqLwvi04ToUigfedLfaT0mVtT9hJG','Admin'),('anshi','swasti12@gmail.com','swasti','Jain','$2a$10$ikasCc79OcTSLvXWrRj82.9fO9bUyeVsvjC7WhiGjJG4Ln.gxZqXi','Customer'),('John','john@gmail.com','john','hardy','$2a$10$C5xTRdxzYJi3hbuesFQTBekn3HJGbsOlPk0JKw8hGGTPjtr2wHnyy','Customer');
/*!40000 ALTER TABLE `gym_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-26  0:11:16
