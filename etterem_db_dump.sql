/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: etterem_db
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0ubuntu0.24.04.1

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
-- Table structure for table `Allergens`
--

DROP TABLE IF EXISTS `Allergens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Allergens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Allergens`
--

LOCK TABLES `Allergens` WRITE;
/*!40000 ALTER TABLE `Allergens` DISABLE KEYS */;
INSERT INTO `Allergens` VALUES
(5,'Glutén','A'),
(6,'Rákfélék','B'),
(7,'Tojás','C'),
(8,'Hal','D'),
(9,'Földimogyoró','E'),
(10,'Szójabab','F'),
(11,'Tej / laktóz','G'),
(12,'Diófélék','H'),
(13,'Zeller','L'),
(14,'Mustár','M'),
(15,'Szezámmag','N'),
(16,'Kén-dioxid / szulfit','O'),
(17,'Csillagfürt','P'),
(18,'Puhatestűek','R');
/*!40000 ALTER TABLE `Allergens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categories` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` VALUES
('10','Sörök'),
('11','Égetett szeszek & koktélok'),
('3','Előételek'),
('4','Levesek'),
('5','Főételek'),
('6','Desszertek'),
('7','Alkoholmentes italok'),
('8','Kávék & teák'),
('9','Borok & pezsgők');
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoices`
--

DROP TABLE IF EXISTS `Invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_paid` decimal(10,2) unsigned NOT NULL,
  `base_amount` decimal(10,2) unsigned NOT NULL,
  `tip` decimal(10,2) unsigned NOT NULL DEFAULT 0.00,
  `total_amount` decimal(10,2) unsigned NOT NULL,
  `billing_details` varchar(100) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `payment_method` enum('Cash','Card','Online') NOT NULL DEFAULT 'Cash',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoices`
--

LOCK TABLES `Invoices` WRITE;
/*!40000 ALTER TABLE `Invoices` DISABLE KEYS */;
INSERT INTO `Invoices` VALUES
(2,2010000.00,2000000.00,10000.00,2010000.00,'asd','6','Cash','2026-04-23 09:36:10'),
(3,2001000.00,2000000.00,1000.00,2001000.00,'qwe','8','Cash','2026-04-23 17:23:25'),
(4,2001000.00,2000000.00,1000.00,2001000.00,'wafwrfw','9','Card','2026-04-23 17:25:26'),
(5,2001000.00,2000000.00,1000.00,2001000.00,'asdadasda','10','Cash','2026-04-23 18:07:31'),
(6,2000010.00,2000000.00,10.00,2000010.00,'asdadsa','12','Cash','2026-04-23 18:09:22'),
(7,2000.00,2000.00,0.00,2000.00,'','13','Cash','2026-04-23 18:20:23'),
(8,2000.00,2000.00,0.00,2000.00,'','13','Cash','2026-04-23 18:20:32'),
(9,2000010.00,2000000.00,10.00,2000010.00,'asdad','14','Cash','2026-04-23 18:21:29'),
(10,2100000.00,2000000.00,100000.00,2100000.00,'Feri buta','15','Cash','2026-04-26 20:39:23');
/*!40000 ALTER TABLE `Invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ordered_items`
--

DROP TABLE IF EXISTS `Ordered_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ordered_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT 1,
  `current_price` decimal(10,2) NOT NULL,
  `special_request` varchar(255) DEFAULT NULL,
  `serving_status` varchar(45) NOT NULL DEFAULT 'pending',
  `course_number` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ordered_items_orders_idx` (`order_id`),
  KEY `fk_ordered_items_products_idx` (`product_id`),
  CONSTRAINT `fk_ordered_items_orders` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ordered_items`
--

LOCK TABLES `Ordered_items` WRITE;
/*!40000 ALTER TABLE `Ordered_items` DISABLE KEYS */;
INSERT INTO `Ordered_items` VALUES
(7,8,1,1,2000000.00,NULL,'pending',NULL),
(8,9,1,1,2000000.00,NULL,'pending',NULL),
(9,10,1,1,2000000.00,NULL,'pending',NULL),
(10,12,1,1,2000000.00,NULL,'pending',NULL),
(11,14,1,1,2000000.00,NULL,'pending',NULL),
(12,15,1,1,2000000.00,NULL,'pending',NULL);
/*!40000 ALTER TABLE `Ordered_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('pending','cooking','served','paid') NOT NULL DEFAULT 'pending',
  `table_number` smallint(5) unsigned NOT NULL,
  `order_time` datetime NOT NULL DEFAULT current_timestamp(),
  `invoice_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_invoices_idx` (`invoice_id`),
  CONSTRAINT `fk_orders_invoices` FOREIGN KEY (`invoice_id`) REFERENCES `Invoices` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES
(2,'pending',3,'2026-04-23 09:16:39',NULL),
(3,'pending',3,'2026-04-23 09:17:55',NULL),
(4,'pending',3,'2026-04-23 09:20:23',NULL),
(5,'pending',3,'2026-04-23 09:21:00',NULL),
(6,'pending',3,'2026-04-23 09:36:10',2),
(7,'pending',1,'2026-04-23 15:42:29',NULL),
(8,'cooking',3,'2026-04-23 17:23:25',3),
(9,'cooking',3,'2026-04-23 17:25:26',4),
(10,'pending',3,'2026-04-23 18:07:31',5),
(11,'pending',4,'2026-04-23 18:08:49',NULL),
(12,'pending',4,'2026-04-23 18:09:22',6),
(13,'pending',3,'2026-04-23 18:18:32',NULL),
(14,'pending',4,'2026-04-23 18:21:29',9),
(15,'pending',4,'2026-04-26 20:39:23',10);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_allergens`
--

DROP TABLE IF EXISTS `Product_allergens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product_allergens` (
  `product_id` int(11) NOT NULL,
  `allergen_id` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_allergens`
--

LOCK TABLES `Product_allergens` WRITE;
/*!40000 ALTER TABLE `Product_allergens` DISABLE KEYS */;
INSERT INTO `Product_allergens` VALUES
(1,'1'),
(2,'7'),
(3,'1'),
(5,'1'),
(7,'1'),
(9,'9'),
(11,'7'),
(24,'7'),
(25,'7'),
(26,'7'),
(33,'12'),
(41,'3'),
(4,'7'),
(4,'8'),
(6,'7'),
(6,'12'),
(8,'1'),
(8,'7'),
(10,'1'),
(10,'3'),
(10,'7'),
(12,'4'),
(12,'7'),
(12,'1'),
(13,'1'),
(13,'3'),
(13,'7'),
(14,'1'),
(14,'3'),
(14,'7'),
(14,'8'),
(15,'1'),
(15,'3'),
(15,'7'),
(15,'8'),
(15,'12'),
(16,'1'),
(16,'3'),
(16,'7'),
(17,'7'),
(17,'8');
/*!40000 ALTER TABLE `Product_allergens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Products` (
  `id` int(11) NOT NULL,
  `is_available` tinyint(3) unsigned NOT NULL,
  `story_text` varchar(1000) NOT NULL,
  `chef_note` varchar(200) NOT NULL,
  `tax_rate` decimal(5,2) unsigned NOT NULL DEFAULT 27.00,
  `category_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` decimal(10,2) unsigned NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES
(36,1,'','',27.00,'7','Alkoholmentes sör','Heineken 0.0 – 0,33 l palack.',890.00),
(38,1,'','',27.00,'11','Aperol Spritz','Aperol, Törley Brut pezsgő, szódavíz, narancsszelet – 0,3 l.',1990.00),
(21,1,'','',27.00,'7','Ásványvíz','Magyar ásványvíz – 0,5 l palackban (szénsavas vagy szénsavmentes).',490.00),
(34,1,'','',27.00,'10','Borsodi Búza (csapolt)','Magyar búzasör – 0,5 l csapolt.',990.00),
(10,1,'','Séfünk titka: a fokhagyma egészben kerül a serpenyőbe.',27.00,'5','Brassói aprópecsenye','Sertéskaraj és füstölt szalonna együtt sütve, fokhagymás sült burgonyával.',3490.00),
(24,1,'','Latte arttal tálalva.',27.00,'8','Cappuccino','Eszpresszó gőzölt tejjel és tejhabbal – 180 ml.',790.00),
(5,1,'Egy könnyű, mégis telt ízvilágú fogás vegetáriánusoknak és húsevőknek egyaránt.','',27.00,'3','Cékla-kecskesajt saláta dióval','Sült cékla, krémes kecskesajt, dió, rukola, balzsamkrém vinaigrette-tel.',1790.00),
(22,1,'','',27.00,'7','Cola / Zero Cola','Üveges Coca-Cola vagy Coca-Cola Zero – 0,33 l.',590.00),
(18,1,'','Két személyre elegáns záró fogás.',27.00,'6','Csokifondue gyümölcsökkel','Étcsokoládé fondue eper, banán, málna és marshmallow kíséretében.',1990.00),
(33,1,'','',27.00,'10','Dreher Klassik (csapolt)','Magyar világos lager – 0,5 l csapolt.',890.00),
(29,1,'','',27.00,'9','Egri Bikavér pohár','Thummerer Egri Bikavér – 1,5 dl pohár.',1390.00),
(23,1,'Kávénkat helyi pörkölőtől szerezzük be, heti friss kiszállítással.','',27.00,'8','Eszpresszó','Dupla ristretto alapú egyedi pörkölésű kávé.',590.00),
(25,1,'','',27.00,'8','Flat White','Dupla eszpresszó krémes mikrogőzölt tejjel – 160 ml.',850.00),
(3,1,'Őszi erdőjárás ihlette fogás – a tányéron mintha a lomb között sétálnánk.','Kérhető gluténmentesen.',27.00,'4','Gombakrémleves tálkában sült gombával','Erdei gombákból főzött krémleves, tetején egészben sült csiperkegombával és snidlinggel.',1890.00),
(6,1,'A gulyás Magyarország lelke. Séfünk a húst 4 órán át főzi, míg omlóssá nem válik.','Csípősségét igény szerint fokozzuk.',27.00,'4','Gulyásleves','Klasszikus marhagulyás leves csipetkével, paprikával és köménnyel.',1590.00),
(16,1,'Gundel Károly alkotása – Magyarország leghíresebb palacsintája.','Kérhető alkohol nélkül is.',27.00,'6','Gundel palacsinta','Diós töltelékű palacsinta, csokoládé-rum öntettel, lángoló felszolgálással.',1690.00),
(13,1,'A Tisza-part ízei egyetlen tányérban – ez a fogás a mi folyóink tiszteletére készül.','Szálkamentesen filézve, de lehetnek apró szálkák.',27.00,'5','Harcsapaprikás galuskával','Magyar folyami harcsából készült paprikás, friss tojásos galuskával és tejföllel.',3890.00),
(20,1,'','Az aznapi kínálatot a pincértől kérdezze!',27.00,'7','Házi gyümölcslé (szezonális)','Napi frissen préselt gyümölcslé – 0,3 l.',790.00),
(19,1,'','Választható: eper, bodza vagy klasszikus ízben.',27.00,'7','Házi limonádé','Frissen facsart citrom, menta, jég – 0,5 l.',890.00),
(39,1,'','',27.00,'11','Hugo','Bodza szörp, Törley pezsgő, szódavíz, menta, lime – 0,3 l.',1990.00),
(26,1,'','',27.00,'8','Jeges kávé','Cold brew alap, tejszín, vaníliás jégkrém – 0,3 l.',990.00),
(2,1,'A libamáj Magyarország büszkesége. Séfünk nagymamájának receptje szerint készül, amelyet évtizedek óta őriznek.','Fogyasztás előtt 10 perccel vegyük ki a hűtőből, hogy az ízek kibontakozhassanak.',27.00,'3','Libamáj-krém pirítóssal','Házi készítésű libamáj-krém, karamellizált vöröshagymával és kovászos pirítóssal tálalva.',2990.00),
(27,1,'','Mézzel kérhető.',27.00,'7','Magyar gyógynövénytea','Házi gyűjtésű szárított gyógynövény keverék – hársvirág, borsmenta, kamilla.',690.00),
(12,1,'A mangalica a Kárpát-medence ősi fajtája, zsíros húsa páratlan ízélményt nyújt.','5 óra alacsony hőmérsékletű sütés után kerül a tányérra.',27.00,'5','Mangalica-tarja kemencéből','Lassan sült mangalica-tarja, füstölt paprikás mártással és káposztás galuskával.',4490.00),
(4,1,'','A tepertő naponta frissen készül, limitált mennyiségben.',27.00,'3','Mangalica-tepertő házi savanyúsággal','Ropogósra sütött mangalica-tepertő, mustáros savanyúsággal és friss fehér kenyérrel.',1690.00),
(7,1,'Nyári klasszikus, amely Magyarországon minden vendéglő étlapján helyet kap.','Csak szezonálisan elérhető (június–augusztus).',27.00,'4','Meggyleves tejföllel','Hidegen tálalt édes-savanyú meggyleves, fahéjjal és friss tejföllel.',1390.00),
(35,1,'','Helyi főzde, limitált készlet.',27.00,'10','Monyo IPA (palackos)','Magyar craft IPA – 0,33 l palack.',1290.00),
(37,1,'Egy igazi szatmári gazdától származó, kézzel szedett kajszibarackból desztillált pálinka.','Szobahőmérsékleten, tulipán pohárban tálalva.',27.00,'11','Pálinka (5 cl)','Házi barackpálinka Szatmárból – napi ajánlat szerint.',1190.00),
(11,1,'','',27.00,'5','Rántott csirkemell házi tartárral','Vastagra panírozott csirkemell, házi készítésű tartármártással és sült burgonyával.',2990.00),
(15,1,'Az 1950-es évek legendás budai étterméből eredő desszert, azóta nemzeti kincs.','',27.00,'6','Somlói galuska','Piskóta, dió, mazsola, csokoládékrém, tejszínhab – az igazi klasszikus.',1490.00),
(14,1,'','Vegetáriánus fogás.',27.00,'5','Spenótos-ricottás cannelloni (V)','Spenóttal és ricottával töltött cannelloni, paradicsomos-besameles mártásban sütve.',2790.00),
(32,1,'A világ egyik leghíresebb desszertbora, több mint 400 éves hagyománnyal.','',27.00,'9','Tokaji Aszú 5 puttonyos pohár','Oremus Tokaji Aszú – 0,5 dl pohár, desszerthez.',2490.00),
(28,1,'','',27.00,'9','Tokaji Furmint pohár','Oremus Tokaji Furmint száraz fehér – 1,5 dl pohár.',1290.00),
(9,1,'Séfünk nagyapja szatmári receptje. Két napig érik az ízek, mielőtt tányérra kerül.','Gluténmentes változat kérhető.',27.00,'5','Töltött káposzta füstölt hússal','Darált sertés-marha töltelékkel készített káposzta, füstölt oldalassal és tejföllel.',3290.00),
(31,1,'','Ünnepi koccintáshoz ajánlott.',27.00,'9','Törley Prestige Brut pohár','Magyar pezsgő – 1,5 dl pohár.',1490.00),
(17,1,'','',27.00,'6','Túrógombóc tejföllel','Puha túrógombóc, porcukorral és tejföllel, opcionálisan lekvárral.',1390.00),
(8,1,'Édesanyáink \"csodaszerének\" éttermi verziója.','',27.00,'4','Újházi tyúkhúsleves','Tyúkhúsból főzött erős leves csigatésztával, sárgarépával és zellergumóval.',1490.00),
(30,1,'','',27.00,'9','Villányi Rosé pohár','Bock Villányi Rosé – 1,5 dl pohár.',1190.00),
(40,1,'','',27.00,'11','Whisky Sour','Bourbon, friss citromlé, cukoroldék, tojásfehérje hab.',2490.00);
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wine_pairings`
--

DROP TABLE IF EXISTS `Wine_pairings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Wine_pairings` (
  `wine_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `pairing_reason` varchar(255) DEFAULT NULL,
  KEY `fk_wine_idx` (`wine_id`),
  KEY `fk_product_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wine_pairings`
--

LOCK TABLES `Wine_pairings` WRITE;
/*!40000 ALTER TABLE `Wine_pairings` DISABLE KEYS */;
INSERT INTO `Wine_pairings` VALUES
(11,1,'Az édes Szamorodni tökéletesen ellensúlyozza a libamáj gazdag zsírosságát.'),
(10,1,'Klasszikus párosítás: az aszú édessége kiemeli a máj kremességét.'),
(3,2,'A Leányka enyhén gyümölcsös savassága frissíti az erdei gomba telt ízét.'),
(5,4,'A rozé friss gyümölcsössége remekül kiegészíti a cékla édes-földes karakterét.'),
(6,5,'Az Egri Bikavér fűszeres tanninjei tökéletesen passzolnak a paprikás gulyáshoz.'),
(8,8,'A Kékfrankos savassága és gyümölcsössége átvágja a füstölt hús gazdagságát.'),
(7,9,'A Cab.Franc borsos-feketeribizlis karaktere kiemeli a sertéshús ízét.'),
(2,10,'A félszáraz Szürkebarát gyümölcsössége harmonizál a ropogós panír semlegességével.'),
(9,11,'A Merlot bársonyos tanninjei és szilvaíze tökéletesen egészíti ki a gazdag mangalicát.'),
(1,12,'A száraz Furmint mineralitása és frissessége tökéletesen illik a halételhez.'),
(3,13,'A könnyű fehér frissíti az olaszos fogás sűrű mártásait.'),
(10,14,'Az Aszú fahéjas-mézes hangjai tükrözik a somlói rétegeit.'),
(11,15,'Az édes Szamorodni dió- és mandulajegyei visszaköszönnek a palacsintában.'),
(10,17,'Az Aszú gazdag édessége nem nyomja el, hanem emeli a jó étcsokoládé keserűségét.'),
(12,6,'A brut pezsgő élénk savassága és pezsgése felfrissíti a gyümölcsleves édességét.');
/*!40000 ALTER TABLE `Wine_pairings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wines`
--

DROP TABLE IF EXISTS `Wines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Wines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wines`
--

LOCK TABLES `Wines` WRITE;
/*!40000 ALTER TABLE `Wines` DISABLE KEYS */;
INSERT INTO `Wines` VALUES
(2,'Teszt bor 2','rose'),
(3,'Teszt bor','rose'),
(4,'Tokaji Furmint – Oremus','száraz fehér'),
(5,'Badacsonyi Szürkebarát – Figula','félszáraz fehér'),
(6,'Egri Leányka – St. Andrea','száraz fehér'),
(7,'Somló Juhfark – Spiegelberg','száraz fehér'),
(8,'Villányi Rosé – Bock','száraz rozé'),
(9,'Egri Bikavér – Thummerer','száraz vörös'),
(10,'Villányi Cabernet Franc – Gere','száraz vörös'),
(11,'Szekszárdi Kékfrankos – Takler','száraz vörös'),
(12,'Villányi Merlot – Malatinszky','száraz vörös'),
(13,'Tokaji Aszú 5 puttonyos – Oremus','édes fehér'),
(14,'Tokaji Szamorodni édes – Disznókő','édes fehér'),
(15,'Törley Prestige Brut','pezsgő'),
(16,'Hungaria Grande Cuvée Brut','pezsgő');
/*!40000 ALTER TABLE `Wines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desks`
--

DROP TABLE IF EXISTS `desks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `desks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desks`
--

LOCK TABLES `desks` WRITE;
/*!40000 ALTER TABLE `desks` DISABLE KEYS */;
INSERT INTO `desks` VALUES
(1,'admin','$2b$10$RtiJKDmBLpEGyyHCe8W31esxZ3yBApLnfQMd5ylMwJYX7CSjVN6L6'),
(3,'asztal1','$2b$10$KpLf/UsI40uM5X8oQAhftOXKQsbhkEwcw5oExTUs.vrjnnP6H0OaG'),
(4,'asztal2','$2b$10$rzdILnYPnidpQwboh8Zzm.IlxNIMn3D13JWn8FOv6N3t5tUsne6a6');
/*!40000 ALTER TABLE `desks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-26 21:35:06
