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
-- Table structure for table `slot_item`
--

DROP TABLE IF EXISTS `slot_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slot_item` (
  `item_id` bigint NOT NULL,
  `slot_id` bigint NOT NULL,
  `seat_booked` int DEFAULT NULL,
  PRIMARY KEY (`item_id`,`slot_id`),
  KEY `slot_id` (`slot_id`),
  CONSTRAINT `slot_item_ibfk_1` FOREIGN KEY (`slot_id`) REFERENCES `slot` (`slot_id`),
  CONSTRAINT `slot_item_ibfk_2` FOREIGN KEY (`slot_id`) REFERENCES `slot` (`slot_id`),
  CONSTRAINT `slot_item_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `gym_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slot_item`
--

LOCK TABLES `slot_item` WRITE;
/*!40000 ALTER TABLE `slot_item` DISABLE KEYS */;
INSERT INTO `slot_item` VALUES (101,1,0),(101,2,0),(101,3,0),(101,4,0),(101,5,0),(101,6,0),(102,1,0),(102,2,1),(102,3,0),(102,4,0),(102,5,0),(102,6,0),(103,1,0),(103,2,0),(103,3,0),(103,4,0),(103,5,0),(103,6,0),(104,1,1),(104,2,0),(104,3,0),(104,4,0),(104,5,0),(104,6,1);
/*!40000 ALTER TABLE `slot_item` ENABLE KEYS */;
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
