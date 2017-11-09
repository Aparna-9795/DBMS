-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: bank_db
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `account_details`
--

DROP TABLE IF EXISTS `account_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_details` (
  `Account_Number` int(8) DEFAULT NULL,
  `Customer_Number` int(3) DEFAULT NULL,
  `Date_Of_OpeningAccount` date DEFAULT NULL,
  KEY `Account_Number` (`Account_Number`),
  KEY `Customer_Number` (`Customer_Number`),
  CONSTRAINT `account_details_ibfk_1` FOREIGN KEY (`Account_Number`) REFERENCES `account_type` (`Account_Number`),
  CONSTRAINT `account_details_ibfk_2` FOREIGN KEY (`Customer_Number`) REFERENCES `customer` (`C_ID`),
  CONSTRAINT `account_details_ibfk_3` FOREIGN KEY (`Account_Number`) REFERENCES `account_type` (`Account_Number`) ON UPDATE CASCADE,
  CONSTRAINT `account_details_ibfk_4` FOREIGN KEY (`Account_Number`) REFERENCES `account_type` (`Account_Number`) ON DELETE CASCADE,
  CONSTRAINT `account_details_ibfk_5` FOREIGN KEY (`Customer_Number`) REFERENCES `customer` (`C_ID`) ON UPDATE CASCADE,
  CONSTRAINT `account_details_ibfk_6` FOREIGN KEY (`Customer_Number`) REFERENCES `customer` (`C_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_details`
--

LOCK TABLES `account_details` WRITE;
/*!40000 ALTER TABLE `account_details` DISABLE KEYS */;
INSERT INTO `account_details` VALUES (12323001,101,'2011-01-12'),(87323002,103,'2006-03-16'),(65323003,104,'2012-11-28'),(42323004,105,'2009-12-22');
/*!40000 ALTER TABLE `account_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_type` (
  `C_ID` int(3) DEFAULT NULL,
  `Account_Number` int(8) NOT NULL,
  `Account_Type` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Account_Number`),
  KEY `C_ID` (`C_ID`),
  CONSTRAINT `account_type_ibfk_1` FOREIGN KEY (`C_ID`) REFERENCES `customer` (`C_ID`),
  CONSTRAINT `account_type_ibfk_2` FOREIGN KEY (`C_ID`) REFERENCES `customer` (`C_ID`) ON UPDATE CASCADE,
  CONSTRAINT `account_type_ibfk_3` FOREIGN KEY (`C_ID`) REFERENCES `customer` (`C_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_type`
--

LOCK TABLES `account_type` WRITE;
/*!40000 ALTER TABLE `account_type` DISABLE KEYS */;
INSERT INTO `account_type` VALUES (101,12323001,'Business'),(105,42323004,'Normal'),(104,65323003,'Student'),(103,87323002,'Normal');
/*!40000 ALTER TABLE `account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `B_Id` int(4) NOT NULL,
  `Bank_Name` varchar(25) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`B_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES (421313,'SBI','Hyderabad'),(421327,'Andhra Bank','Bangalore'),(438142,'ICICI BANK PVT LTD','Indore');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `B_Id` int(4) DEFAULT NULL,
  `Branch_Number` int(4) NOT NULL,
  `Bank_Name` varchar(25) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Branch_Number`),
  KEY `B_Id` (`B_Id`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`B_Id`) REFERENCES `bank` (`B_Id`),
  CONSTRAINT `branch_ibfk_2` FOREIGN KEY (`B_Id`) REFERENCES `bank` (`B_Id`) ON UPDATE CASCADE,
  CONSTRAINT `branch_ibfk_3` FOREIGN KEY (`B_Id`) REFERENCES `bank` (`B_Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (421313,1001,'SBI Gachibowli','Gachibowli'),(421313,1002,'SBI Uppal','Uppal'),(421327,1003,'Andhra bank Mavali','Mavali'),(421327,1004,'Andhrabank Ibulpark','Ibulpark'),(438142,1005,'ICICI Transport nagar','Transport Nagar'),(438142,1006,'ICICI  Palai','Palai');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_account_details`
--

DROP TABLE IF EXISTS `branch_account_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_account_details` (
  `Account_Number` int(8) DEFAULT NULL,
  `B_ID` int(6) DEFAULT NULL,
  `Branch_Number` int(4) DEFAULT NULL,
  KEY `Account_Number` (`Account_Number`),
  KEY `B_ID` (`B_ID`),
  KEY `Branch_Number` (`Branch_Number`),
  CONSTRAINT `branch_account_details_ibfk_1` FOREIGN KEY (`Account_Number`) REFERENCES `account_type` (`Account_Number`),
  CONSTRAINT `branch_account_details_ibfk_2` FOREIGN KEY (`B_ID`) REFERENCES `bank` (`B_Id`),
  CONSTRAINT `branch_account_details_ibfk_3` FOREIGN KEY (`Branch_Number`) REFERENCES `branch` (`Branch_Number`),
  CONSTRAINT `branch_account_details_ibfk_4` FOREIGN KEY (`Account_Number`) REFERENCES `account_type` (`Account_Number`) ON DELETE CASCADE,
  CONSTRAINT `branch_account_details_ibfk_5` FOREIGN KEY (`Account_Number`) REFERENCES `account_type` (`Account_Number`) ON UPDATE CASCADE,
  CONSTRAINT `branch_account_details_ibfk_6` FOREIGN KEY (`B_ID`) REFERENCES `bank` (`B_Id`) ON UPDATE CASCADE,
  CONSTRAINT `branch_account_details_ibfk_7` FOREIGN KEY (`B_ID`) REFERENCES `bank` (`B_Id`) ON DELETE CASCADE,
  CONSTRAINT `branch_account_details_ibfk_8` FOREIGN KEY (`Branch_Number`) REFERENCES `branch` (`Branch_Number`) ON UPDATE CASCADE,
  CONSTRAINT `branch_account_details_ibfk_9` FOREIGN KEY (`Branch_Number`) REFERENCES `branch` (`Branch_Number`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_account_details`
--

LOCK TABLES `branch_account_details` WRITE;
/*!40000 ALTER TABLE `branch_account_details` DISABLE KEYS */;
INSERT INTO `branch_account_details` VALUES (12323001,421313,1001),(87323002,421313,1002),(65323003,438142,1005),(42323004,421327,1003);
/*!40000 ALTER TABLE `branch_account_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `C_ID` int(3) NOT NULL,
  `Customer_Name` varchar(25) DEFAULT NULL,
  `Phone_Number` bigint(10) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (101,'Robin',9912200120,'Mavali'),(102,'Harry',7799183543,'Palai'),(103,'Potter',7788121234,'Gachibowli'),(104,'Alina',8877665431,'Ibul Park'),(105,'Karina',9848123451,'Transport Nagar'),(106,'Ketharin',9911223451,'Uppal');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan` (
  `B_Id` int(4) DEFAULT NULL,
  `Loan_Number` varchar(4) NOT NULL,
  `Type` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Loan_Number`),
  KEY `B_Id` (`B_Id`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`B_Id`) REFERENCES `bank` (`B_Id`),
  CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`B_Id`) REFERENCES `bank` (`B_Id`) ON DELETE CASCADE,
  CONSTRAINT `loan_ibfk_3` FOREIGN KEY (`B_Id`) REFERENCES `bank` (`B_Id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (438142,'A101','CAR'),(421327,'A102','Business'),(421313,'A103','Home'),(421313,'A104','Car'),(421313,'A105','Study'),(438142,'A106','Car');
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_details`
--

DROP TABLE IF EXISTS `loan_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_details` (
  `Loan_Number` varchar(4) DEFAULT NULL,
  `C_ID` int(3) DEFAULT NULL,
  `Loan_Issued_Date` date DEFAULT NULL,
  `Intrest_Rate` float(4,2) DEFAULT NULL,
  `Amount` int(6) DEFAULT NULL,
  `Duration` varchar(25) DEFAULT NULL,
  KEY `Loan_Number` (`Loan_Number`),
  KEY `C_ID` (`C_ID`),
  CONSTRAINT `loan_details_ibfk_1` FOREIGN KEY (`Loan_Number`) REFERENCES `loan` (`Loan_Number`),
  CONSTRAINT `loan_details_ibfk_2` FOREIGN KEY (`C_ID`) REFERENCES `customer` (`C_ID`),
  CONSTRAINT `loan_details_ibfk_3` FOREIGN KEY (`Loan_Number`) REFERENCES `loan` (`Loan_Number`) ON DELETE CASCADE,
  CONSTRAINT `loan_details_ibfk_4` FOREIGN KEY (`Loan_Number`) REFERENCES `loan` (`Loan_Number`) ON UPDATE CASCADE,
  CONSTRAINT `loan_details_ibfk_5` FOREIGN KEY (`C_ID`) REFERENCES `customer` (`C_ID`) ON DELETE CASCADE,
  CONSTRAINT `loan_details_ibfk_6` FOREIGN KEY (`C_ID`) REFERENCES `customer` (`C_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_details`
--

LOCK TABLES `loan_details` WRITE;
/*!40000 ALTER TABLE `loan_details` DISABLE KEYS */;
INSERT INTO `loan_details` VALUES ('A101',101,'2013-10-20',8.00,100000,'5 years'),('A102',102,'2013-05-20',10.50,1000000,'10 years'),('A103',104,'2012-12-20',12.00,12000000,'15 years'),('A104',105,'2012-11-10',5.00,10000,'One month');
/*!40000 ALTER TABLE `loan_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_offering`
--

DROP TABLE IF EXISTS `loan_offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan_offering` (
  `B_ID` int(6) DEFAULT NULL,
  `Branch_Number` int(4) DEFAULT NULL,
  `Loan_Number` varchar(4) DEFAULT NULL,
  KEY `Loan_Number` (`Loan_Number`),
  KEY `B_ID` (`B_ID`),
  KEY `Branch_Number` (`Branch_Number`),
  CONSTRAINT `loan_offering_ibfk_1` FOREIGN KEY (`B_ID`) REFERENCES `bank` (`B_Id`),
  CONSTRAINT `loan_offering_ibfk_2` FOREIGN KEY (`Branch_Number`) REFERENCES `branch` (`Branch_Number`),
  CONSTRAINT `loan_offering_ibfk_3` FOREIGN KEY (`Loan_Number`) REFERENCES `loan` (`Loan_Number`),
  CONSTRAINT `loan_offering_ibfk_4` FOREIGN KEY (`B_ID`) REFERENCES `bank` (`B_Id`) ON UPDATE CASCADE,
  CONSTRAINT `loan_offering_ibfk_5` FOREIGN KEY (`B_ID`) REFERENCES `bank` (`B_Id`) ON DELETE CASCADE,
  CONSTRAINT `loan_offering_ibfk_6` FOREIGN KEY (`Branch_Number`) REFERENCES `branch` (`Branch_Number`) ON DELETE CASCADE,
  CONSTRAINT `loan_offering_ibfk_7` FOREIGN KEY (`Branch_Number`) REFERENCES `branch` (`Branch_Number`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_offering`
--

LOCK TABLES `loan_offering` WRITE;
/*!40000 ALTER TABLE `loan_offering` DISABLE KEYS */;
INSERT INTO `loan_offering` VALUES (421313,1001,'A101'),(421313,1002,'A102'),(438142,1005,'A103'),(438142,1004,'A104'),(438142,1006,'A105'),(421327,1003,'A106');
/*!40000 ALTER TABLE `loan_offering` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-01 12:45:13
