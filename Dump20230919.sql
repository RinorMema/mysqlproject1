-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: university_database
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `CourseID` int NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(45) NOT NULL,
  `CourseCode` int NOT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=InnoDB AUTO_INCREMENT=8889 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1111,'Gjuhe angleze I',252),(2222,'Gjuhe gjermane I',283),(3333,'Gjuhe shqipe',125),(4444,'Gjuhe angleze II',620),(5555,'Gjuhe frenge II',486),(6666,'Gjuhe gjermane  II',278),(7777,'Gramatike',393),(8888,'Matematike',242);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `EnrollmentID` int NOT NULL,
  `StudentID` int NOT NULL,
  `CourseID` int DEFAULT NULL,
  `EnrollmentDate` datetime NOT NULL,
  PRIMARY KEY (`EnrollmentID`),
  KEY `fk_StudentID_enrollment_idx` (`StudentID`),
  KEY `fk_StudentID__idx` (`CourseID`),
  CONSTRAINT `fk_StudentID_` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_StudentID_enrollment` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (10000,1,1111,'2020-10-01 00:00:00'),(20000,2,2222,'2020-10-01 00:00:00'),(30000,4,7777,'2019-10-01 00:00:00'),(40000,3,6666,'2018-10-01 00:00:00'),(50000,7,3333,'2019-10-01 00:00:00'),(60000,8,5555,'2018-10-01 00:00:00'),(70000,6,8888,'2021-10-01 00:00:00'),(80000,5,4444,'2021-10-01 00:00:00');
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `InstructorID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `HireDate` datetime NOT NULL,
  PRIMARY KEY (`InstructorID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'Agron','Berisha','aberisha@hotmail.com','2005-10-01 00:00:00'),(2,'Bekim','Krasniqi','bkrasniqi@gmail.com','2008-01-04 00:00:00'),(3,'Rrahman','Gashi','rrgashi@gmail.com','2003-10-01 00:00:00'),(4,'Njomza','Kelmendi','njkelmendi@hotmail.com','2012-01-04 00:00:00'),(5,'Bajram ','Shehu','bshehu@hotmail.com','2012-01-04 00:00:00');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `StudentID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Mentor','Kastrati','mkastrati@live.com','1995-01-12'),(2,'Arlind','Berisha','aberisha@hotmail.com','2000-04-05'),(3,'Vlora','Sadiku','vsadiku@gmail.com','2001-12-01'),(4,'Besarta','Shala','bshala@hotmail.com','1997-07-17'),(5,'Armend','Gashi','agashi@hotmail.com','1998-04-05'),(6,'Arijon','Krasniqi','akrasniqi@gmail.com','1999-07-17'),(7,'Emanuel','Berisha','eberisha@hotmail.com','2000-12-05'),(8,'Erjon','Rexhepi','erexhepi@gmail.com','1998-06-19'),(9,'Albatrit','Devolli','adevolli@hotmail.com','2000-04-05'),(10,'Leonard','Shala','lshala@hotmail.com','2000-01-25'),(11,'Medina','Kelmendi','mkelmendi@live.com','2002-07-17');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaching`
--

DROP TABLE IF EXISTS `teaching`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaching` (
  `TeachingID` int NOT NULL,
  `InstructorID` int DEFAULT NULL,
  `CourseID` int DEFAULT NULL,
  `Semester` float NOT NULL,
  PRIMARY KEY (`TeachingID`),
  KEY `fk_InstructorID_Teaching_idx` (`InstructorID`),
  KEY `fk_CourseID_Teaching_idx` (`CourseID`),
  CONSTRAINT `fk_CourseID_Teaching` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_InstructorID_Teaching` FOREIGN KEY (`InstructorID`) REFERENCES `instructor` (`InstructorID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaching`
--

LOCK TABLES `teaching` WRITE;
/*!40000 ALTER TABLE `teaching` DISABLE KEYS */;
INSERT INTO `teaching` VALUES (3210,5,7777,1),(4321,2,1111,1),(5432,4,5555,2),(6543,3,8888,1),(7643,2,4444,2),(8765,3,6666,2),(9876,1,2222,1);
/*!40000 ALTER TABLE `teaching` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-19 16:31:11
