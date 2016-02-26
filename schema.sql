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
  `grade` varchar(128) DEFAULT NULL,
  `attachment_name` varchar(256) DEFAULT NULL,
  `attachment_type` varchar(128) DEFAULT NULL,
  `attachment_size` int(10) DEFAULT '0',
  `attachment` mediumblob,
  `note` varchar(1024) DEFAULT NULL,
  `ref_url` varchar(512) DEFAULT NULL,
  `award_name` varchar(256) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `publish_year` varchar(45) DEFAULT NULL,
  `publish_month` varchar(45) DEFAULT NULL,
  `attachment_name` varchar(45) DEFAULT NULL,
  `attachment_type` varchar(45) DEFAULT NULL,
  `attachment` mediumblob,
  `attachment_size` int(10) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `ref_url` varchar(45) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='品种审定（鉴定）';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `publish_year` varchar(45) DEFAULT NULL,
  `publish_month` varchar(45) DEFAULT NULL,
  `attachment_name` varchar(45) DEFAULT NULL,
  `attachment_type` varchar(45) DEFAULT NULL,
  `attachment` mediumblob,
  `attachment_size` int(10) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `ref_url` varchar(45) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='新品种保护';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `publish_year` varchar(10) DEFAULT NULL,
  `publish_month` varchar(10) DEFAULT NULL,
  `author` varchar(256) DEFAULT NULL,
  `attachment_name` varchar(45) DEFAULT NULL,
  `attachment_type` varchar(45) DEFAULT NULL,
  `attachment` mediumblob,
  `attachment_size` int(10) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `ref_url` varchar(45) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='颁布的技术标准';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `q5`
--

DROP TABLE IF EXISTS `q5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `q5` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `author` varchar(256) NOT NULL,
  `publish_year` varchar(10) DEFAULT NULL,
  `publish_month` varchar(10) DEFAULT NULL,
  `publisher` varchar(128) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='发表文章';
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出版著作';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `publish_year` varchar(45) DEFAULT NULL,
  `publish_month` varchar(45) DEFAULT NULL,
  `attachment_name` varchar(45) DEFAULT NULL,
  `attachment_type` varchar(45) DEFAULT NULL,
  `attachment` mediumblob,
  `attachment_size` int(10) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `ref_url` varchar(45) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='获得专利\n';
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='典型事例';
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-26 17:05:29
