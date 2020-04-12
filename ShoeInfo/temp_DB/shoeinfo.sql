CREATE DATABASE  IF NOT EXISTS `shoeinfo` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `shoeinfo`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: shoeinfo
-- ------------------------------------------------------
-- Server version	5.6.45-log

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
-- Table structure for table `shoeinfo_brand`
--

DROP TABLE IF EXISTS `shoeinfo_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoeinfo_brand` (
  `country_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_logo` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_id` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoeinfo_brand`
--

LOCK TABLES `shoeinfo_brand` WRITE;
/*!40000 ALTER TABLE `shoeinfo_brand` DISABLE KEYS */;
INSERT INTO `shoeinfo_brand` VALUES ('대한민국','snkrs.png','snkrs 코리아','대한민국_snkrs'),('대한민국','atmos.png','아트모스','대한민국_아트모스'),('대한민국','kasina.png','카시나','대한민국_카시나'),('미국','extrabutter.png','extrabutter','미국_extrabutter'),('미국','snkrs.png','snkrs USA','미국_snkrs'),('일본','atmos.png','아트모스','일본_아트모스');
/*!40000 ALTER TABLE `shoeinfo_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoeinfo_country`
--

DROP TABLE IF EXISTS `shoeinfo_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoeinfo_country` (
  `country_region` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `country_flag` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoeinfo_country`
--

LOCK TABLES `shoeinfo_country` WRITE;
/*!40000 ALTER TABLE `shoeinfo_country` DISABLE KEYS */;
INSERT INTO `shoeinfo_country` VALUES ('아메리카','캐나다','01','캐나다.png'),('아메리카','미국','1','미국.png'),('유럽','네덜란드','31','네덜란드.png'),('유럽','영국','44','영국.png'),('기타','호주','61','호주.png'),('기타','뉴질랜드','64','뉴질랜드.png'),('아시아','일본','81','일본.png'),('아시아','대한민국','82','대한민국.png'),('아시아','중국','86','중국.png');
/*!40000 ALTER TABLE `shoeinfo_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoeinfo_member`
--

DROP TABLE IF EXISTS `shoeinfo_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoeinfo_member` (
  `id` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoeinfo_member`
--

LOCK TABLES `shoeinfo_member` WRITE;
/*!40000 ALTER TABLE `shoeinfo_member` DISABLE KEYS */;
INSERT INTO `shoeinfo_member` VALUES ('admin','1234','통합관리자','coduo25@gmail.com','01062419520','2020-03-31'),('coduo25','1234','박정훈','coduo25@gmail.com','01062419520','2020-03-31');
/*!40000 ALTER TABLE `shoeinfo_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoeinfo_offlineinfo`
--

DROP TABLE IF EXISTS `shoeinfo_offlineinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoeinfo_offlineinfo` (
  `offline_num` int(11) NOT NULL,
  `model_stylecode` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `offline_location` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `offline_link` text COLLATE utf8_unicode_ci,
  `offline_start_time` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `offline_end_time` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `offline_result_time` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `offline_method` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`offline_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoeinfo_offlineinfo`
--

LOCK TABLES `shoeinfo_offlineinfo` WRITE;
/*!40000 ALTER TABLE `shoeinfo_offlineinfo` DISABLE KEYS */;
INSERT INTO `shoeinfo_offlineinfo` VALUES (1,'555088-500','대한민국','대한민국_snkrs','홍대','','2020-04-18 10:00','2020-04-18 14:00','2020-04-18 18:00','스크래치','');
/*!40000 ALTER TABLE `shoeinfo_offlineinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoeinfo_onlineinfo`
--

DROP TABLE IF EXISTS `shoeinfo_onlineinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoeinfo_onlineinfo` (
  `online_num` int(11) NOT NULL,
  `model_stylecode` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_region` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `online_link` text COLLATE utf8_unicode_ci,
  `online_start_time` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `online_end_time` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `online_result_time` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `online_method` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_method` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`online_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoeinfo_onlineinfo`
--

LOCK TABLES `shoeinfo_onlineinfo` WRITE;
/*!40000 ALTER TABLE `shoeinfo_onlineinfo` DISABLE KEYS */;
INSERT INTO `shoeinfo_onlineinfo` VALUES (1,'555088-500','아시아','대한민국','대한민국_snkrs','https://www.nike.com/kr/ko_kr/','2020-04-18 10:00','2020-04-18 11:00','2020-04-18 13:00','드로우','-',NULL),(2,'555088-500','아시아','대한민국','대한민국_아트모스','http://www.atmos.co.kr','2020-04-09 10:00','2020-04-09 12:00','2020-04-09 13:00','드로우','-',NULL),(3,'555088-041','아메리카','미국','미국_snkrs','https://www.nike.com/','2020-05-09 09:00','2020-05-09 09:30',' ','드로우','직배불가(배대지추천)',NULL),(4,'555088-500','아시아','대한민국','대한민국_카시나','https://www.kasina.co.kr/','2020-04-18 10:00','2020-04-18 12:00','2020-04-18 18:00','드로우','-',NULL),(5,'555088-500','아시아','일본','일본_아트모스','https://www.atmos-tokyo.com/','2020-04-18 11:00','2020-04-18 11:30','2020-04-18 13:00','드로우','직배불가(배대지추천)',NULL),(6,'555088-500','아메리카','미국','미국_extrabutter','https://extrabutterny.com/collections/release-draws/products/air-jordan-mens-1-high-og-555088-500?variant=31797632008240','2020-04-11 09:00','2020-04-11 10:00','2020-04-11 14:00','드로우(드로우당첨자간 선착순 구매)','직배불가(배대지추천)',NULL),(7,'555088-500','아시아','대한민국','대한민국_카시나','https://www.kasina.co.kr/','2020-04-18 10:00','2020-04-18 12:00','2020-04-18 18:00','선착','-',NULL);
/*!40000 ALTER TABLE `shoeinfo_onlineinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoeinfo_sneakerlibrary`
--

DROP TABLE IF EXISTS `shoeinfo_sneakerlibrary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoeinfo_sneakerlibrary` (
  `brand` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_brand` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_index` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `model_stylecode` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `model_name` text COLLATE utf8_unicode_ci,
  `model_colorway` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`model_stylecode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoeinfo_sneakerlibrary`
--

LOCK TABLES `shoeinfo_sneakerlibrary` WRITE;
/*!40000 ALTER TABLE `shoeinfo_sneakerlibrary` DISABLE KEYS */;
INSERT INTO `shoeinfo_sneakerlibrary` VALUES ('Fear of God','ESSENTIAL','','Fear Of God ESSENTIALS Converse Chuck 70.jpg,Fear Of God ESSENTIALS Converse Chuck 701.jpg,Fear Of God ESSENTIALS Converse Chuck 70 3.jpg','167954c','Fear of God ESSENTIALS x Converse Chuck 70','Black/Egret/Natural',110,'2020-04-10'),('Air Jordan','','1','air jordan 1 game royal 1.jpg,air jordan 1 game royal 2.jpg,air jordan 1 game royal 3.jpg','555088-041','Air Jordan 1 Retro High OG “Game Royal”','Black/White-Game Royal-Black',170,'2020-05-09'),('Air Jordan','','1','air jordan 1 court purple 1.jpg,air jordan 1 court purple 3.jpg,air jordan 1 court purple 4.jpg','555088-500','Jordan 1 Retro High Court Purple White','COURT PURPLE/WHITE-BLACK',170,'2020-04-18'),('New Balance','','','New Balance 992 Grey 1.jpg,New Balance 992 Grey 2.jpg,New Balance 992 Grey 3.jpg','M992GR','New Balance 992 Grey','GREY/SILVER',175,'2020-04-13');
/*!40000 ALTER TABLE `shoeinfo_sneakerlibrary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'shoeinfo'
--

--
-- Dumping routines for database 'shoeinfo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-13  0:55:55
