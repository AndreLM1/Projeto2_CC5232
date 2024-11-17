CREATE DATABASE  IF NOT EXISTS `project_netflix` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project_netflix`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: project_netflix
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `diretor`
--

DROP TABLE IF EXISTS `diretor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diretor` (
  `ID_Diretor` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) NOT NULL,
  `Data_Nascimento` date NOT NULL,
  PRIMARY KEY (`ID_Diretor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diretor`
--

LOCK TABLES `diretor` WRITE;
/*!40000 ALTER TABLE `diretor` DISABLE KEYS */;
INSERT INTO `diretor` VALUES (1,'Quentin Tarantino','1963-03-27'),(2,'Zack Snyder','1966-03-01'),(3,'Shonda Lynn Rhimes','1970-01-13'),(4,'Bryan Cranston','1956-03-07'),(5,'Eric Kripke','1974-04-24'),(6,'Kevin S. Bright','1954-10-15'),(7,'Charles Michael Levine','1952-10-18'),(8,'Eric Kripke','1974-04-24');
/*!40000 ALTER TABLE `diretor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diretor_filme`
--

DROP TABLE IF EXISTS `diretor_filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diretor_filme` (
  `ID_Diretor` int DEFAULT NULL,
  `ID_Filme` int DEFAULT NULL,
  KEY `ID_Diretor` (`ID_Diretor`),
  KEY `ID_Filme` (`ID_Filme`),
  CONSTRAINT `diretor_filme_ibfk_1` FOREIGN KEY (`ID_Diretor`) REFERENCES `diretor` (`ID_Diretor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `diretor_filme_ibfk_2` FOREIGN KEY (`ID_Filme`) REFERENCES `filme` (`ID_Filme`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diretor_filme`
--

LOCK TABLES `diretor_filme` WRITE;
/*!40000 ALTER TABLE `diretor_filme` DISABLE KEYS */;
INSERT INTO `diretor_filme` VALUES (1,1),(1,2),(2,3),(2,4),(2,5),(2,6);
/*!40000 ALTER TABLE `diretor_filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diretor_serie`
--

DROP TABLE IF EXISTS `diretor_serie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diretor_serie` (
  `ID_Diretor` int DEFAULT NULL,
  `ID_Serie` int DEFAULT NULL,
  KEY `ID_Diretor` (`ID_Diretor`),
  KEY `ID_Serie` (`ID_Serie`),
  CONSTRAINT `diretor_serie_ibfk_1` FOREIGN KEY (`ID_Diretor`) REFERENCES `diretor` (`ID_Diretor`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `diretor_serie_ibfk_2` FOREIGN KEY (`ID_Serie`) REFERENCES `serie` (`ID_Serie`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diretor_serie`
--

LOCK TABLES `diretor_serie` WRITE;
/*!40000 ALTER TABLE `diretor_serie` DISABLE KEYS */;
INSERT INTO `diretor_serie` VALUES (4,2),(3,1),(5,3),(6,4),(7,5),(8,6);
/*!40000 ALTER TABLE `diretor_serie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filme`
--

DROP TABLE IF EXISTS `filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filme` (
  `ID_Filme` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(255) NOT NULL,
  `Duracao` int NOT NULL,
  `Data_lancamento` date NOT NULL,
  PRIMARY KEY (`ID_Filme`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme`
--

LOCK TABLES `filme` WRITE;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
INSERT INTO `filme` VALUES (1,'Os Oito Odiados',187,'2016-01-07'),(2,'Bastardos Inglórios',153,'2009-10-09'),(3,'Liga da Justiça de Zack Snyder',242,'2019-03-18'),(4,'Watchmen - O Filme',265,'2009-03-06'),(5,'300',94,'2007-03-09'),(6,'Aquaman',134,'2018-12-13');
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista`
--

DROP TABLE IF EXISTS `lista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista` (
  `ID_Lista` int NOT NULL AUTO_INCREMENT,
  `DATA_Criacao` date NOT NULL,
  `ID_Usuario` int DEFAULT NULL,
  PRIMARY KEY (`ID_Lista`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `lista_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista`
--

LOCK TABLES `lista` WRITE;
/*!40000 ALTER TABLE `lista` DISABLE KEYS */;
INSERT INTO `lista` VALUES (1,'2020-01-27',1),(2,'2020-04-14',2);
/*!40000 ALTER TABLE `lista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_conteudo`
--

DROP TABLE IF EXISTS `lista_conteudo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_conteudo` (
  `ID_Lista` int DEFAULT NULL,
  `ID_Filme` int DEFAULT NULL,
  `ID_Serie` int DEFAULT NULL,
  KEY `ID_Lista` (`ID_Lista`),
  KEY `ID_Filme` (`ID_Filme`),
  KEY `ID_Serie` (`ID_Serie`),
  CONSTRAINT `lista_conteudo_ibfk_1` FOREIGN KEY (`ID_Lista`) REFERENCES `lista` (`ID_Lista`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lista_conteudo_ibfk_2` FOREIGN KEY (`ID_Filme`) REFERENCES `filme` (`ID_Filme`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lista_conteudo_ibfk_3` FOREIGN KEY (`ID_Serie`) REFERENCES `serie` (`ID_Serie`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_conteudo`
--

LOCK TABLES `lista_conteudo` WRITE;
/*!40000 ALTER TABLE `lista_conteudo` DISABLE KEYS */;
INSERT INTO `lista_conteudo` VALUES (1,1,NULL),(1,3,NULL),(1,4,NULL),(2,4,NULL),(1,NULL,1),(2,3,NULL),(1,2,NULL),(2,2,NULL),(2,NULL,2),(2,NULL,3),(1,5,NULL),(1,6,NULL),(1,NULL,2),(1,NULL,3),(1,NULL,4),(1,NULL,5),(2,NULL,6);
/*!40000 ALTER TABLE `lista_conteudo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serie`
--

DROP TABLE IF EXISTS `serie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serie` (
  `ID_Serie` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(255) NOT NULL,
  `Temporadas` int NOT NULL,
  `Data_lancamento` date NOT NULL,
  PRIMARY KEY (`ID_Serie`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serie`
--

LOCK TABLES `serie` WRITE;
/*!40000 ALTER TABLE `serie` DISABLE KEYS */;
INSERT INTO `serie` VALUES (1,'Greys Anatomy ',21,'2005-03-27'),(2,'The Office ',9,'2005-03-24'),(3,'Supernatural ',15,'2005-09-13'),(4,'Friends ',10,'1994-09-22'),(5,'The Big Bang Theory',12,'2007-09-24'),(6,'The Boys',4,'2019-07-26');
/*!40000 ALTER TABLE `serie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ID_Usuario` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Data_Registro` date NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Andre Marques','andre@gmail','2020-01-27'),(2,'Marcelo','marcelo@gmail','2020-04-01');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-17 11:36:28
