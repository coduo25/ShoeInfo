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
INSERT INTO `shoeinfo_brand` VALUES ('대한민국','HOOPCITY.png','HOOOPCITY','대한민국_HOOOPCITY'),('대한민국','JD Sports.png','JD Sports','대한민국_JD Sports'),('대한민국','snkrs.png','snkrs 코리아','대한민국_snkrs'),('대한민국','COMME des GARCONS.png','꼼데가르송','대한민국_꼼데가르송'),('대한민국','atmos.png','아트모스','대한민국_아트모스'),('대한민국','kasina.png','카시나','대한민국_카시나'),('대한민국','casestudy.png','케이스스터디','대한민국_케이스스터디'),('덴마트','NAKED.png','NAKED','덴마트_NAKED'),('독일','bstn.png','bstn','독일_bstn'),('독일','KICKZ.png','KICKZ','독일_KICKZ'),('독일','SOTO.png','SOTO','독일_SOTO'),('독일','VooStore.png','VooStore','독일_VooStore'),('미국','18montrose.png','18montrose','미국_18montrose'),('미국','Bodega.png','Bodega','미국_Bodega'),('미국','extrabutter.png','extrabutter','미국_extrabutter'),('미국','FEATURES.png','FEATURES','미국_FEATURES'),('미국','finishline.png','FINISHLINE','미국_FINISHLINE'),('미국','JD Sports.png','JD Sports','미국_JD Sports'),('미국','LIVESTOCK.png','LIVESTOCK','미국_LIVESTOCK'),('미국','shoepalace.png','ShoePalace','미국_ShoePalace'),('미국','snkrs.png','snkrs USA','미국_snkrs'),('미국','UNDEFEATED.png','UNDEFEATED','미국_UNDEFEATED'),('미국','XHIBITION.png','XHIBITION','미국_XHIBITION'),('스웨덴','SNS.png','SNS','스웨덴_SNS'),('스페인','FOOTDISTRICT.png','FOOTDISTRICT','스페인_FOOTDISTRICT'),('스페인','noirfonce.png','noirfonce','스페인_noirfonce'),('영국','END.png','END','영국_END'),('영국','flatspot.png','flatspot','영국_flatspot'),('영국','FOOTPATROL.png','FOOTPATROL','영국_FOOTPATROL'),('영국','GOODHOOD.png','GOODHOOD','영국_GOODHOOD'),('영국','TRES BIEN.png','TRES BIEN','영국_TRES BIEN'),('이탈리아','ONEBLOCKDOWN.png','ONEBLOCKDOWN','이탈리아_ONEBLOCKDOWN'),('일본','mortar.png','MORTAR tokyo','일본_MORTAR tokyo'),('일본','atmos.png','아트모스 도쿄','일본_아트모스 도쿄'),('중국','JD Sports.png','JD Sports','중국_JD Sports'),('체코','FOOTSHOP.png','FOOTSHOP','체코_FOOTSHOP'),('캐나다','NRML.png','NRML','캐나다_NRML'),('프랑스','basket4ballers.png','basket4ballers','프랑스_basket4ballers');
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
INSERT INTO `shoeinfo_country` VALUES ('아메리카','캐나다','01','캐나다.png'),('아메리카','미국','1','미국.png'),('유럽','네덜란드','31','네덜란드.png'),('유럽','프랑스','33','프랑스.png'),('유럽','스페인','34','스페인.png'),('유럽','이탈리아','39','이탈리아.png'),('유럽','체코','420','체코.png'),('유럽','영국','44','영국.png'),('유럽','덴마트','45','덴마크.png'),('유럽','스웨덴','46','스웨덴.png'),('유럽','독일','49','독일.png'),('기타','호주','61','호주.png'),('기타','뉴질랜드','64','뉴질랜드.png'),('아시아','일본','81','일본.png'),('아시아','대한민국','82','대한민국.png'),('아시아','중국','86','중국.png');
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
-- Table structure for table `shoeinfo_memberdrawinfo`
--

