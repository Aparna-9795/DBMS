-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: sales
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `CUST_ID` int(4) NOT NULL,
  `COMPANY_NAME` varchar(20) NOT NULL,
  `ADDRESS` varchar(20) NOT NULL,
  `CITY` varchar(20) NOT NULL,
  `TEL_NO` bigint(16) NOT NULL,
  `FAX_NO` varchar(2) NOT NULL,
  PRIMARY KEY (`CUST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1467,'gdansk','Plot no 43','vijayawada',135454574897,'F3'),(2345,'abc','Plot no 22','hyderabad',88978445454,'F1');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `ITEM_CATAL_NO` varchar(2) NOT NULL,
  `ITEM_TYPE` varchar(20) NOT NULL,
  `MANUFACTURER_NAME` varchar(3) NOT NULL,
  `MODEL` varchar(2) NOT NULL,
  `PRICE` int(4) NOT NULL,
  `AMOUNT_IN_WAREHOUSE` int(4) NOT NULL,
  PRIMARY KEY (`ITEM_CATAL_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES ('S1','Sleeping bag','xyz','M1',5000,4000),('S2','Backpack','uwz','M2',4500,3000),('S3','Sleeping bag','zzz','M1',5000,3000),('S4','Backpack','aaa','M2',6000,3000),('S5','Sleeping bag','bbb','M2',5000,3000);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `ORDER_ID` varchar(3) NOT NULL,
  `ITEM_CATAL_NO` varchar(3) NOT NULL,
  `AMOUNT_ORDERED` int(4) NOT NULL,
  KEY `ORDER_ID` (`ORDER_ID`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES ('OD1','OC1',1000),('OD2','OC2',4000);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `ORDER_ID` varchar(3) NOT NULL,
  `ORDER_DATE` date NOT NULL,
  `CUST_ID` int(4) NOT NULL,
  `ORDER_VALUE_PLN` int(4) NOT NULL,
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('OD1','2016-01-02',1467,1000),('OD2','2015-12-04',1563,4000);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `SUPPLY_ID` varchar(3) NOT NULL,
  `COMPANY_NAME` varchar(20) NOT NULL,
  `ADDRESS` varchar(20) NOT NULL,
  `CITY` varchar(15) NOT NULL,
  `COUNTRY` varchar(20) NOT NULL,
  PRIMARY KEY (`SUPPLY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers_offers`
--

DROP TABLE IF EXISTS `suppliers_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers_offers` (
  `SUPPLY_ID` varchar(3) NOT NULL,
  `ITEM_CATAL_NO` varchar(3) NOT NULL,
  `PRICE` int(5) NOT NULL,
  KEY `SUPPLY_ID` (`SUPPLY_ID`),
  KEY `ITEM_CATAL_NO` (`ITEM_CATAL_NO`),
  CONSTRAINT `suppliers_offers_ibfk_1` FOREIGN KEY (`SUPPLY_ID`) REFERENCES `suppliers` (`SUPPLY_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `suppliers_offers_ibfk_2` FOREIGN KEY (`ITEM_CATAL_NO`) REFERENCES `items` (`ITEM_CATAL_NO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers_offers`
--

LOCK TABLES `suppliers_offers` WRITE;
/*!40000 ALTER TABLE `suppliers_offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplies` (
  `SUPPLY_NO` varchar(3) NOT NULL,
  `SUPPLY_ID` varchar(3) NOT NULL,
  `DATE_ORDERED` date NOT NULL,
  `DATE_RECEIVED` date NOT NULL,
  `ITEM_CATAL_NO` varchar(2) NOT NULL,
  `AMOUNT` int(5) NOT NULL,
  PRIMARY KEY (`SUPPLY_NO`),
  KEY `SUPPLY_ID` (`SUPPLY_ID`),
  KEY `ITEM_CATAL_NO` (`ITEM_CATAL_NO`),
  CONSTRAINT `supplies_ibfk_1` FOREIGN KEY (`SUPPLY_ID`) REFERENCES `suppliers` (`SUPPLY_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplies_ibfk_2` FOREIGN KEY (`ITEM_CATAL_NO`) REFERENCES `items` (`ITEM_CATAL_NO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-09 16:18:13
