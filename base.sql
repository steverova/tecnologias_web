CREATE DATABASE  IF NOT EXISTS `db_lavacash` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_lavacash`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 208.109.41.231    Database: db_lavacash
-- ------------------------------------------------------
-- Server version	5.6.51-cll-lve

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
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asunto` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comentario` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (9,'steven rojas','net','net','aaaaaaaaaa','2022-07-18 17:54:20','2022-07-18 05:25:01','2022-07-18 05:25:01'),(25,'qqqqqq','qqqqqq','qqqq','qqqqqq','2022-07-18 20:58:34','2022-07-19 09:58:42','2022-07-19 09:58:42'),(26,'react','react','react','react','2022-07-18 20:03:37',NULL,NULL),(27,'eeeee','e','eeeee','eeee','2022-07-18 20:05:23',NULL,NULL),(28,'11111','111','111','111','2022-07-18 20:07:52',NULL,NULL),(29,'qqqqqq','qqqqq','qqqqq','qqqqq','2022-07-18 20:12:50',NULL,NULL),(30,'22222','22222','22222','22222','2022-07-18 20:15:00',NULL,NULL),(31,'3333','333','333','3333','2022-07-18 20:15:57',NULL,NULL);
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cita`
--

DROP TABLE IF EXISTS `tb_cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `detalle` varchar(100) NOT NULL,
  `servicio_id` int(11) NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  `tb_cita_ibfk_2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehiculo_id` (`vehiculo_id`),
  KEY `servicio_id` (`servicio_id`),
  KEY `FKk8qoyj8or78igd2j122nvin0a` (`tb_cita_ibfk_2`),
  CONSTRAINT `FKk8qoyj8or78igd2j122nvin0a` FOREIGN KEY (`tb_cita_ibfk_2`) REFERENCES `tb_servicio` (`id`),
  CONSTRAINT `tb_cita_ibfk_1` FOREIGN KEY (`vehiculo_id`) REFERENCES `tb_vehiculo` (`id`),
  CONSTRAINT `tb_cita_ibfk_2` FOREIGN KEY (`servicio_id`) REFERENCES `tb_servicio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cita`
--

LOCK TABLES `tb_cita` WRITE;
/*!40000 ALTER TABLE `tb_cita` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cita_cita`
--

DROP TABLE IF EXISTS `tb_cita_cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cita_cita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cita_padre` int(11) NOT NULL,
  `cita_hijo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cita_hijo` (`cita_hijo`),
  KEY `cita_padre` (`cita_padre`),
  CONSTRAINT `tb_cita_cita_ibfk_1` FOREIGN KEY (`cita_hijo`) REFERENCES `tb_cita` (`id`),
  CONSTRAINT `tb_cita_cita_ibfk_2` FOREIGN KEY (`cita_padre`) REFERENCES `tb_cita` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cita_cita`
--

LOCK TABLES `tb_cita_cita` WRITE;
/*!40000 ALTER TABLE `tb_cita_cita` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cita_cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_comentarios`
--

DROP TABLE IF EXISTS `tb_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `comentario` varchar(300) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `estado` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_idx` (`id_user`),
  KEY `FKmlykv2h9owwpgla1ntwuooye0` (`user_id`),
  CONSTRAINT `FKmlykv2h9owwpgla1ntwuooye0` FOREIGN KEY (`user_id`) REFERENCES `tb_usuario` (`id`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`id_user`) REFERENCES `tb_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comentarios`
--

