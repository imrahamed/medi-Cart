-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: mart
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.19.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structured for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `brandName` varchar(255) DEFAULT NULL,
  `company` int(6) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_company` (`company`),
  KEY `company` (`company_id`),
  CONSTRAINT `company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  CONSTRAINT `fk_company` FOREIGN KEY (`company`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'imran',NULL,1);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping datas for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'imran','sample');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(255) DEFAULT NULL,
  `user` int(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_company` (`user`),
  KEY `user` (`user_id`),
  CONSTRAINT `fk_user_company` FOREIGN KEY (`user`) REFERENCES `user` (`id`),
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'imran',NULL,1);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicine` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `medicineName` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `imageURL` varchar(255) DEFAULT NULL,
  `actualPrice` double(10,2) DEFAULT NULL,
  `discountPrice` double(10,2) DEFAULT NULL,
  `quantity` int(6) DEFAULT NULL,
  `brand` int(6) DEFAULT NULL,
  `category` int(6) DEFAULT NULL,
  `isBlocked` bit(1) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_brand` (`brand`),
  KEY `fk_category` (`category`),
  KEY `category` (`category_id`),
  KEY `brand` (`brand_id`),
  CONSTRAINT `brand` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_brand` FOREIGN KEY (`brand`) REFERENCES `brand` (`id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'pefanil','fever tablet','',120.00,100.00,100000,NULL,NULL,_binary '\0',1,1),(2,'calpol drops','Oral Suspension. A pink strawberry flavoured suspension. ','',10.00,7.00,1000,NULL,NULL,_binary '\0',1,1),(3,'Diclofenac Sodium(Voltaren)','Dosage is twice a day after food to prevent gastric irritation.','https://stylesatlife.com/wp-content/uploads/2017/03/Diclofenac-SodiumVoltaren.jpg',120.00,10.00,1000,NULL,NULL,_binary '\0',1,1),(4,'Asprin','Aspirin is classified under salicylates. It helps to reduce pain by preventing the pain stimulating the nerve and sensitize the nerve endings.','https://stylesatlife.com/wp-content/uploads/2017/03/Aspirin-for-Adults.png',120.00,10.00,1000,NULL,NULL,_binary '\0',1,1),(5,'Children?s Motrin','It is another best fever medicine for child which comes in a syrup form that effectively treats cold and fever.','https://stylesatlife.com/wp-content/uploads/2017/03/Children%C2%B4s-Motrin.jpg',120.00,10.00,1000,NULL,NULL,_binary '\0',1,1),(6,'Tylenol Fever Syrup','Tylenol is the most commonly used syrup as fever medicine for kids from 2 to 122 years of age','https://stylesatlife.com/wp-content/uploads/2017/03/Tylenol-Syrup-For-Kids.jpg',120.00,10.00,1000,NULL,NULL,_binary '\0',1,1),(7,'Paracetamol','Also, known as Acetaminophen. It is classified under the Non-steroidal anti-inflammatory drug. It helps to reduce body temperature and it increases analgesic threshold but has a less anti-inflammatory effect.','https://stylesatlife.com/wp-content/uploads/2017/03/Paracetamol1.jpg',120.00,10.00,1000,NULL,NULL,_binary '\0',1,1);
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderline`
--

DROP TABLE IF EXISTS `orderline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderline` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `medicine` int(6) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `medicine_id` int(11) DEFAULT NULL,
  `orders_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_medicine` (`medicine`),
  KEY `medicine` (`medicine_id`),
  KEY `orders` (`orders_id`),
  CONSTRAINT `fk_medicine` FOREIGN KEY (`medicine`) REFERENCES `medicine` (`id`),
  CONSTRAINT `medicine` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`),
  CONSTRAINT `orders` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderline`
--

LOCK TABLES `orderline` WRITE;
/*!40000 ALTER TABLE `orderline` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  `user` int(6) DEFAULT NULL,
  `totalAmount` double(10,2) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user` (`user`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'Buyer'),(3,'Seller'),(4,'Reviewer');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` int(6) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role` (`role`),
  KEY `role` (`role_id`),
  CONSTRAINT `fk_role` FOREIGN KEY (`role`) REFERENCES `role` (`id`),
  CONSTRAINT `role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'imran','imran@examly.in','imran','9566890562','sampler',NULL,1),(4,'sample','sample@examly.in','sample','9566890562','sapme',NULL,2),(5,'seller','seller@examly.in','seller','9566890562','seller',NULL,3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-19 13:16:34