-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: airlinesystem
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admintable`
--

DROP TABLE IF EXISTS `admintable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admintable` (
  `admin_email` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `admin_key` varchar(100) NOT NULL,
  PRIMARY KEY (`admin_email`),
  UNIQUE KEY `admin_email` (`admin_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admintable`
--

LOCK TABLES `admintable` WRITE;
/*!40000 ALTER TABLE `admintable` DISABLE KEYS */;
/*!40000 ALTER TABLE `admintable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `card` (
  `card_number` varchar(16) NOT NULL,
  `card_pin` varchar(100) DEFAULT NULL,
  UNIQUE KEY `card_number` (`card_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES ('1234123412341234','81dc9bdb52d04dc20036dbd8313ed055');
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(100) NOT NULL,
  `cust_email` varchar(100) NOT NULL,
  `cust_password` varchar(100) NOT NULL,
  `cust_dob` varchar(100) NOT NULL,
  `cust_contactNumber` varchar(15) NOT NULL,
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `cust_email` (`cust_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `flight` (
  `flight_id` int(11) NOT NULL AUTO_INCREMENT,
  `flight_arrival` varchar(100) NOT NULL,
  `flight_departure` varchar(100) NOT NULL,
  `flight_arrivalTime` varchar(100) NOT NULL,
  `flight_departureTime` varchar(100) NOT NULL,
  `flight_company` varchar(100) NOT NULL,
  `flight_number` varchar(100) NOT NULL,
  `flight_numberOfSeats` int(11) NOT NULL,
  `flight_status` enum('COMPLETED','CANCELLED','DELAYED','ON_TIME') DEFAULT NULL,
  `flight_type` enum('INTERNATIONAL','DOMESTIC') DEFAULT NULL,
  `flight_cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`flight_id`),
  UNIQUE KEY `flight_id` (`flight_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,'Trivandrum','Bangalore','2016:09:12 5:30:30','2016:09:12 8:30:30','Indigo','6E22',50,'ON_TIME','DOMESTIC',1500),(2,'London','Delhi','2016:09:12 5:30:30','2016:09:12 8:30:30','Air Asia','7E22',50,'DELAYED','INTERNATIONAL',22200),(3,'Mumbai','patna','2016:09:12 5:30:30','2016:09:12 8:30:30','Inidian Airlines','8E12',50,'CANCELLED','DOMESTIC',1200);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `flight_id` int(11) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `booking_time` varchar(100) DEFAULT NULL,
  `passenger_name` varchar(100) DEFAULT NULL,
  `passenger_dob` varchar(100) DEFAULT NULL,
  `passenger_email` varchar(100) DEFAULT NULL,
  `ticket_status` enum('CANCELLED','ACTIVE','COMPLETED') DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,1,1,'2016:06:12 2:30:30','Mohit','11/07/1996','mohit@anand.com','ACTIVE',1);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-30 22:53:57
