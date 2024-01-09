-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: mysqldb.ct46mmkk43pm.us-east-2.rds.amazonaws.com    Database: petsdb
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adopters`
--

DROP TABLE IF EXISTS `adopters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adopters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contact` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adopters`
--

LOCK TABLES `adopters` WRITE;
/*!40000 ALTER TABLE `adopters` DISABLE KEYS */;
INSERT INTO `adopters` VALUES (1,'Alejandro Castrillón',NULL,NULL,'2023-12-29 17:08:39','2023-12-29 17:08:39'),(2,'z','z','z','2024-01-07 00:59:11','2024-01-07 00:59:11'),(3,'z','z','z','2024-01-07 01:00:42','2024-01-07 01:00:42'),(4,'y','y','y','2024-01-07 01:01:17','2024-01-07 01:01:17'),(5,'a','a','a','2024-01-07 01:08:50','2024-01-07 01:08:50'),(6,'b','b','b','2024-01-07 01:17:13','2024-01-07 01:17:13'),(7,'c','c','c','2024-01-07 01:18:58','2024-01-07 01:18:58'),(8,'d','d','d','2024-01-07 01:27:12','2024-01-07 01:27:12'),(9,'e','e','e','2024-01-07 01:38:13','2024-01-07 01:38:13'),(10,'e','e','e','2024-01-07 01:38:48','2024-01-07 01:38:48'),(11,'e','e','e','2024-01-07 01:39:00','2024-01-07 01:39:00'),(12,'f','f','f','2024-01-07 01:41:00','2024-01-07 01:41:00'),(13,'g','g','g','2024-01-07 01:44:40','2024-01-07 01:44:40'),(14,'h','h','h','2024-01-07 17:44:29','2024-01-07 17:44:29');
/*!40000 ALTER TABLE `adopters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adoption_requests`
--

DROP TABLE IF EXISTS `adoption_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adoption_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pet_id` int NOT NULL,
  `adopter_id` int NOT NULL,
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '2',
  `createdAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_pet_id` (`pet_id`),
  KEY `fk_adopter_id` (`adopter_id`),
  KEY `fk_status_id` (`status`),
  CONSTRAINT `fk_adopter_id` FOREIGN KEY (`adopter_id`) REFERENCES `adopters` (`id`),
  CONSTRAINT `fk_pet_id` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`),
  CONSTRAINT `fk_status_id` FOREIGN KEY (`status`) REFERENCES `adoption_statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoption_requests`
--

LOCK TABLES `adoption_requests` WRITE;
/*!40000 ALTER TABLE `adoption_requests` DISABLE KEYS */;
INSERT INTO `adoption_requests` VALUES (1,2,7,'4','2024-01-07 01:19:00','2024-01-07 01:33:16'),(2,20,8,'5','2024-01-07 01:27:15','2024-01-07 01:37:58'),(3,20,10,'2','2024-01-07 01:44:18','2024-01-07 01:44:18'),(4,5,12,'5','2024-01-07 01:44:41','2024-01-07 17:46:03'),(5,23,14,'4','2024-01-07 17:44:31','2024-01-07 17:46:29');
/*!40000 ALTER TABLE `adoption_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adoption_statuses`
--

DROP TABLE IF EXISTS `adoption_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adoption_statuses` (
  `id` char(1) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoption_statuses`
--

LOCK TABLES `adoption_statuses` WRITE;
/*!40000 ALTER TABLE `adoption_statuses` DISABLE KEYS */;
INSERT INTO `adoption_statuses` VALUES ('1','Available'),('2','In process'),('3','Adopted'),('4','Approved'),('5','Rejected');
/*!40000 ALTER TABLE `adoption_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_breeds`
--

DROP TABLE IF EXISTS `pet_breeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_breeds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_breeds`
--

LOCK TABLES `pet_breeds` WRITE;
/*!40000 ALTER TABLE `pet_breeds` DISABLE KEYS */;
INSERT INTO `pet_breeds` VALUES (1,'mixed-breed','Mocha is a sweet and affectionate furry friend looking for a forever home. When you first meet this playful pup or kitty, you\'ll be greeted with a wagging tail or welcoming purrs - Mocha loves making new friends! This happy boy or girl enjoys daily playtime and has plenty of energy to burn. Whether it\'s chasing balls, batting at toys, or just running around the yard, Mocha is always up for fun and games. At the end of an exciting day full of activity, Mocha will curl up on the couch or at the foot of the bed, ready for belly rubs and ear scratches. Nothing makes this lovable canine or feline happier than quality time with caring humans. Mocha\'s ideal home would provide lots of snuggles, pets, and lap naps. An experienced owner who can continue positive reinforcement training would be preferred. Mocha is eager to find a family to share life\'s adventures with - going for long walks or just relaxing at home. With proper introduction, this friendly boy or girl could potentially live with other pets. Mocha promises to return the love with puppy kisses or purring cuddles! Come meet this sweet dog or cat today!','0000-00-00 00:00:00','2024-01-04 23:25:07'),(2,'labrador','The Labrador Retriever is one of the most popular dog breeds in the world. They are friendly, energetic, and make great family pets. Labradors have a short, weather-resistant coat that comes in three colors: black, yellow, and chocolate. They are athletic dogs that need daily exercise and mental stimulation. Labradors are intelligent and eager to please, making them easy to train. However, without proper training and socialization, their exuberant nature can lead to behavior problems. Overall, Labrador Retrievers are loyal, affectionate companions that adapt well to many different lifestyles.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(3,'german shepherd','The German Shepherd is a highly intelligent and versatile working dog. They are the second most popular dog breed in the United States. German Shepherds are athletic, strong, and make excellent guard dogs and police dogs. However, they are also loyal family pets and get along well with children. They have a double-layer coat that sheds year round and requires frequent brushing. German Shepherds are protective of their family and territory, making socialization essential to avoid aggression toward strangers and other dogs. With proper training, these dogs can be calm, obedient companions. But their high energy and drive require an experienced owner willing to provide structure, exercise, and mental stimulation.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(4,'golden retriever','The Golden Retriever is one of the most popular family dogs. They have a friendly, eager-to-please temperament that makes them a joy to own. Golden Retrievers are intelligent and relatively easy to train. They love being around people and get along well with children and other pets. Golden Retrievers have a water-repellent double coat that comes in various shades of gold. They shed heavily year-round and require daily brushing. Golden Retrievers need at least 30-60 minutes of exercise per day. They enjoy activities like swimming, hiking, and playing fetch. Without enough physical and mental stimulation, Golden Retrievers may become destructive or hyperactive. Overall, these dogs thrive when treated as part of the family.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(5,'french bulldog','The French Bulldog is a fun-loving companion dog with a wrinkled face and bat-like ears. They are one of the most popular small dog breeds. French Bulldogs do not require a lot of exercise and adapt well to apartment living. They have a short, fine coat that is easy to groom. French Bulldogs are known for being affectionate lap dogs but also have a playful, mischievous side. They can be stubborn but are usually eager to please their owners. French Bulldogs are prone to heatstroke and breathing problems due to their pushed-in faces. Potential owners should be prepared for snoring and slobbering. With their charming and amusing personality, the French Bulldog makes a great family pet for experienced dog owners.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(6,'beagle','The Beagle is a merry and energetic hound dog breed. Their most distinctive features are their tri-colored coat, muscled body, and short legs. Beagles are intelligent but can be difficult to train due to their strong will and wandering instincts. They require patient, reward-based training. Beagles are pack animals and thrive on companionship. They get along very well with children and other dogs. A bored Beagle will become destructive and noisy. They need substantial daily exercise and mental stimulation. Beagles also have a tendency to follow their noses, so secure fencing is a must. Overall, Beagles make friendly, playful pets for active families.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(7,'rottweiler','The Rottweiler is a robust working breed of dog that originated in Germany. Rottweilers have a powerful, muscular build with a thick, black coat and rust-colored markings on their face, paws and chest. They are known for being protective, obedient, and eager to work. With proper socialization and training, Rottweilers can make great guard dogs, police dogs, service dogs and devoted family companions. However, their size and strength require an experienced owner. Rottweilers need extensive obedience training and do best with a job to do. They have high exercise needs and tend to be reserved with strangers. Rottweilers can become destructive and aggressive without enough stimulation and leadership. Overall, these dogs are loyal companions for the right owner.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(8,'yorkshire terrier','The Yorkshire Terrier, or Yorkie, is one of the most popular toy dog breeds. Weighing under 7 pounds, Yorkies are affectionate, spunky, and tomboyish. They have a long, silky coat that requires daily brushing to prevent tangles and mats. Yorkies are highly energetic and love to play. They can be yappy but also make great watchdogs. Yorkies are intelligent and respond well to reward-based training. However, their small size makes them fragile, so they need gentle handling and supervision around small children. Yorkies are adaptable to many living situations, including apartments. They thrive on being close to their owners. Overall, Yorkies make charming, entertaining companion dogs.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(9,'boxer','The Boxer is an energetic, medium-sized breed. They were originally developed in Germany as guard dogs and hunters. Today, Boxers are popular family pets, guide dogs, and police dogs. They have a powerful, muscular build and a short, shiny coat that requires minimal grooming. Boxers are active, playful dogs that thrive on human companionship. They are patient and protective with children. Boxers are intelligent but can be headstrong. Consistent, positive training is important. Boxers need at least an hour of exercise daily. Without enough activity, they may become mischievous or high-strung. Their shortened muzzles make them prone to overheating. Overall, Boxers make loyal guardians and lively playmates for active households.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(10,'dachshund','The Dachshund is a lively breed with a long body and short legs. Dachshunds were originally bred in Germany to hunt badgers and other small prey. Today they are popular family pets and show dogs. Dachshunds are playful, but also bold and stubborn. They require patient, consistent training. With early socialization, Dachshunds get along well with children and other pets. Their long backs make them prone to disc problems, so activities like jumping should be avoided. Dachshunds have moderate exercise needs and adapt well to apartment living. Their smooth, long coat requires minimal grooming. Overall, Dachshunds are amusing companions when treated as family members.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(11,'pembroke welsh corgi','The Pembroke Welsh Corgi is an active herding breed that originated in Wales. They have a fox-like head, alert ears, and a short, sturdy body. Corgis are very smart and eager to please but can be strong-willed. Positive reinforcement training is highly recommended. Corgis are energetic dogs that need daily exercise, like brisk walks or playing fetch. They enjoy being around people and get along well with other pets when socialized properly. Corgis have weather-resistant coats that shed heavily year-round. Their long bodies are prone to back problems if allowed to jump excessively. Overall, Corgis are upbeat, family-friendly pets for active owners.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(12,'great dane','The Great Dane is a giant dog breed known for its imposing size and gentle temperament. Great Danes are loyal, patient companions that get along well with children and other pets. They have a short, easy-care coat that needs minimal grooming. Great Danes are generally friendly toward strangers, making them poor guard dogs. They are relatively inactive indoors but enjoy brisk daily walks. Great Danes are prone to health issues like hip dysplasia due to their rapid growth rate and size. Potential owners should be prepared to deal with their considerable food consumption and veterinary costs. With proper training and socialization, Great Danes can make calm, dignified pets.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(13,'siberian husky','The Siberian Husky is a medium-sized sled dog renowned for its endurance, speed, and striking coat. Huskies have a wolf-like appearance but a very friendly, gentle temperament. They are athletic, energetic, and thrive on human companionship. Huskies are pack animals and need frequent interaction with people or other dogs. They cannot be left alone for long periods. Huskies have thick double coats that keep them cool in summer and warm in winter. Their coats require weekly brushing to minimize shedding. Without proper training, Huskies can be challenging to manage due to their high energy and strong prey drive. Overall, this breed makes an affectionate pet for active households.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(14,'australian shepherd','The Australian Shepherd is an intelligent, high energy herding breed. Aussies have a medium-length coat that comes in a variety of colors like black, red, and blue merle. They require frequent brushing and shedding is constant. Aussies are lively, good-natured companions that thrive when challenged both physically and mentally. They excel at canine sports like agility and flyball. Aussies are protective of their home and family. Early socialization and obedience training are essential. Without a job to do, Aussies easily become bored and destructive. Daily exercise and interaction are a must for this breed. Overall, Aussies make devoted, energetic pets for active households.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(15,'shih tzu','The Shih Tzu is an affectionate toy dog breed with a long, flowing coat. Shih Tzus are lively, devoted companions that thrive on human contact. They are intelligent but can be stubborn to train. Positive reinforcement works best. Shih Tzus adapt well to apartment living with daily walks. Their long coat requires extensive grooming to keep it free of tangles and mats. Shih Tzus are relatively inactive indoors. They make excellent therapy dogs due to their calm, trusting nature. Shih Tzus also get along well with other pets and children. Overall, this breed makes a gentle, low-maintenance pet for those who enjoy pampering a furry friend.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(16,'miniature schnauzer','The Miniature Schnauzer is a small terrier breed with a wiry coat and bushy beard. Mini Schnauzers are energetic, affectionate dogs that thrive on human companionship. They are smart and usually eager to please, though they can be stubborn. Mini Schnauzers are spirited and alert watchdogs that bark at any disturbance. They get along well with children and do fine with other pets when socialized properly. Mini Schnauzers need at least 30 minutes of exercise daily, like brisk walks or playing fetch. Their wiry coat requires frequent brushing and trimming. Overall, this breed makes a fun-loving and lively pet for those who can provide consistent training, activity, and grooming.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(17,'maine coon','The Maine Coon is a large, rugged cat breed renowned for its intelligence and hunting skills. Maine Coons have a distinctive physical appearance with a long, shaggy coat, tufted ears, and a long, bushy tail. Their water-resistant coat comes in many colors and patterns but requires frequent grooming to prevent matting. Maine Coons are known for their friendly, social personalities. They enjoy playing games and have an endearing habit of trilling when happy. Maine Coons are adaptable to many lifestyles but require daily exercise and stimulation. They are intelligent and can be trained to walk on a leash, play fetch, and learn tricks. Overall, the Maine Coon makes an affectionate, family-friendly pet for those willing to maintain its high-maintenance coat.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(18,'persian','The Persian cat is a longhaired breed known for its beautiful coat and sweet personality. Persians have a rounded head, short legs, and a plumed tail. Their long, flowing coat requires daily grooming to prevent matting and shedding. Persians tend to be quiet, gentle cats that thrive on affection. They adapt well to indoor living and get along with other pets and children. Persians are not very active but enjoy short play sessions with toys or teaser wands. Their flat faces make them prone to respiratory problems. Owners should be prepared for extensive grooming needs and potential health issues. For those wanting a beautiful yet docile lap cat, the Persian is an excellent choice.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(19,'siamese','The Siamese cat is a vocal, affectionate breed known for its distinctive coloring and striking blue eyes. Siamese cats are highly active and social. They form strong bonds with their owners and crave attention and play. Siamese are very intelligent and can learn tricks or even walk on a leash. Their short, fine coat requires little maintenance. Siamese are prone to behavioral problems like aggression or separation anxiety if left alone frequently. They thrive in an active household that can provide ample interaction and stimulation. With proper training and activity, Siamese cats make endearing, conversational pets.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(20,'abyssinian','The Abyssinian is an active, intelligent cat breed with a distinctly ticked coat. Abyssinians are curious, playful cats that thrive when kept busy. They love to climb, explore new areas, and play fetch. Abyssinians are highly social and form close bonds with their families. They get along well with other pets and children. Abyssinians have a medium-length coat that requires weekly grooming. They are well-suited for active households that can provide ample playtime and environmental enrichment. With proper care and training, Abyssinians make loyal, entertaining companions.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(21,'ragdoll','The Ragdoll is a large, laidback breed known for its soft, silky coat and tendency to go limp when held. Ragdolls are gentle, quiet cats that thrive on human bonding. They enjoy being carried and cuddled. Ragdolls get along very well with children and other pets. They adapt well to indoor living as long as they receive daily playtime and affection. Ragdolls have semi-long coats that require regular brushing to prevent matting. They are not overly active but enjoy playing with toys. Overall, Ragdolls make ideal pets for families seeking an easygoing, fluffy feline companion.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(22,'scottish fold','The Scottish Fold cat is known for its adorably folded ears and rounded head. Scottish Folds have a medium-length coat that sheds moderately. Their calm, loyal personality makes them ideal lap cats and family pets. Scottish Folds enjoy human interaction but are generally quiet and easygoing. They adapt well to apartment living as long as their moderate exercise needs are met through playtime and environmental enrichment. Owners should be aware of potential joint problems associated with the gene that causes folded ears. Overall, Scottish Folds are sweet, affectionate cats that thrive when treated as part of the family.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(23,'sphynx','The Sphynx is a hairless cat breed known for its svelte body, large ears, and lack of any coat. Sphynxes have soft, wrinkled skin that requires regular cleaning. They are energetic, affectionate cats that crave human interaction. Sphynxes love to cuddle and often sleep under the covers. They thrive in warm environments and may need to wear sweaters in cold weather. Sphynxes are highly intelligent and can learn tricks or walk on a leash. Their high energy requires lots of playtime and environmental enrichment. For those seeking a quirky, hairless feline companion, the Sphynx makes an endearing pet.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(24,'bengal','The Bengal cat is a hybrid breed known for its exotic spotted or marbled coat. Bengals are highly active and vocal cats that thrive when given plenty of playtime and environmental enrichment. They love climbing, playing fetch, and learning tricks. Bengals are very social and become strongly attached to their families. With early socialization, they get along well with other pets and children. Their short, soft coat requires weekly brushing. Bengals need an active household that can keep them engaged. For experienced owners, Bengals make fun, devoted companions.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(25,'domestic shorthair','The domestic shorthair is the most common house cat breed. They are well-rounded felines that adapt to any home environment. Domestic shorthairs display a wide range of coat colors and patterns. They have an easy-care, short coat that requires weekly brushing. Domestic shorthairs are generally healthy, energetic cats. They are affectionate companions that enjoy attention but are also content entertaining themselves. With proper enrichment and socialization, domestic shorthairs thrive in any household.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(26,'domestic longhair','The domestic longhair is a breed of house cat characterized by its medium to long coat. They come in a vast array of colors and patterns. Domestic longhairs tend to be calm, gentle cats that enjoy being petted. They are lower maintenance than their coat length implies, only needing weekly brushing to minimize shedding and prevent matting. Domestic longhairs make excellent pets for any family or individual looking for an adaptable, loving feline companion. Their laidback personality suits relaxed households, but they also enjoy playing with toys and learning tricks.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(27,'russian blue','The Russian Blue is a sweet-tempered breed known for its distinctive gray coat and brilliant green eyes. Russian Blues are intelligent, playful cats that form strong bonds with their owners. They thrive on interaction and playtime but are also content relaxing on a lap. Russian Blues have plush, silvery coats that shed minimally and require weekly brushing. They are gentle, quiet cats that get along well with children and other pets. Owners appreciate the Russian Blue for its devotion, sensitivity, and willingness to stay close by. This breed makes an exceptionally loving yet undemanding companion.','0000-00-00 00:00:00','2024-01-01 22:00:30'),(28,'norwegian forest','The Norwegian Forest Cat is a large, semi-longhaired breed adapted to a cold climate. They have a thick, water-resistant coat, large tufted ears, and a long, bushy tail. Norwegian Forest Cats are energetic, intelligent cats that enjoy playing and climbing. They bond closely with their families but can be cautious around strangers. Their coat requires weekly brushing to minimize shedding and prevent matting. Norwegian Forest Cats thrive when provided ample vertical space and opportunities for enrichment. With their loving personality and adaptability, they make great family pets for active households.','0000-00-00 00:00:00','2024-01-03 00:05:29');
/*!40000 ALTER TABLE `pet_breeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_genders`
--

DROP TABLE IF EXISTS `pet_genders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_genders` (
  `id` char(1) NOT NULL,
  `description` varchar(7) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_genders`
--

LOCK TABLES `pet_genders` WRITE;
/*!40000 ALTER TABLE `pet_genders` DISABLE KEYS */;
INSERT INTO `pet_genders` VALUES ('F','Female'),('M','Male'),('U','Unknown');
/*!40000 ALTER TABLE `pet_genders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_types`
--

DROP TABLE IF EXISTS `pet_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_types` (
  `id` char(1) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_types`
--

LOCK TABLES `pet_types` WRITE;
/*!40000 ALTER TABLE `pet_types` DISABLE KEYS */;
INSERT INTO `pet_types` VALUES ('C','Cat'),('D','Dog');
/*!40000 ALTER TABLE `pet_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` char(1) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `gender` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'U',
  `age` float DEFAULT '0',
  `breed` int NOT NULL DEFAULT '1',
  `photo_url` text COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `adoption_status` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  `createdAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_pet_type` (`type`),
  KEY `fk_adoption_status_id` (`adoption_status`),
  CONSTRAINT `fk_adoption_status_id` FOREIGN KEY (`adoption_status`) REFERENCES `adoption_statuses` (`id`),
  CONSTRAINT `fk_pet_type` FOREIGN KEY (`type`) REFERENCES `pet_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (1,'C','Fluffy','F',1,17,'https://www.ellevetsciences.com/wp-content/uploads/2022/08/ev-blog-mainecoon-header-1024x683.jpg','Affectionate, loyal \"gentle giant\" cats. Playful and adaptable, with a loving personality.','1','2023-12-11 17:12:49','2024-01-04 22:58:30'),(2,'D','Buddy','M',3,2,'https://i2.wp.com/2.bp.blogspot.com/-JuFUNFi4wyA/ViWSGB8OPyI/AAAAAAAAAAg/7AmqUmvKRtw/s1600/labrador6.jpg','Energetic young Lab who enjoys playing fetch and learning new tricks. Friendly and loves attention.','3','2023-12-11 17:12:56','2024-01-07 01:33:16'),(3,'C','Max','M',1,18,'https://www.hepper.com/wp-content/uploads/2021/07/Beautiful-persian-cream-colorpoint-cat-whith-blue-eyes_Dorottya-Mathe_shutterstock.jpg','Sweet, docile cats known for their beautiful flowing coats. Gentle and serene. Require daily grooming.','1','2023-12-11 17:12:49','2024-01-04 23:45:31'),(4,'D','Lucy','F',4,3,'https://cdn.britannica.com/79/232779-004-9EBC7CB8/German-Shepherd-dog-Alsatian.jpg','Young female German Shepherd, very smart and eager to please. Would do well with training and an active family.','1','2023-12-11 17:12:56','2024-01-04 23:01:54'),(5,'C','Charlie','M',2,19,'https://assets.elanco.com/8e0bf1c2-1ae4-001f-9257-f2be3c683fb1/fca42f04-2474-4302-a238-990c8aebfe8c/Siamese_cat_1110x740.jpg','Vocal, outgoing cats who bond strongly with their person. Intelligent and playful. Love to be involved in everything.','1','2023-12-11 17:12:49','2024-01-07 17:46:03'),(6,'D','Teddy','M',3,4,'https://www.rover.com/blog/wp-content/uploads/2020/06/Golden-Retriever-2.jpg','Sweet senior Retriever looking for a calm quiet home to spend her golden years. Loves napping and cuddling.','1','2023-12-11 17:12:56','2024-01-04 23:46:53'),(7,'C','Bella','F',1,20,'https://animal-world.com/wp-content/uploads/2023/08/Abyssinian-cat-in-the-kitchen_Ingus-Kruklitis_Shutterstock.jpg','Energetic and curious. Need interactive play and exercise. Intelligent and mischievous but loving.','1','2023-12-11 17:12:49','2024-01-04 22:58:30'),(8,'D','Rocky','M',2,5,'https://www.akc.org/wp-content/uploads/2017/11/French-Bulldog-standing-outdoors.jpg','Playful and charming \"Frenchie\" with a silly personality. Loves being the center of attention and entertaining their humans. Requires minimal exercise.','1','2023-12-11 17:12:56','2024-01-04 22:58:17'),(9,'C','Lola','F',3,21,'https://clubcatt.com/cdn/shop/articles/ragdoll-cat-breed.webp?v=1691442856&width=1100','Affectionate, laid-back cats. Go limp when held. Love human companionship. Playful and gentle.','1','2023-12-11 17:12:49','2024-01-04 23:41:36'),(10,'D','Coco','M',1,6,'https://www.zooplus.es/magazine/wp-content/uploads/2017/10/Beagle-1.jpeg','Happy little Beagle mix who loves playing and going for long walks. Very friendly with people and other dogs.','1','2023-12-11 17:12:56','2024-01-04 23:41:43'),(11,'C','Molly','F',2,22,'https://www.tiendanimal.es/articulos/wp-content/uploads/2022/01/Scottish-Fold-raza-1200x900.jpg','Sweet, calm cats known for folded ears. Loyal and loving lap cats. Get along well with children and other pets.','1','2023-12-11 17:12:49','2024-01-04 23:47:00'),(12,'D','Milo','M',4,7,'https://cdn.britannica.com/69/234469-050-B883797B/Rottweiler-dog.jpg','Confident guardian breed who is loyal and protective of family. Needs consistent training and early socialization. Enjoys learning and mental stimulation.','1','2023-12-11 17:12:56','2024-01-04 22:58:17'),(13,'C','Daisy','F',1,23,'https://hips.hearstapps.com/hmg-prod/images/hairless-cat-breeds-1567008459.jpg',' Active, silly hairless cats who love cuddling and feeling warm. Outgoing and demanding of attention. Need bathing and warmth.','1','2023-12-11 17:12:49','2024-01-04 22:58:30'),(14,'D','Bailey','M',3,8,'https://img.lalr.co/cms/2023/05/24132955/istockphoto-1328221872-612x612-1.jpg?w=728','Feisty and affectionate small companion. Loves lots of lap time and being with their person. Confident and curious. Makes a great alert watchdog.','1','2023-12-11 17:12:56','2024-01-04 22:58:17'),(15,'C','Sophie','F',2,24,'https://cats.com/wp-content/uploads/2020/10/Bengal-cat-like-a-leopard-sneaks.jpg','Intelligent, energetic cats who love interactive play. Have a wild appearance but are affectionate pets. Need exercise and stimulation.','1','2023-12-11 17:12:49','2024-01-04 22:58:30'),(16,'D','Sadie','F',4,9,'https://cdn.britannica.com/46/233846-050-8D30A43B/Boxer-dog.jpg','Adult female boxer, energetic and needs daily exercise. Friendly and playful once exercised. Enjoys training and learning tricks.','1','2023-12-11 17:12:56','2024-01-04 23:01:54'),(17,'C','Ruby','F',1,25,'https://scrumbles.co.uk/cdn/shop/articles/domestic-shorthair-cat.jpg?v=1683901253','Well-rounded mixed breed cats. Tend to be social, playful and affectionate. Make great family pets.','1','2023-12-11 17:12:49','2024-01-04 23:48:39'),(18,'D','Tucker','M',3,10,'https://cdn.britannica.com/14/234214-050-70C6ACDD/dachshund-dog-long-doat.jpg','Sweet senior Dachshund. Quiet low energy. Loves napping and belly rubs. Gentle and calm.','1','2023-12-24 18:05:09','2024-01-04 23:48:48'),(19,'C','Zoe','F',2,26,'https://cf.ltkcdn.net/cats/cat-breeds/images/std-xs/325731-340x226-norwegian-forest-cat.jpg','Mixed breed cats with longer fur. Gentle, calm personalities. Require regular grooming. Loyal and loving.','1','2023-12-24 18:05:42','2024-01-04 23:49:04'),(20,'D','Oscar','M',1,11,'https://www.akc.org/wp-content/uploads/2017/11/Pembroke-Welsh-Corgi-standing-outdoors-in-the-fall.jpg','Male Corgi, playful and silly. Loves treats, belly rubs, and going for rides in the car.','2','2023-12-24 18:06:20','2024-01-07 01:44:18'),(21,'C','Michi','F',6,27,'https://www.zooplus.co.uk/magazine/wp-content/uploads/2018/03/russian-blue.jpg','Elegant, reserved cats who bond closely with their families. Even-tempered and quiet. Known for plush grey-blue coats.','1','2023-12-24 18:06:52','2024-01-04 22:58:30'),(22,'D','Boby','M',1,12,'https://cdn-images.vetstreet.com/46/2d1f90a0d711e0a2380050568d634f/file/Great-Danes-3-645mk062111.jpg','Gentle giant breed who thinks they are a lapdog. Patient and loving with family, especially children. Require regular exercise and training due to large size.','1','2023-12-24 18:09:17','2024-01-04 23:44:32'),(23,'D','Luna','F',5,13,'https://cdn.britannica.com/84/232784-050-1769B477/Siberian-Husky-dog.jpg','Young female husky. Beautiful and energetic. Needs consistent training and daily exercise. Quite vocal and talkative.','3','2023-12-24 18:09:31','2024-01-07 17:46:29'),(24,'C','cato','M',7,28,'https://www.animalfunfacts.net/images/stories/pets/cats/norwegian_forest_cat_fur_l.jpg','Large, athletic build for climbing and hunting. Intelligent and energetic but very affectionate. Develop strong bonds with owners.','1','2023-12-27 01:51:23','2024-01-04 22:58:17');
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-09 15:15:00
