-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_management
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `Appointment_ID` int(11) NOT NULL,
  `Patient_ID` int(11) DEFAULT NULL,
  `Doctor_ID` int(11) DEFAULT NULL,
  `Appointment_date` datetime DEFAULT NULL,
  PRIMARY KEY (`Appointment_ID`),
  KEY `Patient_ID` (`Patient_ID`),
  KEY `Doctor_ID` (`Doctor_ID`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patients` (`Patient_ID`),
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`Doctor_ID`) REFERENCES `doctors` (`Doctor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,1,1,'2024-02-10 10:00:00'),(2,2,2,'2024-02-11 11:30:00'),(3,3,3,'2024-02-12 14:00:00'),(4,4,4,'2024-02-13 09:30:00'),(5,5,5,'2024-02-14 16:00:00'),(6,6,6,'2024-02-15 13:00:00'),(7,7,7,'2024-02-16 12:00:00'),(8,8,8,'2024-02-17 15:30:00'),(9,9,9,'2024-02-18 08:00:00'),(10,10,10,'2024-02-19 17:00:00');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis` (
  `Dia_ID` int(11) NOT NULL,
  `Patient_ID` int(11) DEFAULT NULL,
  `Results` varchar(200) DEFAULT NULL,
  `Date_Recorded` date DEFAULT NULL,
  PRIMARY KEY (`Dia_ID`),
  KEY `Patient_ID` (`Patient_ID`),
  CONSTRAINT `diagnosis_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patients` (`Patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES (1,1,'Flu','2024-02-01'),(2,2,'Hypertension','2024-01-15'),(3,3,'Diabetes','2024-02-10'),(4,4,'Migraine','2024-01-20'),(5,5,'Fracture','2024-02-05'),(6,6,'Allergy','2024-02-08'),(7,7,'Asthma','2024-01-25'),(8,8,'Skin Rash','2024-01-30'),(9,9,'Bronchitis','2024-02-12'),(10,10,'Gastritis','2024-02-03');
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_sched`
--

DROP TABLE IF EXISTS `doctor_sched`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_sched` (
  `Sched_ID` int(11) NOT NULL,
  `Doctor_ID` int(11) DEFAULT NULL,
  `Avail_Day` varchar(20) DEFAULT NULL CHECK (`Avail_Day` in ('monday','tuesday','wednesday','thursday','friday','saturday','sunday')),
  PRIMARY KEY (`Sched_ID`),
  KEY `Doctor_ID` (`Doctor_ID`),
  CONSTRAINT `doctor_sched_ibfk_1` FOREIGN KEY (`Doctor_ID`) REFERENCES `doctors` (`Doctor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_sched`
--

LOCK TABLES `doctor_sched` WRITE;
/*!40000 ALTER TABLE `doctor_sched` DISABLE KEYS */;
INSERT INTO `doctor_sched` VALUES (1,1,'Monday'),(2,1,'Wednesday'),(3,1,'Friday'),(4,2,'Tuesday'),(5,2,'Thursday'),(6,3,'Monday'),(7,3,'Friday'),(8,4,'Wednesday'),(9,4,'Saturday'),(10,5,'Tuesday'),(11,5,'Thursday'),(12,6,'Monday'),(13,6,'Wednesday'),(14,7,'Friday'),(15,7,'Sunday'),(16,8,'Tuesday'),(17,8,'Saturday'),(18,9,'Thursday'),(19,9,'Sunday'),(20,10,'Monday'),(21,10,'Saturday');
/*!40000 ALTER TABLE `doctor_sched` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `Doctor_ID` int(11) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  `Specialization` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Doctor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'James','Clark','Cardiology'),(2,'Emma','White','Pediatrics'),(3,'William','Lewis','Neurology'),(4,'Sophia','Walker','Orthopedics'),(5,'Benjamin','Hall','Dermatology'),(6,'Mia','Allen','Ophthalmology'),(7,'Alexander','Young','Radiology'),(8,'Charlotte','King','Endocrinology'),(9,'Henry','Wright','Psychiatry'),(10,'Amelia','Scott','General Surgery');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse_assignment`
--

DROP TABLE IF EXISTS `nurse_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse_assignment` (
  `Assignment_ID` int(11) NOT NULL,
  `Nurse_ID` int(11) DEFAULT NULL,
  `Doctor_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Assignment_ID`),
  KEY `Nurse_ID` (`Nurse_ID`),
  KEY `Doctor_ID` (`Doctor_ID`),
  CONSTRAINT `nurse_assignment_ibfk_1` FOREIGN KEY (`Nurse_ID`) REFERENCES `nurses` (`Nurse_ID`),
  CONSTRAINT `nurse_assignment_ibfk_2` FOREIGN KEY (`Doctor_ID`) REFERENCES `doctors` (`Doctor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse_assignment`
--

LOCK TABLES `nurse_assignment` WRITE;
/*!40000 ALTER TABLE `nurse_assignment` DISABLE KEYS */;
INSERT INTO `nurse_assignment` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,2),(5,5,3),(6,6,3),(7,7,4),(8,8,4),(9,9,5),(10,10,5),(11,1,6),(12,2,7),(13,3,8),(14,4,9),(15,5,10);
/*!40000 ALTER TABLE `nurse_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurses`
--

DROP TABLE IF EXISTS `nurses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurses` (
  `Nurse_ID` int(11) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Nurse_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurses`
--

LOCK TABLES `nurses` WRITE;
/*!40000 ALTER TABLE `nurses` DISABLE KEYS */;
INSERT INTO `nurses` VALUES (1,'Jessica','Adams'),(2,'Andrew','Baker'),(3,'Laura','Carter'),(4,'Jacob','Evans'),(5,'Hannah','Green'),(6,'Samuel','Hill'),(7,'Madison','Moore'),(8,'Christopher','Nelson'),(9,'Ashley','Parker'),(10,'Joshua','Reed');
/*!40000 ALTER TABLE `nurses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `Patient_ID` int(11) NOT NULL,
  `First_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'John','Doe'),(2,'Alice','Smith'),(3,'Michael','Brown'),(4,'Sarah','Johnson'),(5,'David','Williams'),(6,'Emily','Davis'),(7,'Daniel','Miller'),(8,'Sophia','Wilson'),(9,'Matthew','Anderson'),(10,'Olivia','Taylor'),(11,'Ethan','Thomas'),(12,'Ava','Martinez'),(13,'Liam','Hernandez'),(14,'Isabella','Moore'),(15,'Noah','Jackson');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hospital_management'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-02 13:48:47
