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
  `brand_num` int(11) NOT NULL,
  `country_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_logo` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`brand_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoeinfo_brand`
--

LOCK TABLES `shoeinfo_brand` WRITE;
/*!40000 ALTER TABLE `shoeinfo_brand` DISABLE KEYS */;
INSERT INTO `shoeinfo_brand` VALUES (1,'네덜란드','CALICO JACK.png','CALICO JACK','네덜란드_CALICO JACK'),(2,'노르웨이','STRESS95.png','STRESS95','노르웨이_STRESS95'),(3,'대한민국','ABC GrandStage.png','ABC GrandStage','대한민국_ABC GrandStage'),(4,'대한민국','HOOPCITY.png','HOOOPCITY','대한민국_HOOOPCITY'),(5,'대한민국','JD Sports.png','JD Sports','대한민국_JD Sports'),(6,'대한민국','onthespot.png','onthespot','대한민국_onthespot'),(7,'대한민국','SNKRS.png','SNKRS 코리아','대한민국_SNKRS'),(8,'대한민국','NIKE GANGNAM.png','강남 나이키','대한민국_강남 나이키'),(9,'대한민국','COMME des GARCONS.png','꼼데가르송','대한민국_꼼데가르송'),(10,'대한민국','ADIDAS.png','아디다스 한국','대한민국_아디다스 한국'),(11,'대한민국','atmos.png','아트모스','대한민국_아트모스'),(12,'대한민국','JORDAN SEOUL.png','조던 서울','대한민국_조던 서울'),(13,'대한민국','JORDAN HONGDAE.png','홍대 조던','대한민국_조던 홍대'),(14,'대한민국','kasina.png','카시나','대한민국_카시나'),(15,'대한민국','casestudy.png','케이스스터디','대한민국_케이스스터디'),(16,'대한민국','NIKE TIMES SQUARE.png','타임스퀘어 나이키','대한민국_타임스퀘어 나이키'),(17,'대한민국','SNKRS HONGDAE.png','홍대 SNKRS','대한민국_홍대 SNKRS'),(18,'덴마트','NAKED.png','NAKED','덴마트_NAKED'),(19,'독일','43einhalb.png','43einhalb','독일_43einhalb'),(20,'독일','AFEW.png','AFEW','독일_AFEW'),(21,'독일','BLOWOUT.png','BLOWOUT','독일_BLOWOUT'),(22,'독일','bstn.png','bstn','독일_bstn'),(23,'독일','KICKZ.png','KICKZ','독일_KICKZ'),(24,'독일','ORANGE JUNGLE.png','ORANGE JUNGLE','독일_ORANGE JUNGLE'),(25,'독일','SOLEBOX.png','SOLEBOX','독일_SOLEBOX'),(26,'독일','SOTO.png','SOTO','독일_SOTO'),(27,'독일','VooStore.png','VooStore','독일_VooStore'),(28,'미국','18montrose.png','18montrose','미국_18montrose'),(29,'미국','BAIT.png','BAIT','미국_BAIT'),(30,'미국','Bodega.png','Bodega','미국_Bodega'),(31,'미국','DICKS.png','DICKS','미국_DICKS'),(32,'미국','DTLR.png','DTLR','미국_DTLR'),(33,'미국','Eastbay.png','Eastbay','미국_Eastbay'),(34,'미국','extrabutter.png','extrabutter','미국_extrabutter'),(35,'미국','FEATURES.png','FEATURES','미국_FEATURES'),(36,'미국','finishline.png','FINISHLINE','미국_FINISHLINE'),(37,'미국','Foot Locker.png','Foot Locker','미국_Foot Locker'),(38,'미국','HIBBETT.png','HIBBETT','미국_HIBBETT'),(39,'미국','JD Sports.png','JD Sports','미국_JD Sports'),(40,'미국','ROOTED.png','ROOTED','미국_ROOTED'),(41,'미국','shoepalace.png','ShoePalace','미국_ShoePalace'),(42,'미국','SNKRS.png','SNKRS USA','미국_SNKRS'),(43,'미국','UNDEFEATED.png','UNDEFEATED','미국_UNDEFEATED'),(44,'미국','XHIBITION.png','XHIBITION','미국_XHIBITION'),(45,'미국','yeezysupply.png','YEEZY supply','미국_YEEZY supply'),(46,'미국','ADIDAS.png','아디다스 미국','미국_아디다스 미국'),(47,'스웨덴','SNS.png','SNS','스웨덴_SNS'),(48,'스위스','TITOLO.png','TITOLO','스위스_TITOLO'),(49,'스페인','FOOTDISTRICT.png','FOOTDISTRICT','스페인_FOOTDISTRICT'),(50,'스페인','noirfonce.png','noirfonce','스페인_noirfonce'),(51,'싱가포르','SNKRS.png','SNKRS 싱가포르','싱가포르_SNKRS'),(52,'영국','END.png','END','영국_END'),(53,'영국','flatspot.png','flatspot','영국_flatspot'),(54,'영국','FOOTPATROL.png','FOOTPATROL','영국_FOOTPATROL'),(55,'영국','GOODHOOD.png','GOODHOOD','영국_GOODHOOD'),(56,'영국','HANON.png','HANON','영국_HANON'),(57,'영국','TRES BIEN.png','TRES BIEN','영국_TRES BIEN'),(58,'영국','wellgosh.png','wellgosh','영국_wellgosh'),(59,'이탈리아','AcriminalG.png','AcriminalG','이탈리아_AcriminalG'),(60,'이탈리아','BACKDOOR.png','BACKDOOR','이탈리아_BACKDOOR'),(61,'이탈리아','BLACK BOX.png','BLACK BOX','이탈리아_BLACK BOX'),(62,'이탈리아','ONEBLOCKDOWN.png','ONEBLOCKDOWN','이탈리아_ONEBLOCKDOWN'),(63,'이탈리아','SNEAKERS 76.png','SNEAKERS 76','이탈리아_SNEAKERS 76'),(64,'이탈리아','SOTF.png','SOTF','이탈리아_SOTF'),(65,'일본','mortar.png','MORTAR tokyo','일본_MORTAR tokyo'),(66,'일본','UNDEFEATED.png','UNDEFEATED JP','일본_UNDEFEATED JP'),(67,'일본','atmos.png','아트모스 도쿄','일본_아트모스 도쿄'),(68,'중국','JD Sports.png','JD Sports','중국_JD Sports'),(69,'체코','FOOTSHOP.png','FOOTSHOP','체코_FOOTSHOP'),(70,'캐나다','DEADSTOCK.png','DEADSTOCK','캐나다_DEADSTOCK'),(71,'캐나다','NRML.png','NRML','캐나다_NRML'),(72,'프랑스','basket4ballers.png','basket4ballers','프랑스_basket4ballers'),(73,'프랑스','SHINZO.png','SHINZO','프랑스_SHINZO'),(74,'대한민국','ABC Mart.png','ABC Mart','대한민국_ABC Mart'),(75,'대한민국','MUSINSA.png','MUSINSA','대한민국_MUSINSA');
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
INSERT INTO `shoeinfo_country` VALUES ('아메리카','캐나다','01','캐나다.png'),('아메리카','미국','1','미국.png'),('유럽','네덜란드','31','네덜란드.png'),('유럽','프랑스','33','프랑스.png'),('유럽','스페인','34','스페인.png'),('유럽','이탈리아','39','이탈리아.png'),('유럽','스위스','41','Webp.net-resizeimage.png'),('유럽','체코','420','체코.png'),('유럽','영국','44','영국.png'),('유럽','덴마트','45','덴마크.png'),('유럽','스웨덴','46','스웨덴.png'),('유럽','노르웨이','47','노르웨이.png'),('유럽','독일','49','독일.png'),('기타','호주','61','호주.png'),('기타','뉴질랜드','64','뉴질랜드.png'),('아시아','싱가포르','65','싱가포르.png'),('아시아','일본','81','일본.png'),('아시아','대한민국','82','대한민국.png'),('아시아','중국','86','중국.png');
/*!40000 ALTER TABLE `shoeinfo_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoeinfo_member`
--

DROP TABLE IF EXISTS `shoeinfo_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoeinfo_member` (
  `count` int(11) DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `position` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoeinfo_member`
--

LOCK TABLES `shoeinfo_member` WRITE;
/*!40000 ALTER TABLE `shoeinfo_member` DISABLE KEYS */;
INSERT INTO `shoeinfo_member` VALUES (1,'coduo25@gmail.com','qwer1234','박정훈','01062419520','2020-07-02','user'),(2,'shoeinfoshoeinfo@gmail.com','1234','SHOEInfo','01062419520','2020-03-31','admin');
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
  `member_email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
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
INSERT INTO `shoeinfo_memberdrawinfo` VALUES (1,'coduo25@gmail.com','555088-126','이탈리아','이탈리아_ONEBLOCKDOWN',1),(2,'coduo25@gmail.com','555088-126','대한민국','대한민국_SNKRS',2),(3,'coduo25@gmail.com','555088-126','미국','미국_snkrs',3),(4,'coduo25@gmail.com','555088-126','체코','체코_FOOTSHOP',4),(5,'coduo25@gmail.com','555088-126','독일','독일_43einhalb',5),(6,'coduo25@gmail.com','555088-126','캐나다','캐나다_DEADSTOCK',6),(7,'coduo25@gmail.com','555088-126','미국','미국_extrabutter',7),(8,'coduo25@gmail.com','555088-126','영국','영국_FOOTPATROL',8);
/*!40000 ALTER TABLE `shoeinfo_memberdrawinfo` ENABLE KEYS */;
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
  `online_start_date` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `online_start_time` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `online_end_date` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
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
INSERT INTO `shoeinfo_onlineinfo` VALUES (1,'555088-126','아시아','대한민국','대한민국_SNKRS','https://www.nike.com/kr/launch/t/men/fw/basketball/555088-126/ejab48/air-jordan-1-retro-high-og','2020-07-03','10:00','2020-07-03','11:00','드로우','당첨 후 결제','국내배송',''),(2,'CV9499-100','아시아','대한민국','대한민국_SNKRS','https://www.nike.com/kr/launch/t/adult-unisex/fw/action-outdoor/CV9499-100/ybmh84/nike-sb-dunk-high-pro','2020-07-04','10:00','','','선착','선착순 구매','국내배송',''),(3,'414962-105','아시아','대한민국','대한민국_onthespot','https://www.onthespot.co.kr/product?prdtNo=2010078483','2020-07-03','10:00','','','선착','선착순 구매','국내배송',''),(4,'575441-126','아시아','대한민국','대한민국_SNKRS','https://www.nike.com/kr/launch/t/junior/fw/basketball/575441-126/cytp20/air-jordan-1-retro-high-og-gs','2020-07-07','10:00','','','선착','선착순 구매','국내배송',''),(5,'414962-105','아시아','대한민국','대한민국_아트모스','https://www.instagram.com/p/CCLerAKpMH5/?utm_source=ig_web_button_share_sheet','2020-07-04','','','','선착','선착순 구매','국내배송',''),(6,'555088-126','유럽','이탈리아','이탈리아_ONEBLOCKDOWN','https://row.oneblockdown.it/products/1-retro-high-og-light-smoke-grey','','','2020-07-11','16:00','드로우','당첨 후 결제','직배가능',''),(8,'555088-126','유럽','독일','독일_43einhalb','https://www.43einhalb.com/en/nike-air-jordan-1-retro-high-og-light-smoke-grey-412060?__cf_chl_captcha_tk__=6e802ce52f936d5ee088b88c99b77e7f54444061-1593921619-0-AUCTROwGLvP0iZBjwzq7fucRXtvhr0w8BIDxvQwSDpOVXZtd7eH2wwTI3k3JbB2OwW5-wOin-z4IJorJlCKjh3J9xL6WqEV1Kgb8rzAFp1-ZmRQN53SselIRB6oTVS0fgHOpEhKkZeoWkB2kV9cO-_bty-fMgPkxafnZwM7hKCufPVHm2HZbL7nELG33MEDRceGOJ3GDELg3ahJg0NsWpB02eAzfpdI6CJVODU3a6lfJnuRnEgp3cvc0rOSCOGUuXsx_RvKNFkNIbfu51zoRpIjOa5PJyg5k_wa8GGHpr_lY5ZtDuou30ts7OYMf8bCIhJOCmTwt18XFxDkKLdZ_9-972PG5sobcVsVENX_aWLoqQDue4Gk1_JHOZ37GB9607egT6uqgPSuzTgqr1-KXpJiLVqXH-jYNNPjx0Nas_nMzEU2Yv7bC_VGeUXQkb-JpNyrYbdg1tVTCNVyP_WHeHjDWZDY2gtdnAZRfd1nCgrbo5J8_iYi63OeXrQ_J0tFqX3Wmp7N8n2KCVyhJw05ulAW8XDgRnAuUxsF6W1u_k9gAff-ZMk0azwQPRs9g-xXZIwmhgOeIZbVmEFW-dwy1xrcHzseL0J6AhGKHqqS6XDt6KOa-lS8jQgGKpFDT8GH6jw','','','2020-07-10','19:00','드로우','당첨 후 결제','직배가능',''),(9,'575441-126','유럽','영국','영국_END','https://launches.endclothing.com/product/air-jordan-1-retro-high-og-gs-575441-126','','','2020-07-11','08:00','드로우','당첨 후 결제','직배가능',''),(10,'555088-126','아시아','싱가포르','싱가포르_SNKRS','https://www.nike.com/sg/launch/t/air-jordan-1-smoke-grey','2020-07-11','11:00','','','선착','선착순 구매','배대지',''),(11,'555088-126','아메리카','미국','미국_SNKRS','https://www.nike.com/launch/t/air-jordan-1-smoke-grey','2020-07-11','23:00','2020-07-11','23:30','드로우','당첨 후 결제','배대지',''),(12,'BQ6817-008','유럽','이탈리아','이탈리아_AcriminalG','https://docs.google.com/forms/d/e/1FAIpQLScSTNJhiwPYmdvOyxUs6ReV_vccJrJrQaBdUMuIJwn1O-3MSg/viewform','','','2020-07-07','01:00','드로우','당첨 후 결제','배대지',''),(13,'BQ6817-008','유럽','독일','독일_BLOWOUT','https://www.blowoutshop.de/raffle','','','2020-07-10','07:00','드로우','당첨 후 결제','배대지',''),(14,'BQ6817-008','유럽','독일','독일_ORANGE JUNGLE','https://www.instagram.com/p/CCN8AyioYXr/?utm_source=ig_web_button_share_sheet','','','2020-07-08','23:00','드로우','당첨 후 결제','배대지',''),(15,'555088-126','아메리카','미국','미국_HIBBETT','https://www.hibbett.com/jordan-1-retro-high-og-white-black-light-smoke-grey-mens-shoe/Q0936.html','2020-07-11','23:00','','','선착','선착순 구매','배대지',''),(16,'555088-126','유럽','영국','영국_wellgosh','https://launches.wellgosh.com/nike-air-jordan-1-retro-high-og-light-smoke-555088-126.html','','','2020-07-10','16:00','드로우','당첨 후 결제','직배가능',''),(17,'555088-126','유럽','영국','영국_HANON','https://launches.hanon-shop.com/collections/launch/products/nike-air-jordan-1-retro-high-og-bloodline-555088126','','','2020-07-10','21:00','드로우','당첨전 선결제','직배가능',''),(19,'555088-126','아메리카','미국','미국_DTLR','https://blog.dtlr.com/raffles/air-jordan-1-smoke-grey/?__cf_chl_captcha_tk__=378e9e132e494f8999b4532dbed6a7cb5ec2ab27-1594300774-0-Aa3-4bj6XLUVC3ptkInpfbU7QYE5SyShn1gs8VZvw1gHa4CshsnxP7zCHzn8jCUu4DfYZzwIc6JrZD5h4InFpxqDkNEl_apcisBOfpP_tuVbQifvY0wEoD5YDgUFyG30EJbFjSqf-33K-w8yUkmHFJ5yXdV9gX6Ff2M5Ni03eeNxdklynJhCEEPQ6hOGq2G9HGSGh9K-KkJEDtLf14VpoY8zwWjBhZ_K1EJokabKGwGpgw8W2Dmz6GD8JYNTqrkF8uxU9ASJhI69q-wbaLmZa0aqwVwwfRqO9fxxZUNj25kG66HIqrXlr9e8Cub_v-Bm5BSERvRkYgLpJYS-jSiVhp-aXf-Wf7ZYpZZl7C6hrzgVilnnudZjErOR_0U_gLCXF5b1Ja3wZB5tIaGryOOpfG_WttGzTf_iM-snampxNf9swMMwmc72VMtWphcZBI4pZHdyBtrSX0AtmHgQ2GcKNI0LpAEBeCyWNvoyIx3sRF03mt5UIHf1SqPvO8_YkU25iVnvrBkjpGMft3xIIwcJXGI','','','2020-07-11','01:00','드로우','당첨 후 결제','배대지',''),(20,'555088-126','아메리카','미국','미국_Eastbay','https://www.eastbay.com/release-dates.html','2020-07-11','23:00','','','선착','선착순 구매','배대지',''),(21,'555088-126','아메리카','미국','미국_Foot Locker','https://www.footlocker.com/release-dates?','2020-07-11','23:00','','','선착','선착순 구매','배대지',''),(23,'BQ6817-008','유럽','영국','영국_HANON','https://launches.hanon-shop.com/products/nike-sb-dunk-low-pro-bq6817008','','','2020-07-10','07:00','드로우','당첨전 선결제','배대지',''),(24,'FY3729','아메리카','미국','미국_아디다스 미국','https://www.adidas.com/us/yeezy','2020-07-11','23:00','','','선착','선착순 구매','배대지',''),(25,'555088-126','유럽','스웨덴','스웨덴_SNS','https://www.sneakersnstuff.com/en/product/42061/jordan-brand-air-jordan-1-retro-high-og','','','2020-07-10','17:00','드로우','당첨 후 결제','배대지',''),(26,'555088-126','유럽','체코','체코_FOOTSHOP','https://releases.footshop.com/air-jordan-1-retro-high-og-H3wsEHMB6mPPl2nF7YDA','','','2020-07-11','07:00','드로우','당첨 후 결제','배대지',''),(27,'FY3729','아메리카','미국','미국_YEEZY supply','https://www.yeezysupply.com/product/FY3729','2020-07-11','22:00','','','선착','선착순 구매','배대지',''),(28,'CZ4776-107','아시아','대한민국','대한민국_HOOOPCITY','https://www.hoopcity.co.kr/goods/goods_view.php?goodsNo=1000001430','2020-07-07','10:00','','','선착','선착순 구매','국내배송',''),(29,'555088-126','아메리카','미국','미국_FEATURES','https://feature.com/products/air-jordan-1-retro-high-og-light-smoke-grey-white-black','','','2020-07-11','10:00','드로우','당첨 후 결제','배대지',''),(30,'BQ6817-008','유럽','영국','영국_wellgosh','https://launches.wellgosh.com/nike-sb-dunk-low-pro-acg-terra-bq6817-008.html','','','2020-07-07','16:00','드로우','당첨 후 결제','직배가능',''),(31,'555088-126','유럽','독일','독일_AFEW','https://de.afew-store.com/collections/sneaker-releases/products/air-jordan-1-retro-high-og-white-black-lt-smoke-grey-varsity-red/#in','','','2020-07-11','09:00','드로우','당첨전 선결제','직배가능',''),(32,'555088-126','아메리카','미국','미국_extrabutter','https://www.instagram.com/p/CCZi2LJDDEz/?utm_source=ig_web_copy_link','','','2020-07-11','03:00','드로우','당첨 후 결제','배대지',''),(33,'852542-100','아시아','일본','일본_UNDEFEATED JP','https://undefeated.jp/blog/launch/','2020-07-18','09:00','','','선착','선착순 구매','배대지',''),(34,'555088-126','아메리카','캐나다','캐나다_DEADSTOCK','https://www.deadstock.ca/pages/raffle?utm_source=Livestock+Canada+Email+List&utm_campaign=bd3bc61550-EMAIL_CAMPAIGN_2020_07_06_09_28_COPY_02&utm_medium=email&utm_term=0_e2df5ed68f-bd3bc61550-43863301&goal=0_e2df5ed68f-bd3bc61550-43863301&mc_cid=bd3bc61550&mc_eid=5c25442480','','','2020-07-10','16:00','드로우','당첨 후 결제','배대지',''),(35,'555088-126','유럽','프랑스','프랑스_SHINZO','https://raffle.shinzo.paris/air-jordan-1-retro-high-og-light-smoke-grey/','','','2020-07-10','13:00','드로우','당첨 후 결제','직배가능',''),(36,'555088-126','유럽','영국','영국_FOOTPATROL','https://raffles.footpatrol.com/air-jordan-1-high-og-light-smoke-grey--8nexi1w9-406','','','2020-07-08','16:00','드로우','당첨 후 결제','배대지',''),(37,'555088-126','유럽','노르웨이','노르웨이_STRESS95','https://stress95.typeform.com/to/Bm2ZuK0m','','','2020-07-10','06:00','드로우','당첨 후 결제','직배가능',''),(38,'555088-126','유럽','독일','독일_KICKZ','https://www.kickz.com/de/support/static/AJ1-Smoke-Grey-Raffle','','','2020-07-10','18:59','드로우','당첨 후 결제','배대지',''),(39,'555088-126','유럽','프랑스','프랑스_basket4ballers','https://www.basket4ballers.com/fr/jordan-sportswear/22975-air-jordan-1-retro-high-og-white-black-lt-smoke-grey-varsity-red-555088-126.html','','','2020-07-10','23:00','드로우','당첨 후 결제','배대지',''),(40,'555088-126','유럽','이탈리아','이탈리아_SNEAKERS 76','https://www.sneakers76.com/it/content/22-air-jordan-1-retro-high-og-light-smoke-grey-?utm_source=shoeprize&__cf_chl_jschl_tk__=8579ebe1abb40fbe20d6f2014998fdc846e81288-1594195880-0-AaDeFVgYSjaRD0I_sK5f3qm2rx81qaxvQbOcDCPpcftmw-AwMfi9gxcpzdg51CAclE41ZWzNgYVed-a5BtrpgekPAmUvUt4SMiAHUYCAjRNSFn2iHszeKM1TJNnE5UfBGR-0yjy9CNcKgAu8PlVQf0HbYCRDMKFw_M4IX93TdXHtj9Rqd7N0vh8t0V19azb13HNahkzh6sL6pyWGQ5kgd61QoQnE7FqJ-hOTrsxAHKf9vHBjGpjchqnkxbXm9a21wnlUJW4b7pkJtL7Oyp-lYzbhiK0sJqEerfVgL0b-4kGM1FnnqS9lqkX8hEfDMSNn-6mzYRYkWOgtLc2xg8pi-DOFP_0-1301GGg_gwQUeiKFJOfKjGVIhCKy6Ln7JRMnYQ','','','2020-07-12','03:00','드로우','당첨 후 결제','직배가능',''),(41,'414962-105','아시아','대한민국','대한민국_카시나','https://www.kasina.co.kr/goods/goods_view.php?goodsNo=1242664177&mtn=7%5E%7C%5ENEW%5E%7C%5En','2020-07-09','','','','선착','선착순 구매','국내배송',''),(42,'553558-124','아시아','대한민국','대한민국_SNKRS','https://www.nike.com/kr/ko_kr/t/men/fw/basketball/553558-124/fzlp91/air-jordan-1-low','2020-07-09','','','','선착','선착순 구매','국내배송',''),(43,'CD0461-601','아메리카','미국','미국_HIBBETT','https://www.hibbett.com/jordan-1-high-og-satin-snake-womens-shoe/Q0997.html','2020-08-06','23:00','','','선착','선착순 구매','배대지',''),(44,'852542-104','아메리카','미국','미국_FINISHLINE','https://www.finishline.com/store/product/mens-air-jordan-retro-1-mid-se-casual-shoes/prod1360415?styleId=852542&colorId=104#','2020-07-10','','','','선착','선착순 구매','배대지',''),(45,'FY3729','아메리카','미국','미국_Bodega','https://bdgastore.com/blogs/upcoming-releases/7-11-20-adidas-yeezy-700-mnvn','2020-07-09','23:00','2020-07-10','06:00','드로우','당첨 후 결제','직배가능',''),(46,'852542-104','아메리카','미국','미국_HIBBETT','https://www.hibbett.com/jordan-1-mid-se-white-university-red-midnight-navy-gold-mens-shoe/Q0959.html?dwvar_Q0959_color=1465&cgid=sneakers-jordan-airjordan1#start=1&sz=24','2020-07-10','','','','선착','선착순 구매','배대지',''),(47,'CD0461-601','아시아','대한민국','대한민국_JD Sports','test','','','2020-07-11','18:00','드로우','당첨 후 결제','직배가능',''),(48,'CP9654','아시아','대한민국','대한민국_HOOOPCITY','TEST','2020-07-11','','','','선착','선착순 구매','국내배송',''),(49,'555088-126','아메리카','미국','미국_BAIT','http://www.baitme.com/air-jordan-1-smoke-grey','','','2020-07-10','16:00','드로우','당첨 후 결제','배대지',''),(50,'555088-126','유럽','이탈리아','이탈리아_BACKDOOR','https://back-door.it/jordan-air-jordan-1-retro-high-og-lt-smoke-grey-555088-126/','','','2020-07-11','16:00','드로우','당첨 후 결제','직배가능',''),(51,'555088-126','유럽','이탈리아','이탈리아_SOTF','https://www.sotf.com/en/raffle_online_form.php','','','2020-07-11','20:00','드로우','당첨 후 결제','직배가능',''),(52,'555088-126','유럽','스페인','스페인_FOOTDISTRICT','https://footdistrict.typeform.com/to/JCm1Ex7b','','','2020-07-11','00:00','드로우','당첨 후 결제','배대지',''),(53,'FZ1267','아메리카','미국','미국_아디다스 미국','https://www.adidas.com/us/FZ1267.html?pid=App%20Share%20PDP','','','2020-07-19','07:30','드로우','당첨 후 결제','배대지',''),(54,'FZ1267','아메리카','미국','미국_DICKS','https://www.dickssportinggoods.com/s/launch-details','','','2020-07-18','23:00','드로우','당첨 후 결제','배대지',''),(55,'FZ1267','아메리카','미국','미국_Eastbay','https://www.eastbay.com/release-dates.html','','','2020-07-18','23:00','드로우','당첨 후 결제','배대지',''),(56,'FZ1267','유럽','이탈리아','이탈리아_BLACK BOX','https://drops.blackboxstore.com/it/drop/yeezy-boost-350-v2-zyon/?utm_source=shoeprize','','','2020-07-18','10:00','드로우','당첨 후 결제','배대지',''),(57,'FZ1267','유럽','노르웨이','노르웨이_STRESS95','https://stress95.typeform.com/to/byOUEYV4','','','2020-07-18','00:00','드로우','당첨자간 선착순','직배가능',''),(58,'FZ1267','유럽','네덜란드','네덜란드_CALICO JACK','https://docs.google.com/forms/d/e/1FAIpQLSe3Bhtx6C6moO813bq89OcIUEEmL1svS7ichHui7naD7gKk8A/viewform','','','2020-07-16','17:00','드로우','당첨 후 결제','직배가능',''),(59,'FZ1267','유럽','독일','독일_bstn','https://raffle.bstn.com/yeezy-boost-350-v2-zyon-?__cf_chl_captcha_tk__=505c55a1a33497822e66eac0357a5632f45f3459-1594655668-0-AfpJ0hj-oD0dkMa8paB1y3NoN4tcm9AtIcSyk-GRuCYHd_M6e-fLTRoDygnBy5KzBwLgE_PQC2PpV8rWjCfqAGXykzpm2cTkiKaN9Vv3uBfAUiD4j-BbK5HWGnR4Ae47HHCFOv3ChsJXtRJWqW7PGaaGkyehA0lwn_PfbQIeHdUI-kPS9bSrAftikvwsQIfe_jAoClGAQOCEw7fsx5mCcsdiFMN4PkBokPuPb2s72KU-eDhNP0AyQ_uvbXvA5HsNojVLVdlYN6i0-bng3mK-m3b7FJZDsjHxQbxfTclYPaseNBx-2rzj4PH46NRHbqQEw6FbmKBe0-j7D-mZYMoBwoQbzRHSEnrrfVx70bPo11kmEGAeYdTkDpgU0GZW9f6fqkoQqckQytvzd1w73-vbLz9dsQUnvDPrSzEH1eStDo6KsqSJSHSqFM42ZRc0M4SEdsYR5hJk-XK39g8FG6oye8f_wW22h-LutR65g91I9lEGTOHfC_qfGd7X-atY8NpfXHyoTAlZDOdBTjC7Hz--H5o','','','2020-07-17','22:00','드로우','당첨 후 결제','배대지',''),(60,'FZ1267','아메리카','미국','미국_YEEZY supply','https://www.yeezysupply.com/product/FZ1267','2020-07-18','23:00','','','선착','선착순 구매','배대지',''),(61,'FZ1267','유럽','이탈리아','이탈리아_ONEBLOCKDOWN','https://row.oneblockdown.it/products/yeezy-boost-350-v2-zyon','','','2020-07-18','15:00','드로우','당첨 후 결제','직배가능',''),(62,'FZ1267','유럽','영국','영국_GOODHOOD','https://launches.goodhoodstore.com/launches/yeezy-boost-350-v2-zyon-392','','','2020-07-18','00:00','드로우','당첨 후 결제','직배가능',''),(63,'FZ1267','유럽','독일','독일_43einhalb','https://www.43einhalb.com/en/adidas-yeezy-boost-350-v2-zyon-436916?wgu=10253_173889_15946603902151_a43d2dcd07&wgexpiry=1602436390&p=wbgns&siteid=173889&__cf_chl_captcha_tk__=17937cc103413ea1b65e8f97dfaa1faa21df2a92-1594660393-0-AUNX0KdEOt1LIY2kkMtfhKz02PMm7kUD4n3ixgwdUty9wo8GlhxjJY6wz6-Q8IKO4ea5hhfcn8bm-9Q2VsG_PeF29D5CvJNchVGXAt-okUYoRwSBbWhw0MwKDDcVkdnhopd545U7ygBw0IExiqb76MzSr8mB6cQqzmUZxnKV0CoTCp9KUIqx4ZqSih49NxSNDWYiYh-MOwT_eCve184fr9Mw1nsQ7ArPN7vl2jwaNFPYy4wbWRzn449uO85qhK14TD-FfKFLXM1qy8hcFmJdUzcK6r_GXjIEeSQYV-52B760BdFvX86gWJDymNqNc4AL9rBU2lgFtirsHI5vF5Gd1E0JRx5FeJDeRLkqxtjccZ8bMlvoaBKzy5f86dplgxjTZVrnE8PrOp-DxQeJM68lG_mXWucjJcTeTuDzOe-G4HXmkJE_W7EViLUkPPfnLUi7q7eXdMeFYD-jtQOgGHatJlaX7oTId4JRsNQe211NuN9slXqlreJfz9oB6j7SEpvo3KiMbM4eyLkH9cfXWO1-mOH9ZOpowtnDV2etN5mslnUXeaXJ-0DoRXPkRY8OUXsAFHyGlyx_FS9hiosZXuvYLrdBXuJj-I8e_d812gejbE88zv-zcoboevKfFDZlDrj6RIfuRLbKgcf-0PsVoJGW1qc0TBxMQ2t1Ov4i_3EVrQ5cLTk6_0YxejdLxjAEhWS1WIxtZk4lzHyFo5hdniAEnxQ','','','2020-07-18','18:00','드로우','당첨 후 결제','배대지',''),(64,'FZ1267','유럽','스위스','스위스_TITOLO','https://en.titolo.ch/yeezy-boost-350-v2-fz1267','2020-07-17','15:00','','','선착','선착순 구매','직배가능',''),(65,'FZ1267','유럽','독일','독일_SOLEBOX','https://www.solebox.com/en_US/c/soon','','','','','-','-','직배가능',''),(66,'414962-105','아시아','대한민국','대한민국_ABC GrandStage','https://grandstage.a-rt.com/product/new?prdtNo=1020078483#productInfo','2020-07-03','','','','선착','선착순 구매','국내배송',''),(67,'FZ1267','아시아','대한민국','대한민국_아디다스 한국','https://shop.adidas.co.kr/PF020401.action?PROD_CD=FZ1267','2020-07-18','08:00','','','선착','선착순 구매','국내배송',''),(68,'FZ1267','아시아','대한민국','대한민국_onthespot','https://www.onthespot.co.kr/?track=W0002','2020-07-18','08:00','','','선착','선착순 구매','국내배송',''),(69,'FZ1267','아시아','대한민국','대한민국_JD Sports','https://www.jdsports.co.kr/front/launches_detail.php?no=39','2020-07-18','08:00','','','선착','선착순 구매','국내배송',''),(70,'FZ1267','유럽','독일','독일_AFEW','https://de.afew-store.com/products/adidas-originals-yeezy-boost-350-v2-zyon-zyon-zyon','','','2020-07-18','15:00','드로우','당첨 후 결제','직배가능',''),(71,'FZ1267','아메리카','미국','미국_ROOTED','https://stay-rooted.com/products/adidas-yeezy-boost-350-v2-zyon-fz1267','','','2020-07-17','14:00','드로우','당첨 후 결제','직배가능',''),(72,'FZ1267','유럽','영국','영국_wellgosh','https://launches.wellgosh.com/adidas-yeezy-boost-350-v2-zyon-fz1267.html','','','2020-07-17','15:00','드로우','당첨 후 결제','직배가능',''),(73,'CV9388-100','아시아','대한민국','대한민국_SNKRS','https://www.nike.com/kr/launch/t/women/fw/basketball/CV9388-100/uztg16/wmns-air-jordan-4-retro-sp','2020-07-25','10:00','2020-07-25','11:00','드로우','당첨 후 결제','국내배송',''),(74,'CV9388-100','아메리카','미국','미국_SNKRS','https://www.nike.com/launch/t/air-jordan-4-off-white-sail','2020-07-25','23:00','2020-07-25','23:30','드로우','당첨 후 결제','배대지',''),(75,'FZ1267','아시아','대한민국','대한민국_카시나','https://www.kasina.co.kr/main/html.php?htmid=proc/datedrop.html','2020-07-18','08:00','','','선착','선착순 구매','국내배송',''),(76,'FZ1267','아시아','대한민국','대한민국_아트모스','http://www.atmos-seoul.com/shop/shopbrand.html?xcode=003&type=N&mcode=001&gf_ref=Yz12UEthNk0=','2020-07-18','','','','선착','선착순 구매','국내배송',''),(77,'FZ1267','아시아','대한민국','대한민국_ABC Mart','https://www.a-rt.com/?utm_source=luck-d','2020-07-18','08:00','','','선착','선착순 구매','국내배송',''),(78,'FZ1267','아시아','대한민국','대한민국_MUSINSA','https://store.musinsa.com/app/','2020-07-16','16:00','2020-07-18','06:00','드로우','당첨 후 결제','국내배송',''),(79,'CZ4776-107','아시아','대한민국','대한민국_ABC GrandStage','https://grandstage.a-rt.com/product/new?prdtNo=1020078196','2020-07-15','10:00','','','선착','선착순 구매','국내배송',''),(80,'CJ5378-700','아메리카','미국','미국_SNKRS','https://www.nike.com/launch/t/sb-dunk-low-pro-grateful-dead-opti-yellow?cp=usns_aff_nike_content','2020-07-24','23:00','2020-07-24','23:30','드로우','당첨 후 결제','배대지',''),(81,'CJ5378-700','아시아','대한민국','대한민국_SNKRS','https://www.nike.com/kr/launch/t/adult-unisex/fw/action-outdoor/CJ5378-700/jgnr47/nike-sb-dunk-low-pro-qs','2020-07-24','11:00','2020-07-24','12:00','드로우','당첨 후 결제','국내배송','');
/*!40000 ALTER TABLE `shoeinfo_onlineinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoeinfo_sneakerlibrary`
--

DROP TABLE IF EXISTS `shoeinfo_sneakerlibrary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoeinfo_sneakerlibrary` (
  `num` int(11) NOT NULL,
  `brand` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_brand` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_index` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_thumb` text COLLATE utf8_unicode_ci,
  `image` text COLLATE utf8_unicode_ci,
  `model_stylecode` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` text COLLATE utf8_unicode_ci,
  `model_colorway` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `release_date` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `release_status` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoeinfo_sneakerlibrary`
