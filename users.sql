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
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'a','北京农林科学院蔬菜研究中心','a',1455054381,'example@example.com','123','西瓜',1,NULL,0),(3,'b','新疆农科院哈密瓜研究中心','b',1455304877,'b@b.com','1234567890','西瓜',1,NULL,0),(4,'hy','系统管理员','hy',1455940945,'hy@example.com','1234567890','西瓜',1,NULL,1),(5,'c','中国农业科学院蔬菜花卉研究所','c',1455940945,'c','1234567890','西瓜',1,NULL,0),(6,'d','江苏农科院','d',1455940945,NULL,NULL,'西瓜',1,NULL,0),(7,'e','黑龙江农科院','e',1455940945,NULL,NULL,'西瓜',1,NULL,0),(8,'f','湖北省农科院','f',1455940945,NULL,NULL,'西瓜',1,NULL,0),(9,'g','湖南农业大学','g',1455940945,NULL,NULL,'西瓜',1,NULL,0),(10,'h','安徽农科院园艺所','h',1455940945,NULL,NULL,'西瓜',1,NULL,0),(11,'i','浙江农科院','i',1455940945,NULL,NULL,'西瓜',1,NULL,0),(12,'j','天津科润','j',1455940945,NULL,NULL,'西瓜',1,NULL,0),(13,'k','西北农林科技大学','k',1455940945,NULL,NULL,'西瓜',1,NULL,0),(14,'l','中国农业科学院郑州果树研究所','l',1455940945,'','','西瓜',1,NULL,0),(15,'m','新疆农科院哈密瓜研究中心','m',1455940945,NULL,NULL,'甜瓜',1,NULL,0),(16,'n','中国农业科学院蔬菜花卉研究所','n',1455940945,NULL,NULL,'甜瓜',1,NULL,0),(17,'o','北京农林科学院蔬菜研究中心','o',1455940945,NULL,NULL,'甜瓜',1,NULL,0),(18,'p','华中农业大学','p',1455940945,NULL,NULL,'甜瓜',1,NULL,0),(19,'q','宁波市农业科学研究院','q',1455940945,NULL,NULL,'甜瓜',1,NULL,0),(20,'r','山东省农业科学院蔬菜花卉研究所','r',1455940945,NULL,NULL,'甜瓜',1,NULL,0),(21,'s','东北农业大学','s',1455940945,NULL,NULL,'甜瓜',1,NULL,0),(22,'t','上海市农业科学院','t',1455940945,NULL,NULL,'甜瓜',1,NULL,0),(30,'test123','test123','test123',1456254405,'aa@bb.com','123','甜瓜',1,NULL,0),(31,'n1','北京市农林科学院蔬菜研究中心','n1',1456254405,NULL,NULL,'南瓜',1,NULL,0),(32,'n2','山西省农业科学院蔬菜研究所','n2',1456254405,NULL,NULL,'南瓜',1,NULL,0),(33,'n3','中国农业科学院蔬菜花卉研究所','n3',1456254405,NULL,NULL,'南瓜',1,NULL,0),(34,'n4','湖南农业大学','n4',1456254405,NULL,NULL,'南瓜',1,NULL,0),(35,'n5','安徽江淮园艺科技有限公司','n5',1456254405,NULL,NULL,'南瓜',1,NULL,0),(36,'n6','湖南省农科院蔬菜研究所','n6',1456254405,NULL,NULL,'南瓜',1,NULL,0),(37,'n7','广东省农科院蔬菜研究所','n7',1456254405,NULL,NULL,'南瓜',1,NULL,0),(38,'h1','中国农业科学院蔬菜花卉研究所','h1',1456254405,NULL,NULL,'南瓜',1,NULL,0),(39,'h2','天津科润黄瓜研究所','h2',1456254405,NULL,NULL,'黄瓜',1,NULL,0),(40,'h3','天津德瑞特种业有限公司','h3',1456254405,NULL,NULL,'黄瓜',1,NULL,0),(41,'h4','四川省农业科学院','h4',1456254405,NULL,NULL,'黄瓜',1,NULL,0),(42,'h5','扬州大学农学院','h5',1456254405,NULL,NULL,'黄瓜',1,NULL,0),(43,'h6','上海交通大学农业与生物学院','h6',1456254405,NULL,NULL,'黄瓜',1,NULL,0),(44,'h7','北京市农林科学院蔬菜研究中心','h7',1456254405,NULL,NULL,'黄瓜',1,NULL,0),(45,'h8','广东省农业科学院蔬菜研究所','h8',1456254405,NULL,NULL,'黄瓜',1,NULL,0),(46,'h9','黑龙江省农业科学院园艺分院','h9',1456254405,NULL,NULL,'黄瓜',1,NULL,0),(47,'h10','吉林省蔬菜花卉科学研究院','h10',1456254405,NULL,NULL,'黄瓜',1,NULL,0),(48,'h11','湖南省蔬菜研究所','h11',1456254405,NULL,NULL,'黄瓜',1,NULL,0);
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

-- Dump completed on 2016-02-24 13:26:07
