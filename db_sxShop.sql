-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: db_nzxs
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `t_admin`
--

DROP TABLE IF EXISTS `t_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL,
  `userName` varchar(88) DEFAULT NULL,
  `userPw` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_admin`
--

LOCK TABLES `t_admin` WRITE;
/*!40000 ALTER TABLE `t_admin` DISABLE KEYS */;
INSERT INTO `t_admin` VALUES (1,'a','a');
/*!40000 ALTER TABLE `t_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_catelog`
--

DROP TABLE IF EXISTS `t_catelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_catelog` (
  `catelog_id` int(11) NOT NULL,
  `catelog_name` varchar(88) DEFAULT NULL,
  `catelog_del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`catelog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_catelog`
--

LOCK TABLES `t_catelog` WRITE;
/*!40000 ALTER TABLE `t_catelog` DISABLE KEYS */;
INSERT INTO `t_catelog` VALUES (1,'奶制品','no'),(2,'水果','no'),(3,'蔬菜','no');
/*!40000 ALTER TABLE `t_catelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_goods`
--

DROP TABLE IF EXISTS `t_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_goods` (
  `goods_id` int(11) NOT NULL,
  `goods_name` varchar(88) DEFAULT NULL,
  `goods_miaoshu` varchar(5000) DEFAULT NULL,
  `goods_pic` varchar(50) DEFAULT NULL,
  `goods_shichangjia` int(11) DEFAULT NULL,
  `goods_tejia` int(11) DEFAULT NULL,
  `goods_isnottejia` varchar(50) DEFAULT NULL,
  `goods_isnottuijian` varchar(50) DEFAULT NULL,
  `goods_catelog_id` int(11) DEFAULT NULL,
  `goods_Del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_goods`
--

LOCK TABLES `t_goods` WRITE;
/*!40000 ALTER TABLE `t_goods` DISABLE KEYS */;
INSERT INTO `t_goods` VALUES (1,'鲜牛奶','<p>&nbsp;山西农业大学自产鲜牛奶</p>','/upload/1490794409057.jpg',5,5,'no',NULL,1,'no'),(2,'酸牛奶','<p>&nbsp;山西农业大学自产酸牛奶</p>\r','/upload/1490794484173.jpg',10,10,'no',NULL,1,'no'),(3,'石榴','山西农业大学果园水果','/upload/1490794572539.jpg',20,20,'no',NULL,2,'no'),(4,'青柠','<p>&nbsp;山西农业大学果园水果</p>','/upload/1490795392208.jpg',20,20,'no',NULL,2,'no'),(5,'梨','<p>&nbsp;山西农业大学果园水果</p>\r','/upload/1490795493224.jpg',20,20,'no',NULL,2,'no'),(6,'猕猴桃','<p>&nbsp;山西农业大学果园水果</p>','/upload/1490795536776.jpg',20,20,'no',NULL,2,'no'),(7,'豌豆','山西农业大学农场蔬菜','/upload/1490795578280.jpg',20,20,'no',NULL,3,'no'),(8,'西红柿','山西农业大学农场蔬菜','/upload/1490795626805.jpg',20,20,'no',NULL,3,'no');
/*!40000 ALTER TABLE `t_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_liuyan`
--

DROP TABLE IF EXISTS `t_liuyan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_liuyan` (
  `id` int(11) NOT NULL,
  `neirong` varchar(3000) DEFAULT NULL,
  `liuyanshi` varchar(55) DEFAULT NULL,
  `huiyuanId` int(11) DEFAULT NULL,
  `huifu` varchar(3000) DEFAULT NULL,
  `huifushi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_liuyan`
--

LOCK TABLES `t_liuyan` WRITE;
/*!40000 ALTER TABLE `t_liuyan` DISABLE KEYS */;
INSERT INTO `t_liuyan` VALUES (1,'dddddddddddddddddddddddd','2017-04-09 23:37',NULL,'dfdfd','2017-04-09 23:39');
/*!40000 ALTER TABLE `t_liuyan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_order`
--

DROP TABLE IF EXISTS `t_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL,
  `bianhao` varchar(88) DEFAULT NULL,
  `xiadanshi` varchar(50) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `userRealname` varchar(255) DEFAULT NULL,
  `userTel` varchar(255) DEFAULT NULL,
  `songhuodizhi` varchar(50) DEFAULT NULL,
  `fukuanfangshi` varchar(50) DEFAULT NULL,
  `jine` int(11) DEFAULT NULL,
  `zhuangtai` varchar(50) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_order`
--

LOCK TABLES `t_order` WRITE;
/*!40000 ALTER TABLE `t_order` DISABLE KEYS */;
INSERT INTO `t_order` VALUES (3,'20170522034324','2017-05-22 03:43:24','songyi','songyi','songyi','songyi','????',20,'???',3);
/*!40000 ALTER TABLE `t_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_orderitem`
--

DROP TABLE IF EXISTS `t_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_orderitem` (
  `orderItem_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderItem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_orderitem`
--

LOCK TABLES `t_orderitem` WRITE;
/*!40000 ALTER TABLE `t_orderitem` DISABLE KEYS */;
INSERT INTO `t_orderitem` VALUES (4,2,1,1),(5,2,6,1),(6,2,8,1),(7,3,6,1),(8,3,8,1),(9,3,6,1);
/*!40000 ALTER TABLE `t_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(88) DEFAULT NULL,
  `user_pw` varchar(50) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `user_realname` varchar(50) DEFAULT NULL,
  `user_sex` varchar(50) DEFAULT NULL,
  `user_age` varchar(50) DEFAULT NULL,
  `user_address` varchar(50) DEFAULT NULL,
  `user_tel` varchar(50) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (3,'songyi','songyi',0,'songyi','?','20','songyi','songyi','songyi','no');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_xinwen`
--

DROP TABLE IF EXISTS `t_xinwen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_xinwen` (
  `id` int(11) NOT NULL,
  `biaoti` varchar(200) DEFAULT NULL,
  `neirong` varchar(3000) DEFAULT NULL,
  `fujian` varchar(255) DEFAULT NULL,
  `shijian` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_xinwen`
--

LOCK TABLES `t_xinwen` WRITE;
/*!40000 ALTER TABLE `t_xinwen` DISABLE KEYS */;
INSERT INTO `t_xinwen` VALUES (1,'?????????????','&nbsp;?????????????','/img/zanwu.jpg','2017-05-21 14:14');
/*!40000 ALTER TABLE `t_xinwen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-22 15:48:45
