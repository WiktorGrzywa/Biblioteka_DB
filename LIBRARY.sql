-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: bibioteka
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `czytelnicy`
--

DROP TABLE IF EXISTS `czytelnicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `czytelnicy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imie` varchar(40) DEFAULT NULL,
  `nazwisko` varchar(60) DEFAULT NULL,
  `plec` varchar(10) DEFAULT NULL,
  `data_urodzenia` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `czytelnicy`
--

LOCK TABLES `czytelnicy` WRITE;
/*!40000 ALTER TABLE `czytelnicy` DISABLE KEYS */;
INSERT INTO `czytelnicy` VALUES (1,'Tomasz','Łupka','M','1989-11-02'),(2,'Daria','Zielińska','K','1994-07-29'),(3,'Maria','Lewska','K','1964-05-24'),(4,'Tomasz','Łupka','M','1989-11-02'),(5,'Maria','Lewska','K','1964-05-24'),(6,'Krzysztof','Andrzejewski','M','1987-04-14'),(7,'Małgorzata','Gorzewska','K','1994-07-29'),(8,'Piotr','Nowak','M','1990-09-30'),(9,'Wanda','Niska','K','1968-03-24'),(10,'Patryk','Kowalski','M','2001-12-20'),(11,'Karolina','Busko','K','1993-05-17'),(12,'Grzegorz','Zawada','M','1983-06-12'),(13,'Bożena','Dromska','K','1964-08-01'),(14,'Dorota','Kowalczuk','K','1979-02-27'),(15,'Damian','Gajos','M','1991-08-19'),(16,'Marcin','Kalinowski','M','1980-04-12'),(17,'Paweł','Urban','M','2000-10-22'),(18,'Renata','Pawłowska','K','1977-01-13');
/*!40000 ALTER TABLE `czytelnicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kary`
--

DROP TABLE IF EXISTS `kary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wypozyczenie_id` int DEFAULT NULL,
  `typ_kary_id` int DEFAULT NULL,
  `kwota` double DEFAULT NULL,
  `opis` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wypozyczenie_id` (`wypozyczenie_id`),
  KEY `typ_kary_id` (`typ_kary_id`),
  CONSTRAINT `kary_ibfk_1` FOREIGN KEY (`wypozyczenie_id`) REFERENCES `wypozyczenia` (`id`),
  CONSTRAINT `kary_ibfk_2` FOREIGN KEY (`typ_kary_id`) REFERENCES `typy_kar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kary`
--

LOCK TABLES `kary` WRITE;
/*!40000 ALTER TABLE `kary` DISABLE KEYS */;
INSERT INTO `kary` VALUES (1,4,1,3.45,NULL),(2,4,1,3.45,NULL),(3,8,2,10,NULL),(4,11,3,45.99,NULL);
/*!40000 ALTER TABLE `kary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategorie`
--

DROP TABLE IF EXISTS `kategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategorie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategorie`
--

LOCK TABLES `kategorie` WRITE;
/*!40000 ALTER TABLE `kategorie` DISABLE KEYS */;
INSERT INTO `kategorie` VALUES (1,'obyczajowa'),(2,'psychologiczna'),(3,'poradnik'),(4,'kryminał'),(5,'horror'),(6,'popularno-naukowa'),(7,'romans');
/*!40000 ALTER TABLE `kategorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ksiazki`
--

DROP TABLE IF EXISTS `ksiazki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ksiazki` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(255) NOT NULL,
  `ilosc_stron` int DEFAULT NULL,
  `kategoria_id` int DEFAULT NULL,
  `autor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kategoria_id` (`kategoria_id`),
  CONSTRAINT `ksiazki_ibfk_1` FOREIGN KEY (`kategoria_id`) REFERENCES `kategorie` (`id`),
  CONSTRAINT `ksiazki_ibfk_2` FOREIGN KEY (`kategoria_id`) REFERENCES `kategorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ksiazki`
--

LOCK TABLES `ksiazki` WRITE;
/*!40000 ALTER TABLE `ksiazki` DISABLE KEYS */;
INSERT INTO `ksiazki` VALUES (1,'Bieguni',834,1,'Tokarczuk'),(2,'Duchowe Życie Zwierząt',412,6,'Wohlleben'),(3,'Kasacja',456,4,'Mróz'),(4,'Czysty kod',287,3,'Martin'),(5,'Udręka i Ekstaza',1023,2,'Stone'),(6,'Stan Futbolu',324,6,'Stanowski'),(7,'Grecy Umierają w Domu',276,1,'Klimko-Dobrzaniecki'),(8,'Neapol',184,3,'Various authors'),(9,'Rewizja',457,4,'Mróz'),(10,'To',1248,5,'King');
/*!40000 ALTER TABLE `ksiazki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typy_kar`
--

DROP TABLE IF EXISTS `typy_kar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typy_kar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typy_kar`
--

LOCK TABLES `typy_kar` WRITE;
/*!40000 ALTER TABLE `typy_kar` DISABLE KEYS */;
INSERT INTO `typy_kar` VALUES (1,'po terminie'),(2,'uszkodzenie'),(3,'zniszczenie');
/*!40000 ALTER TABLE `typy_kar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wypozyczenia`
--

DROP TABLE IF EXISTS `wypozyczenia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wypozyczenia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ksiazka_id` int DEFAULT NULL,
  `czytelnik_id` int DEFAULT NULL,
  `data_zwrotu` date DEFAULT NULL,
  `data_wypozyczenia` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ksiazka_id` (`ksiazka_id`),
  KEY `czytelnik_id` (`czytelnik_id`),
  CONSTRAINT `wypozyczenia_ibfk_1` FOREIGN KEY (`ksiazka_id`) REFERENCES `ksiazki` (`id`),
  CONSTRAINT `wypozyczenia_ibfk_2` FOREIGN KEY (`czytelnik_id`) REFERENCES `czytelnicy` (`id`),
  CONSTRAINT `wypozyczenia_ibfk_3` FOREIGN KEY (`ksiazka_id`) REFERENCES `ksiazki` (`id`),
  CONSTRAINT `wypozyczenia_ibfk_4` FOREIGN KEY (`czytelnik_id`) REFERENCES `czytelnicy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wypozyczenia`
--

LOCK TABLES `wypozyczenia` WRITE;
/*!40000 ALTER TABLE `wypozyczenia` DISABLE KEYS */;
INSERT INTO `wypozyczenia` VALUES (1,3,2,NULL,'2022-02-01'),(2,5,4,'2022-02-13','2022-02-01'),(3,2,5,NULL,'2022-02-01'),(4,4,1,'2022-02-13','2022-02-01'),(5,6,1,'2022-02-11','2022-02-01'),(6,7,2,'2022-02-11','2022-02-01'),(7,8,3,'2022-02-11','2022-02-01'),(8,9,4,'2022-02-10','2022-02-02'),(9,1,5,NULL,'2022-02-03'),(10,2,6,NULL,'2022-02-03'),(11,3,7,NULL,'2022-02-03'),(12,4,8,NULL,'2022-02-03'),(13,5,9,NULL,'2022-02-03'),(14,6,10,NULL,'2022-02-03'),(15,7,11,NULL,'2022-02-03'),(16,8,12,NULL,'2022-02-03');
/*!40000 ALTER TABLE `wypozyczenia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-19 14:07:45
