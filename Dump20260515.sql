-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: novacart_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `detalle_pedidos`
--

DROP TABLE IF EXISTS `detalle_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedidos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `pedido_id` bigint DEFAULT NULL,
  `precio_unitario` double NOT NULL,
  `producto_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedidos`
--

LOCK TABLES `detalle_pedidos` WRITE;
/*!40000 ALTER TABLE `detalle_pedidos` DISABLE KEYS */;
INSERT INTO `detalle_pedidos` VALUES (1,1,1,3500,1),(2,1,2,25999.99,2),(3,1,3,1200,4);
/*!40000 ALTER TABLE `detalle_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `calle` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `codigo_postal` varchar(255) DEFAULT NULL,
  `colonia` varchar(255) DEFAULT NULL,
  `referencias` varchar(255) DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES (1,'San Benito 212','García, Nuevo León','66600','Real San Martin','',1),(2,'124','Apodaca, Nuevo León','66600','Colonia','',1),(3,'12','Apodaca, Nuevo León','66600','2eda','',1),(4,'asjsahkjk','jskjksajkasn','60000','kjaskjsakjsa','',1);
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `estado_envio` varchar(255) DEFAULT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `total` double NOT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'PROCESANDO','2026-05-05 01:26:16.702175',3500,1),(2,'PROCESANDO','2026-05-14 22:27:53.735445',25999.99,2),(3,'PROCESANDO','2026-05-14 22:43:51.768591',1200,1);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `imagen_url` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `precio` double NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'https://images.tcdn.com.br/img/img_prod/486750/monitor_gamer_24_led_full_hd_3green_vga_e_hdmi_75hz_preto_8719_1_95d271916d473ee6cd539a96f731c7ad.jpg','Monitor Gamer 24\'',3500,9),(2,'https://www.ayacnet.com/wp-content/uploads/2020/06/8176I7k3nGL._AC_SY355_.jpg','Laptop Gamer ASUS',25999.99,9),(3,'https://www.lg.com/content/dam/channel/wcms/co/24u421a/24u421a-2025-2010-1334.jpg/_jcr_content/renditions/thum-1600x1062.jpeg','Monitor LG 24\"',4500,15),(4,'https://images.fravega.com/f1000/e0d9e9a71abf3525fc37d2f14f81c71f.jpg','Teclado Mecánico',1200,19),(5,'https://m.media-amazon.com/images/I/61qN9d08hgL.jpg','Mouse Inalámbrico',650,25),(12,'https://m.media-amazon.com/images/I/712TY0NCErL._AC_SL1114_.jpg','iPhone 15 Pro',32999.99,8),(13,'https://image-us.samsung.com/us/smartphones/galaxy-s24/all-gallery/01_E3_OnlineExclusive_TitaniumBlue_Lockup_1600x1200.jpg?$product-details-jpg$?$product-details-thumbnail-jpg$','Samsung Galaxy S24',28999.99,10),(14,'https://i5.walmartimages.com/seo/2024-Apple-13-inch-iPad-Air-M2-Wi-Fi-128GB-Blue_1512612b-3f81-4661-9b5a-b6e30501ff99.2caff370b34b2a95cde52509e02f68b9.jpeg','iPad Air',18999.99,12),(15,'https://cdsassets.apple.com/live/7WUAS350/images/tech-specs/apple-watch-series-9.png','Apple Watch Series 9',12999.99,15),(16,'https://the-gadgeteer.com/wp-content/uploads/2019/10/apple-announces-airpod-pros-002.jpg','AirPods Pro',8999.99,20),(17,'https://m.media-amazon.com/images/I/51fM0CKG+HL.jpg','PlayStation 5',14999.99,5),(18,'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6428/6428324_sd.jpg','Xbox Series X',13999.99,6),(19,'https://upload.wikimedia.org/wikipedia/commons/8/88/Nintendo-Switch-wJoyCons-BlRd-Standing-FL.jpg','Nintendo Switch',8499.99,18),(20,'https://tse4.mm.bing.net/th/id/OIP.xV9kx0FhpIcdu1VIWKn_4AHaF3?rs=1&pid=ImgDetMain&o=7&rm=3','Cámara Canon EOS',22999.99,7),(21,'https://i5.walmartimages.com/asr/c386e2d1-bf46-4371-a34f-9c7b463c5ba7.3c586c73854ea34169bfe9f2653e8dcf.png','Bocina JBL Charge 5',3499.99,25);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `rol` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Tadeo Velazquez','123456','USER','tadeo@ejemplo.com'),(2,'Admin','admin123','ADMIN','admin@novacart.com'),(3,'Juan Perez','123456','USER','juan@correo.com'),(4,'Carlos Martínez','123456','USER','carlos@gmail.com'),(5,'Ana García','123456','USER','ana@gmail.com'),(6,'Luis Hernández','123456','USER','luis@gmail.com'),(7,'María López','123456','USER','maria@gmail.com'),(8,'Pedro Ramírez','123456','USER','pedro@gmail.com'),(9,'Sofía Torres','123456','USER','sofia@gmail.com'),(10,'Diego Flores','123456','USER','diego@gmail.com'),(11,'Valentina Cruz','123456','USER','valentina@gmail.com'),(12,'Andrés Morales','123456','USER','andres@gmail.com'),(13,'Camila Jiménez','123456','USER','camila@gmail.com'),(14,'Roberto Díaz','123456','USER','roberto@gmail.com'),(15,'Isabella Vargas','123456','USER','isabella@gmail.com'),(16,'Fernando Núñez','123456','USER','fernando@gmail.com'),(17,'Gabriela Reyes','123456','USER','gabriela@gmail.com'),(18,'Alejandro Mendoza','123456','USER','alejandro@gmail.com'),(19,'Daniela Castro','123456','USER','daniela@gmail.com'),(20,'Miguel Ortega','123456','USER','miguel@gmail.com'),(21,'Lucia Pereira','123456','USER','lucia@gmail.com'),(22,'Javier Romero','123456','USER','javier@gmail.com'),(23,'Paula Gutiérrez','123456','USER','paula@gmail.com'),(24,'Sebastián Ruiz','123456','USER','sebastian@gmail.com'),(25,'Natalia Sánchez','123456','USER','natalia@gmail.com'),(26,'Eduardo Molina','123456','USER','eduardo@gmail.com'),(27,'Mariana Herrera','123456','USER','mariana@gmail.com'),(28,'Ricardo Medina','123456','USER','ricardo@gmail.com'),(29,'Valeria Aguilar','123456','USER','valeria@gmail.com'),(30,'Ernesto Vega','123456','USER','ernesto@gmail.com'),(31,'Patricia Rios','123456','USER','patricia@gmail.com'),(32,'Hector Sandoval','123456','USER','hector@gmail.com'),(33,'Adriana Campos','123456','USER','adriana@gmail.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-15 18:23:15
