-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: fakultas
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
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mahasiswa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) NOT NULL,
  `nim` int NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `prodi` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa`
--

LOCK TABLES `mahasiswa` WRITE;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` VALUES (1,'fajar abdillah ahmad',2103015111,'3f','Teknik Informatika'),(2,'Sandi maldini',2103015047,'3f','Teknik Informatika'),(3,'M.Ryan Adi ',2103015191,'3f','Teknik Informatika'),(4,'M.Yazid Zidan',2103015061,'3f','Teknik Informatika'),(5,'Sifannis',2103015021,'3f','Teknik Informatika'),(6,'Siti Jupri',2103015234,'3f','Teknik Informatika');
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organisasi`
--

DROP TABLE IF EXISTS `organisasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organisasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_org` int NOT NULL,
  `nama_organisasi` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_id_org_mhs` (`id_org`),
  CONSTRAINT `fk_organisasi_mahasiswa` FOREIGN KEY (`id_org`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisasi`
--

LOCK TABLES `organisasi` WRITE;
/*!40000 ALTER TABLE `organisasi` DISABLE KEYS */;
INSERT INTO `organisasi` VALUES (1,1,' - '),(2,2,'Hima'),(3,3,'BEM'),(4,4,'Dpm'),(5,5,'BEM'),(6,6,' - ');
/*!40000 ALTER TABLE `organisasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ukm`
--

DROP TABLE IF EXISTS `ukm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ukm` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_ukm` int NOT NULL,
  `nama_ukm` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_ukm` (`id_ukm`),
  CONSTRAINT `FK_UKM_MAHASISWA` FOREIGN KEY (`id_ukm`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ukm`
--

LOCK TABLES `ukm` WRITE;
/*!40000 ALTER TABLE `ukm` DISABLE KEYS */;
INSERT INTO `ukm` VALUES (1,5,'Badminton'),(2,1,'Futsal'),(3,2,'Badminton'),(4,3,'Renang'),(5,4,'Volly'),(6,6,'Pencak Silat');
/*!40000 ALTER TABLE `ukm` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-08 23:08:23
