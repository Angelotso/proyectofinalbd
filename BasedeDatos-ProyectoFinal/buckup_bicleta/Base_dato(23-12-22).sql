CREATE DATABASE  IF NOT EXISTS `tienda_bicicleta` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tienda_bicicleta`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda_bicicleta
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `accesorio`
--

DROP TABLE IF EXISTS `accesorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accesorio` (
  `id_producto` int NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  CONSTRAINT `accesorio_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesorio`
--

LOCK TABLES `accesorio` WRITE;
/*!40000 ALTER TABLE `accesorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `accesorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administra`
--

DROP TABLE IF EXISTS `administra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administra` (
  `DNI_admin` int NOT NULL,
  `id_producto` int NOT NULL,
  PRIMARY KEY (`DNI_admin`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `administra_ibfk_1` FOREIGN KEY (`DNI_admin`) REFERENCES `administrador` (`DNI`),
  CONSTRAINT `administra_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administra`
--

LOCK TABLES `administra` WRITE;
/*!40000 ALTER TABLE `administra` DISABLE KEYS */;
/*!40000 ALTER TABLE `administra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `DNI` int NOT NULL,
  `salario` int DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (14523269,784512),(48569123,15497),(48740548,784542),(48745146,985123),(77844511,9955200);
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almacena`
--

DROP TABLE IF EXISTS `almacena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacena` (
  `id_pedido` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `cantidad_productos` int DEFAULT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  KEY `id_pedido` (`id_pedido`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `almacena_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `almacena_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacena`
--

LOCK TABLES `almacena` WRITE;
/*!40000 ALTER TABLE `almacena` DISABLE KEYS */;
INSERT INTO `almacena` VALUES (15,152,1,'2022-12-24','2022-12-24');
/*!40000 ALTER TABLE `almacena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bici_freestyle`
--

DROP TABLE IF EXISTS `bici_freestyle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bici_freestyle` (
  `id_producto` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  CONSTRAINT `bici_freestyle_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `bicicleta` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bici_freestyle`
--

LOCK TABLES `bici_freestyle` WRITE;
/*!40000 ALTER TABLE `bici_freestyle` DISABLE KEYS */;
INSERT INTO `bici_freestyle` VALUES (301),(302);
/*!40000 ALTER TABLE `bici_freestyle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bici_infantil`
--

DROP TABLE IF EXISTS `bici_infantil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bici_infantil` (
  `id_producto` int NOT NULL,
  `objeto_extra` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  CONSTRAINT `bici_infantil_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `bicicleta` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bici_infantil`
--

LOCK TABLES `bici_infantil` WRITE;
/*!40000 ALTER TABLE `bici_infantil` DISABLE KEYS */;
INSERT INTO `bici_infantil` VALUES (101,'rueditas'),(102,'canasta');
/*!40000 ALTER TABLE `bici_infantil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bici_montañera`
--

DROP TABLE IF EXISTS `bici_montañera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bici_montañera` (
  `id_producto` int NOT NULL,
  `objeto_extra` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  CONSTRAINT `bici_montañera_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `bicicleta` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bici_montañera`
--

LOCK TABLES `bici_montañera` WRITE;
/*!40000 ALTER TABLE `bici_montañera` DISABLE KEYS */;
INSERT INTO `bici_montañera` VALUES (152,'rodilleras'),(153,'casco');
/*!40000 ALTER TABLE `bici_montañera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bici_urbana`
--

DROP TABLE IF EXISTS `bici_urbana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bici_urbana` (
  `id_producto` int NOT NULL,
  `objeto_extra` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  CONSTRAINT `bici_urbana_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `bicicleta` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bici_urbana`
--

LOCK TABLES `bici_urbana` WRITE;
/*!40000 ALTER TABLE `bici_urbana` DISABLE KEYS */;
INSERT INTO `bici_urbana` VALUES (201,'tobilleras'),(202,'canasta metalico');
/*!40000 ALTER TABLE `bici_urbana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bicicleta`
--

DROP TABLE IF EXISTS `bicicleta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bicicleta` (
  `id_producto` int NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `material` varchar(20) DEFAULT NULL,
  `foto` text,
  PRIMARY KEY (`id_producto`),
  CONSTRAINT `bicicleta_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bicicleta`
--

LOCK TABLES `bicicleta` WRITE;
/*!40000 ALTER TABLE `bicicleta` DISABLE KEYS */;
INSERT INTO `bicicleta` VALUES (101,'verde fosforecente','metal-acero','img_79f31d32798c71bc06aa3899eb9bca79.jpg'),(102,'blanco','caucho','img_cc97e484294864fea239ca6fac19ea37.jpg'),(152,'azul con plomo','titanio','img_8159a9ab45bb0029e3fc8cc9af395a10.jpg'),(153,'verde agua','aluminio','img_465127376f094997d1058448c979e87e.jpg'),(201,'negro','titanio','img_0301258f781ed1354978d3f2ecfdd4d4.jpg'),(202,'plateado','fibra-carbono','img_5607672bf777c83355df3ec9e097c3eb.jpg'),(301,'naranja-azul','aluminio','img_fb5520bb266ac425e1bcc571a1c4f3f5.jpg'),(302,'negro rojizo','metal-acero','img_9c8f29197c1ac2436a2a71bdfef9d98b.jpg');
/*!40000 ALTER TABLE `bicicleta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destacado`
--

DROP TABLE IF EXISTS `destacado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destacado` (
  `DNI` int NOT NULL,
  `descuento` int DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  CONSTRAINT `destacado_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destacado`
--

LOCK TABLES `destacado` WRITE;
/*!40000 ALTER TABLE `destacado` DISABLE KEYS */;
/*!40000 ALTER TABLE `destacado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kit_herramientas`
--

DROP TABLE IF EXISTS `kit_herramientas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kit_herramientas` (
  `numero` int NOT NULL,
  `id_producto` int NOT NULL,
  PRIMARY KEY (`numero`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `kit_herramientas_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `bicicleta` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kit_herramientas`
--

LOCK TABLES `kit_herramientas` WRITE;
/*!40000 ALTER TABLE `kit_herramientas` DISABLE KEYS */;
/*!40000 ALTER TABLE `kit_herramientas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `no_destacado`
--

DROP TABLE IF EXISTS `no_destacado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `no_destacado` (
  `DNI` int NOT NULL,
  PRIMARY KEY (`DNI`),
  CONSTRAINT `no_destacado_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `no_destacado`
--

LOCK TABLES `no_destacado` WRITE;
/*!40000 ALTER TABLE `no_destacado` DISABLE KEYS */;
/*!40000 ALTER TABLE `no_destacado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL,
  `precio` int DEFAULT NULL,
  `DNI_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `DNI_cliente` (`DNI_cliente`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`DNI_cliente`) REFERENCES `usuario` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (15,430,45781236);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `DNI` int NOT NULL,
  `nombres` varchar(20) DEFAULT NULL,
  `primero_apellido` varchar(20) DEFAULT NULL,
  `segundo_apellido` varchar(20) DEFAULT NULL,
  `contraseña` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (11223344,'Gabriel','Lopez','Mamani','123456789'),(14523269,'Pedro','Lozano','Farro','774411'),(14559866,'Luis','Cardinales','Gomez','9988777'),(15213649,'Leandro','Caballero','Fuji','223355'),(15440548,'Valentina','Poma','Cayhuasi','113344'),(22465591,'Tobias','Mertens','Jolden','009988'),(32569841,'Manuel','Canisales','Guevara','112233'),(44568596,'Federico','Tejada','Dorimc','110055'),(44875123,'Javier','Quispe','Loayza','445566'),(45781236,'luis ','perez','moreno','123456'),(48411521,'Benito','Bonifacio','Terminales','331144'),(48569123,'Monica','ceballos','garcia','12345'),(48740548,'Fernanda','Kosth','Ranit','228899'),(48745146,'Angelo','Sante','Limache','660055'),(55498632,'Jessica','Fernadez','Mertecin','775533'),(65984234,'Jaime','Castillo','Tejada','995511'),(74165263,'Mathias','Fernandez','Mentss','115522'),(77844511,'Christian','Perdavae','Tito','445566'),(77884455,'Pablo','Benavidez','Polanco','998855'),(78451236,'Lorenzo','Mendez','Morales','779933'),(86325147,'Cesar','Wingston','Perez','221133'),(88455211,'Samuel','Taya','Yana','664455');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_correo_electronico`
--

DROP TABLE IF EXISTS `persona_correo_electronico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona_correo_electronico` (
  `DNI_persona` int NOT NULL,
  `correo_electronico` varchar(50) NOT NULL,
  PRIMARY KEY (`DNI_persona`,`correo_electronico`),
  CONSTRAINT `persona_correo_electronico_ibfk_1` FOREIGN KEY (`DNI_persona`) REFERENCES `persona` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_correo_electronico`
--

LOCK TABLES `persona_correo_electronico` WRITE;
/*!40000 ALTER TABLE `persona_correo_electronico` DISABLE KEYS */;
INSERT INTO `persona_correo_electronico` VALUES (11223344,'gabi34@gmail.com'),(14523269,'pedri10@gmail.com'),(14559866,'luchito22@gmail.com'),(15213649,'leand345@gmail.com'),(15440548,'valen33@gmail.com'),(22465591,'tobi90@gmail.com'),(32569841,'manuelas23@gmail.com'),(44568596,'feder92@gmail.com'),(44875123,'javi40@gmail.com'),(45781236,'maore123@gmail.com'),(48411521,'benit_9@gmail.com'),(48569123,'monic@gmail.com'),(48740548,'ferchi_12@gmail.com'),(48745146,'angelito33@gmail.com'),(55498632,'jesic56@gmail.com'),(65984234,'jaimito69@gmail.com'),(74165263,'mathi223@gmail.com'),(77844511,'cristi55@gmail.com'),(77884455,'pabli42@gmail.com'),(78451236,'mapuchin@gmail.com'),(86325147,'cesaro_13@gmail.com'),(88455211,'samu_99_1@gmail.com');
/*!40000 ALTER TABLE `persona_correo_electronico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_telefono`
--

DROP TABLE IF EXISTS `persona_telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona_telefono` (
  `DNI_persona` int NOT NULL,
  `telefono` int NOT NULL,
  PRIMARY KEY (`DNI_persona`,`telefono`),
  CONSTRAINT `persona_telefono_ibfk_1` FOREIGN KEY (`DNI_persona`) REFERENCES `persona` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_telefono`
--

LOCK TABLES `persona_telefono` WRITE;
/*!40000 ALTER TABLE `persona_telefono` DISABLE KEYS */;
INSERT INTO `persona_telefono` VALUES (11223344,945612348),(45781236,986532417);
/*!40000 ALTER TABLE `persona_telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `precio` float DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,499),(5,49985.6),(101,130),(102,140),(152,430),(153,125),(201,80),(202,200),(301,150),(302,110);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `DNI` int NOT NULL,
  `presuspuesto` int DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (11223344,784512),(14523269,333211),(14559866,889944),(15440548,215364),(22465591,100500),(32569841,112000),(45781236,1546),(48740548,995612),(55498632,784512),(65984234,321654),(74165263,784512),(88455211,665551);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tienda_bicicleta'
--

--
-- Dumping routines for database 'tienda_bicicleta'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_bici_freestyle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_bici_freestyle`(in id int,in precio decimal(12,2),in color varchar(20),
in material varchar(20),in foto text)
begin
    update producto pr set pr.precio=precio where pr.id_producto=id;
    update bicicleta bi set bi.color=color,bi.material=material, bi.foto=foto where bi.id_producto=id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_bici_freestyle_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_bici_freestyle_id`(in id int)
begin
	select p.id_producto,p.precio,b.color,b.material,b.foto
    from producto p
    inner join bicicleta b
    on p.id_producto=b.id_producto
    inner join bici_freestyle bf
    on p.id_producto=bf.id_producto
	where p.id_producto=id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_bici_infantil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_bici_infantil`(in id int,in precio decimal(12,2),in color varchar(20),
in material varchar(20),in extra varchar(60),in foto text)
begin
    update producto pr set pr.precio=precio where pr.id_producto=id;
    update bicicleta bi set bi.color=color,bi.material=material,bi.foto=foto where bi.id_producto=id;
    update bici_infantil bin set bin.objeto_extra=extra where bin.id_producto=id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_bici_infantil_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_bici_infantil_id`(in id int)
begin
	select p.id_producto,p.precio,b.color,b.material,bin.objeto_extra,b.foto
    from producto p
    inner join bicicleta b
    on p.id_producto=b.id_producto
    inner join bici_infantil bin
    on p.id_producto=bin.id_producto
	where p.id_producto=id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_bici_montañera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_bici_montañera`(in id int,in precio decimal(12,2),in color varchar(20),
in material varchar(20),in extra varchar(60),in foto text)
begin
    update producto pr set pr.precio=precio where pr.id_producto=id;
    update bicicleta bi set bi.color=color,bi.material=material,bi.foto=foto where bi.id_producto=id;
    update bici_montañera bm set bm.objeto_extra=extra where bm.id_producto=id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_bici_montañera_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_bici_montañera_id`(in id int)
begin
	select p.id_producto,p.precio,b.color,b.material,bm.objeto_extra,b.foto
    from producto p
    inner join bicicleta b
    on p.id_producto=b.id_producto
    inner join bici_montañera bm
    on p.id_producto=bm.id_producto
	where p.id_producto=id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_bici_urbana` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_bici_urbana`(in id int,in precio decimal(12,2),in color varchar(20),
in material varchar(20),in extra varchar(60),in foto text)
begin
    update producto pr set pr.precio=precio where pr.id_producto=id;
    update bicicleta bi set bi.color=color,bi.material=material,bi.foto=foto where bi.id_producto=id;
    update bici_urbana bur set bur.objeto_extra=extra where bur.id_producto=id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_bici_urbana_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_bici_urbana_id`(in id int)
begin
	select p.id_producto,p.precio,b.color,b.material,bu.objeto_extra,b.foto
    from producto p
    inner join bicicleta b
    on p.id_producto=b.id_producto 
    inner join bici_urbana bu
    on p.id_producto=bu.id_producto
	where p.id_producto=id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_cliente`(
in dni integer,in nombres varchar(30),in primer_ape varchar(30),segundo_ape varchar(30),
in contra varchar(30),in email varchar(30),in tele integer)
begin
	update persona p set p.nombres=nombres,p.primero_apellido=primer_ape,
    p.segundo_apellido=segundo_ape,p.contraseña=contra where p.DNI=dni;
    update persona_correo_electronico pce set pce.correo_electronico=email
    where pce.DNI_persona=dni;
    update persona_telefono pt set pt.DNI_persona=dni,pt.telefono=tele where pt.DNI_persona=dni;
    update usuario u set u.DNI=dni where u.DNI=dni;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_cliente_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_cliente_id`(in id int)
begin
	select p.dni,p.nombres,p.primero_apellido,p.segundo_apellido,p.contraseña,pce.correo_electronico,
    pt.telefono
    from persona p
    inner join persona_correo_electronico pce
    on p.DNI=pce.DNI_persona
    inner join persona_telefono pt
    on p.DNI=pt.DNI_persona
    inner join usuario u
    on p.DNI=u.DNI
    where p.DNI=id
    group by p.DNI;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_administrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_administrador`(correo varchar(60),contra varchar(60))
begin
	select p.contraseña 'contraseña' , pce.correo_electronico 'correo'
    from persona p
    inner join persona_correo_electronico pce
    on p.DNI=pce.DNI_persona
    inner join administrador a
    on p.DNI=a.DNI and pce.DNI_persona=a.DNI
    where pce.correo_electronico=correo;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_bicicleta_freestyle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_bicicleta_freestyle`(in id_producto int,in precio decimal(12,2),
in color varchar(20),in material varchar(20),in foto text)
begin
	insert into producto values (id_producto,precio);
    insert into bicicleta values (id_producto,color,material,foto);
    insert into bici_freestyle values (id_producto);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_bicicleta_infantil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_bicicleta_infantil`(in id_producto int,in precio decimal(12,2),
in color varchar(20),in material varchar(20),in objeto_extra varchar(40),in foto text)
begin
	insert into producto values (id_producto,precio);
    insert into bicicleta values (id_producto,color,material,foto);
    insert into bici_infantil values (id_producto,objeto_extra);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_bicicleta_montañera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_bicicleta_montañera`(in id_producto int,in precio decimal(12,2),
in color varchar(20),in material varchar(20),in objeto_extra varchar(40),in foto text)
begin
	insert into producto values (id_producto,precio);
    insert into bicicleta values (id_producto,color,material,foto);
    insert into bici_montañera values (id_producto,objeto_extra);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_bicicleta_urbana` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_bicicleta_urbana`(in id_producto int,in precio decimal(12,2),
in color varchar(20),in material varchar(20),in objeto_extra varchar(40),in foto text)
begin
	insert into producto values (id_producto,precio);
    insert into bicicleta values (id_producto,color,material,foto);
    insert into bici_urbana values (id_producto,objeto_extra);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_bici_freestyle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_bici_freestyle`()
begin
	select p.id_producto,p.precio,b.color,b.material,b.foto
    from producto p
    inner join bicicleta b
    on p.id_producto=b.id_producto
    inner join bici_freestyle bf
    on p.id_producto=bf.id_producto
    group by p.id_producto;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_bici_infantil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_bici_infantil`()
begin
	select p.id_producto,p.precio,b.color,b.material,bi.objeto_extra,b.foto
    from producto p
    inner join bicicleta b
    on p.id_producto=b.id_producto
    inner join bici_infantil bi
    on p.id_producto=bi.id_producto
    group by p.id_producto;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_bici_montañera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_bici_montañera`()
begin
	select p.id_producto,p.precio,b.color,b.material,bm.objeto_extra,b.foto
    from producto p
    inner join bicicleta b
    on p.id_producto=b.id_producto
    inner join bici_montañera bm
    on p.id_producto=bm.id_producto
    group by p.id_producto;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrar_bici_urbana` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_bici_urbana`()
begin
	select p.id_producto,p.precio,b.color,b.material,b.foto,bu.objeto_extra
    from producto p
    inner join bicicleta b
    on p.id_producto=b.id_producto
    inner join bici_urbana bu
    on p.id_producto=bu.id_producto
    group by p.id_producto;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_cliente`(in DNI int,in nombre varchar(30),in primer_ape varchar(30),
in segundo_ape varchar(30),in pass varchar(30),in email varchar(30),in tele integer,in presu integer)
begin
	insert into persona values(DNI,nombre,primer_ape,segundo_ape,pass);
    insert into persona_correo_electronico values(DNI,email);
    insert into persona_telefono values(DNI,tele);
    insert into usuario values(DNI,presu);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verificar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verificar_cliente`(in correo_electronico varchar(30),in contraseña varchar(30))
begin
	select p.DNI,p.nombres,p.primero_apellido,p.segundo_apellido,pt.telefono,pce.correo_electronico,p.contraseña  
            from persona p
            inner join persona_correo_electronico pce
            on p.DNI=pce.DNI_persona
            inner join persona_telefono pt
            on pt.DNI_persona=p.DNI
            inner join usuario u
            on p.DNI=u.DNI and pce.DNI_persona=u.DNI
			where pce.correo_electronico=correo_electronico and p.contraseña=contraseña
            group by p.DNI;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-23 22:55:12
