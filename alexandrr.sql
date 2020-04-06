-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: gor_electro_trans
-- ------------------------------------------------------
-- Server version	5.7.29

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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employee_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Employee id',
  `position_id` int(10) unsigned DEFAULT NULL COMMENT 'Position id',
  `last_name` varchar(127) NOT NULL COMMENT 'Email',
  `first_name` varchar(127) NOT NULL COMMENT 'Employee First Name',
  `email` varchar(127) NOT NULL COMMENT 'Employee Last Name',
  `dob` date DEFAULT NULL COMMENT 'Date of Birth',
  `salary` decimal(7,2) NOT NULL COMMENT 'Employee salary',
  PRIMARY KEY (`employee_id`),
  KEY `EMPLOYEE_POSITION_ID_POSITION_POSITION_ID` (`position_id`),
  CONSTRAINT `EMPLOYEE_POSITION_ID_POSITION_POSITION_ID` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='Employees';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (31,1,'Петров','Петр','petrov@example.com','1988-09-12',4000.00),(32,1,'Сидоров','Савелий','sidorov@empale.com','1970-03-10',4000.00),(33,1,'Бендер','Остап','bender@empale.com','1964-01-01',4000.00),(34,7,'Воробьянинов','Ипполит','kissa@empale.com','1988-11-05',5000.00),(35,6,'Безенчук','Иван','kist@empale.com','1991-04-09',3000.00),(36,6,'Иванпуло','Сергей','chemical@empale.com','1989-09-22',3000.00),(37,6,'Гарро','Натаниэль','garro@empale.com','1967-10-12',3000.00),(38,6,'Локен','Гарвель','garvel@empale.com','1988-01-05',3000.00),(39,5,'Иванов','Иван','ivanov@empale.com','1978-12-22',4000.00),(40,5,'Ратищей','Александр','ratichei@empale.com','1971-02-28',4000.00),(41,2,'Артемьев','Максим','artem_909@empale.com','1955-03-08',4500.00),(42,2,'Ростовский','Дионис','rostov@empale.com','1968-07-22',4500.00),(43,2,'Захарченко','Дмитрий','zaharchenko@empale.com','1978-05-02',4500.00),(44,4,'Литовченко','Николай','litovchenko@empale.com','1989-04-22',5000.00),(45,3,'Шлейфманн','Изя','boss@empale.com','1979-08-24',12000.00);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `position_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Position id',
  `name` varchar(63) NOT NULL COMMENT 'Position name',
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Position';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'driver'),(2,'mechanic'),(3,'director'),(4,'accountant'),(5,'manager'),(6,'conductor'),(7,'senior driver');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary` (
  `salary_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Salary id',
  `employee_id` int(10) unsigned DEFAULT NULL COMMENT 'Employee id',
  `amount` decimal(7,2) NOT NULL COMMENT 'Amount',
  `salary_date` date DEFAULT NULL COMMENT 'Salary date',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create salary date',
  PRIMARY KEY (`salary_id`),
  KEY `SALARY_EMPLOYEE_ID_EMPLOYEE_EMPLOYEE_ID` (`employee_id`),
  CONSTRAINT `SALARY_EMPLOYEE_ID_EMPLOYEE_EMPLOYEE_ID` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='Salary';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,31,4300.00,'2020-02-01','2020-03-26 11:42:38'),(2,32,4600.00,'2020-02-01','2020-03-26 11:42:38'),(3,33,4800.00,'2020-02-01','2020-03-26 11:42:38'),(4,34,4500.00,'2020-02-01','2020-03-26 11:42:38'),(5,35,3000.00,'2020-02-01','2020-03-26 11:42:38'),(6,36,3000.00,'2020-02-01','2020-03-26 11:42:38'),(7,37,3000.00,'2020-02-01','2020-03-26 11:42:38'),(8,38,3000.00,'2020-02-01','2020-03-26 11:42:38'),(9,39,4000.00,'2020-02-01','2020-03-26 11:42:38'),(10,40,4000.00,'2020-02-01','2020-03-26 11:42:38'),(11,41,4500.00,'2020-02-01','2020-03-26 11:42:38'),(12,42,4500.00,'2020-02-01','2020-03-26 11:42:38'),(13,43,4500.00,'2020-02-01','2020-03-26 11:42:38'),(14,44,5000.00,'2020-02-01','2020-03-26 11:42:38'),(15,45,12000.00,'2020-02-01','2020-03-26 11:42:38'),(16,31,4000.00,'2020-01-01','2020-03-26 11:42:38'),(17,32,4000.00,'2020-01-01','2020-03-26 11:42:38'),(18,33,4000.00,'2020-01-01','2020-03-26 11:42:38'),(19,34,5000.00,'2020-01-01','2020-03-26 11:42:38'),(20,35,3000.00,'2020-01-01','2020-03-26 11:42:38'),(21,36,3000.00,'2020-01-01','2020-03-26 11:42:38'),(22,37,3000.00,'2020-01-01','2020-03-26 11:42:38'),(23,38,3000.00,'2020-01-01','2020-03-26 11:42:38'),(24,39,4000.00,'2020-01-01','2020-03-26 11:42:38'),(25,40,4000.00,'2020-01-01','2020-03-26 11:42:38'),(26,41,4500.00,'2020-01-01','2020-03-26 11:42:38'),(27,42,4500.00,'2020-01-01','2020-03-26 11:42:38'),(28,43,4500.00,'2020-01-01','2020-03-26 11:42:38'),(29,44,5000.00,'2020-01-01','2020-03-26 11:42:38'),(30,45,16000.00,'2020-01-01','2020-03-26 11:42:38'),(31,31,4000.00,'2020-03-01','2020-03-26 11:42:38'),(32,32,4000.00,'2020-03-01','2020-03-26 11:42:38'),(33,33,4000.00,'2020-03-01','2020-03-26 11:42:38'),(34,34,4600.00,'2020-03-01','2020-03-26 11:42:38'),(35,35,3000.00,'2020-03-01','2020-03-26 11:42:38'),(36,36,3000.00,'2020-03-01','2020-03-26 11:42:38'),(37,37,3000.00,'2020-03-01','2020-03-26 11:42:38'),(38,38,3000.00,'2020-03-01','2020-03-26 11:42:38'),(39,39,4000.00,'2020-03-01','2020-03-26 11:42:38'),(40,40,4000.00,'2020-03-01','2020-03-26 11:42:38'),(41,41,4500.00,'2020-03-01','2020-03-26 11:42:38'),(42,42,4500.00,'2020-03-01','2020-03-26 11:42:38'),(43,43,4500.00,'2020-03-01','2020-03-26 11:42:38'),(44,44,7000.00,'2020-03-01','2020-03-26 11:42:38'),(45,45,24000.00,'2020-03-01','2020-03-26 11:42:38'),(46,38,3000.00,'2019-02-01','2020-03-26 13:46:15'),(47,39,4000.00,'2019-02-01','2020-03-26 13:46:15');
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport` (
  `transport_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transport id',
  `type` varchar(127) NOT NULL COMMENT 'Transport type',
  `number` varchar(31) NOT NULL COMMENT 'Transport number',
  PRIMARY KEY (`transport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Transport';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,'Škoda 22TrG','СА 6560 ВО'),(2,'Škoda 22TrG','СА 5678 АА'),(3,'Škoda 22TrG','СА 7863 ВО'),(4,'ElectroLAZ-12','СА 5463 ВО'),(5,'ElectroLAZ-12','СА 7899 СС'),(6,'ElectroLAZ-12','СА 2332 АА'),(7,'ЗиУ-5','СА 1235 АТ'),(8,'ЗиУ-5','СА 6578 СС'),(9,'ЗиУ-5','СА 3426 ВО'),(10,'ЗиУ-5','СА 1234 АА'),(11,'ЗиУ-5','СА 2145 ВО');
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport_data`
--

DROP TABLE IF EXISTS `transport_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport_data` (
  `transport_data_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transport data id',
  `employee_id` int(10) unsigned DEFAULT NULL,
  `transport_id` int(10) unsigned DEFAULT NULL,
  `income` decimal(8,2) DEFAULT NULL COMMENT 'Transport income',
  `date` date DEFAULT NULL COMMENT 'Date',
  PRIMARY KEY (`transport_data_id`),
  KEY `TRANSPORT_DATA_EMPLOYEE_ID_EMPLOYEE_EMPLOYEE_ID` (`employee_id`),
  KEY `TRANSPORT_DATA_TRANSPORT_ID_TRANSPORT_TRANSPORT_ID` (`transport_id`),
  CONSTRAINT `TRANSPORT_DATA_EMPLOYEE_ID_EMPLOYEE_EMPLOYEE_ID` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE,
  CONSTRAINT `TRANSPORT_DATA_TRANSPORT_ID_TRANSPORT_TRANSPORT_ID` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`transport_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='Employee Transport';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_data`
--

LOCK TABLES `transport_data` WRITE;
/*!40000 ALTER TABLE `transport_data` DISABLE KEYS */;
INSERT INTO `transport_data` VALUES (1,31,1,234.00,'2020-02-12'),(2,32,2,243.00,'2020-02-12'),(3,33,3,678.00,'2020-02-12'),(4,34,4,345.00,'2020-02-12'),(5,31,1,657.00,'2020-02-13'),(6,32,2,234.00,'2020-02-13'),(7,33,3,768.00,'2020-02-13'),(8,34,4,567.00,'2020-02-13'),(9,31,1,678.00,'2020-02-14'),(10,32,2,123.00,'2020-02-14'),(11,33,3,345.00,'2020-02-14'),(12,34,7,213.00,'2020-02-14'),(13,31,8,324.00,'2020-02-15'),(14,32,9,567.00,'2020-02-15'),(15,33,3,547.00,'2020-02-15'),(16,34,4,123.00,'2020-02-15'),(17,31,1,234.00,'2020-02-16'),(18,32,10,678.00,'2020-02-16'),(19,33,11,546.00,'2020-02-16'),(20,34,4,789.00,'2020-02-16'),(21,31,1,546.00,'2020-02-17'),(22,32,2,234.00,'2020-02-17'),(23,33,3,456.00,'2020-02-17'),(24,34,4,234.00,'2020-02-17'),(25,31,1,678.00,'2020-02-18'),(26,32,2,456.00,'2020-02-18'),(27,33,7,234.00,'2020-02-18'),(28,34,4,567.00,'2020-02-18'),(29,31,1,234.00,'2020-02-19'),(30,32,9,678.00,'2020-02-19'),(31,33,3,567.00,'2020-02-19'),(32,34,4,324.00,'2020-02-19'),(33,31,5,345.00,'2020-02-20'),(34,32,6,546.00,'2020-02-20'),(35,33,7,678.00,'2020-02-20'),(36,34,8,657.00,'2020-02-20'),(37,31,9,546.00,'2020-02-21'),(38,32,10,567.00,'2020-02-21'),(39,33,11,900.00,'2020-02-21'),(40,34,4,800.00,'2020-02-21');
/*!40000 ALTER TABLE `transport_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-26 16:58:24
