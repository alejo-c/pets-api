-- Table structure for table `adopters`

DROP TABLE IF EXISTS `adopters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adopters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table `adopters`

/*!40000 ALTER TABLE `adopters` DISABLE KEYS */;
INSERT INTO `adopters` VALUES (1,'Alejandro Rodriguez','123 Main Street, City, Country','+123 456 7890','2023-12-15 21:27:28','2023-12-15 21:27:28'),(2,'Sofia Martinez','456 Park Avenue, Town, Country','+987 654 3210','2023-12-15 21:27:28','2023-12-15 21:27:28'),(3,'Carlos Gonzalez','789 Oak Street, Village, Country','+543 210 6789','2023-12-15 21:27:28','2023-12-15 21:27:28'),(4,'Isabella Silva','101 Pine Lane, City, Country','+876 543 2109','2023-12-15 21:27:28','2023-12-15 21:27:28'),(5,'Mateo Ramirez','202 Elm Road, Town, Country','+109 876 5432','2023-12-15 21:27:28','2023-12-15 21:27:28'),(6,'Valentina Lopez','303 Maple Court, Village, Country','+234 567 8901','2023-12-15 21:27:28','2023-12-15 21:27:28'),(7,'Diego Hernandez','404 Cedar Drive, City, Country','+876 543 2109','2023-12-15 21:27:28','2023-12-15 21:27:28'),(8,'Camila Perez','505 Birch Street, Town, Country','+987 654 3210','2023-12-15 21:27:28','2023-12-15 21:27:28'),(9,'Nicolas Castro','606 Willow Lane, Village, Country','+123 456 7890','2023-12-15 21:27:28','2023-12-15 21:27:28'),(10,'Mariana Flores','707 Redwood Road, City, Country','+210 678 5432','2023-12-15 21:27:28','2023-12-15 21:27:28');
/*!40000 ALTER TABLE `adopters` ENABLE KEYS */;

-- Table structure for table `adoption_requests`

DROP TABLE IF EXISTS `adoption_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adoption_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pet_id` int(11) NOT NULL,
  `adopter_id` int(11) NOT NULL,
  `status` char(1) NOT NULL DEFAULT '2',
  `createdAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_pet_id` (`pet_id`),
  KEY `fk_adopter_id` (`adopter_id`),
  KEY `fk_status_id` (`status`),
  CONSTRAINT `fk_adopter_id` FOREIGN KEY (`adopter_id`) REFERENCES `adopters` (`id`),
  CONSTRAINT `fk_pet_id` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`),
  CONSTRAINT `fk_status_id` FOREIGN KEY (`status`) REFERENCES `adoption_statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table `adoption_requests`

/*!40000 ALTER TABLE `adoption_requests` DISABLE KEYS */;
INSERT INTO `adoption_requests` VALUES (1,1,1,'2','2023-12-15 21:35:54','2023-12-15 21:35:54'),(2,2,2,'4','2023-12-15 21:35:54','2023-12-15 22:57:16'),(3,3,3,'2','2023-12-15 21:35:54','2023-12-15 21:35:54'),(4,4,4,'4','2023-12-15 21:35:54','2023-12-15 22:57:16'),(5,5,5,'5','2023-12-15 21:35:54','2023-12-15 22:56:56'),(6,6,6,'4','2023-12-15 21:35:54','2023-12-15 21:35:54'),(7,7,7,'5','2023-12-15 21:35:54','2023-12-15 21:35:54'),(8,8,8,'4','2023-12-15 21:35:54','2023-12-15 22:57:16'),(9,9,9,'5','2023-12-15 21:35:54','2023-12-15 22:56:56'),(10,10,10,'2','2023-12-15 21:35:54','2023-12-15 21:35:54');
/*!40000 ALTER TABLE `adoption_requests` ENABLE KEYS */;

-- Table structure for table `adoption_statuses`

DROP TABLE IF EXISTS `adoption_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adoption_statuses` (
  `id` char(1) NOT NULL,
  `description` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table `adoption_statuses`

/*!40000 ALTER TABLE `adoption_statuses` DISABLE KEYS */;
INSERT INTO `adoption_statuses` VALUES ('1','Available'),('2','In process'),('3','Adopted'),('4','Approved'),('5','Rejected');
/*!40000 ALTER TABLE `adoption_statuses` ENABLE KEYS */;

-- Table structure for table `pet_types`

DROP TABLE IF EXISTS `pet_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_types` (
  `id` char(1) NOT NULL,
  `description` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table `pet_types`

/*!40000 ALTER TABLE `pet_types` DISABLE KEYS */;
INSERT INTO `pet_types` VALUES ('C','Cat'),('D','Dog');
/*!40000 ALTER TABLE `pet_types` ENABLE KEYS */;

-- Table structure for table `pets`

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(1) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `adoption_status` char(1) NOT NULL DEFAULT '1',
  `createdAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_pet_type` (`type`),
  KEY `fk_adoption_status_id` (`adoption_status`),
  CONSTRAINT `fk_adoption_status_id` FOREIGN KEY (`adoption_status`) REFERENCES `adoption_statuses` (`id`),
  CONSTRAINT `fk_pet_type` FOREIGN KEY (`type`) REFERENCES `pet_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table `pets`

/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (1,'D','Fluffy',1,'2','2023-12-11 17:12:49','2023-12-16 19:14:21'),(2,'D','Buddy',3,'3','2023-12-11 17:12:56','2023-12-15 22:59:51'),(3,'C','Max',1,'2','2023-12-11 17:12:49','2023-12-15 22:59:04'),(4,'D','Lucy',4,'3','2023-12-11 17:12:56','2023-12-15 22:59:51'),(5,'C','Charlie',2,'1','2023-12-11 17:12:49','2023-12-11 22:53:29'),(6,'D','Molly',3,'3','2023-12-11 17:12:56','2023-12-15 22:59:51'),(7,'C','Bella',1,'1','2023-12-11 17:12:49','2023-12-11 17:12:49'),(8,'D','Rocky',2,'3','2023-12-11 17:12:56','2023-12-15 22:59:51'),(9,'C','Coco',3,'1','2023-12-11 17:12:49','2023-12-11 17:12:49'),(10,'D','Lola',1,'2','2023-12-11 17:12:56','2023-12-15 22:59:04'),(11,'C','Teddy',2,'1','2023-12-11 17:12:49','2023-12-11 17:12:49'),(12,'D','Milo',4,'1','2023-12-11 17:12:56','2023-12-11 17:12:56'),(13,'C','Daisy',1,'1','2023-12-11 17:12:49','2023-12-11 17:12:49'),(14,'D','Bailey',3,'1','2023-12-11 17:12:56','2023-12-11 17:12:56'),(15,'C','Sophie',2,'1','2023-12-11 17:12:49','2023-12-11 17:12:49'),(16,'D','Sadie',4,'1','2023-12-11 17:12:56','2023-12-11 17:12:56'),(17,'C','Tucker',1,'1','2023-12-11 17:12:49','2023-12-11 17:12:49'),(24,'D','Luna',1,'1','2023-12-16 18:26:03','2023-12-16 18:26:03'),(25,'C','Michi',2,'1','2023-12-16 18:36:01','2023-12-16 18:36:01');
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
