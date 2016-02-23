-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: hy
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(512) NOT NULL,
  `author` varchar(256) NOT NULL,
  `publish_year` varchar(45) NOT NULL,
  `publish_month` varchar(45) DEFAULT NULL,
  `category` varchar(45) NOT NULL,
  `publisher` varchar(256) DEFAULT NULL,
  `level` varchar(45) NOT NULL,
  `attachment_name` varchar(256) DEFAULT NULL,
  `attachment_type` varchar(128) DEFAULT NULL,
  `attachment_size` int(10) DEFAULT '0',
  `attachment` mediumblob,
  `note` varchar(1024) DEFAULT NULL,
  `ref_url` varchar(512) DEFAULT NULL,
  `award_name` varchar(256) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'test','2016-02-15 00:00:00','2016-02-29 00:00:00','This is a test project');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `q2`
--

DROP TABLE IF EXISTS `q2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `q2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zuowu_name` varchar(256) NOT NULL,
  `pinzhong_name` varchar(256) NOT NULL,
  `certification_code` varchar(45) NOT NULL,
  `certified_by` varchar(45) NOT NULL,
  `certified_at` varchar(45) DEFAULT NULL,
  `attachment_name` varchar(45) DEFAULT NULL,
  `attachment_type` varchar(45) DEFAULT NULL,
  `attachment` mediumblob,
  `attachment_size` int(10) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `ref_url` varchar(45) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='品种审定（鉴定）';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `q2`
--

LOCK TABLES `q2` WRITE;
/*!40000 ALTER TABLE `q2` DISABLE KEYS */;
/*!40000 ALTER TABLE `q2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `q3`
--

DROP TABLE IF EXISTS `q3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `q3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zuowu_name` varchar(256) NOT NULL,
  `pinzhong_name` varchar(256) NOT NULL,
  `auth_code` varchar(45) NOT NULL,
  `attachment_name` varchar(45) DEFAULT NULL,
  `attachment_type` varchar(45) DEFAULT NULL,
  `attachment` mediumblob,
  `attachment_size` int(10) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `ref_url` varchar(45) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='新品种保护';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `q3`
--

LOCK TABLES `q3` WRITE;
/*!40000 ALTER TABLE `q3` DISABLE KEYS */;
/*!40000 ALTER TABLE `q3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `q4`
--

DROP TABLE IF EXISTS `q4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `q4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `auth_by` varchar(256) NOT NULL,
  `auth_code` varchar(45) NOT NULL,
  `auth_year` varchar(10) DEFAULT NULL,
  `auth_month` varchar(10) DEFAULT NULL,
  `attachment_name` varchar(45) DEFAULT NULL,
  `attachment_type` varchar(45) DEFAULT NULL,
  `attachment` mediumblob,
  `attachment_size` int(10) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `ref_url` varchar(45) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='颁布的技术标准';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `q4`
--