--

LOCK TABLES `shoeinfo_sneakerlibrary` WRITE;
/*!40000 ALTER TABLE `shoeinfo_sneakerlibrary` DISABLE KEYS */;
INSERT INTO `shoeinfo_sneakerlibrary` VALUES (1,'Adidas','Yeezy','Boost 350 V2','adidas Yeezy Boost 350 V2 Zebra thumb.png','adidas Yeezy Boost 350 V2 Zebra.png','CP9654','Adidas Yeezy Boost 350 Zebra','WHITE/CORE BLACK/RED',289000,'2020-06-26','planned'),(2,'Air Jordan','1','','Jordan 1 Retro High Light Smoke Grey thumb.png','Jordan 1 Retro High Light Smoke Grey.png','555088-126','Air Jordan 1 Retro High Smoke Grey','White/Black-Light Smoke Grey-Varsity Red',199000,'2020-07-11','planned'),(3,'Air Jordan','11','Low','Jordan 11 Retro Low Concord Bred thumb.png','Jordan 11 Retro Low Concord Bred.png','AV2187-160','Air Jordan 11 Low Concord Bred','White/University Red-Black-True Red',219000,'2020-06-06','planned'),(4,'Air Jordan','1','','Jordan 1 Retro High Tie Dye W thumb.png','Jordan 1 Retro High Tie Dye W.png','CD0461-100','Air Jordan 1 Retro High Tie Dye (W)','White/Black/Aurora Green',189000,'2020-06-04','planned'),(5,'Nike','Dunk SB','High','NIKE SB DUNK HIGH TEAM CRIMSON thumb.png','NIKE SB DUNK HIGH TEAM CRIMSON.png','CV9499-100','Nike SB Dunk High Team Crimson','Sail/Wheat-Sail-Team Crimson',129000,'2020-07-04','planned'),(6,'Air Jordan','4','Off-White x','OFF-WHITE X AIR JORDAN 4 SP WMNS thumb.png','OFF-WHITE X AIR JORDAN 4 SP WMNS.png','CV9388-100','Off-White x Air Jordan 4 SP WMNS','Sail/Muslin-White-Black',0,'2020-07-25','planned'),(7,'Air Jordan','1','','AIR JORDAN 1 HIGH OG WMNS SATIN SNAKE thumb.png','AIR JORDAN 1 HIGH OG WMNS SATIN SNAKE.png','CD0461-601','Air Jordan 1 High OG WMNS Satin Snake','Gym Red/White-Black',0,'2020-08-15','planned'),(8,'Nike','Air More','','Nike Air More Uptempo Scottie Pippen thumb.png','Nike Air More Uptempo Scottie Pippen.png','414962-105','Nike Air More Uptempo Scottie Pippen','WHITE/BLACK-UNIVERSITY RED RETAIL PRICE $160',189000,'2020-07-03','planned'),(9,'Air Jordan','1','','Jordan 1 Retro High Light Smoke Grey GS thumb.png','Jordan 1 Retro High Light Smoke Grey GS.png','575441-126','Jordan 1 Retro High Light Smoke Grey (GS)','WHITE/BLACK-LIGHT SMOKE GREY-VARSITY RED',139000,'2020-07-07','planned'),(10,'Nike','Dunk SB','Low','Nike SB Dunk Low ACG thumb.png','Nike SB Dunk Low ACG.png','BQ6817-008','NIKE SB DUNK LOW ACG TERRA','BLACK/PURPLE-ORANGE-UNIVERSITY GOLD',0,'2020-07-99','planned'),(11,'Air Jordan','1','Mid','Air Jordan 1 Mid SE thumb.png','Air Jordan 1 Mid SE.png','852542-100','Air Jordan 1 Mid SE Union Black Toe','WHITE/BLACK-LIGHT SMOKE GREY-GYM RED',0,'2020-07-99','planned'),(12,'Air Jordan','1','Mid','Air Jordan 1 Mid SE USA thumb.png','Air Jordan 1 Mid SE USA.png','852542-104','Air Jordan 1 Mid SE “USA”','White/University Red',0,'2020-07-99','planned'),(13,'Air Jordan','1','Low','Air Jordan 1 Low WMNS Laser Orange thumb.png','Air Jordan 1 Low WMNS Laser Orange.png','CZ4776-107','Air Jordan 1 Low WMNS Laser Orange','White/Laser Orange-Black',139000,'2020-07-99','planned'),(14,'Adidas','Yeezy','Boost 700','adidas Yeezy Boost 700 MNVN Bone thumb.png','adidas Yeezy Boost 700 MNVN Bone.png','FY3729','adidas Yeezy Boost 700 MNVN Bone','Bone/Bone-Bone',299000,'2020-07-11','planned'),(15,'Air Jordan','1','Low','Air Jordan 1 Low Game Royal thumb.png','Air Jordan 1 Low Game Royal.png','553558-124','Air Jordan 1 Low Game Royal','White/Game Royal-Black',139000,'2020-07-99','planned'),(16,'Adidas','Yeezy','Boost 350 V2','adidas Yeezy Boost 350 V2 Zyon thumb.png','adidas Yeezy Boost 350 V2 Zyon.png','FZ1267','adidas Yeezy Boost 350 V2 Zyon','Zyon/Zyon-Zyon',289000,'2020-07-18','planned'),(17,'Nike','Dunk SB','Low','Nike SB Dunk Low Grateful Dead Bears Yellow thumb.png','Nike SB Dunk Low Grateful Dead Bears Yellow.png','CJ5378-700','Nike SB Dunk Low Grateful Dead Bears Yellow','YELLOW/ELECTRIC GREEN-BLACK-GUM MEDIUM BROWN',0,'2020-07-24','planned'),(18,'Nike','Dunk SB','Low','Grateful Dead x Nike SB Dunk Low Green Bear thumb.png','Grateful Dead x Nike SB Dunk Low Green Bear.png','CJ5378-300','Nike SB Dunk Low Grateful Dead Bears Green','ELECTRIC GREEN/GAME ROYAL-BLACK',0,'2020-07-24','planned');
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

-- Dump completed on 2020-07-17 14:50:12
