-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: blockbuster
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `actores`
--

DROP TABLE IF EXISTS `actores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actores` (
  `idactores` int NOT NULL,
  `nombre_entero` varchar(65) NOT NULL,
  PRIMARY KEY (`idactores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actores`
--

LOCK TABLES `actores` WRITE;
/*!40000 ALTER TABLE `actores` DISABLE KEYS */;
INSERT INTO `actores` VALUES (1,'Daniel Radcliffe'),(2,'Emma Watson'),(3,'Rupert Grint'),(4,'Tom Felton'),(5,'Alan Rickman'),(6,'Helena Bonham Carter'),(7,'Maggie Smith'),(8,'Robbie Coltrane'),(9,'Michael Gambon'),(10,'Richard Harris');
/*!40000 ALTER TABLE `actores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actores_y_peliculas`
--

DROP TABLE IF EXISTS `actores_y_peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actores_y_peliculas` (
  `actores_idactores` int NOT NULL,
  `peliculas_idpeliculas` int NOT NULL,
  PRIMARY KEY (`actores_idactores`,`peliculas_idpeliculas`),
  KEY `fk_actores_has_peliculas_peliculas1_idx` (`peliculas_idpeliculas`),
  KEY `fk_actores_has_peliculas_actores_idx` (`actores_idactores`),
  CONSTRAINT `fk_actores_has_peliculas_actores` FOREIGN KEY (`actores_idactores`) REFERENCES `actores` (`idactores`),
  CONSTRAINT `fk_actores_has_peliculas_peliculas1` FOREIGN KEY (`peliculas_idpeliculas`) REFERENCES `peliculas` (`idpeliculas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actores_y_peliculas`
--

LOCK TABLES `actores_y_peliculas` WRITE;
/*!40000 ALTER TABLE `actores_y_peliculas` DISABLE KEYS */;
INSERT INTO `actores_y_peliculas` VALUES (1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1);
/*!40000 ALTER TABLE `actores_y_peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alquiler`
--

DROP TABLE IF EXISTS `alquiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alquiler` (
  `idalquiler` int NOT NULL,
  `fecha_inicio` varchar(45) NOT NULL,
  `fecha_devolución` varchar(45) NOT NULL,
  `cliente_idcliente` int NOT NULL,
  `peliculas_idpeliculas` int NOT NULL,
  `peliculas_categoria_idcategoria` int NOT NULL,
  PRIMARY KEY (`idalquiler`,`cliente_idcliente`,`peliculas_idpeliculas`,`peliculas_categoria_idcategoria`),
  KEY `fk_alquiler_cliente1_idx` (`cliente_idcliente`),
  KEY `fk_alquiler_peliculas1_idx` (`peliculas_idpeliculas`,`peliculas_categoria_idcategoria`),
  CONSTRAINT `fk_alquiler_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `fk_alquiler_peliculas1` FOREIGN KEY (`peliculas_idpeliculas`, `peliculas_categoria_idcategoria`) REFERENCES `peliculas` (`idpeliculas`, `categoria_idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquiler`
--

LOCK TABLES `alquiler` WRITE;
/*!40000 ALTER TABLE `alquiler` DISABLE KEYS */;
INSERT INTO `alquiler` VALUES (0,'2023-06-04','2023-07-04',0,0,2),(0,'2023-07-21','2023-08-21',3,1,2);
/*!40000 ALTER TABLE `alquiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idcategoria` int NOT NULL,
  `nombre_categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (0,'comedia'),(1,'romance'),(2,'ficcion'),(3,'infantil'),(4,'clasicos'),(5,'documental'),(6,'drama'),(7,'horror'),(8,'musica');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL,
  `nombre_apellido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (0,'Lola del Brio'),(1,'Carlos Gonzalez'),(2,'Mateo Garcia'),(3,'Nicolas Cols'),(4,'Africa Torres'),(5,'Laura Perez');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idiomas`
--

DROP TABLE IF EXISTS `idiomas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idiomas` (
  `ididiomas` int NOT NULL,
  `nombre_idioma` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ididiomas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idiomas`
--

LOCK TABLES `idiomas` WRITE;
/*!40000 ALTER TABLE `idiomas` DISABLE KEYS */;
INSERT INTO `idiomas` VALUES (1,'ingles'),(2,'italiano'),(3,'japones'),(4,'frances'),(5,'español'),(6,'aleman');
/*!40000 ALTER TABLE `idiomas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peliculas` (
  `idpeliculas` int NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripción` varchar(45) NOT NULL,
  `fecha_de_estreno` varchar(45) NOT NULL,
  `duración` int NOT NULL,
  `precio` varchar(45) NOT NULL,
  `rating` varchar(45) NOT NULL,
  `categoria_idcategoria` int NOT NULL,
  PRIMARY KEY (`idpeliculas`,`categoria_idcategoria`),
  KEY `fk_peliculas_categoria1_idx` (`categoria_idcategoria`),
  CONSTRAINT `fk_peliculas_categoria1` FOREIGN KEY (`categoria_idcategoria`) REFERENCES `categoria` (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peliculas`
--

LOCK TABLES `peliculas` WRITE;
/*!40000 ALTER TABLE `peliculas` DISABLE KEYS */;
INSERT INTO `peliculas` VALUES (0,'Harry Potter y la Piedra Filosofal','Un joven mago en la escuela de Hogwarts.','2001-11-16',152,'10.99','4.8',2),(1,'Harry Potter y la Cámara Secreta','Harry en su segundo año en Hogwarts.','2002-11-15',161,'11.99','4.9',2);
/*!40000 ALTER TABLE `peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peliculas_has_idiomas`
--

DROP TABLE IF EXISTS `peliculas_has_idiomas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peliculas_has_idiomas` (
  `peliculas_idpeliculas` int NOT NULL,
  `idiomas_ididiomas` int NOT NULL,
  PRIMARY KEY (`peliculas_idpeliculas`,`idiomas_ididiomas`),
  KEY `fk_peliculas_has_idiomas_idiomas1_idx` (`idiomas_ididiomas`),
  KEY `fk_peliculas_has_idiomas_peliculas1_idx` (`peliculas_idpeliculas`),
  CONSTRAINT `fk_peliculas_has_idiomas_idiomas1` FOREIGN KEY (`idiomas_ididiomas`) REFERENCES `idiomas` (`ididiomas`),
  CONSTRAINT `fk_peliculas_has_idiomas_peliculas1` FOREIGN KEY (`peliculas_idpeliculas`) REFERENCES `peliculas` (`idpeliculas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peliculas_has_idiomas`
--

LOCK TABLES `peliculas_has_idiomas` WRITE;
/*!40000 ALTER TABLE `peliculas_has_idiomas` DISABLE KEYS */;
INSERT INTO `peliculas_has_idiomas` VALUES (0,1),(1,1),(0,2),(0,5),(1,5),(1,6);
/*!40000 ALTER TABLE `peliculas_has_idiomas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-31 13:10:29