LOCK TABLES `q4` WRITE;
/*!40000 ALTER TABLE `q4` DISABLE KEYS */;
/*!40000 ALTER TABLE `q4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `q5`
--

DROP TABLE IF EXISTS `q5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `q5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `auth_by` varchar(256) NOT NULL,
  `auth_year` varchar(10) DEFAULT NULL,
  `auth_month` varchar(10) DEFAULT NULL,
  `attachment_name` varchar(45) DEFAULT NULL,
  `attachment_type` varchar(45) DEFAULT NULL,
  `attachment` mediumblob,
  `attachment_size` int(10) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `ref_url` varchar(45) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='颁布的技术标准';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `q5`
--

LOCK TABLES `q5` WRITE;
/*!40000 ALTER TABLE `q5` DISABLE KEYS */;
/*!40000 ALTER TABLE `q5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `q6`
--

DROP TABLE IF EXISTS `q6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `q6` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(512) NOT NULL,
  `author` varchar(256) NOT NULL,
  `publisher` varchar(256) DEFAULT NULL,
  `publish_year` varchar(4) NOT NULL,
  `publish_month` varchar(2) DEFAULT NULL,
  `publish_page` varchar(45) DEFAULT NULL,
  `effect_factor` varchar(45) DEFAULT NULL,
  `level` varchar(45) NOT NULL,
  `attachment_name` varchar(256) DEFAULT NULL,
  `attachment_type` varchar(128) DEFAULT NULL,
  `attachment_size` int(10) DEFAULT '0',
  `attachment` mediumblob,
  `note` varchar(1024) DEFAULT NULL,
  `ref_url` varchar(512) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='发表文章';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `q6`
--

LOCK TABLES `q6` WRITE;
/*!40000 ALTER TABLE `q6` DISABLE KEYS */;
/*!40000 ALTER TABLE `q6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `q7`
--

DROP TABLE IF EXISTS `q7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `q7` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `author` varchar(256) NOT NULL,
  `publisher` varchar(256) NOT NULL,
  `publish_year` varchar(10) DEFAULT NULL,
  `publish_month` varchar(10) DEFAULT NULL,
  `attachment_name` varchar(45) DEFAULT NULL,
  `attachment_type` varchar(45) DEFAULT NULL,
  `attachment` mediumblob,
  `attachment_size` int(10) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `ref_url` varchar(45) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='出版著作';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `q7`
--

LOCK TABLES `q7` WRITE;
/*!40000 ALTER TABLE `q7` DISABLE KEYS */;
/*!40000 ALTER TABLE `q7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `q8`
--

DROP TABLE IF EXISTS `q8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `q8` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `author` varchar(256) NOT NULL,
  `patent_code` varchar(45) NOT NULL,
  `org_name` varchar(256) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `attachment_name` varchar(45) DEFAULT NULL,
  `attachment_type` varchar(45) DEFAULT NULL,
  `attachment` mediumblob,
  `attachment_size` int(10) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `ref_url` varchar(45) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='获得专利\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `q8`
--

LOCK TABLES `q8` WRITE;
/*!40000 ALTER TABLE `q8` DISABLE KEYS */;
/*!40000 ALTER TABLE `q8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `q9`
--

DROP TABLE IF EXISTS `q9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `q9` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `author` varchar(256) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `attachment_name` varchar(45) DEFAULT NULL,
  `attachment_type` varchar(45) DEFAULT NULL,
  `attachment` mediumblob,
  `attachment_size` int(10) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `ref_url` varchar(45) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='典型事例';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `q9`
--

LOCK TABLES `q9` WRITE;
/*!40000 ALTER TABLE `q9` DISABLE KEYS */;
/*!40000 ALTER TABLE `q9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `org_name` varchar(256) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `regdate` bigint(64) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `project` varchar(45) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `submit_date` datetime DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'a','中国农业科学院郑州果树研究所','a',1455054381,'example@example.com','123','西瓜',1,NULL,0),(3,'b','新疆农科院哈密瓜研究中心','b',1455304877,'b@b.com','1234567890','西瓜',1,NULL,0),(4,'hy','系统管理员','hy',1455940945,'hy@example.com','1234567890','西瓜',1,NULL,1),(5,'c','中国农业科学院蔬菜花卉研究所','c',1455940945,'c','1234567890','西瓜',1,NULL,0),(6,'d','江苏农科院','d',1455940945,NULL,NULL,'西瓜',1,NULL,0),(7,'e','黑龙江农科院','e',1455940945,NULL,NULL,'西瓜',1,NULL,0),(8,'f','湖北省农科院','f',1455940945,NULL,NULL,'西瓜',1,NULL,0),(9,'g','湖南农业大学','g',1455940945,NULL,NULL,'西瓜',1,NULL,0),(10,'h','安徽农科院园艺所','h',1455940945,NULL,NULL,'西瓜',1,NULL,0),(11,'i','浙江农科院','i',1455940945,NULL,NULL,'西瓜',1,NULL,0),(12,'j','天津科润','j',1455940945,NULL,NULL,'西瓜',1,NULL,0),(13,'k','西北农林科技大学','k',1455940945,NULL,NULL,'西瓜',1,NULL,0),(14,'l','北京农林科学院蔬菜研究中心','l',1455940945,NULL,NULL,'西瓜',1,NULL,0),(15,'m','新疆农科院哈密瓜研究中心','m',1455940945,NULL,NULL,'甜瓜',1,NULL,0),(16,'n','中国农业科学院蔬菜花卉研究所','n',1455940945,NULL,NULL,'甜瓜',1,NULL,0),(17,'o','北京农林科学院蔬菜研究中心','o',1455940945,NULL,NULL,'甜瓜',1,NULL,0),(18,'p','华中农业大学','p',1455940945,NULL,NULL,'甜瓜',1,NULL,0),(19,'q','宁波市农业科学研究院','q',1455940945,NULL,NULL,'甜瓜',1,NULL,0),(20,'r','山东省农业科学院蔬菜花卉研究所','r',1455940945,NULL,NULL,'甜瓜',1,NULL,0),(21,'s','东北农业大学','s',1455940945,NULL,NULL,'甜瓜',1,NULL,0),(22,'t','上海市农业科学院','t',1455940945,NULL,NULL,'甜瓜',1,NULL,0),(30,'test123','test123','test123',1456254405,'a@a.com','123','甜瓜',1,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-23 15:07:06
