-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: azkacake
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `brownies`
--

DROP TABLE IF EXISTS `brownies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brownies` (
  `no_brownies` int NOT NULL AUTO_INCREMENT,
  `kode_brownies` varchar(5) NOT NULL,
  `nama_brownies` varchar(20) NOT NULL,
  `bahan_brownies` varchar(20) NOT NULL,
  PRIMARY KEY (`no_brownies`),
  KEY `kode_brownies` (`kode_brownies`),
  CONSTRAINT `brownies_ibfk_1` FOREIGN KEY (`kode_brownies`) REFERENCES `product` (`kode_product`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brownies`
--

LOCK TABLES `brownies` WRITE;
/*!40000 ALTER TABLE `brownies` DISABLE KEYS */;
/*!40000 ALTER TABLE `brownies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cake`
--

DROP TABLE IF EXISTS `cake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cake` (
  `no_cake` int NOT NULL AUTO_INCREMENT,
  `kode_cake` varchar(5) NOT NULL,
  `nama_cake` varchar(20) NOT NULL,
  `bahan_cake` varchar(20) NOT NULL,
  PRIMARY KEY (`no_cake`),
  KEY `kode_cake` (`kode_cake`),
  CONSTRAINT `cake_ibfk_1` FOREIGN KEY (`kode_cake`) REFERENCES `dessert` (`kode_dessert`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cake`
--

LOCK TABLES `cake` WRITE;
/*!40000 ALTER TABLE `cake` DISABLE KEYS */;
/*!40000 ALTER TABLE `cake` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dessert`
--

DROP TABLE IF EXISTS `dessert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dessert` (
  `no_dessert` int NOT NULL AUTO_INCREMENT,
  `kode_dessert` varchar(5) NOT NULL,
  `nama_dessert` varchar(20) NOT NULL,
  `bahan_dessert` varchar(20) NOT NULL,
  PRIMARY KEY (`no_dessert`),
  KEY `kode_dessert` (`kode_dessert`),
  CONSTRAINT `dessert_ibfk_1` FOREIGN KEY (`kode_dessert`) REFERENCES `product` (`kode_product`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dessert`
--

LOCK TABLES `dessert` WRITE;
/*!40000 ALTER TABLE `dessert` DISABLE KEYS */;
INSERT INTO `dessert` VALUES (7,'p01','Dadar Gulung','Tepung and Cocoa'),(8,'p02','Pie Keju','Tepung and Keju'),(9,'p03','Bapia Coklat','Tepung and Coklat');
/*!40000 ALTER TABLE `dessert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gajikaryawan`
--

DROP TABLE IF EXISTS `gajikaryawan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gajikaryawan` (
  `no_gaji` int NOT NULL AUTO_INCREMENT,
  `kode_gaji` varchar(5) NOT NULL,
  `nominal_gaji` int NOT NULL,
  PRIMARY KEY (`no_gaji`),
  UNIQUE KEY `kode_gaji` (`kode_gaji`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gajikaryawan`
--

LOCK TABLES `gajikaryawan` WRITE;
/*!40000 ALTER TABLE `gajikaryawan` DISABLE KEYS */;
/*!40000 ALTER TABLE `gajikaryawan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `karyawan`
--

DROP TABLE IF EXISTS `karyawan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `karyawan` (
  `no_karyawan` int NOT NULL AUTO_INCREMENT,
  `kode_karyawan` varchar(5) NOT NULL,
  `nama_karyawan` varchar(20) NOT NULL,
  `umur_karyawan` int NOT NULL,
  `jenisKelamin_karyawan` varchar(10) NOT NULL,
  PRIMARY KEY (`no_karyawan`),
  KEY `nama_karyawan` (`nama_karyawan`),
  CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`nama_karyawan`) REFERENCES `gajikaryawan` (`kode_gaji`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karyawan`
--

LOCK TABLES `karyawan` WRITE;
/*!40000 ALTER TABLE `karyawan` DISABLE KEYS */;
/*!40000 ALTER TABLE `karyawan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listpembayaran`
--

DROP TABLE IF EXISTS `listpembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listpembayaran` (
  `no_pembayaran` int NOT NULL AUTO_INCREMENT,
  `kode_pembayaran` varchar(5) NOT NULL,
  `nominal_pembayaran` varchar(20) NOT NULL,
  PRIMARY KEY (`no_pembayaran`),
  KEY `kode_pembayaran` (`kode_pembayaran`),
  CONSTRAINT `listpembayaran_ibfk_1` FOREIGN KEY (`kode_pembayaran`) REFERENCES `product` (`kode_product`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listpembayaran`
--

LOCK TABLES `listpembayaran` WRITE;
/*!40000 ALTER TABLE `listpembayaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `listpembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `no_product` int NOT NULL AUTO_INCREMENT,
  `kode_product` varchar(5) NOT NULL,
  `jenis_product` varchar(20) NOT NULL,
  PRIMARY KEY (`no_product`),
  UNIQUE KEY `kode_product` (`kode_product`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'p01','Makanan'),(2,'p02','Makanan'),(3,'p03','Makanan'),(4,'p04','Makanan'),(5,'p05','Makanan'),(6,'p06','Makanan'),(7,'p07','Makanan'),(8,'p08','Makanan');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-18 16:58:26