DROP TABLE IF EXISTS `shoeinfo_memberdrawinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoeinfo_memberdrawinfo` (
  `userDraw_num` int(11) NOT NULL,
  `member_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_stylecode` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `draw_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`userDraw_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoeinfo_memberdrawinfo`
--

LOCK TABLES `shoeinfo_memberdrawinfo` WRITE;
/*!40000 ALTER TABLE `shoeinfo_memberdrawinfo` DISABLE KEYS */;
INSERT INTO `shoeinfo_memberdrawinfo` VALUES (1,'admin','555088-500','대한민국','대한민국_snkrs',1),(2,'coduo25','555088-500','대한민국','대한민국_snkrs',1),(3,'coduo25','555088-500','프랑스','프랑스_basket4ballers',2),(4,'admin','555088-500','프랑스','프랑스_basket4ballers',2),(5,'coduo25','555088-500','대한민국','대한민국_카시나',3),(6,'coduo25','AR4237-005','대한민국','대한민국_snkrs',4),(7,'coduo25','555088-500','독일','독일_SOTO',5),(8,'coduo25','AR4237-005','미국','미국_Bodega',6),(9,'admin','555088-500','체코','체코_FOOTSHOP',3),(10,'coduo25','555088-041','대한민국','대한민국_카시나',7),(11,'coduo25','555088-041','대한민국','대한민국_HOOOPCITY',8);
/*!40000 ALTER TABLE `shoeinfo_memberdrawinfo` ENABLE KEYS */;
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
INSERT INTO `shoeinfo_offlineinfo` VALUES (1,'AR4237-005','대한민국','대한민국_snkrs','홍대','https://www.instagram.com/p/B_Q5O4XAO9a/?utm_source=ig_web_button_share_sheet','2020-04-22 10:00','2020-04-24 10:00','추첨',''),(2,'AR4237-005','대한민국','대한민국_꼼데가르송','한남 서울 스토어','https://www.instagram.com/p/B_RGxLoDMJi/?utm_source=ig_web_button_share_sheet','2020-04-22 12:00','2020-04-22 18:00','추첨',''),(3,'555088-041','대한민국','대한민국_아트모스','서울','https://www.instagram.com/p/B_4epzsJQcU/?utm_source=ig_web_copy_link','2020-05-09 11:00','0000-00-00 00:00','선착','');
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
  `online_method` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buy_method` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
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
INSERT INTO `shoeinfo_onlineinfo` VALUES (1,'555088-500','아시아','대한민국','대한민국_snkrs','https://www.nike.com/kr/launch/t/men/fw/basketball/555088-500/mzqw37/air-jordan-1-retro-high-og','2020-04-18 10:00','2020-04-18 11:00','드로우','당첨 후 결제','-',''),(2,'555088-500','유럽','프랑스','프랑스_basket4ballers','https://www.basket4ballers.com/fr/basket-sneakers/22296-air-jordan-1-retro-high-og-court-purple.html','2020-04-11 10:00','2020-04-16 19:00','드로우','당첨 후 결제','직배불가(배대지추천)',''),(3,'555088-500','아메리카','미국','미국_FINISHLINE','https://www.finishline.com/store/product/mens-air-jordan-retro-1-high-og-basketball-shoes/prod1360195?styleId=555088&colorId=500&ranMID=37731&ranEAID=W9MhUk6cl28&ranSiteID=W9MhUk6cl28-22UBwzUF0cy1wYn.GinGZg&CMP=AFL-LS-affiliatechannel&sourceid=affiliate&utm_source=3168473&utm_medium=affiliate&utm_campaign=1&siteID=W9MhUk6cl28-22UBwzUF0cy1wYn.GinGZg','2020-04-15 23:00','2020-04-15 23:00','선착','선착순 구매','직배불가(배대지추천)',''),(4,'555088-500','아메리카','미국','미국_ShoePalace','https://www.shoepalace.com/product/jordan/555088-500/air-jordan-1-high-og-court-purple-mens-lifestyle-shoe-court-purple-white-black/','2020-04-11 23:00','2020-04-11 23:00','선착','선착순 구매','직배불가(배대지추천)',''),(5,'555088-500','아메리카','미국','미국_JD Sports','https://www.jdsports.com/store/product/mens-air-jordan-retro-1-high-og-basketball-shoes/prod1360195?styleId=555088&colorId=500','2020-04-11 23:00','2020-04-11 23:00','선착','선착순 구매','직배불가(배대지추천)',''),(6,'555088-500','아메리카','미국','미국_18montrose','https://us.18montrose.com/footwear/sneakers','2020-04-11 23:00','2020-04-11 23:00','선착','선착순 구매','직배불가(배대지추천)',''),(7,'555088-500','아메리카','캐나다','캐나다_NRML','https://nrml.ca/collections/new-arrivals','2020-04-11 23:00','2020-04-11 23:00','선착','선착순 구매','직배가능',''),(8,'555088-500','유럽','독일','독일_bstn','https://raffle.bstn.com/air-jordan-1-retro-high-og-court-purple-','2020-04-11 10:00','2020-04-16 23:00','드로우','당첨 후 결제','직배가능',''),(9,'555088-500','아시아','대한민국','대한민국_카시나','https://www.kasina.co.kr/main/html.php?htmid=proc/page/draw/draw20200416jd1p.html','2020-04-16 22:00','2020-04-17 08:00','드로우','당첨 후 결제','-',''),(10,'555088-500','아시아','대한민국','대한민국_아트모스','http://www.atmos-seoul.com/m/seminar.html?seminar_type=draw_list','2020-04-17 12:00','2020-04-17 15:00','드로우','당첨 후 결제','-',''),(11,'555088-500','아시아','대한민국','대한민국_JD Sports','https://www.instagram.com/p/B_CK-WAgtkh/?igshid=w50zuudf5vjc','2020-04-18 12:00','2020-04-20 23:59','드로우','당첨 후 결제','-',''),(12,'555088-500','아시아','대한민국','대한민국_HOOOPCITY','https://www.hoopcity.co.kr/shop/goods/goods_view.php?goodsno=5514&category=005','2020-04-16 16:00','2020-04-17 09:00','드로우','당첨 후 결제','-',''),(13,'AR4237-005','아시아','대한민국','대한민국_snkrs','https://www.nike.com/kr/launch/t/men/fw/basketball/AR4237-005/jubx15/nike-air-fear-of-god-1','2020-04-25 10:00','2020-04-25 11:00','드로우','당첨 후 결제','-',''),(14,'CU1727-100​​​​​​​','유럽','스페인','스페인_noirfonce','https://www.noirfonce.eu/products/nike-dunk-low-sp-cu1727-801?_pos=5&_sid=5f528ad55&_ss=r','0000-00-00 00:00','0000-00-00 00:00','선착','선착순 구매','직배가능',''),(15,'555088-500','유럽','독일','독일_SOTO','https://www.sotostore.com/en/content/view/JORDAN-1-RETRO-HIGH-OG-555088-500?__cf_chl_captcha_tk__=9301231290cf83598d47354d530c36a151a4d0af-1587427192-0-Acgi8xbF_SF4QhnM6TGfJPNA2XbQW6ndiGR1_7gBYZD-cqx7bI_RvSgTHTZaYW6OBWWWhftOGb6hqeMZ0iJVpbqOPlkRZXGEMN-Ay_Iw2xogpnV0-8BHAg609O-2QzFpYEqcVrbza9AOLj03wzGRIbGMaElycciUWPoHSS-DL2rR0s8-iqCgo3ONCXw3N9kFlLiqjY0A2RRfciEUZ_uLOOSaPxL7nA3AnpQhxOWOD3gQypd0hvBPglPJlMKnWGM_YP6PEIVF-uo4fby219SV-6CKkaOKjrfP_DT5l2F34wKq6vC8v0sd3xTjKQ-Tkc66dRjscVT580c1mDikNh3X_A9pYFEB_ooDCx7wpGUYZorF3nNcR1TW1tDkJrhxb_8seGdpQcDOFqjXS82vYwNH8pM3Z4YJjpUNZWGdfLK0h6l64q6e7wQl3pcPr-4twPKjmoNJKinGARcKN-4HEe18c-rnLc9GsKGOFLxCdfBwmT_h4f8bwJf-4Uk9dzrUkJuEDZs87csrd4BV3xHdcJwL8evOhoUP36FeDQEm4MIiMs840-Sr9da84DDgrvsLVhM43q2YKk7mEQNNKnEDhCmappjqGZsZaJVHBSa-HI38-6T8','2020-04-20 22:00','0000-00-00 00:00','드로우','당첨 후 결제','직배불가(배대지추천)',''),(16,'AO9944-441','아시아','대한민국','대한민국_snkrs','https://www.nike.com/kr/ko_kr/t/women/fw/basketball/AO9944-441/jqvh38/wmns-air-jordan-1-low','2020-04-25 10:00','0000-00-00 00:00','선착','선착순 구매','-',''),(17,'AR4237-005','아메리카','미국','미국_Bodega','https://bdgastore.com/blogs/upcoming-releases/4-25-20-nike-air-fear-of-god-1-triple-blackqs','2020-04-23 10:00','2020-04-24 06:00','드로우','당첨 후 결제','직배가능',''),(18,'555088-500','유럽','체코','체코_FOOTSHOP','https://releases.footshop.com/air-jordan-1-retro-high-og-rMsuMHEBjrozTwwS3DNO','0000-00-00 00:00','2020-04-24 07:00','드로우','당첨 후 결제','직배불가(배대지추천)',''),(19,'555088-041','아시아','대한민국','대한민국_snkrs','http://www.nike.com/kr/launch/t/men/fw/basketball/555088-041/cowo17/air-jordan-1-retro-high-og','2020-05-09 10:00','2020-05-09 11:00','드로우','당첨 후 결제','-',''),(20,'555088-041','아시아','대한민국','대한민국_카시나','https://www.kasina.co.kr/main/html.php?htmid=proc/page/draw/draw20200507jd1r.html','0002-11-30 00:00','2020-05-08 08:00','드로우','당첨 후 결제','-',''),(21,'555088-041','아시아','대한민국','대한민국_HOOOPCITY','https://www.hoopcity.co.kr/shop/goods/goods_view.php?goodsno=6912&category=005001005','2020-05-07 00:00','2020-05-08 09:00','드로우','당첨 후 결제','-',''),(22,'555088-041','아시아','대한민국','대한민국_아트모스','http://www.atmos-seoul.com/m/seminar.html?seminar_type=seminar_enter&code=DRAW&uid=85','2020-05-08 12:00','2020-05-08 15:00','드로우','당첨 후 결제','-',''),(23,'555088-041','아시아','대한민국','대한민국_JD Sports','','2020-05-09 00:00','2020-05-10 11:59','드로우','당첨 후 결제','-','');
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
INSERT INTO `shoeinfo_sneakerlibrary` VALUES ('Air Jordan','1','','air jordan 1 game royal.png','555088-041','Jordan 1 Retro High Black Game Royal','BLACK/WHITE-GAME ROYAL-BLACK',170,'2020-05-09'),('Air Jordan','1','','Air Jordan 1 Retro High Light Smoke Grey.png','555088-126','Air Jordan 1 Retro High Light Smoke Grey','WHITE/BLACK-LIGHT SMOKE GREY-VARSITY RED',130,'2020-07-11'),('Air Jordan','1','','air jordan 1 court purple 1.png','555088-500','Jordan 1 Retro High Court Purple White','COURT PURPLE/WHITE-BLACK',170,'2020-04-18'),('Air Jordan','1','Low','air jordan 1 low unc W.png','AO9944-441','Jordan 1 Low UNC (W)','UNIVERSITY BLUE/UNIVERSITY BLUE-WHITE',90,'2020-04-25'),('Nike','1','Fear of God','fear-of-god-black 1.png','AR4237-005','Nike Air Fear of God 1 Triple Black','BLACK/BLACK',350,'2020-04-25'),('Air Jordan','11','Low','Air Jordan 11 Low Concord.png','AV2187-160','Air Jordan 11 Low Concord','White/University Red-Black-True Red',185,'2020-05-23'),('Air Jordan','1','','air Jordan 1 satin snake.png','CD0461-601','Air Jordan 1 Retro High OG Satin Snake','Gym Red/White-Black',170,'2020-08-15'),('Adidas','Yeezy','Boost 350 V2','Adidas Yeezy Boost 350 Zebra.png','CP9654','Adidas Yeezy Boost 350 Zebra','WHITE/CORE BLACK/RED',220,'2020-06-27'),('Nike x Travis Scoots','Air Max','270','Travis Scotts Nike Air Max 270 React.png','CT2864-200','Travis Scott’s Nike Air Max 270 React','',190,'2020-05-29'),('Nike','Dunk ','Low','Nike Dunk Low University Red.png','CU1727-100​​​​​​​','Nike Dunk Low University Red','White/University Red​​​​​​​',100,'2020-06-04'),('Nike','Dunk','Low','Nike Dunk Low Varsity MaizePine Green.png','CU1727-700','Nike Dunk Low Varsity MaizePine Green','Varsity Maize/Pine Green-White',100,'2020-05-21'),('Nike','Dunk','Low','Nike Dunk Low University Orange.png','CU1727-800​​​​​​​','Nike Dunk Low University Orange','University Orange/Marine​​​​​​​-Marine',100,'2020-06-19'),('Ben & Jerry’s x Nike','Dunk SB','','Ben  Jerrys x Nike SB Dunk Chunky Dunky.png','CU3244-100','Ben & Jerry’s x Nike SB Dunk Chunky Dunky','',0,'2020-06-20'),('Off-White x Nike','Rubber Dunk','','Off-White x Nike Rubber Dunk University Gold.png','CU6015-700','Off-White x Nike Rubber Dunk University Gold','',220,'2020-07-31'),('Air Jordan','1','Low','Jordan 1 Low SE Multi-Color W.png','CZ3572-104','Jordan 1 Low SE Multi-Color (W)','WHITE/BLACK-LIGHTBULB-TEAM ORANGE',100,'2020-04-09'),('Air Jordan','5','','Air Jordan 5 Fire Red.png','DA1911-102','Air Jordan 5 Fire Red','',200,'2020-05-02'),('Adidas','Slide','','Yeezy Slide Desert Sand.png','FW6344','Yeezy Slide Desert Sand','DESERT SAND/DESERT SAND/DESERT SAND',55,'2020-04-16'),('Adidas','Yeezy','Boost V2 350','adidas Yeezy Boost 350 V2 Linen.png','FY5158','Adidas Yeezy Boost 350 V2 Linen','LINEN/LINEN/LINEN',220,'2020-04-18'),('Adidas','Yeezy','Quantum','adidas YZY QNTM Basketball.png','FZ4362','Adidas YZY QNTM Basketball','',250,'2020-05-15'),('New Balance','','992','New Balance 992 Grey.png','M992GR','New Balance 992 Grey','GREY/SILVER',175,'2020-04-18');
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

-- Dump completed on 2020-05-08 10:20:47
