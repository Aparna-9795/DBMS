CREATE USER  `fly_safe_airways` IDENTIFIED BY `fly_safe_airways` /*!40100 DEFAULT CHARACTER SET utf8 */;
ALTER SESSION SET CURRENT_SCHEMA = fly_safe_airways;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: fly_safe_airways
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
-- Table structure for table `availability`
--

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE availability';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE availability (
  FID varchar2(5) DEFAULT NULL,
  Journey_date date DEFAULT NULL,
  Class varchar2(10) DEFAULT NULL,
  Remaining_seats number(10) DEFAULT NULL
 ,
  CONSTRAINT availability_ibfk_1 FOREIGN KEY (FID) REFERENCES flight (FID) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE INDEX FID ON availability (FID);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `availability`
--

LOCK TABLES availability WRITE;
/*!40000 ALTER TABLE `availability` DISABLE KEYS */;
INSERT INTO availability  SELECT 'FSA01','2012-12-03','EXECUTIVE',3 FROM dual UNION ALL  SELECT 'FSA02','2012-12-04','BUSINESS',2 FROM dual UNION ALL  SELECT 'FSA06','2012-12-06','ECONOMY',3 FROM dual UNION ALL  SELECT 'FSA07','2012-12-04','EXECUTIVE',0 FROM dual UNION ALL  SELECT 'FSA04','2012-12-05','BUSINESS',3 FROM dual UNION ALL  SELECT 'FSA05','2012-12-05','ECONOMY',0 FROM dual UNION ALL  SELECT 'FSA02','2012-12-06','EXECUTIVE',2 FROM dual UNION ALL  SELECT 'FSA08','2012-12-09','BUSINESS',3 FROM dual UNION ALL  SELECT 'FSA03','2012-12-08','ECONOMY',2 FROM dual UNION ALL  SELECT 'FSA01','2012-12-03','EXECUTIVE',3 FROM dual;
/*!40000 ALTER TABLE `availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancellation`
--

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE cancellation';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE cancellation (
  CID varchar2(5) NOT NULL,
  PNRNO varchar2(10) DEFAULT NULL,
  Before_Hours varchar2(10) DEFAULT NULL,
  PRIMARY KEY (CID)
 ,
  CONSTRAINT cancellation_ibfk_1 FOREIGN KEY (PNRNO) REFERENCES ticket (PNRNO) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE INDEX PNRNO ON cancellation (PNRNO);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancellation`
--

LOCK TABLES cancellation WRITE;
/*!40000 ALTER TABLE `cancellation` DISABLE KEYS */;
INSERT INTO cancellation  SELECT 'C0001','PNRNO0004','12' FROM dual UNION ALL  SELECT 'C0002','PNRNO0005','24' FROM dual;
/*!40000 ALTER TABLE `cancellation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancellation_charges`
--

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE cancellation_charges';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE cancellation_charges (
  Before_Hours number(10) DEFAULT NULL,
  Charges number(7,2) DEFAULT NULL
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancellation_charges`
--

LOCK TABLES cancellation_charges WRITE;
/*!40000 ALTER TABLE `cancellation_charges` DISABLE KEYS */;
INSERT INTO cancellation_charges  SELECT 24,10.00 FROM dual UNION ALL  SELECT 48,0.00 FROM dual UNION ALL  SELECT 24,10.00 FROM dual UNION ALL  SELECT 6,25.00 FROM dual UNION ALL  SELECT 3,50.00 FROM dual;
/*!40000 ALTER TABLE `cancellation_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_master`
--

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE city_master';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE city_master (
  City_Code varchar2(5) NOT NULL,
  City_Name varchar2(20) DEFAULT NULL,
  Country varchar2(20) DEFAULT NULL,
  PRIMARY KEY (City_Code)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_master`
--

LOCK TABLES city_master WRITE;
/*!40000 ALTER TABLE `city_master` DISABLE KEYS */;
INSERT INTO city_master  SELECT 'CC001','HYDERABAD','INDIA' FROM dual UNION ALL  SELECT 'CC002','MUMBAI','INDIA' FROM dual UNION ALL  SELECT 'CC003','DELHI','INDIA' FROM dual UNION ALL  SELECT 'CC004','LOS ANGELES','USA' FROM dual UNION ALL  SELECT 'CC005','CALIFORNIA','ENGLAND' FROM dual;
/*!40000 ALTER TABLE `city_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE flight';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE flight (
  FID varchar2(5) NOT NULL,
  FName varchar2(20) DEFAULT NULL,
  Source_Code varchar2(20) DEFAULT NULL,
  Destination_Code varchar2(5) DEFAULT NULL,
  Journey_Hours number(10) DEFAULT NULL,
  PRIMARY KEY (FID)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES flight WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO flight  SELECT 'FSA01','HYD-DEL','CC001','CC003',6 FROM dual UNION ALL  SELECT 'FSA02','DEL-HYD','CC003','CC001',6 FROM dual UNION ALL  SELECT 'FSA03','MUM-DEL','CC002','CC003',5 FROM dual UNION ALL  SELECT 'FSA04','DEL-MUM','CC003','CC002',5 FROM dual UNION ALL  SELECT 'FSA05','DEL-LAS','CC003','CC004',12 FROM dual UNION ALL  SELECT 'FSA06','LAS-DEL','CC004','CC003',12 FROM dual UNION ALL  SELECT 'FSA07','DEL-CFA','CC003','CC005',13 FROM dual UNION ALL  SELECT 'FSA08','CFA-DEL','CC005','CC003',13 FROM dual;
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_class`
--

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE flight_class';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE flight_class (
  FID varchar2(5) DEFAULT NULL,
  Class varchar2(10) DEFAULT NULL,
  Amount number(7,2) DEFAULT NULL,
  No_Seats number(10) DEFAULT NULL
 ,
  CONSTRAINT flight_class_ibfk_1 FOREIGN KEY (FID) REFERENCES flight (FID) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE INDEX FID ON flight_class (FID);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_class`
--

LOCK TABLES flight_class WRITE;
/*!40000 ALTER TABLE `flight_class` DISABLE KEYS */;
INSERT INTO flight_class  SELECT 'FSA01','EXECUTIVE',7000.00,3 FROM dual UNION ALL  SELECT 'FSA01','BUSINESS',6000.00,4 FROM dual UNION ALL  SELECT 'FSA01','ECONOMY',5000.00,5 FROM dual UNION ALL  SELECT 'FSA02','EXECUTIVE',7000.00,3 FROM dual UNION ALL  SELECT 'FSA02','BUSINESS',6000.00,4 FROM dual UNION ALL  SELECT 'FSA02','ECONOMY',5000.00,5 FROM dual UNION ALL  SELECT 'FSA03','EXECUTIVE',8000.00,4 FROM dual UNION ALL  SELECT 'FSA03','BUSINESS',7000.00,5 FROM dual UNION ALL  SELECT 'FSA03','ECONOMY',6000.00,6 FROM dual UNION ALL  SELECT 'FSA04','EXECUTIVE',8000.00,4 FROM dual UNION ALL  SELECT 'FSA04','BUSINESS',7000.00,5 FROM dual UNION ALL  SELECT 'FSA04','ECONOMY',6000.00,6 FROM dual UNION ALL  SELECT 'FSA05','EXECUTIVE',10000.00,5 FROM dual UNION ALL  SELECT 'FSA05','BUSINESS',9000.00,6 FROM dual UNION ALL  SELECT 'FSA05','ECONOMY',8000.00,7 FROM dual UNION ALL  SELECT 'FSA06','EXECUTIVE',10000.00,5 FROM dual UNION ALL  SELECT 'FSA06','BUSINESS',9000.00,6 FROM dual UNION ALL  SELECT 'FSA06','ECONOMY',8000.00,7 FROM dual UNION ALL  SELECT 'FSA07','EXECUTIVE',12000.00,6 FROM dual UNION ALL  SELECT 'FSA07','BUSINESS',11000.00,7 FROM dual UNION ALL  SELECT 'FSA07','ECONOMY',10000.00,8 FROM dual UNION ALL  SELECT 'FSA08','EXECUTIVE',12000.00,6 FROM dual UNION ALL  SELECT 'FSA08','BUSINESS',11000.00,7 FROM dual UNION ALL  SELECT 'FSA08','ECONOMY',10000.00,8 FROM dual;
/*!40000 ALTER TABLE `flight_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_days`
--

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE flight_days';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE flight_days (
  FID varchar2(5) DEFAULT NULL,
  Day varchar2(10) DEFAULT NULL,
  Dept_time number(10) DEFAULT NULL
 ,
  CONSTRAINT flight_days_ibfk_1 FOREIGN KEY (FID) REFERENCES flight (FID) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE INDEX FID ON flight_days (FID);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_days`
--

LOCK TABLES flight_days WRITE;
/*!40000 ALTER TABLE `flight_days` DISABLE KEYS */;
INSERT INTO flight_days  SELECT 'FSA01','MONDAY',11 FROM dual UNION ALL  SELECT 'FSA05','MONDAY',18 FROM dual UNION ALL  SELECT 'FSA06','TUESDAY',9 FROM dual UNION ALL  SELECT 'FSA02','TUESDAY',23 FROM dual UNION ALL  SELECT 'FSA01','WEDNESDAY',11 FROM dual UNION ALL  SELECT 'FSA05','WEDNESDAY',18 FROM dual UNION ALL  SELECT 'FSA06','THURSDAY',9 FROM dual UNION ALL  SELECT 'FSA02','THURSDAY',23 FROM dual UNION ALL  SELECT 'FSA01','FRIDAY',11 FROM dual UNION ALL  SELECT 'FSA05','FRIDAY',18 FROM dual UNION ALL  SELECT 'FSA06','SATURDAY',9 FROM dual UNION ALL  SELECT 'FSA02','SATURDAY',23 FROM dual UNION ALL  SELECT 'FSA03','TUESDAY',8 FROM dual UNION ALL  SELECT 'FSA07','TUESDAY',15 FROM dual UNION ALL  SELECT 'FSA08','WEDNESDAY',7 FROM dual UNION ALL  SELECT 'FSA04','WEDNESDAY',23 FROM dual UNION ALL  SELECT 'FSA03','THURSDAY',11 FROM dual UNION ALL  SELECT 'FSA07','THURSDAY',18 FROM dual UNION ALL  SELECT 'FSA08','FRIDAY',9 FROM dual UNION ALL  SELECT 'FSA04','FRIDAY',23 FROM dual UNION ALL  SELECT 'FSA03','SATURDAY',11 FROM dual UNION ALL  SELECT 'FSA07','SATURDAY',18 FROM dual UNION ALL  SELECT 'FSA08','SUNDAY',9 FROM dual UNION ALL  SELECT 'FSA04','SUNDAY',23 FROM dual;
/*!40000 ALTER TABLE `flight_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_meal`
--

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE flight_meal';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE flight_meal (
  FID varchar2(5) DEFAULT NULL,
  Meal_Code varchar2(5) DEFAULT NULL
 ,
  CONSTRAINT flight_meal_ibfk_1 FOREIGN KEY (FID) REFERENCES flight (FID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT flight_meal_ibfk_2 FOREIGN KEY (Meal_Code) REFERENCES meal_master (Meal_Code) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE INDEX FID ON flight_meal (FID);
CREATE INDEX Meal_Code ON flight_meal (Meal_Code);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_meal`
--

LOCK TABLES flight_meal WRITE;
/*!40000 ALTER TABLE `flight_meal` DISABLE KEYS */;
INSERT INTO flight_meal  SELECT 'FSA01','MC001' FROM dual UNION ALL  SELECT 'FSA01','MC002' FROM dual UNION ALL  SELECT 'FSA02','MC001' FROM dual UNION ALL  SELECT 'FSA02','MC002' FROM dual UNION ALL  SELECT 'FSA03','MC002' FROM dual UNION ALL  SELECT 'FSA03','MC003' FROM dual UNION ALL  SELECT 'FSA04','MC002' FROM dual UNION ALL  SELECT 'FSA04','MC003' FROM dual UNION ALL  SELECT 'FSA05','MC001' FROM dual UNION ALL  SELECT 'FSA05','MC003' FROM dual UNION ALL  SELECT 'FSA06','MC001' FROM dual UNION ALL  SELECT 'FSA06','MC003' FROM dual UNION ALL  SELECT 'FSA07','MC001' FROM dual UNION ALL  SELECT 'FSA07','MC002' FROM dual UNION ALL  SELECT 'FSA08','MC001' FROM dual UNION ALL  SELECT 'FSA08','MC002' FROM dual;
/*!40000 ALTER TABLE `flight_meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_services`
--

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE flight_services';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE flight_services (
  FID varchar2(5) DEFAULT NULL,
  Service_Code varchar2(5) DEFAULT NULL
 ,
  CONSTRAINT flight_services_ibfk_1 FOREIGN KEY (FID) REFERENCES flight (FID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT flight_services_ibfk_2 FOREIGN KEY (Service_Code) REFERENCES service_master (Service_Code) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE INDEX FID ON flight_services (FID);
CREATE INDEX Service_Code ON flight_services (Service_Code);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_services`
--

LOCK TABLES flight_services WRITE;
/*!40000 ALTER TABLE `flight_services` DISABLE KEYS */;
INSERT INTO flight_services  SELECT 'FSA01','SC001' FROM dual UNION ALL  SELECT 'FSA01','SC002' FROM dual UNION ALL  SELECT 'FSA02','SC001' FROM dual UNION ALL  SELECT 'FSA02','SC002' FROM dual UNION ALL  SELECT 'FSA03','SC002' FROM dual UNION ALL  SELECT 'FSA03','SC003' FROM dual UNION ALL  SELECT 'FSA04','SC002' FROM dual UNION ALL  SELECT 'FSA04','SC003' FROM dual UNION ALL  SELECT 'FSA05','SC001' FROM dual UNION ALL  SELECT 'FSA05','SC003' FROM dual UNION ALL  SELECT 'FSA06','SC001' FROM dual UNION ALL  SELECT 'FSA06','SC003' FROM dual UNION ALL  SELECT 'FSA07','SC001' FROM dual UNION ALL  SELECT 'FSA07','SC002' FROM dual UNION ALL  SELECT 'FSA08','SC001' FROM dual UNION ALL  SELECT 'FSA08','SC002' FROM dual;
/*!40000 ALTER TABLE `flight_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luggage_master`
--

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE luggage_master';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE luggage_master (
  class varchar2(10) DEFAULT NULL,
  Weight number(10) DEFAULT NULL,
  Extra_Amount_PERKG number(7,2) DEFAULT NULL
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luggage_master`
--

LOCK TABLES luggage_master WRITE;
/*!40000 ALTER TABLE `luggage_master` DISABLE KEYS */;
INSERT INTO luggage_master  SELECT 'EXECUTIVE',40,15.00 FROM dual UNION ALL  SELECT 'BUSINESS',35,12.00 FROM dual UNION ALL  SELECT 'ECONOMY',30,10.00 FROM dual;
/*!40000 ALTER TABLE `luggage_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_master`
--

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE meal_master';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE meal_master (
  Meal_Code varchar2(5) NOT NULL,
  Meal_Name varchar2(15) NOT NULL,
  Amount number(7,2) DEFAULT NULL,
  PRIMARY KEY (Meal_Code,Meal_Name)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_master`
--

LOCK TABLES meal_master WRITE;
/*!40000 ALTER TABLE `meal_master` DISABLE KEYS */;
INSERT INTO meal_master  SELECT 'MC001','SOUTH',250.00 FROM dual UNION ALL  SELECT 'MC002','NORTH',300.00 FROM dual UNION ALL  SELECT 'MC003','CHINESE',350.00 FROM dual;
/*!40000 ALTER TABLE `meal_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE passenger';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE passenger (
  PPNO varchar2(10) NOT NULL,
  Name varchar2(20) DEFAULT NULL,
  DOB date DEFAULT NULL,
  Sex varchar2(6) DEFAULT NULL,
  Address varchar2(30) DEFAULT NULL,
  Contact_No number(19) DEFAULT NULL,
  PRIMARY KEY (PPNO)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES passenger WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO passenger  SELECT 'PPNO00001','NAME001','1985-01-01','MALE','ADDR001',9876543210 FROM dual UNION ALL  SELECT 'PPNO00002','NAME002','1986-02-02','FEMALE','ADDR002',9876543211 FROM dual UNION ALL  SELECT 'PPNO00003','NAME003','1987-03-03','MALE','ADDR003',9876543212 FROM dual UNION ALL  SELECT 'PPNO00004','NAME004','1988-04-04','FEMALE','ADDR004',9876543213 FROM dual UNION ALL  SELECT 'PPNO00005','NAME005','1989-05-05','MALE','ADDR005',9876543214 FROM dual;
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger_luggage_charges`
--

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE passenger_luggage_charges';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE passenger_luggage_charges (
  PNRNO varchar2(10) DEFAULT NULL,
  Weight number(10) DEFAULT NULL,
  Amount number(7,2) DEFAULT NULL
 ,
  CONSTRAINT passenger_luggage_charges_ibfk_1 FOREIGN KEY (PNRNO) REFERENCES ticket (PNRNO) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE INDEX PNRNO ON passenger_luggage_charges (PNRNO);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_luggage_charges`
--

LOCK TABLES passenger_luggage_charges WRITE;
/*!40000 ALTER TABLE `passenger_luggage_charges` DISABLE KEYS */;
INSERT INTO passenger_luggage_charges  SELECT 'PNRNO0001',70,450.00 FROM dual UNION ALL  SELECT 'PNRNO0002',60,300.00 FROM dual UNION ALL  SELECT 'PNRNO0008',65,360.00 FROM dual;
/*!40000 ALTER TABLE `passenger_luggage_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE reservation';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE reservation (
  PPNO varchar2(10) DEFAULT NULL,
  Flight_Code varchar2(5) DEFAULT NULL,
  Journey_Date date DEFAULT NULL,
  Class varchar2(10) DEFAULT NULL,
  Meal_Code varchar2(5) DEFAULT NULL,
  Service_Code varchar2(5) DEFAULT NULL
 ,
  CONSTRAINT reservation_ibfk_1 FOREIGN KEY (PPNO) REFERENCES passenger (PPNO) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT reservation_ibfk_2 FOREIGN KEY (Flight_Code) REFERENCES flight (FID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT reservation_ibfk_3 FOREIGN KEY (Meal_Code) REFERENCES meal_master (Meal_Code) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT reservation_ibfk_4 FOREIGN KEY (Service_Code) REFERENCES service_master (Service_Code) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE INDEX PPNO ON reservation (PPNO);
CREATE INDEX Flight_Code ON reservation (Flight_Code);
CREATE INDEX Meal_Code ON reservation (Meal_Code);
CREATE INDEX Service_Code ON reservation (Service_Code);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES reservation WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_master`
--

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE service_master';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE service_master (
  Service_Code varchar2(5) NOT NULL,
  Service_Name varchar2(15) DEFAULT NULL,
  Amount number(7,2) DEFAULT NULL,
  PRIMARY KEY (Service_Code)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_master`
--

LOCK TABLES service_master WRITE;
/*!40000 ALTER TABLE `service_master` DISABLE KEYS */;
INSERT INTO service_master  SELECT 'SC001','CHILDECARE',400.00 FROM dual UNION ALL  SELECT 'SC002','NURSING',300.00 FROM dual UNION ALL  SELECT 'SC003','WHEELCHAIR',350.00 FROM dual;
/*!40000 ALTER TABLE `service_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE ticket';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;
/
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE ticket (
  PNRNO varchar2(10) NOT NULL,
  PPNO varchar2(10) DEFAULT NULL,
  Flight_Code varchar2(5) DEFAULT NULL,
  Journey_Date date DEFAULT NULL,
  Class varchar2(10) DEFAULT NULL,
  Meal_Code varchar2(5) DEFAULT NULL,
  Service_Code varchar2(5) DEFAULT NULL,
  Amount number(7,2) DEFAULT NULL,
  Status varchar2(10) DEFAULT NULL,
  PRIMARY KEY (PNRNO)
 ,
  CONSTRAINT ticket_ibfk_1 FOREIGN KEY (PPNO) REFERENCES passenger (PPNO) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT ticket_ibfk_2 FOREIGN KEY (Flight_Code) REFERENCES flight (FID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT ticket_ibfk_3 FOREIGN KEY (Meal_Code) REFERENCES meal_master (Meal_Code) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT ticket_ibfk_4 FOREIGN KEY (Service_Code) REFERENCES service_master (Service_Code) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE INDEX PPNO ON ticket (PPNO);
CREATE INDEX Flight_Code ON ticket (Flight_Code);
CREATE INDEX Meal_Code ON ticket (Meal_Code);
CREATE INDEX Service_Code ON ticket (Service_Code);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES ticket WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO ticket  SELECT 'PNRNO0001','PPNO00005','FSA01','2012-12-03','EXECUTIVE','MC002','SC002',7600.00,'CNF' FROM dual UNION ALL  SELECT 'PNRNO0002','PPNO00003','FSA02','2012-12-04','BUSINESS','MC001','SC001',6650.00,'CNF' FROM dual UNION ALL  SELECT 'PNRNO0003','PPNO00002','FSA06','2012-12-06','ECONOMY','MC003','SC003',8700.00,'CNF' FROM dual UNION ALL  SELECT 'PNRNO0004','PPNO00004','FSA07','2012-12-04','EXECUTIVE','MC001','SC001',12650.00,'WTG' FROM dual UNION ALL  SELECT 'PNRNO0005','PPNO00005','FSA04','2012-12-05','BUSINESS','MC003','SC003',7700.00,'CNF' FROM dual UNION ALL  SELECT 'PNRNO0006','PPNO00001','FSA05','2012-12-05','ECONOMY','MC001','SC001',8650.00,'WTG' FROM dual UNION ALL  SELECT 'PNRNO0007','PPNO00002','FSA02','2012-12-06','EXECUTIVE','MC001','SC002',7650.00,'CNF' FROM dual UNION ALL  SELECT 'PNRNO0008','PPNO00004','FSA08','2012-12-09','BUSINESS','MC002','SC002',11600.00,'CNF' FROM dual UNION ALL  SELECT 'PNRNO0009','PPNO00003','FSA03','2012-12-08','ECONOMY','MC003','SC002',6650.00,'CNF' FROM dual;
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

-- Dump completed on 2017-10-26 16:50:52
