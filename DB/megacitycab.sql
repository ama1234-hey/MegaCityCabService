-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: megacitycab
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS admin;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  AdminID int NOT NULL AUTO_INCREMENT,
  Username varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  Email varchar(100) NOT NULL,
  PRIMARY KEY (AdminID),
  UNIQUE KEY Username (Username),
  UNIQUE KEY Email (Email)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES admin WRITE;
/*!40000 ALTER TABLE admin DISABLE KEYS */;
INSERT INTO admin VALUES (1,'admin','123','admin@gmail.com');
/*!40000 ALTER TABLE admin ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS booking;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE booking (
  order_id int NOT NULL AUTO_INCREMENT,
  customer_name varchar(255) NOT NULL,
  address text NOT NULL,
  telephone_number varchar(20) NOT NULL,
  pickup_location varchar(255) NOT NULL,
  duration varchar(20) DEFAULT NULL,
  order_datetime datetime NOT NULL,
  driver_name varchar(255) NOT NULL,
  car_model varchar(100) NOT NULL,
  PRIMARY KEY (order_id)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES booking WRITE;
/*!40000 ALTER TABLE booking DISABLE KEYS */;
INSERT INTO booking VALUES (1,'Prasanna Sunil','aaa','1111111111','ww','200','2025-02-22 23:13:42','With a driver','Honda Civic'),(2,'Mandeera ','aaa','11211111171','ww','100','2025-02-16 23:38:00','With a driver','Nissan Sunny'),(3,'Sumedha Sanjeewani','wee','31211111171','ww','50','2025-02-22 15:43:00','With a driver','Ford Mustang'),(4,'Kushantha Nimal','ss','312211111171','ww','250','2025-02-28 23:49:00','Self Drive','Nissan Sunny'),(5,'Sunil Smantha','Kandy','04141414552','Kandy','150','2025-02-15 14:55:00','Self Drive','Nissan Sunny'),(6,'Dhanushka Perera','Kandy','078878787874','Kandy','120','2025-02-23 02:58:00','With a driver','Honda Civic'),(7,'aa','ll','11211111178','ww','20','2025-02-24 16:44:00','Self Drive','Suzuki Wagon R'),(8,'aa','ll','11211111178','ww','20','2025-02-24 16:44:00','With a driver','Suzuki Wagon R'),(9,'aa','hh','11211111178','ww','50','2025-02-24 16:44:00','With a driver','Toyota Land Cruiser'),(10,'Sunil Priyantha','Kandy','0768457485','Kurunegala','100','2025-03-07 11:17:00','With a driver','Toyota Land Cruiser');
/*!40000 ALTER TABLE booking ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS car;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE car (
  CarID int NOT NULL AUTO_INCREMENT,
  Model varchar(50) NOT NULL,
  Brand varchar(50) NOT NULL,
  LicensePlate varchar(20) NOT NULL,
  PricePerDay decimal(10,2) NOT NULL,
  `Status` enum('Available','Booked','In Maintenance') DEFAULT 'Available',
  Image varchar(255) DEFAULT NULL,
  PRIMARY KEY (CarID),
  UNIQUE KEY LicensePlate (LicensePlate)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES car WRITE;
/*!40000 ALTER TABLE car DISABLE KEYS */;
INSERT INTO car VALUES (6,'Mercedes','Benze','NB-8990',9000.00,'Available','/assets/images/cars/8d9fffc2-239e-4d85-bac2-a4b4704e7a1b-675dc4476b6a4.jpeg'),(7,'Vezel','Honda','VM-1240',8000.00,'Available','/assets/images/cars/7f31ab5a-8bdc-4047-a2d1-2ce5fc6f1fc5-673324be84a65.jpeg'),(8,'CRz','TOYOTA','TH-4570',5.00,'Available','/assets/images/cars/9c3e8e52-0d54-43b7-bb25-347a52c2a710-1729931355620_1.jpg'),(9,'A3','AUDI','BU-8990',5.00,'Available','/assets/images/cars/565eb164-c69f-4476-8f3c-2337ac8b37b1-678b06953c708.jpeg'),(10,'Prius','TOYOTA','DM-2321',2.00,'Available','/assets/images/cars/45be2444-3df3-478a-8308-486ef970e400-6761424758ead.jpeg'),(11,'SORENTO','KIA','DR-1202',2.00,'Available','/assets/images/cars/c3056233-1b8d-4d90-ada4-2d3c8790486b-67540345b6d24.jpeg'),(12,'MODEL 3','TESLA','QY-1716',3.00,'Available','/assets/images/cars/889c9457-d936-453a-909e-b6fda6c9193d-6789753aa211e.jpeg'),(13,'LAND CRUISER','TOYOTA','KJ-9090',5.00,'Available','/assets/images/cars/31d310c8-e2a0-43e2-9a42-7185db647e2c-6729c438c432b.jpeg'),(14,'MG','M4','KG-9990',5.00,'Available','/assets/images/cars/49e3bd15-37b9-44d2-832f-d7a36179bb73-678979a4f2e5c.jpeg'),(25,'Panda','Micro','NB-8998',11.00,'Available','/assets/images/cars/34ea990c-b7a4-4124-b7a0-19875f1bf02c-67594cf199fdd.jpeg'),(32,'CIVIC','Honda','BT-9871',50.00,'Available','/assets/images/cars/a10d3325-3047-4ba3-ba95-233d630d3e21-c.jpeg'),(33,'aa','aaaaaa','2www',222.00,'Available','/assets/images/cars/eb44e83a-b999-4c47-b4c6-74930bba8809-6789753aa211e.jpeg');
/*!40000 ALTER TABLE car ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS customer;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE customer (
  CustomerID int NOT NULL AUTO_INCREMENT,
  NIC varchar(12) NOT NULL,
  `Name` varchar(100) NOT NULL,
  Email varchar(100) NOT NULL,
  PhoneNumber varchar(15) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (CustomerID),
  UNIQUE KEY NIC (NIC),
  UNIQUE KEY Email (Email),
  UNIQUE KEY PhoneNumber (PhoneNumber)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES customer WRITE;
/*!40000 ALTER TABLE customer DISABLE KEYS */;
INSERT INTO customer VALUES (1,'2002','ppp','p@gmail.com','0111','123'),(2,'2222222222','praveen','praveen@gmail.com','01444444444','123456'),(3,'1212121212','kamal','p1@gmail.com','0415458555','123456'),(4,'110101010255','nimal','p2@gmail.com','0514151245','123456');
/*!40000 ALTER TABLE customer ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS driver;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE driver (
  DriverID int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  LicenseNumber varchar(50) NOT NULL,
  PhoneNumber varchar(15) NOT NULL,
  Email varchar(100) NOT NULL,
  Availability tinyint(1) DEFAULT '1',
  PRIMARY KEY (DriverID),
  UNIQUE KEY LicenseNumber (LicenseNumber),
  UNIQUE KEY PhoneNumber (PhoneNumber),
  UNIQUE KEY Email (Email)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES driver WRITE;
/*!40000 ALTER TABLE driver DISABLE KEYS */;
INSERT INTO driver VALUES (1,'Sumila Amith','222','01444444444','praveen@gmail.com',1),(3,'Keerthi Samantha','1111','014444444455','p@gmail.com',1),(5,'Sapumal Indrajith','111155','014444444457','p@gmal.com',1),(12,'Manusha Perera','666','6666','o@gm266ail.com55',1),(14,'Shehan Bandara','11','1','1@gmail.com',1);
/*!40000 ALTER TABLE driver ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-08 19:45:36
