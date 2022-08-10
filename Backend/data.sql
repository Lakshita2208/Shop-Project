-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` bigint DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `coupon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_email_fkey_idx` (`user_email`),
  CONSTRAINT `user_email_fkey` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_main`
--

DROP TABLE IF EXISTS `order_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_main` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `buyer_address` varchar(255) DEFAULT NULL,
  `buyer_email` varchar(255) DEFAULT NULL,
  `buyer_name` varchar(255) DEFAULT NULL,
  `buyer_phone` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `order_amount` decimal(19,2) NOT NULL,
  `order_status` int NOT NULL DEFAULT '0',
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_main`
--

LOCK TABLES `order_main` WRITE;
/*!40000 ALTER TABLE `order_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `category_type` int DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uk_6kq6iveuim6wd90cxo5bksumw` (`category_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2147483645 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (2147483641,'Wardrobe And Table Set',0,'2022-06-23 17:33:26','2022-06-23 17:33:26'),(2147483642,'Camelback Sofa',1,'2022-06-23 17:33:26','2022-06-23 17:33:26'),(2147483643,'Poly Foam Mattresses',2,'2022-06-23 17:33:26','2022-06-23 17:33:26'),(2147483644,'Bookshelf',3,'2022-06-23 17:33:26','2022-06-23 17:33:26');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_in_order`
--

DROP TABLE IF EXISTS `product_in_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_in_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_type` int NOT NULL,
  `count` int DEFAULT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_icon` varchar(255) DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` decimal(19,2) NOT NULL,
  `product_stock` int DEFAULT NULL,
  `cart_user_id` bigint DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkt0sfj3ffasrift1c4lv3ra85e` (`order_id`),
  KEY `product_cart_fkey` (`cart_user_id`),
  CONSTRAINT `fkt0sfj3ffasrift1c4lv3ra85e` FOREIGN KEY (`order_id`) REFERENCES `order_main` (`order_id`),
  CONSTRAINT `product_cart_fkey` FOREIGN KEY (`cart_user_id`) REFERENCES `cart` (`user_id`),
  CONSTRAINT `product_in_order_count_check` CHECK ((`count` >= 1)),
  CONSTRAINT `product_in_order_product_stock_check` CHECK ((`product_stock` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_in_order`
--

LOCK TABLES `product_in_order` WRITE;
/*!40000 ALTER TABLE `product_in_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_in_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_info`
--

DROP TABLE IF EXISTS `product_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_info` (
  `product_id` varchar(255) NOT NULL,
  `category_type` int DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL,
  `product_description` varchar(255) DEFAULT NULL,
  `product_icon` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(19,2) NOT NULL,
  `product_status` int DEFAULT '0',
  `product_stock` int NOT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  CONSTRAINT `product_info_product_stock_check` CHECK ((`product_stock` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_info`
--

LOCK TABLES `product_info` WRITE;
/*!40000 ALTER TABLE `product_info` DISABLE KEYS */;
INSERT INTO `product_info` VALUES ('AF001',1,'2022-06-23 17:33:26','zdfhtrghsrtyj','https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_960_720.jpg','dcbzdfhfghj',111111.00,0,24,'2022-08-08 16:49:32'),('AF002',1,'2022-06-23 17:33:26','The Primary material is the main material used to manufacture the product and in addition to the primary material there might also be other type of materials used in the manufacturing of the product','https://secureservercdn.net/160.153.138.217/gvt.827.myftpupload.com/wp-content/uploads/2022/06/bliss-6-seater-lhs-sectional-sofa-in-black-grey-colour-by-trevi-furniture-bliss-6-seater-lhs-secti-dscmpr.jpg?time=1658297940','6 Seater LHS Sectional Sofa in Black & Grey Colour',40000.00,0,71,'2022-07-23 18:15:29'),('AF003',1,'2022-06-23 17:33:26','Give a hint of finesse to your living room decor with this chic chaise sofa crafted from high-quality wood. It is strong, lightweight, and offers comfortable seating.','https://lmsin.net/cdn-cgi/image/h=750,w=750,q=60,fit=cover/https://aaeff43fe32172cbcecc-ae2a4e9a8cbc330ede5588dedf56886e.lmsin.net/homecentre/1000005772527-1000005772526_01-2100.jpg','Artificial Marigold Flower ',15000.00,0,20,'2022-07-20 06:25:31'),('IF001',3,'2022-06-23 17:33:26','This wall dcor and corner shelf come with a unique design that fits perfectly on your home and office walls. It has multi-tiring shelves rack spaces to keep your special antique or showpiece items. ','https://ii1.pepperfry.com/media/catalog/product/w/e/800x880/wenge-engineered-wood-braine-cornor-wall-shelf-by-bluewud-wenge-engineered-wood-braine-cornor-wall-s-vbqefk.jpg','Wenge Engineered Wood Braine Cornor Wall Shelf',1500.00,0,22,'2022-07-20 06:51:26'),('IF002',0,'2022-06-23 17:33:26','Store all your things at one place. The Zoey three door wardrobe is your one stop solution for all storage needs. If you have too many clothes, this wardrobe is perfect to fit them all. It features several shelves of varied sizes.','https://www.ulcdn.net/images/products/481069/slide/666x363/Zoey_Three_DoorWardrobe_with_Drawer_Classic_Walnut_2.png?1647678643','Three Door Wardrobe',10000.00,0,55,'2022-08-08 16:22:10'),('IF003',0,'2022-06-23 17:33:26','Style: ContemporaryMaterial: Sheesham WoodSize: Kindly choose from the available seating combinations from drop down menu.','https://cdn.shopify.com/s/files/1/1890/8745/products/Buy-Stylish-Wooden-Dining-table-Chair-Bench-furniture-set-for-modern-Home-Choose-your-combination_9c2819d4-a938-40d5-aa67-695e063a7f2e_1200x.jpg?v=1629051225','BUY STYLISH WOODEN DINING TABLE CHAIR BENCH FURNITURE SET FOR MODERN HOME',20499.00,0,38,'2022-07-23 17:49:20'),('PA001',0,'2022-06-23 17:33:26','We design 95% of our products in-house for original style & quality you won\'t find anywhere else.','https://cdnext.fynd.com/image/data/Westelm/09-dec-2020/7518129_1.jpg?width=1400&height=1240&mode=fill&fill=solid&fill-color=FFFFFF','Solid Wood Media Console',50000.00,0,45,'2022-07-20 06:41:35'),('PA002',2,'2022-06-23 17:33:26','As the earliest creators of this design, our goal was to create a versatile, all-purpose mattress that suited anyone and everyone irrespective of their preference for a firmer or softer mattress.','https://wakefit-co.s3.ap-south-1.amazonaws.com/img/dual-comfort-mattress-new/dual-comfort-mattress-1.jpg','Dual Comfort Mattress (72*30*6inch) / (182.9*76.2*15.2cm)',15000.00,0,53,'2022-07-20 06:47:29'),('PA003',2,'2022-06-23 17:33:26','Made of premium-quality sheesham wood with a provincial teak finish. Strong, durable wood with storage. The ideal base for uninterrupted, sound sleep.','https://mysleepyhead.com/media/catalog/product/cache/208fb0ae1c70eca4ffa059c65c5c5342/s/l/sleepyhead_bed_vs_premium_sheesham_wood_bed_with_storage_king_size_2_1_1.jpg','Bed VS - Sheesham Wood Bed With Storage',9500.00,0,70,'2022-07-20 06:48:21'),('WS001',3,'2022-06-23 17:33:26','Elegant, Beautiful, Innovatie, Flexible, Best space, Utility Shelve, Interactive, Ergonomically designed, user friendly and best in class are some appropriate words that can be used for our new launched Modular Wall Shelves','https://ii1.pepperfry.com/media/catalog/product/b/r/800x880/brown-engineered-wood-round-set-of-4-modular-wall-shelf-by-random-brown-engineered-wood-round-set-of-wspav5.jpg','Brown Engineered Wood Round Set of 4 Modular Book Shelf',13500.00,0,22,'2022-08-08 16:22:02'),('WS002',3,'2022-06-23 17:33:26','Klaxon presents wall shelves / book shelf Made from engineered wood, this interesting wall shelf from Klaxon will look great in your home or office. Use these modern and classy shelves to place magazines, books, photo frames ','https://ii1.pepperfry.com/media/catalog/product/o/m/800x880/omega-engineered-wood-wall-shelf-in-walnut--by-klaxon-omega-engineered-wood-wall-shelf-in-walnut--by-fsefze.jpg','Omega Engineered Wood Wall Shelf In Walnut',2499.00,0,10,'2022-07-20 06:52:32'),('WS003',2,'2022-06-23 17:33:26','Made of solid wood, this bed frame is aesthetically designed to be compact and fit into any bedroom, while also offering storage space.','https://mysleepyhead.com/media/catalog/product/cache/208fb0ae1c70eca4ffa059c65c5c5342/b/e/bed_gs.jpg','Bed GS - Solid Wood Bed With Storage',9000.00,0,50,'2022-07-20 06:46:13');
/*!40000 ALTER TABLE `product_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_sx468g52bpetvlad2j9y0lptc` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2147483649 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2147483645,1,'IND','admin@shop.com','Admin','$2a$10$sMslSc8WizaCrL0IqAQfH.Zmf6NSWq6y1Bn44ivaECaPAv5xhuSyq','9988776655','ROLE_MANAGER');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` timestamp NULL DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `product_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_wish_fkey` (`product_id`),
  KEY `user_wish_Fkey` (`user_id`),
  CONSTRAINT `product_wish_fkey` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`product_id`),
  CONSTRAINT `user_wish_Fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-09 11:11:45