LOCK TABLES `tb_comentarios` WRITE;
/*!40000 ALTER TABLE `tb_comentarios` DISABLE KEYS */;
INSERT INTO `tb_comentarios` VALUES (72,16,'aaaaaaaa;oli',NULL,'2022-07-03 15:38:20',0),(73,25,'bbbb;oli',NULL,'2022-07-03 15:38:25',0),(74,26,'cccc;oli',NULL,'2022-07-03 15:38:30',0),(75,27,'ddddd;oli',NULL,'2022-07-03 15:38:36',0),(76,18,'eeeeeee;oli',NULL,'2022-07-03 15:39:01',0),(77,27,'fffff;oli',NULL,'2022-07-03 15:39:07',0),(78,16,'gggggg;oli',NULL,'2022-07-03 15:47:29',0),(79,25,'hhhhhhh;oli',NULL,'2022-07-03 15:47:37',0),(80,16,'zzzzzzzz;zzzzzzzzzz',NULL,'2022-07-03 17:04:05',0),(81,16,'xxxxx;xxxxxx',NULL,'2022-07-03 17:04:45',0),(82,16,'yyyy;yyyyyy',NULL,'2022-07-03 17:05:21',0),(83,16,'lksdjvklsndcs;dscsdvsd',NULL,'2022-07-03 17:05:33',0),(84,16,'esto es un asusto;esto es un comentario',NULL,'2022-07-03 18:40:51',0),(85,16,'texto de asusnto;dklsjdvklsdj  jslkfjsdkl  kjfklsdf fjsd fjsdf  sfjsdfjslkdf jigfujs fjsi weu weif kljfsdjf s wejf wifhsakl wjfwekdfwkle wjhdf whedfw',NULL,'2022-07-03 19:02:21',0),(86,16,'hola;nuevo comentario',NULL,'2022-07-08 09:11:03',0);
/*!40000 ALTER TABLE `tb_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_examen_fabricio`
--

DROP TABLE IF EXISTS `tb_examen_fabricio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_examen_fabricio` (
  `nombre` varchar(50) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `precio` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_examen_fabricio`
--

LOCK TABLES `tb_examen_fabricio` WRITE;
/*!40000 ALTER TABLE `tb_examen_fabricio` DISABLE KEYS */;
INSERT INTO `tb_examen_fabricio` VALUES ('la negra',18,101,'tiene una linda forma de ser',50000,'2020-05-14'),('la negra1',22,10,'tiene una linda forma de ser',50000,'2020-05-14'),('la negra2',23,10,'tiene una linda forma de ser',50000,'2020-05-14'),('la negra3',24,10,'tiene una linda forma de ser',50000,'2020-05-14'),('la negra4',25,10,'tiene una linda forma de ser',50000,'2020-05-14');
/*!40000 ALTER TABLE `tb_examen_fabricio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_examen_steven`
--

DROP TABLE IF EXISTS `tb_examen_steven`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_examen_steven` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `asunto` varchar(45) NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_examen_steven`
--

LOCK TABLES `tb_examen_steven` WRITE;
/*!40000 ALTER TABLE `tb_examen_steven` DISABLE KEYS */;
INSERT INTO `tb_examen_steven` VALUES (153,'nettttttaaaaaaaaaaa','net','net','net','2022-07-18 15:41:43'),(154,'uuuuu','uuuuu','uuuuuuu','uuuuuuuu','2022-07-15 23:09:54'),(160,'sasdasd','sxasx','sxaasx','asxasxa cscac cqwasdac csaca CSADEW  34REWF 3R43 4R34R 34R3 4R','2022-07-16 01:31:06'),(164,'php','php','php','php','2022-07-16 16:10:58');
/*!40000 ALTER TABLE `tb_examen_steven` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_persona`
--

DROP TABLE IF EXISTS `tb_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) DEFAULT NULL,
  `cedula` varchar(255) DEFAULT NULL,
  `edad` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_persona`
--

LOCK TABLES `tb_persona` WRITE;
/*!40000 ALTER TABLE `tb_persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_servicio`
--

DROP TABLE IF EXISTS `tb_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_servicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precio` int(11) NOT NULL,
  `tiempo` time NOT NULL,
  `servicio_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKo9unvkmian5ua7hhn7ntdd3iu` (`servicio_id`),
  CONSTRAINT `FKo9unvkmian5ua7hhn7ntdd3iu` FOREIGN KEY (`servicio_id`) REFERENCES `tb_cita` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_servicio`
--

LOCK TABLES `tb_servicio` WRITE;
/*!40000 ALTER TABLE `tb_servicio` DISABLE KEYS */;
INSERT INTO `tb_servicio` VALUES (29,2,'Lavado','Lavamos su vehiculo a cachete',5000,'00:20:00',NULL),(33,1,';ashfdl','das.kjdfl',123,'00:20:00',NULL);
/*!40000 ALTER TABLE `tb_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` varchar(8) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `rol` varchar(45) NOT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `contrasena_` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (1,'Joan','Zuñiga','joan@gmail.com','27100909','100 estee barrio diamantes','ADMIN','1234','1234',NULL),(16,'Steven','Rojas','steverova0594@gmail.com','88888888','Limon, Guacimo, Barrio Los Colegios. ','CLIENT','pokemon','pokemon','6a8d4403-e180-42ea-aeb6-2ee6472ab24e.jpg'),(17,'Juan','Perez','JUAN@GMAIL.COM','2324234','DWCDSVCEF','CLIENT','4323','4323','0f58c0fc-ded3-4899-9bcf-e220aed93e4e.jpg'),(18,'Mario','Castro','aaaa@gmail.com','1121','dsdasd','CLIENT','1','1','684372d3-f4dc-47ab-98d3-8b691cc9c397.jpg'),(25,'maria','rojas','maria@gmail.com','45345','dsfsd','CLIENT','1234','1234','79e48a3e-238d-4752-ad70-f0dc4585be00.jpg'),(26,'Guillermo','Rojas','guillermo@qqq.com','234533','gdfgdfg','CLIENT','1234','1234','6c702625-0940-487a-a225-067b1ddbfc47.jpg'),(27,'Josue','Valverde','jopuse@QQQ.com','234234','wfdsfcsd','CLIENT','1234','1234','785ce883-0a18-4b21-858b-a63133e6acc9.jpg'),(28,'adan','sdasas','steverova0594@gmail.com','2324234','wdwqd','CLIENT','1234','1234','');
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_vehiculo`
--

DROP TABLE IF EXISTS `tb_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_vehiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `vehiculo_id` int(11) DEFAULT NULL,
  `cita` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `FKojuak9xm0dfn1vftjrpvfupyd` (`vehiculo_id`),
  KEY `FKfmlv329d55n5u40tswsga8cgb` (`cita`),
  CONSTRAINT `FKam89xpw0u3hi4ofelhhkntdd1` FOREIGN KEY (`usuario_id`) REFERENCES `tb_usuario` (`id`),
  CONSTRAINT `FKfmlv329d55n5u40tswsga8cgb` FOREIGN KEY (`cita`) REFERENCES `tb_cita` (`id`),
  CONSTRAINT `FKojuak9xm0dfn1vftjrpvfupyd` FOREIGN KEY (`vehiculo_id`) REFERENCES `tb_cita` (`id`),
  CONSTRAINT `tb_vehiculo_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `tb_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_vehiculo`
--

LOCK TABLES `tb_vehiculo` WRITE;
/*!40000 ALTER TABLE `tb_vehiculo` DISABLE KEYS */;
INSERT INTO `tb_vehiculo` VALUES (4,12,'695826','Toyota','Prius','super veloz',1,NULL,NULL),(6,23,'13321321','Hyundai ','i10','pochomovil',1,NULL,NULL),(7,99,'284675','Ferrari','f40','color rojo',1,NULL,NULL),(8,34,'695826','Hyundai','i10','pochomovil 2',1,NULL,NULL),(13,12,'13321321','Ferrari','i10','pochomovil 2',1,NULL,NULL);
/*!40000 ALTER TABLE `tb_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-19  2:38:44
