-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: klinik_ceria
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
-- Table structure for table `antri`
--

DROP TABLE IF EXISTS `antri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `antri` (
  `no_antrian` int NOT NULL AUTO_INCREMENT,
  `tgl` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hari` varchar(50) NOT NULL,
  `jam` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tahun` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bulan` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`no_antrian`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antri`
--

LOCK TABLES `antri` WRITE;
/*!40000 ALTER TABLE `antri` DISABLE KEYS */;
INSERT INTO `antri` VALUES (1,'2022-06-05 17:06:46','rabu','2022-06-05 17:06:46','2022-06-05 17:06:46','2022-06-06 00:17:31'),(2,'2022-06-05 17:15:09','senin','2022-06-05 17:15:09','2022-06-05 17:15:09','2022-06-06 00:17:31'),(3,'2022-06-05 17:15:09','selasa','2022-06-05 17:15:09','2022-06-05 17:15:09','2022-06-06 00:17:31'),(4,'2022-06-05 17:15:09','minggu','2022-06-05 17:15:09','2022-06-05 17:15:09','2022-06-06 00:17:31');
/*!40000 ALTER TABLE `antri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dokter`
--

DROP TABLE IF EXISTS `dokter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dokter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dokter_pegawai` (`id_dokter`),
  CONSTRAINT `fk_dokter_pegawai` FOREIGN KEY (`id_dokter`) REFERENCES `pegawai` (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dokter`
--

LOCK TABLES `dokter` WRITE;
/*!40000 ALTER TABLE `dokter` DISABLE KEYS */;
INSERT INTO `dokter` VALUES (2,'4','fajar abdillah'),(3,'5','inne qonitati ahmad'),(4,'6','ryan sinomong'),(5,'7','ahmad basa');
/*!40000 ALTER TABLE `dokter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `is_many`
--

DROP TABLE IF EXISTS `is_many`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `is_many` (
  `id_product` varchar(10) NOT NULL,
  `no_pegawai` varchar(10) NOT NULL,
  `gaji` double NOT NULL DEFAULT '0',
  `nama_makanan` varchar(100) NOT NULL,
  PRIMARY KEY (`id_product`,`no_pegawai`),
  KEY `fk_is_many_pegawai` (`no_pegawai`),
  CONSTRAINT `fk_is_many_kantin` FOREIGN KEY (`id_product`) REFERENCES `kantin` (`id`),
  CONSTRAINT `fk_is_many_pegawai` FOREIGN KEY (`no_pegawai`) REFERENCES `pegawai` (`id_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `is_many`
--

LOCK TABLES `is_many` WRITE;
/*!40000 ALTER TABLE `is_many` DISABLE KEYS */;
INSERT INTO `is_many` VALUES ('k001','4',23000000,'ayam kremes'),('k002','5',0,'ayam penyet');
/*!40000 ALTER TABLE `is_many` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kantin`
--

DROP TABLE IF EXISTS `kantin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kantin` (
  `id` varchar(10) NOT NULL,
  `nama_makanan` varchar(100) NOT NULL,
  `deskripsi` text,
  `makanan_favorit` varchar(100) NOT NULL,
  `coba_fore` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_kantin_pegawai` (`coba_fore`),
  FULLTEXT KEY `product_seacrh` (`nama_makanan`,`deskripsi`),
  CONSTRAINT `fk_kantin_pegawai` FOREIGN KEY (`coba_fore`) REFERENCES `pegawai` (`id_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kantin`
--

LOCK TABLES `kantin` WRITE;
/*!40000 ALTER TABLE `kantin` DISABLE KEYS */;
INSERT INTO `kantin` VALUES ('k001','seblak ceker','seblak + ceker','',NULL),('k0010','mie yamin','makanan','',NULL),('k002','seblak sosis','seblak + sosis','',NULL),('k003','seblak bakso','seblak + bakso','',NULL),('k004','seblak spesial','seblak + ceker + sosis + bakso','',NULL),('k005','seblak seafood','seblak + rollfish','',NULL),('k006','bakso','makanan','',NULL),('k007','mie ayam','makanan','',NULL),('k008','mie ayam bakso','makanan','',NULL),('k009','bakso urat','makanan','',NULL);
/*!40000 ALTER TABLE `kantin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasien`
--

DROP TABLE IF EXISTS `pasien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasien` (
  `no_rekam_medis` varchar(50) NOT NULL,
  `kartu_tanda_penduduk` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgl_lahir` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tinggi` int NOT NULL,
  `berat` int NOT NULL,
  PRIMARY KEY (`no_rekam_medis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasien`
--

LOCK TABLES `pasien` WRITE;
/*!40000 ALTER TABLE `pasien` DISABLE KEYS */;
INSERT INTO `pasien` VALUES ('rs01','33001','jamiludin','30-12-2002','duren sawit',170,55),('rs02','33002','maysaroh','1-4-1999','pejaten',170,69),('rs03','33003','syarifuddin','2-6-2000','kampung sawah',169,87),('rs04','33004','tono','15-8-1998','kebon bawang',189,90),('rs05','33005','jumainah','20-10-1990','kebayoran',166,67),('rs06','33006','dandi','8-8-2008','citayam',170,60),('rs07','33007','paijo','11-5-2000','bojong gede',165,60);
/*!40000 ALTER TABLE `pasien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pegawai` (
  `id_pegawai` varchar(10) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `setatus` enum('aktif','tidak aktif') NOT NULL,
  `gaji` double NOT NULL,
  PRIMARY KEY (`id_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegawai`
--

LOCK TABLES `pegawai` WRITE;
/*!40000 ALTER TABLE `pegawai` DISABLE KEYS */;
INSERT INTO `pegawai` VALUES ('10','ahmad basa','aktif',30000000),('4','fajar abdillah ahmad','aktif',23000000),('5','azka salsabila ahmad','aktif',18000000),('6','fahmi fadilah ahmad','aktif',20000000),('7','inne qonitati ahmad','aktif',15000000),('8','ahmad basa','aktif',30000000),('9','nur asiah','aktif',25000000);
/*!40000 ALTER TABLE `pegawai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembayaran`
--

DROP TABLE IF EXISTS `pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pembayaran` (
  `id_pembayaran` int NOT NULL,
  `tipe_pembayaran` varchar(50) NOT NULL,
  `nama_instansi` varchar(50) NOT NULL,
  `nominal` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_pembayaran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayaran`
--

LOCK TABLES `pembayaran` WRITE;
/*!40000 ALTER TABLE `pembayaran` DISABLE KEYS */;
INSERT INTO `pembayaran` VALUES (1,'tranfer','uhamka',5000000),(2,'kredit','unindra',2000000),(3,'kredit','unsoed',7000000),(4,'tranfer','UI',8000000);
/*!40000 ALTER TABLE `pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poli`
--

DROP TABLE IF EXISTS `poli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poli` (
  `id_poli` varchar(50) NOT NULL,
  `id_peg` varchar(50) NOT NULL,
  `Nama_poli` varchar(50) NOT NULL,
  PRIMARY KEY (`id_poli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poli`
--

LOCK TABLES `poli` WRITE;
/*!40000 ALTER TABLE `poli` DISABLE KEYS */;
/*!40000 ALTER TABLE `poli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_customer` varchar(10) NOT NULL,
  `balance` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_id_customer_unique` (`id_customer`),
  CONSTRAINT `fk_wallet_pegawai` FOREIGN KEY (`id_customer`) REFERENCES `pegawai` (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` VALUES (1,'4',0),(2,'5',0),(5,'6',200000),(6,'7',1000000),(7,'8',500000),(8,'9',300000);
/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-07 23:01:26
