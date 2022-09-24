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
  `name_brownies` varchar(20) NOT NULL,
  `no_brownies` int NOT NULL AUTO_INCREMENT,
  `price_brownies` int NOT NULL,
  `id_brownies` varchar(10) NOT NULL,
  `id_product` varchar(10) NOT NULL,
  `taste` text,
  PRIMARY KEY (`no_brownies`),
  KEY `fk_brownies_product` (`id_product`),
  CONSTRAINT `fk_brownies_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`PRODUCT_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name_cake` varchar(20) NOT NULL,
  `no_cake` int NOT NULL AUTO_INCREMENT,
  `price_cake` int NOT NULL,
  `id_cake` varchar(10) NOT NULL,
  `id_product` varchar(10) NOT NULL,
  `taste` text,
  PRIMARY KEY (`no_cake`),
  KEY `fk_cake_product` (`id_product`),
  CONSTRAINT `fk_cake_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`PRODUCT_ID`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `gaji`
--

DROP TABLE IF EXISTS `gaji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gaji` (
  `no_gaji` int NOT NULL AUTO_INCREMENT,
  `gaji_karyawan` int NOT NULL,
  `gaji_id_karyawan` varchar(10) NOT NULL,
  PRIMARY KEY (`no_gaji`),
  KEY `fk_gaji_karyawan` (`gaji_id_karyawan`),
  CONSTRAINT `fk_gaji_karyawan` FOREIGN KEY (`gaji_id_karyawan`) REFERENCES `karyawan` (`karyawan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gaji`
--

LOCK TABLES `gaji` WRITE;
/*!40000 ALTER TABLE `gaji` DISABLE KEYS */;
/*!40000 ALTER TABLE `gaji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `karyawan`
--

DROP TABLE IF EXISTS `karyawan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `karyawan` (
  `no_karyawan` int NOT NULL AUTO_INCREMENT,
  `karyawan_name` varchar(20) NOT NULL,
  `karyawan_umur` int NOT NULL,
  `karyawan_id` varchar(10) NOT NULL,
  PRIMARY KEY (`no_karyawan`),
  UNIQUE KEY `karyawan_id` (`karyawan_id`)
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
-- Table structure for table `pembayaran`
--

DROP TABLE IF EXISTS `pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pembayaran` (
  `NO_PEMBAYARAN` int NOT NULL AUTO_INCREMENT,
  `NOMINAL_PEMBAYARAN` varchar(20) NOT NULL,
  `ID_PRODUCT` varchar(10) NOT NULL,
  `KODE_PEMBAYARAN` varchar(10) NOT NULL,
  PRIMARY KEY (`NO_PEMBAYARAN`),
  UNIQUE KEY `KODE_PEMBAYARAN` (`KODE_PEMBAYARAN`),
  KEY `FK_PEMBAYARAN_PRODUCT` (`ID_PRODUCT`),
  CONSTRAINT `FK_PEMBAYARAN_PRODUCT` FOREIGN KEY (`ID_PRODUCT`) REFERENCES `product` (`PRODUCT_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayaran`
--

LOCK TABLES `pembayaran` WRITE;
/*!40000 ALTER TABLE `pembayaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `NO_PRODUCT` int NOT NULL AUTO_INCREMENT,
  `CATEGORY_PRODUCT` text,
  `PRODUCT_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`NO_PRODUCT`),
  UNIQUE KEY `PRODUCT_ID` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
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

-- Dump completed on 2022-09-24  8:08:39
