-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: pendidikan
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
-- Table structure for table `guru`
--

DROP TABLE IF EXISTS `guru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guru` (
  `idGuru` varchar(10) NOT NULL,
  `namaGuru` varchar(25) NOT NULL,
  `umur` int NOT NULL,
  UNIQUE KEY `idGuru` (`idGuru`),
  CONSTRAINT `guru_ibfk_1` FOREIGN KEY (`idGuru`) REFERENCES `sekolah` (`noSekolah`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guru`
--

LOCK TABLES `guru` WRITE;
/*!40000 ALTER TABLE `guru` DISABLE KEYS */;
INSERT INTO `guru` VALUES ('kb01','Ahmad Basa',45),('kb02','Sugeng dayu',54),('kb03','Rahmi Imanda',35),('kb04','Alfan Supete',20),('kb05','Otong Parotong',47),('kb06','Ucok Pekok',50);
/*!40000 ALTER TABLE `guru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `humassekolah`
--

DROP TABLE IF EXISTS `humassekolah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `humassekolah` (
  `kodeHumas` varchar(10) NOT NULL,
  `namaHumas` varchar(100) NOT NULL,
  `gaji` float NOT NULL,
  `umur` int NOT NULL,
  PRIMARY KEY (`kodeHumas`),
  CONSTRAINT `humassekolah_ibfk_1` FOREIGN KEY (`kodeHumas`) REFERENCES `sekolah` (`noSekolah`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humassekolah`
--

LOCK TABLES `humassekolah` WRITE;
/*!40000 ALTER TABLE `humassekolah` DISABLE KEYS */;
INSERT INTO `humassekolah` VALUES ('kb01','Supriadi',3000000,46),('kb02','jumanto',3500000,60),('kb03','Agung',2000000,30);
/*!40000 ALTER TABLE `humassekolah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kantin`
--

DROP TABLE IF EXISTS `kantin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kantin` (
  `kodeKantin` varchar(10) NOT NULL,
  `makanan` varchar(25) NOT NULL,
  `minuman` varchar(25) NOT NULL,
  `taste` enum('lezat','lezat sekali','tidak lezat') DEFAULT NULL,
  PRIMARY KEY (`kodeKantin`),
  CONSTRAINT `kantin_ibfk_1` FOREIGN KEY (`kodeKantin`) REFERENCES `sekolah` (`noSekolah`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kantin`
--

LOCK TABLES `kantin` WRITE;
/*!40000 ALTER TABLE `kantin` DISABLE KEYS */;
INSERT INTO `kantin` VALUES ('kb01','sate padang','sop duren','lezat sekali'),('kb02','sop betawi','sop duren','lezat sekali'),('kb03','sate madura','es campur','lezat'),('kb04','ayam panggang','es serut','lezat'),('kb05','iga bakar','es teh','lezat sekali');
/*!40000 ALTER TABLE `kantin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sekolah`
--

DROP TABLE IF EXISTS `sekolah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sekolah` (
  `noSekolah` varchar(10) NOT NULL,
  `namaSekolah` varchar(100) NOT NULL,
  `akreditasi` char(5) NOT NULL,
  PRIMARY KEY (`noSekolah`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sekolah`
--

LOCK TABLES `sekolah` WRITE;
/*!40000 ALTER TABLE `sekolah` DISABLE KEYS */;
INSERT INTO `sekolah` VALUES ('kb01','SMA Budi Utomo Perak Jombang','A'),('kb02','SMA Budi Mulya Karawang','A'),('kb03','SMA Sulthon AULIA jakarta','A'),('kb04','Ayenk','Z'),('kb05','Noem','Z+'),('kb06','SLB Uye','ZZ');
/*!40000 ALTER TABLE `sekolah` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-28 15:07:30
