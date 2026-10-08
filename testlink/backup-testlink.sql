/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.19-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: testlink
-- ------------------------------------------------------
-- Server version	10.11.19-MariaDB-ubu2204

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
-- Table structure for table `assignment_status`
--

DROP TABLE IF EXISTS `assignment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_status`
--

LOCK TABLES `assignment_status` WRITE;
/*!40000 ALTER TABLE `assignment_status` DISABLE KEYS */;
INSERT INTO `assignment_status` VALUES
(1,'open'),
(2,'closed'),
(3,'completed'),
(4,'todo_urgent'),
(5,'todo');
/*!40000 ALTER TABLE `assignment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment_types`
--

DROP TABLE IF EXISTS `assignment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_table` varchar(30) DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_types`
--

LOCK TABLES `assignment_types` WRITE;
/*!40000 ALTER TABLE `assignment_types` DISABLE KEYS */;
INSERT INTO `assignment_types` VALUES
(1,'testplan_tcversions','testcase_execution'),
(2,'tcversions','testcase_review');
/*!40000 ALTER TABLE `assignment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_id` int(10) unsigned NOT NULL DEFAULT 0,
  `fk_table` varchar(250) DEFAULT '',
  `title` varchar(250) DEFAULT '',
  `description` varchar(250) DEFAULT '',
  `file_name` varchar(250) NOT NULL DEFAULT '',
  `file_path` varchar(250) DEFAULT '',
  `file_size` int(11) NOT NULL DEFAULT 0,
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `content` longblob DEFAULT NULL,
  `compression_type` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `attachments_idx1` (`fk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES
(1,11,'execution_tcsteps','','','1.png','execution_tcsteps/11/c0ef78eb7e3ebcf47bd52d1f616e473b.png',442344,'image/png','2026-10-08 18:06:12',NULL,1),
(2,12,'execution_tcsteps','','','2.png','execution_tcsteps/12/8be6ae05beb3e0329d6a9a7883eada6a.png',191887,'image/png','2026-10-08 18:06:45',NULL,1),
(3,14,'execution_tcsteps','','','3.png','execution_tcsteps/14/d26b6fd881646751f144a4880058a534.png',289231,'image/png','2026-10-08 18:07:05',NULL,1),
(4,22,'execution_tcsteps','','','4.png','execution_tcsteps/22/439fb55fd8b769f94f3fc9bb095dffcc.png',15815,'image/png','2026-10-08 18:18:40',NULL,1),
(5,26,'execution_tcsteps','','','5.png','execution_tcsteps/26/ef96bee1e81ca7e396ad5f9c27150de1.png',673471,'image/png','2026-10-08 18:19:58',NULL,1);
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseline_l1l2_context`
--

DROP TABLE IF EXISTS `baseline_l1l2_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `baseline_l1l2_context` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0,
  `begin_exec_ts` timestamp NOT NULL,
  `end_exec_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `udx1_context` (`testplan_id`,`platform_id`,`creation_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseline_l1l2_context`
--

LOCK TABLES `baseline_l1l2_context` WRITE;
/*!40000 ALTER TABLE `baseline_l1l2_context` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseline_l1l2_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseline_l1l2_details`
--

DROP TABLE IF EXISTS `baseline_l1l2_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `baseline_l1l2_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `context_id` int(10) unsigned NOT NULL,
  `top_tsuite_id` int(10) unsigned NOT NULL DEFAULT 0,
  `child_tsuite_id` int(10) unsigned NOT NULL DEFAULT 0,
  `status` char(1) DEFAULT NULL,
  `qty` int(10) unsigned NOT NULL DEFAULT 0,
  `total_tc` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `udx1_details` (`context_id`,`top_tsuite_id`,`child_tsuite_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseline_l1l2_details`
--

LOCK TABLES `baseline_l1l2_details` WRITE;
/*!40000 ALTER TABLE `baseline_l1l2_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `baseline_l1l2_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `builds`
--

DROP TABLE IF EXISTS `builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `builds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT 'undefined',
  `notes` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `release_date` date DEFAULT NULL,
  `closed_on_date` date DEFAULT NULL,
  `commit_id` varchar(64) DEFAULT NULL,
  `tag` varchar(64) DEFAULT NULL,
  `branch` varchar(64) DEFAULT NULL,
  `release_candidate` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`testplan_id`,`name`),
  KEY `testplan_id` (`testplan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Available builds';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `builds`
--

LOCK TABLES `builds` WRITE;
/*!40000 ALTER TABLE `builds` DISABLE KEYS */;
INSERT INTO `builds` VALUES
(1,81,'166c95b','<p>&nbsp;</p>\r\n<g0-textarea-recorder-host id=\"g0-textarea-recorder\"></g0-textarea-recorder-host>',1,1,NULL,'2026-10-08 17:31:53',NULL,NULL,'','','','');
/*!40000 ALTER TABLE `builds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_build_design_values`
--

DROP TABLE IF EXISTS `cfield_build_design_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfield_build_design_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `node_id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`node_id`),
  KEY `idx_cfield_build_design_values` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_build_design_values`
--

LOCK TABLES `cfield_build_design_values` WRITE;
/*!40000 ALTER TABLE `cfield_build_design_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_build_design_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_design_values`
--

DROP TABLE IF EXISTS `cfield_design_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfield_design_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `node_id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`node_id`),
  KEY `idx_cfield_design_values` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_design_values`
--

LOCK TABLES `cfield_design_values` WRITE;
/*!40000 ALTER TABLE `cfield_design_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_design_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_execution_values`
--

DROP TABLE IF EXISTS `cfield_execution_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfield_execution_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `execution_id` int(10) NOT NULL DEFAULT 0,
  `testplan_id` int(10) NOT NULL DEFAULT 0,
  `tcversion_id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`execution_id`,`testplan_id`,`tcversion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_execution_values`
--

LOCK TABLES `cfield_execution_values` WRITE;
/*!40000 ALTER TABLE `cfield_execution_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_execution_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_node_types`
--

DROP TABLE IF EXISTS `cfield_node_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfield_node_types` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `node_type_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`field_id`,`node_type_id`),
  KEY `idx_custom_fields_assign` (`node_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_node_types`
--

LOCK TABLES `cfield_node_types` WRITE;
/*!40000 ALTER TABLE `cfield_node_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_node_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_testplan_design_values`
--

DROP TABLE IF EXISTS `cfield_testplan_design_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfield_testplan_design_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `link_id` int(10) NOT NULL DEFAULT 0 COMMENT 'point to testplan_tcversion id',
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`link_id`),
  KEY `idx_cfield_tplan_design_val` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_testplan_design_values`
--

LOCK TABLES `cfield_testplan_design_values` WRITE;
/*!40000 ALTER TABLE `cfield_testplan_design_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_testplan_design_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_testprojects`
--

DROP TABLE IF EXISTS `cfield_testprojects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfield_testprojects` (
  `field_id` int(10) unsigned NOT NULL DEFAULT 0,
  `testproject_id` int(10) unsigned NOT NULL DEFAULT 0,
  `display_order` smallint(5) unsigned NOT NULL DEFAULT 1,
  `location` smallint(5) unsigned NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `required_on_design` tinyint(1) NOT NULL DEFAULT 0,
  `required_on_execution` tinyint(1) NOT NULL DEFAULT 0,
  `monitorable` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`field_id`,`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_testprojects`
--

LOCK TABLES `cfield_testprojects` WRITE;
/*!40000 ALTER TABLE `cfield_testprojects` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_testprojects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codetrackers`
--

DROP TABLE IF EXISTS `codetrackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `codetrackers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int(10) DEFAULT 0,
  `cfg` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codetrackers_uidx1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codetrackers`
--

LOCK TABLES `codetrackers` WRITE;
/*!40000 ALTER TABLE `codetrackers` DISABLE KEYS */;
/*!40000 ALTER TABLE `codetrackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_fields` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `label` varchar(64) NOT NULL DEFAULT '' COMMENT 'label to display on user interface',
  `type` smallint(6) NOT NULL DEFAULT 0,
  `possible_values` varchar(4000) NOT NULL DEFAULT '',
  `default_value` varchar(4000) NOT NULL DEFAULT '',
  `valid_regexp` varchar(255) NOT NULL DEFAULT '',
  `length_min` int(10) NOT NULL DEFAULT 0,
  `length_max` int(10) NOT NULL DEFAULT 0,
  `show_on_design` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '1=> show it during specification design',
  `enable_on_design` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '1=> user can write/manage it during specification design',
  `show_on_execution` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '1=> show it during test case execution',
  `enable_on_execution` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '1=> user can write/manage it during test case execution',
  `show_on_testplan_design` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `enable_on_testplan_design` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_custom_fields_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_version`
--

DROP TABLE IF EXISTS `db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_version` (
  `version` varchar(50) NOT NULL DEFAULT 'unknown',
  `upgrade_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_version`
--

LOCK TABLES `db_version` WRITE;
/*!40000 ALTER TABLE `db_version` DISABLE KEYS */;
INSERT INTO `db_version` VALUES
('DB 1.9.20','2026-10-08 17:09:32','TestLink 1.9.20 Raijin');
/*!40000 ALTER TABLE `db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL DEFAULT 0,
  `log_level` smallint(5) unsigned NOT NULL DEFAULT 0,
  `source` varchar(45) DEFAULT NULL,
  `description` text NOT NULL,
  `fired_at` int(10) unsigned NOT NULL DEFAULT 0,
  `activity` varchar(45) DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `object_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `fired_at` (`fired_at`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES
(1,1,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:3:\"::1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791479439,'LOGIN',1,'users'),
(2,2,2,'GUI','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/testproject.class.php - Line 3842',1791479466,'PHP',0,NULL),
(3,2,2,'GUI','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/testproject.class.php - Line 3842',1791479466,'PHP',0,NULL),
(4,3,2,'GUI','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/testproject.class.php - Line 3842',1791479510,'PHP',0,NULL),
(5,3,2,'GUI','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/testproject.class.php - Line 3842',1791479510,'PHP',0,NULL),
(6,3,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_user_saved\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791479510,'SAVE',1,'users'),
(7,4,2,'GUI','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/testproject.class.php - Line 3842',1791479513,'PHP',0,NULL),
(8,4,2,'GUI','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/testproject.class.php - Line 3842',1791479513,'PHP',0,NULL),
(9,4,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_user_saved\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791479513,'SAVE',1,'users'),
(10,5,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791479516,'LOGOUT',1,'users'),
(11,6,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:3:\"::1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791479525,'LOGIN',1,'users'),
(12,7,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_testproject_created\";s:6:\"params\";a:1:{i:0;s:17:\"Lanchonete Online\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791479579,'CREATE',1,'testprojects'),
(13,7,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791479579,'PHP',0,NULL),
(14,7,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791479579,'PHP',0,NULL),
(15,8,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791479659,'PHP',0,NULL),
(16,8,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791479659,'PHP',0,NULL),
(17,9,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_testproject_saved\";s:6:\"params\";a:1:{i:0;s:17:\"Lanchonete Online\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791479678,'UPDATE',1,'testprojects'),
(18,9,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791479678,'PHP',0,NULL),
(19,9,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791479678,'PHP',0,NULL),
(20,10,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791479697,'PHP',0,NULL),
(21,10,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791479697,'PHP',0,NULL),
(22,11,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791479805,'PHP',0,NULL),
(23,11,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791479805,'PHP',0,NULL),
(24,12,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791479824,'PHP',0,NULL),
(25,12,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791479824,'PHP',0,NULL),
(26,13,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:3:\"::1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791479888,'LOGIN',1,'users'),
(27,14,16,'GUI - Projecto de Teste ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791479898,'LOGOUT',1,'users'),
(28,15,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:3:\"::1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791479902,'LOGIN',1,'users'),
(29,16,2,'GUI - Test Project ID : 1','E_WARNING\nCannot modify header information - headers already sent by (output started at /var/www/html/lib/functions/testplan.class.php:1194) - in /var/www/html/lib/results/displayMgr.php - Line 231',1791480111,'PHP',0,NULL),
(30,16,2,'GUI - Test Project ID : 1','E_WARNING\nCannot modify header information - headers already sent by (output started at /var/www/html/lib/functions/testplan.class.php:1194) - in /var/www/html/lib/results/displayMgr.php - Line 232',1791480111,'PHP',0,NULL),
(31,16,2,'GUI - Test Project ID : 1','E_WARNING\nCannot modify header information - headers already sent by (output started at /var/www/html/lib/functions/testplan.class.php:1194) - in /var/www/html/lib/results/displayMgr.php - Line 235',1791480111,'PHP',0,NULL),
(32,17,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791480264,'PHP',0,NULL),
(33,17,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791480264,'PHP',0,NULL),
(34,18,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined property: stdClass::$uploadOp - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 134',1791480274,'PHP',0,NULL),
(35,18,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined property: stdClass::$itemID - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 156',1791480274,'PHP',0,NULL),
(36,19,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_testplan_created\";s:6:\"params\";a:2:{i:0;s:17:\"Lanchonete Online\";i:1;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480313,'CREATED',81,'testplans'),
(37,19,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:32:\"audit_users_roles_added_testplan\";s:6:\"params\";a:3:{i:0;s:5:\"admin\";i:1;s:7:\"166c95b\";i:2;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480313,'ASSIGN',81,'testplans'),
(38,20,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined property: stdClass::$uploadOp - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 134',1791480323,'PHP',0,NULL),
(39,20,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined property: stdClass::$itemID - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 156',1791480323,'PHP',0,NULL),
(40,20,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"\" - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 306',1791480323,'PHP',0,NULL),
(41,21,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined property: stdClass::$itemID - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 156',1791480330,'PHP',0,NULL),
(42,21,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"\" - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 306',1791480330,'PHP',0,NULL),
(43,22,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined property: stdClass::$uploadOp - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 134',1791480380,'PHP',0,NULL),
(44,22,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined property: stdClass::$itemID - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 156',1791480380,'PHP',0,NULL),
(45,22,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"\" - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 306',1791480380,'PHP',0,NULL),
(46,23,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:20:\"audit_testplan_saved\";s:6:\"params\";a:2:{i:0;s:17:\"Lanchonete Online\";i:1;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480403,'SAVE',81,'testplans'),
(47,24,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791480409,'PHP',0,NULL),
(48,24,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791480409,'PHP',0,NULL),
(49,24,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 31',1791480409,'PHP',0,NULL),
(50,24,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 31',1791480409,'PHP',0,NULL),
(51,24,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 48',1791480409,'PHP',0,NULL),
(52,24,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 48',1791480409,'PHP',0,NULL),
(53,24,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 49',1791480409,'PHP',0,NULL),
(54,24,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 49',1791480409,'PHP',0,NULL),
(55,24,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 51',1791480409,'PHP',0,NULL),
(56,24,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 51',1791480409,'PHP',0,NULL),
(57,25,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791480414,'PHP',0,NULL),
(58,25,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791480414,'PHP',0,NULL),
(59,25,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 31',1791480414,'PHP',0,NULL),
(60,25,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 31',1791480414,'PHP',0,NULL),
(61,25,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 48',1791480414,'PHP',0,NULL),
(62,25,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 48',1791480414,'PHP',0,NULL),
(63,25,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 49',1791480414,'PHP',0,NULL),
(64,25,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 49',1791480414,'PHP',0,NULL),
(65,25,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 51',1791480414,'PHP',0,NULL),
(66,25,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 51',1791480414,'PHP',0,NULL),
(67,26,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791480416,'PHP',0,NULL),
(68,26,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791480416,'PHP',0,NULL),
(69,26,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 31',1791480416,'PHP',0,NULL),
(70,26,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 31',1791480416,'PHP',0,NULL),
(71,26,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 48',1791480416,'PHP',0,NULL),
(72,26,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 48',1791480416,'PHP',0,NULL),
(73,26,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 49',1791480416,'PHP',0,NULL),
(74,26,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 49',1791480416,'PHP',0,NULL),
(75,26,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 51',1791480416,'PHP',0,NULL),
(76,26,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/e3b162df7b3255dcd6d40fc8c66c81f47faf3752_0.file.DataTablesColumnFiltering.inc.tpl.php - Line 51',1791480416,'PHP',0,NULL),
(77,27,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"DataTablesSelector\" - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791480521,'PHP',0,NULL),
(78,27,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"value\" on null - in /var/www/html/gui/templates_c/1014910f907a29e52650cfdd79a780fb7e2dfab0_0.file.DataTables.inc.tpl.php - Line 35',1791480521,'PHP',0,NULL),
(79,28,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined property: stdClass::$uploadOp - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 134',1791480529,'PHP',0,NULL),
(80,28,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined property: stdClass::$itemID - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 156',1791480529,'PHP',0,NULL),
(81,28,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"\" - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 306',1791480529,'PHP',0,NULL),
(82,29,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined property: stdClass::$uploadOp - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 134',1791480598,'PHP',0,NULL),
(83,29,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined property: stdClass::$itemID - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 156',1791480598,'PHP',0,NULL),
(84,29,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"\" - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 306',1791480598,'PHP',0,NULL),
(85,30,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:46:\"LO-1 : CT-CR-01 - Acesso ao carrinho sem login\";i:1;s:1:\"1\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480630,'ASSIGN',81,'testplans'),
(86,30,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:40:\"LO-2 : CT-CR-02 - Carrinho com um lanche\";i:1;s:1:\"1\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480630,'ASSIGN',81,'testplans'),
(87,30,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:39:\"LO-3 : CT-CR-03 - Aumentar a quantidade\";i:1;s:1:\"1\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480630,'ASSIGN',81,'testplans'),
(88,30,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:39:\"LO-4 : CT-CR-04 - Diminuir a quantidade\";i:1;s:1:\"1\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480630,'ASSIGN',81,'testplans'),
(89,30,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:55:\"LO-5 : CT-CR-05 - Diminuir com quantidade 1 (remoção)\";i:1;s:1:\"1\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480630,'ASSIGN',81,'testplans'),
(90,30,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:46:\"LO-6 : CT-CR-06 - Carrinho com lanche e bebida\";i:1;s:1:\"1\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480630,'ASSIGN',81,'testplans'),
(91,30,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:46:\"LO-7 : CT-CR-07 - Finalizar pedido com um item\";i:1;s:1:\"1\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480630,'ASSIGN',81,'testplans'),
(92,30,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:61:\"LO-8 : CT-CR-08 - Finalizar pedido com quantidade maior que 1\";i:1;s:1:\"1\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480630,'ASSIGN',81,'testplans'),
(93,30,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:48:\"LO-9 : CT-CR-09 - Finalizar com o carrinho vazio\";i:1;s:1:\"1\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480630,'ASSIGN',81,'testplans'),
(94,30,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:61:\"LO-10 : CT-CR-10 - Finalizar sem escolher pagamento e entrega\";i:1;s:1:\"1\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480630,'ASSIGN',81,'testplans'),
(95,30,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:59:\"LO-11 : CT-CR-11 - Registro da forma de pagamento e entrega\";i:1;s:1:\"1\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480630,'ASSIGN',81,'testplans'),
(96,30,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:66:\"LO-12 : CT-CR-12 - Recarregar a página após alterar a quantidade\";i:1;s:1:\"1\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480630,'ASSIGN',81,'testplans'),
(97,30,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:48:\"LO-13 : CT-CR-13 - Abrir o carrinho em outra aba\";i:1;s:1:\"1\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480630,'ASSIGN',81,'testplans'),
(98,30,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:64:\"LO-14 : CT-CR-14 - Adicionar o mesmo lanche duas vezes pelo menu\";i:1;s:1:\"1\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480631,'ASSIGN',81,'testplans'),
(99,30,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:58:\"LO-15 : CT-CR-15 - Lanchonete fecha antes da finalização\";i:1;s:1:\"1\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480631,'ASSIGN',81,'testplans'),
(100,30,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:39:\"LO-16 : CT-CR-16 - Cancelar no carrinho\";i:1;s:1:\"1\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480631,'ASSIGN',81,'testplans'),
(101,30,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:46:\"LO-17 : CT-CR-17 - Voltar da tela de pagamento\";i:1;s:1:\"1\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480631,'ASSIGN',81,'testplans'),
(102,30,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:26:\"audit_tc_added_to_testplan\";s:6:\"params\";a:3:{i:0;s:35:\"LO-18 : CT-CR-18 - Resumo do pedido\";i:1;s:1:\"1\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480631,'ASSIGN',81,'testplans'),
(103,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 476',1791480631,'PHP',0,NULL),
(104,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 481',1791480631,'PHP',0,NULL),
(105,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 493',1791480631,'PHP',0,NULL),
(106,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 476',1791480631,'PHP',0,NULL),
(107,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 481',1791480631,'PHP',0,NULL),
(108,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 493',1791480631,'PHP',0,NULL),
(109,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 476',1791480631,'PHP',0,NULL),
(110,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 481',1791480631,'PHP',0,NULL),
(111,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 493',1791480631,'PHP',0,NULL),
(112,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 476',1791480631,'PHP',0,NULL),
(113,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 481',1791480631,'PHP',0,NULL),
(114,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 493',1791480631,'PHP',0,NULL),
(115,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 476',1791480631,'PHP',0,NULL),
(116,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 481',1791480631,'PHP',0,NULL),
(117,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 493',1791480631,'PHP',0,NULL),
(118,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 476',1791480631,'PHP',0,NULL),
(119,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 481',1791480631,'PHP',0,NULL),
(120,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 493',1791480631,'PHP',0,NULL),
(121,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 476',1791480631,'PHP',0,NULL),
(122,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 481',1791480631,'PHP',0,NULL),
(123,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 493',1791480631,'PHP',0,NULL),
(124,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 476',1791480631,'PHP',0,NULL),
(125,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 481',1791480631,'PHP',0,NULL),
(126,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 493',1791480631,'PHP',0,NULL),
(127,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 476',1791480631,'PHP',0,NULL),
(128,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 481',1791480631,'PHP',0,NULL),
(129,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 493',1791480631,'PHP',0,NULL),
(130,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 476',1791480631,'PHP',0,NULL),
(131,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 481',1791480631,'PHP',0,NULL),
(132,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 493',1791480631,'PHP',0,NULL),
(133,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 476',1791480631,'PHP',0,NULL),
(134,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 481',1791480631,'PHP',0,NULL),
(135,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 493',1791480631,'PHP',0,NULL),
(136,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 476',1791480631,'PHP',0,NULL),
(137,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 481',1791480631,'PHP',0,NULL),
(138,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 493',1791480631,'PHP',0,NULL),
(139,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 476',1791480631,'PHP',0,NULL),
(140,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 481',1791480631,'PHP',0,NULL),
(141,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 493',1791480631,'PHP',0,NULL),
(142,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 476',1791480631,'PHP',0,NULL),
(143,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 481',1791480631,'PHP',0,NULL),
(144,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 493',1791480631,'PHP',0,NULL),
(145,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 476',1791480631,'PHP',0,NULL),
(146,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 481',1791480631,'PHP',0,NULL),
(147,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 493',1791480631,'PHP',0,NULL),
(148,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 476',1791480631,'PHP',0,NULL),
(149,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 481',1791480631,'PHP',0,NULL),
(150,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 493',1791480631,'PHP',0,NULL),
(151,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 476',1791480631,'PHP',0,NULL),
(152,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 481',1791480631,'PHP',0,NULL),
(153,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 493',1791480631,'PHP',0,NULL),
(154,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 476',1791480631,'PHP',0,NULL),
(155,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 481',1791480631,'PHP',0,NULL),
(156,30,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/3a384ce0714c54b0fbee80661a8725306450aadb_0.file.planAddTC_m1.tpl.php - Line 493',1791480631,'PHP',0,NULL),
(157,31,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_build_created\";s:6:\"params\";a:3:{i:0;s:17:\"Lanchonete Online\";i:1;s:7:\"166c95b\";i:2;s:7:\"166c95b\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480713,'CREATE',1,'builds'),
(158,31,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined property: stdClass::$build - in /var/www/html/lib/plan/buildEdit.php - Line 343',1791480713,'PHP',0,NULL),
(159,31,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined variable $args - in /var/www/html/lib/plan/buildEdit.php - Line 371',1791480713,'PHP',0,NULL),
(160,31,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"user\" on null - in /var/www/html/lib/plan/buildEdit.php - Line 371',1791480713,'PHP',0,NULL),
(161,31,2,'GUI - Test Project ID : 1','E_WARNING\nAttempt to read property \"locale\" on null - in /var/www/html/lib/plan/buildEdit.php - Line 371',1791480713,'PHP',0,NULL),
(162,31,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"\" - in /var/www/html/lib/plan/buildEdit.php - Line 371',1791480713,'PHP',0,NULL),
(163,32,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined property: stdClass::$uploadOp - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 134',1791480726,'PHP',0,NULL),
(164,32,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined property: stdClass::$itemID - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 156',1791480726,'PHP',0,NULL),
(165,32,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"\" - in /var/www/html/gui/templates_c/dc265c149d5503210aced4195901ff501ef2c66c_0.file.planEdit.tpl.php - Line 306',1791480726,'PHP',0,NULL),
(166,33,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:20:\"audit_testplan_saved\";s:6:\"params\";a:2:{i:0;s:17:\"Lanchonete Online\";i:1;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791480736,'SAVE',81,'testplans'),
(167,34,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791480817,'PHP',0,NULL),
(168,35,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791480953,'PHP',0,NULL),
(169,36,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791481030,'PHP',0,NULL),
(170,37,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791481054,'PHP',0,NULL),
(171,38,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791481134,'PHP',0,NULL),
(172,39,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791481146,'PHP',0,NULL),
(173,40,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:3:\"::1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791481859,'LOGIN',1,'users'),
(174,41,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791481878,'PHP',0,NULL),
(175,42,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791481884,'PHP',0,NULL),
(176,43,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791481888,'PHP',0,NULL),
(177,44,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:4:\"LO-1\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791481906,'CREATE',1,'execution'),
(178,45,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791481921,'PHP',0,NULL),
(179,46,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_exec_deleted\";s:6:\"params\";a:3:{i:0;s:4:\"LO-1\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791481944,'DELETE',1,'execution'),
(180,46,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791481944,'PHP',0,NULL),
(181,47,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:4:\"LO-1\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791481949,'CREATE',2,'execution'),
(182,48,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791481961,'PHP',0,NULL),
(183,49,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:4:\"LO-2\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791482477,'CREATE',3,'execution'),
(184,50,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791482486,'PHP',0,NULL),
(185,51,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:4:\"LO-3\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791482549,'CREATE',4,'execution'),
(186,52,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791482555,'PHP',0,NULL),
(187,53,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:4:\"LO-4\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791482583,'CREATE',5,'execution'),
(188,54,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791482607,'PHP',0,NULL),
(189,55,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:4:\"LO-5\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791482620,'CREATE',6,'execution'),
(190,56,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791482624,'PHP',0,NULL),
(191,57,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:4:\"LO-6\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791482673,'CREATE',7,'execution'),
(192,58,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:4:\"LO-2\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791482772,'CREATE',8,'execution'),
(193,59,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_exec_deleted\";s:6:\"params\";a:3:{i:0;s:4:\"LO-2\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791482789,'DELETE',3,'execution'),
(194,60,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:4:\"LO-3\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791482805,'CREATE',9,'execution'),
(195,61,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_exec_deleted\";s:6:\"params\";a:3:{i:0;s:4:\"LO-3\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791482812,'DELETE',4,'execution'),
(196,62,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:4:\"LO-6\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791482825,'CREATE',10,'execution'),
(197,63,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_exec_deleted\";s:6:\"params\";a:3:{i:0;s:4:\"LO-6\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791482829,'DELETE',7,'execution'),
(198,64,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791482832,'PHP',0,NULL),
(199,65,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:4:\"LO-7\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791483275,'CREATE',11,'execution'),
(200,66,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791483288,'PHP',0,NULL),
(201,67,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:4:\"LO-8\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791483520,'CREATE',12,'execution'),
(202,68,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791483527,'PHP',0,NULL),
(203,69,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:4:\"LO-9\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791483598,'CREATE',13,'execution'),
(204,70,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791483617,'PHP',0,NULL),
(205,71,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:5:\"LO-10\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791483907,'CREATE',14,'execution'),
(206,72,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791483911,'PHP',0,NULL),
(207,73,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791483952,'PHP',0,NULL),
(208,74,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791483958,'PHP',0,NULL),
(209,75,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:5:\"LO-11\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791484309,'CREATE',15,'execution'),
(210,76,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791484317,'PHP',0,NULL),
(211,77,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:5:\"LO-12\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791484395,'CREATE',16,'execution'),
(212,78,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_exec_deleted\";s:6:\"params\";a:3:{i:0;s:5:\"LO-12\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791484404,'DELETE',16,'execution'),
(213,78,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791484404,'PHP',0,NULL),
(214,79,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:5:\"LO-12\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791484419,'CREATE',17,'execution'),
(215,80,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791484424,'PHP',0,NULL),
(216,81,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:5:\"LO-13\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791484475,'CREATE',18,'execution'),
(217,82,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791484482,'PHP',0,NULL),
(218,83,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:5:\"LO-14\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791484522,'CREATE',19,'execution'),
(219,84,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791484527,'PHP',0,NULL),
(220,85,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791484528,'PHP',0,NULL),
(221,86,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791484568,'PHP',0,NULL),
(222,87,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791484585,'PHP',0,NULL),
(223,88,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791484588,'PHP',0,NULL),
(224,89,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:5:\"LO-15\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791484635,'CREATE',20,'execution'),
(225,90,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791484638,'PHP',0,NULL),
(226,91,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:5:\"LO-16\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791484693,'CREATE',21,'execution'),
(227,92,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791484698,'PHP',0,NULL),
(228,93,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791484725,'PHP',0,NULL),
(229,94,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791484727,'PHP',0,NULL),
(230,95,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:5:\"LO-17\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791484735,'CREATE',22,'execution'),
(231,96,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/gui/templates_c/32916e4d428edb29e8817b6c6726333e0ff51ffe_0.file.inc_exec_show_tc_exec.tpl.php - Line 242',1791484740,'PHP',0,NULL),
(232,97,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_exec_saved\";s:6:\"params\";a:3:{i:0;s:5:\"LO-18\";i:1;s:7:\"166c95b\";i:2;s:9:\"Entrega 1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1791484843,'CREATE',23,'execution'),
(233,98,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined variable $tsuiteData - in /var/www/html/lib/functions/testsuite.class.php - Line 1177',1791484991,'PHP',0,NULL),
(234,98,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined variable $tsuiteData - in /var/www/html/lib/functions/testsuite.class.php - Line 1239',1791484991,'PHP',0,NULL),
(235,98,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/testsuite.class.php - Line 1239',1791484991,'PHP',0,NULL),
(236,98,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined variable $tsuiteData - in /var/www/html/lib/functions/testsuite.class.php - Line 1240',1791484991,'PHP',0,NULL),
(237,98,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/testsuite.class.php - Line 1240',1791484991,'PHP',0,NULL),
(238,98,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined variable $tsuiteData - in /var/www/html/lib/functions/testsuite.class.php - Line 1241',1791484991,'PHP',0,NULL),
(239,98,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/testsuite.class.php - Line 1241',1791484991,'PHP',0,NULL),
(240,98,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined variable $tsuiteData - in /var/www/html/lib/functions/testsuite.class.php - Line 1242',1791484991,'PHP',0,NULL),
(241,98,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/testsuite.class.php - Line 1242',1791484991,'PHP',0,NULL),
(242,98,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined variable $attachXML - in /var/www/html/lib/functions/testsuite.class.php - Line 1242',1791484991,'PHP',0,NULL),
(243,98,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined variable $attachXML - in /var/www/html/lib/functions/testsuite.class.php - Line 1242',1791484991,'PHP',0,NULL),
(244,99,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/print.inc.php - Line 1394',1791485044,'PHP',0,NULL),
(245,99,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485044,'PHP',0,NULL),
(246,99,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/print.inc.php - Line 1394',1791485044,'PHP',0,NULL),
(247,99,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485044,'PHP',0,NULL),
(248,99,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/print.inc.php - Line 1394',1791485044,'PHP',0,NULL),
(249,99,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485044,'PHP',0,NULL),
(250,99,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/print.inc.php - Line 1394',1791485044,'PHP',0,NULL),
(251,99,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485044,'PHP',0,NULL),
(252,99,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/print.inc.php - Line 1394',1791485044,'PHP',0,NULL),
(253,99,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485044,'PHP',0,NULL),
(254,99,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/print.inc.php - Line 1394',1791485044,'PHP',0,NULL),
(255,99,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485044,'PHP',0,NULL),
(256,99,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/print.inc.php - Line 1394',1791485044,'PHP',0,NULL),
(257,99,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485044,'PHP',0,NULL),
(258,99,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/print.inc.php - Line 1394',1791485044,'PHP',0,NULL),
(259,99,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485044,'PHP',0,NULL),
(260,99,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/print.inc.php - Line 1394',1791485044,'PHP',0,NULL),
(261,99,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485044,'PHP',0,NULL),
(262,99,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/print.inc.php - Line 1394',1791485044,'PHP',0,NULL),
(263,99,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485044,'PHP',0,NULL),
(264,99,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/print.inc.php - Line 1394',1791485044,'PHP',0,NULL),
(265,99,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485044,'PHP',0,NULL),
(266,99,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/print.inc.php - Line 1394',1791485044,'PHP',0,NULL),
(267,99,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485044,'PHP',0,NULL),
(268,99,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/print.inc.php - Line 1394',1791485044,'PHP',0,NULL),
(269,99,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485044,'PHP',0,NULL),
(270,99,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/print.inc.php - Line 1394',1791485044,'PHP',0,NULL),
(271,99,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485044,'PHP',0,NULL),
(272,99,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/print.inc.php - Line 1394',1791485044,'PHP',0,NULL),
(273,99,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485044,'PHP',0,NULL),
(274,99,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/print.inc.php - Line 1394',1791485044,'PHP',0,NULL),
(275,99,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485044,'PHP',0,NULL),
(276,99,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/print.inc.php - Line 1394',1791485044,'PHP',0,NULL),
(277,99,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485044,'PHP',0,NULL),
(278,99,2,'GUI - Test Project ID : 1','E_WARNING\nTrying to access array offset on value of type null - in /var/www/html/lib/functions/print.inc.php - Line 1394',1791485044,'PHP',0,NULL),
(279,99,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485044,'PHP',0,NULL),
(280,100,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485085,'PHP',0,NULL),
(281,100,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485085,'PHP',0,NULL),
(282,100,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485085,'PHP',0,NULL),
(283,100,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485085,'PHP',0,NULL),
(284,100,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485085,'PHP',0,NULL),
(285,100,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485085,'PHP',0,NULL),
(286,100,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485085,'PHP',0,NULL),
(287,100,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485085,'PHP',0,NULL),
(288,100,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485085,'PHP',0,NULL),
(289,100,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485085,'PHP',0,NULL),
(290,100,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485085,'PHP',0,NULL),
(291,100,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485085,'PHP',0,NULL),
(292,100,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485085,'PHP',0,NULL),
(293,100,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485085,'PHP',0,NULL),
(294,100,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485085,'PHP',0,NULL),
(295,100,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485085,'PHP',0,NULL),
(296,100,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485085,'PHP',0,NULL),
(297,100,2,'GUI - Test Project ID : 1','E_WARNING\nUndefined array key \"platform\" - in /var/www/html/lib/functions/print.inc.php - Line 1472',1791485085,'PHP',0,NULL);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `exec_by_date_time`
--

DROP TABLE IF EXISTS `exec_by_date_time`;
/*!50001 DROP VIEW IF EXISTS `exec_by_date_time`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `exec_by_date_time` AS SELECT
 NULL AS `testplan_name`,
 NULL AS `yyyy_mm_dd`,
 NULL AS `yyyy_mm`,
 NULL AS `hh`,
 NULL AS `hour`,
 NULL AS `id`,
 NULL AS `build_id`,
 NULL AS `tester_id`,
 NULL AS `execution_ts`,
 NULL AS `status`,
 NULL AS `testplan_id`,
 NULL AS `tcversion_id`,
 NULL AS `tcversion_number`,
 NULL AS `platform_id`,
 NULL AS `execution_type`,
 NULL AS `execution_duration`,
 NULL AS `notes` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `execution_bugs`
--

DROP TABLE IF EXISTS `execution_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `execution_bugs` (
  `execution_id` int(10) unsigned NOT NULL DEFAULT 0,
  `bug_id` varchar(64) NOT NULL DEFAULT '0',
  `tcstep_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`execution_id`,`bug_id`,`tcstep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_bugs`
--

LOCK TABLES `execution_bugs` WRITE;
/*!40000 ALTER TABLE `execution_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `execution_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_tcsteps`
--

DROP TABLE IF EXISTS `execution_tcsteps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `execution_tcsteps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `execution_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcstep_id` int(10) unsigned NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `execution_tcsteps_idx1` (`execution_id`,`tcstep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_tcsteps`
--

LOCK TABLES `execution_tcsteps` WRITE;
/*!40000 ALTER TABLE `execution_tcsteps` DISABLE KEYS */;
INSERT INTO `execution_tcsteps` VALUES
(2,2,6,'','p'),
(6,5,16,'','p'),
(7,6,19,'','p'),
(10,8,9,'','p'),
(11,8,10,'','p'),
(12,9,13,'','p'),
(13,10,22,'','p'),
(14,10,23,'','p'),
(15,11,26,'','p'),
(16,11,27,'','p'),
(17,11,28,'','p'),
(18,11,29,'','p'),
(19,12,32,'','p'),
(20,12,33,'','p'),
(21,12,34,'','p'),
(22,12,35,'Valor total incorreto, em vez de 30, ficou 10','f'),
(23,13,38,'','p'),
(24,13,39,'','p'),
(25,13,40,'','p'),
(26,13,41,'Mensagem de sucesso','f'),
(27,14,44,'','p'),
(28,14,45,'Pedido foi salvo com sucesso, quando deveria dar erro','f'),
(29,15,48,'','p'),
(30,15,49,'','p'),
(31,15,50,'Não existe nenhuma coluna para a forma de pagamento ou de entrega. Mesmo que a página envie essas escolhas, o sistema não tem onde guardá-las.','f'),
(34,17,53,'','p'),
(35,17,54,'O carrinho voltou para a quantidade 1','f'),
(36,18,57,'','p'),
(37,18,58,'Na aba nova, o carrinho fica vazio.','f'),
(38,19,61,'','p'),
(39,19,62,'','p'),
(40,19,63,'Continua apenas 1','f'),
(41,20,66,'','p'),
(42,20,67,'Não funcionou duas abas, dois logins','f'),
(43,20,68,'','f'),
(44,21,71,'','p'),
(45,21,72,'','p'),
(46,22,75,'','p'),
(47,22,76,'','p'),
(48,23,79,'','p'),
(49,23,80,'','p');
/*!40000 ALTER TABLE `execution_tcsteps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_tcsteps_wip`
--

DROP TABLE IF EXISTS `execution_tcsteps_wip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `execution_tcsteps_wip` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tcstep_id` int(10) unsigned NOT NULL DEFAULT 0,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0,
  `build_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tester_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `execution_tcsteps_wip_idx1` (`tcstep_id`,`testplan_id`,`platform_id`,`build_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_tcsteps_wip`
--

LOCK TABLES `execution_tcsteps_wip` WRITE;
/*!40000 ALTER TABLE `execution_tcsteps_wip` DISABLE KEYS */;
/*!40000 ALTER TABLE `execution_tcsteps_wip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executions`
--

DROP TABLE IF EXISTS `executions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `executions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `build_id` int(10) NOT NULL DEFAULT 0,
  `tester_id` int(10) unsigned DEFAULT NULL,
  `execution_ts` datetime DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcversion_number` smallint(5) unsigned NOT NULL DEFAULT 1,
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0,
  `execution_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 -> manual, 2 -> automated',
  `execution_duration` decimal(6,2) DEFAULT NULL COMMENT 'NULL will be considered as NO DATA Provided by user',
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `executions_idx1` (`testplan_id`,`tcversion_id`,`platform_id`,`build_id`),
  KEY `executions_idx2` (`execution_type`),
  KEY `executions_idx3` (`tcversion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executions`
--

LOCK TABLES `executions` WRITE;
/*!40000 ALTER TABLE `executions` DISABLE KEYS */;
INSERT INTO `executions` VALUES
(2,1,1,'2026-10-08 17:52:28','p',81,5,1,0,1,NULL,''),
(5,1,1,'2026-10-08 18:03:03','p',81,15,1,0,1,NULL,''),
(6,1,1,'2026-10-08 18:03:40','p',81,18,1,0,1,NULL,''),
(8,1,1,'2026-10-08 18:06:12','p',81,8,1,0,1,NULL,''),
(9,1,1,'2026-10-08 18:06:45','p',81,12,1,0,1,NULL,''),
(10,1,1,'2026-10-08 18:07:05','p',81,21,1,0,1,NULL,''),
(11,1,1,'2026-10-08 18:14:35','p',81,25,1,0,1,NULL,''),
(12,1,1,'2026-10-08 18:18:40','f',81,31,1,0,1,NULL,''),
(13,1,1,'2026-10-08 18:19:58','f',81,37,1,0,1,NULL,''),
(14,1,1,'2026-10-08 18:25:07','f',81,43,1,0,1,NULL,''),
(15,1,1,'2026-10-08 18:31:49','f',81,47,1,0,1,NULL,''),
(17,1,1,'2026-10-08 18:33:39','f',81,52,1,0,1,NULL,''),
(18,1,1,'2026-10-08 18:34:35','f',81,56,1,0,1,NULL,''),
(19,1,1,'2026-10-08 18:35:22','f',81,60,1,0,1,NULL,''),
(20,1,1,'2026-10-08 18:37:15','f',81,65,1,0,1,NULL,''),
(21,1,1,'2026-10-08 18:38:13','p',81,70,1,0,1,NULL,''),
(22,1,1,'2026-10-08 18:38:55','p',81,74,1,0,1,NULL,''),
(23,1,1,'2026-10-08 18:40:43','p',81,78,1,0,1,NULL,'');
/*!40000 ALTER TABLE `executions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testproject_id` int(10) unsigned NOT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `ipaddress` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modification_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `inventory_idx1` (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuetrackers`
--

DROP TABLE IF EXISTS `issuetrackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `issuetrackers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int(10) DEFAULT 0,
  `cfg` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `issuetrackers_uidx1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuetrackers`
--

LOCK TABLES `issuetrackers` WRITE;
/*!40000 ALTER TABLE `issuetrackers` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuetrackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keywords`
--

DROP TABLE IF EXISTS `keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `testproject_id` int(10) unsigned NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword_testproject_id` (`keyword`,`testproject_id`),
  KEY `testproject_id` (`testproject_id`),
  KEY `keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keywords`
--

LOCK TABLES `keywords` WRITE;
/*!40000 ALTER TABLE `keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `latest_exec_by_context`
--

DROP TABLE IF EXISTS `latest_exec_by_context`;
/*!50001 DROP VIEW IF EXISTS `latest_exec_by_context`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `latest_exec_by_context` AS SELECT
 NULL AS `tcversion_id`,
 NULL AS `testplan_id`,
 NULL AS `build_id`,
 NULL AS `platform_id`,
 NULL AS `id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_exec_by_testplan`
--

DROP TABLE IF EXISTS `latest_exec_by_testplan`;
/*!50001 DROP VIEW IF EXISTS `latest_exec_by_testplan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `latest_exec_by_testplan` AS SELECT
 NULL AS `tcversion_id`,
 NULL AS `testplan_id`,
 NULL AS `id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_exec_by_testplan_plat`
--

DROP TABLE IF EXISTS `latest_exec_by_testplan_plat`;
/*!50001 DROP VIEW IF EXISTS `latest_exec_by_testplan_plat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `latest_exec_by_testplan_plat` AS SELECT
 NULL AS `tcversion_id`,
 NULL AS `testplan_id`,
 NULL AS `platform_id`,
 NULL AS `id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_req_version`
--

DROP TABLE IF EXISTS `latest_req_version`;
/*!50001 DROP VIEW IF EXISTS `latest_req_version`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `latest_req_version` AS SELECT
 NULL AS `req_id`,
 NULL AS `version` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_req_version_id`
--

DROP TABLE IF EXISTS `latest_req_version_id`;
/*!50001 DROP VIEW IF EXISTS `latest_req_version_id`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `latest_req_version_id` AS SELECT
 NULL AS `req_id`,
 NULL AS `version`,
 NULL AS `req_version_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_rspec_revision`
--

DROP TABLE IF EXISTS `latest_rspec_revision`;
/*!50001 DROP VIEW IF EXISTS `latest_rspec_revision`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `latest_rspec_revision` AS SELECT
 NULL AS `req_spec_id`,
 NULL AS `testproject_id`,
 NULL AS `revision` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_tcase_version_id`
--

DROP TABLE IF EXISTS `latest_tcase_version_id`;
/*!50001 DROP VIEW IF EXISTS `latest_tcase_version_id`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `latest_tcase_version_id` AS SELECT
 NULL AS `testcase_id`,
 NULL AS `version`,
 NULL AS `tcversion_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_tcase_version_number`
--

DROP TABLE IF EXISTS `latest_tcase_version_number`;
/*!50001 DROP VIEW IF EXISTS `latest_tcase_version_number`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `latest_tcase_version_number` AS SELECT
 NULL AS `testcase_id`,
 NULL AS `version` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `milestones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `target_date` date NOT NULL,
  `start_date` date DEFAULT NULL,
  `a` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `b` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `c` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT 'undefined',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_testplan_id` (`name`,`testplan_id`),
  KEY `testplan_id` (`testplan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones`
--

LOCK TABLES `milestones` WRITE;
/*!40000 ALTER TABLE `milestones` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_types`
--

DROP TABLE IF EXISTS `node_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `node_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT 'testproject',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_types`
--

LOCK TABLES `node_types` WRITE;
/*!40000 ALTER TABLE `node_types` DISABLE KEYS */;
INSERT INTO `node_types` VALUES
(1,'testproject'),
(2,'testsuite'),
(3,'testcase'),
(4,'testcase_version'),
(5,'testplan'),
(6,'requirement_spec'),
(7,'requirement'),
(8,'requirement_version'),
(9,'testcase_step'),
(10,'requirement_revision'),
(11,'requirement_spec_revision'),
(12,'build'),
(13,'platform'),
(14,'user');
/*!40000 ALTER TABLE `node_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes_hierarchy`
--

DROP TABLE IF EXISTS `nodes_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `nodes_hierarchy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `node_type_id` int(10) unsigned NOT NULL DEFAULT 1,
  `node_order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid_m_nodeorder` (`parent_id`,`node_order`),
  KEY `nodes_hierarchy_node_type_id` (`node_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes_hierarchy`
--

LOCK TABLES `nodes_hierarchy` WRITE;
/*!40000 ALTER TABLE `nodes_hierarchy` DISABLE KEYS */;
INSERT INTO `nodes_hierarchy` VALUES
(1,'Lanchonete Online',NULL,1,1),
(3,'Carrinho e finalização do pedido',1,2,1),
(4,'CT-CR-01 - Acesso ao carrinho sem login',3,3,1),
(5,'',4,4,0),
(6,'',5,9,0),
(7,'CT-CR-02 - Carrinho com um lanche',3,3,1),
(8,'',7,4,0),
(9,'',8,9,0),
(10,'',8,9,0),
(11,'CT-CR-03 - Aumentar a quantidade',3,3,1),
(12,'',11,4,0),
(13,'',12,9,0),
(14,'CT-CR-04 - Diminuir a quantidade',3,3,1),
(15,'',14,4,0),
(16,'',15,9,0),
(17,'CT-CR-05 - Diminuir com quantidade 1 (remoção)',3,3,1),
(18,'',17,4,0),
(19,'',18,9,0),
(20,'CT-CR-06 - Carrinho com lanche e bebida',3,3,1),
(21,'',20,4,0),
(22,'',21,9,0),
(23,'',21,9,0),
(24,'CT-CR-07 - Finalizar pedido com um item',3,3,1),
(25,'',24,4,0),
(26,'',25,9,0),
(27,'',25,9,0),
(28,'',25,9,0),
(29,'',25,9,0),
(30,'CT-CR-08 - Finalizar pedido com quantidade maior que 1',3,3,1),
(31,'',30,4,0),
(32,'',31,9,0),
(33,'',31,9,0),
(34,'',31,9,0),
(35,'',31,9,0),
(36,'CT-CR-09 - Finalizar com o carrinho vazio',3,3,1),
(37,'',36,4,0),
(38,'',37,9,0),
(39,'',37,9,0),
(40,'',37,9,0),
(41,'',37,9,0),
(42,'CT-CR-10 - Finalizar sem escolher pagamento e entrega',3,3,1),
(43,'',42,4,0),
(44,'',43,9,0),
(45,'',43,9,0),
(46,'CT-CR-11 - Registro da forma de pagamento e entrega',3,3,1),
(47,'',46,4,0),
(48,'',47,9,0),
(49,'',47,9,0),
(50,'',47,9,0),
(51,'CT-CR-12 - Recarregar a página após alterar a quantidade',3,3,1),
(52,'',51,4,0),
(53,'',52,9,0),
(54,'',52,9,0),
(55,'CT-CR-13 - Abrir o carrinho em outra aba',3,3,1),
(56,'',55,4,0),
(57,'',56,9,0),
(58,'',56,9,0),
(59,'CT-CR-14 - Adicionar o mesmo lanche duas vezes pelo menu',3,3,1),
(60,'',59,4,0),
(61,'',60,9,0),
(62,'',60,9,0),
(63,'',60,9,0),
(64,'CT-CR-15 - Lanchonete fecha antes da finalização',3,3,1),
(65,'',64,4,0),
(66,'',65,9,0),
(67,'',65,9,0),
(68,'',65,9,0),
(69,'CT-CR-16 - Cancelar no carrinho',3,3,1),
(70,'',69,4,0),
(71,'',70,9,0),
(72,'',70,9,0),
(73,'CT-CR-17 - Voltar da tela de pagamento',3,3,1),
(74,'',73,4,0),
(75,'',74,9,0),
(76,'',74,9,0),
(77,'CT-CR-18 - Resumo do pedido',3,3,1),
(78,'',77,4,0),
(79,'',78,9,0),
(80,'',78,9,0),
(81,'Entrega 1',1,5,0);
/*!40000 ALTER TABLE `nodes_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_keywords`
--

DROP TABLE IF EXISTS `object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_id` int(10) unsigned NOT NULL DEFAULT 0,
  `fk_table` varchar(30) DEFAULT '',
  `keyword_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `udx01_object_keywords` (`fk_id`,`fk_table`,`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_keywords`
--

LOCK TABLES `object_keywords` WRITE;
/*!40000 ALTER TABLE `object_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platforms`
--

DROP TABLE IF EXISTS `platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `platforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `testproject_id` int(10) unsigned NOT NULL,
  `notes` text NOT NULL,
  `enable_on_design` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `enable_on_execution` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `is_open` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_platforms` (`testproject_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platforms`
--

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basename` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins_configuration`
--

DROP TABLE IF EXISTS `plugins_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testproject_id` int(11) NOT NULL,
  `config_key` varchar(255) NOT NULL,
  `config_type` int(11) NOT NULL,
  `config_value` varchar(255) NOT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins_configuration`
--

LOCK TABLES `plugins_configuration` WRITE;
/*!40000 ALTER TABLE `plugins_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_coverage`
--

DROP TABLE IF EXISTS `req_coverage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `req_coverage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `req_id` int(10) NOT NULL,
  `req_version_id` int(10) NOT NULL,
  `testcase_id` int(10) NOT NULL,
  `tcversion_id` int(10) NOT NULL,
  `link_status` int(11) NOT NULL DEFAULT 1,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `review_requester_id` int(10) unsigned DEFAULT NULL,
  `review_request_ts` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_coverage_full_link` (`req_id`,`req_version_id`,`testcase_id`,`tcversion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='relation test case version ** requirement version';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_coverage`
--

LOCK TABLES `req_coverage` WRITE;
/*!40000 ALTER TABLE `req_coverage` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_coverage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_monitor`
--

DROP TABLE IF EXISTS `req_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `req_monitor` (
  `req_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `testproject_id` int(11) NOT NULL,
  PRIMARY KEY (`req_id`,`user_id`,`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_monitor`
--

LOCK TABLES `req_monitor` WRITE;
/*!40000 ALTER TABLE `req_monitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_monitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_relations`
--

DROP TABLE IF EXISTS `req_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `req_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(10) unsigned NOT NULL,
  `destination_id` int(10) unsigned NOT NULL,
  `relation_type` smallint(5) unsigned NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_relations`
--

LOCK TABLES `req_relations` WRITE;
/*!40000 ALTER TABLE `req_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_revisions`
--

DROP TABLE IF EXISTS `req_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `req_revisions` (
  `parent_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `revision` smallint(5) unsigned NOT NULL DEFAULT 1,
  `req_doc_id` varchar(64) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `scope` text DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'V',
  `type` char(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `expected_coverage` int(10) NOT NULL DEFAULT 1,
  `log_message` text DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_revisions_uidx1` (`parent_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_revisions`
--

LOCK TABLES `req_revisions` WRITE;
/*!40000 ALTER TABLE `req_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_specs`
--

DROP TABLE IF EXISTS `req_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `req_specs` (
  `id` int(10) unsigned NOT NULL,
  `testproject_id` int(10) unsigned NOT NULL,
  `doc_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_spec_uk1` (`doc_id`,`testproject_id`),
  KEY `testproject_id` (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Dev. Documents (e.g. System Requirements Specification)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_specs`
--

LOCK TABLES `req_specs` WRITE;
/*!40000 ALTER TABLE `req_specs` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_specs_revisions`
--

DROP TABLE IF EXISTS `req_specs_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `req_specs_revisions` (
  `parent_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `revision` smallint(5) unsigned NOT NULL DEFAULT 1,
  `doc_id` varchar(64) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `scope` text DEFAULT NULL,
  `total_req` int(10) NOT NULL DEFAULT 0,
  `status` int(10) unsigned DEFAULT 1,
  `type` char(1) DEFAULT NULL,
  `log_message` text DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_specs_revisions_uidx1` (`parent_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_specs_revisions`
--

LOCK TABLES `req_specs_revisions` WRITE;
/*!40000 ALTER TABLE `req_specs_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_specs_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_versions`
--

DROP TABLE IF EXISTS `req_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `req_versions` (
  `id` int(10) unsigned NOT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT 1,
  `revision` smallint(5) unsigned NOT NULL DEFAULT 1,
  `scope` text DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'V',
  `type` char(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `expected_coverage` int(10) NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  `log_message` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_versions`
--

LOCK TABLES `req_versions` WRITE;
/*!40000 ALTER TABLE `req_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reqmgrsystems`
--

DROP TABLE IF EXISTS `reqmgrsystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reqmgrsystems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int(10) DEFAULT 0,
  `cfg` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reqmgrsystems_uidx1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reqmgrsystems`
--

LOCK TABLES `reqmgrsystems` WRITE;
/*!40000 ALTER TABLE `reqmgrsystems` DISABLE KEYS */;
/*!40000 ALTER TABLE `reqmgrsystems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirements`
--

DROP TABLE IF EXISTS `requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `requirements` (
  `id` int(10) unsigned NOT NULL,
  `srs_id` int(10) unsigned NOT NULL,
  `req_doc_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `requirements_req_doc_id` (`srs_id`,`req_doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirements`
--

LOCK TABLES `requirements` WRITE;
/*!40000 ALTER TABLE `requirements` DISABLE KEYS */;
/*!40000 ALTER TABLE `requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rights_descr` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
INSERT INTO `rights` VALUES
(53,'cfield_assignment'),
(18,'cfield_management'),
(17,'cfield_view'),
(51,'codetracker_management'),
(52,'codetracker_view'),
(56,'delete_frozen_tcversion'),
(22,'events_mgt'),
(54,'exec_assign_testcases'),
(36,'exec_delete'),
(35,'exec_edit_notes'),
(49,'exec_ro_access'),
(41,'exec_testcases_assigned_to_me'),
(31,'issuetracker_management'),
(32,'issuetracker_view'),
(29,'keyword_assignment'),
(9,'mgt_modify_key'),
(12,'mgt_modify_product'),
(11,'mgt_modify_req'),
(7,'mgt_modify_tc'),
(48,'mgt_plugins'),
(16,'mgt_testplan_create'),
(30,'mgt_unfreeze_req'),
(13,'mgt_users'),
(20,'mgt_view_events'),
(8,'mgt_view_key'),
(10,'mgt_view_req'),
(6,'mgt_view_tc'),
(21,'mgt_view_usergroups'),
(50,'monitor_requirement'),
(24,'platform_management'),
(25,'platform_view'),
(26,'project_inventory_management'),
(27,'project_inventory_view'),
(33,'reqmgrsystem_management'),
(34,'reqmgrsystem_view'),
(28,'req_tcase_link_management'),
(14,'role_management'),
(19,'system_configuration'),
(47,'testcase_freeze'),
(43,'testplan_add_remove_platforms'),
(2,'testplan_create_build'),
(1,'testplan_execute'),
(3,'testplan_metrics'),
(40,'testplan_milestone_overview'),
(4,'testplan_planning'),
(45,'testplan_set_urgent_testcases'),
(46,'testplan_show_testcases_newest_versions'),
(37,'testplan_unlink_executed_testcases'),
(44,'testplan_update_linked_testcase_versions'),
(5,'testplan_user_role_assignment'),
(55,'testproject_add_remove_keywords_executed_tcversions'),
(38,'testproject_delete_executed_testcases'),
(39,'testproject_edit_executed_testcases'),
(42,'testproject_metrics_dashboard'),
(23,'testproject_user_role_assignment'),
(15,'user_role_assignment');
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_assignments`
--

DROP TABLE IF EXISTS `risk_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `risk_assignments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `node_id` int(10) unsigned NOT NULL DEFAULT 0,
  `risk` char(1) NOT NULL DEFAULT '2',
  `importance` char(1) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`id`),
  UNIQUE KEY `risk_assignments_tplan_node_id` (`testplan_id`,`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_assignments`
--

LOCK TABLES `risk_assignments` WRITE;
/*!40000 ALTER TABLE `risk_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_rights`
--

DROP TABLE IF EXISTS `role_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_rights` (
  `role_id` int(10) NOT NULL DEFAULT 0,
  `right_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`role_id`,`right_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_rights`
--

LOCK TABLES `role_rights` WRITE;
/*!40000 ALTER TABLE `role_rights` DISABLE KEYS */;
INSERT INTO `role_rights` VALUES
(4,3),
(4,6),
(4,7),
(4,8),
(4,9),
(4,10),
(4,11),
(4,28),
(4,29),
(4,30),
(4,50),
(5,3),
(5,6),
(5,8),
(6,1),
(6,2),
(6,3),
(6,6),
(6,7),
(6,8),
(6,9),
(6,11),
(6,25),
(6,27),
(6,28),
(6,29),
(6,30),
(6,50),
(7,1),
(7,3),
(7,6),
(7,8),
(8,1),
(8,2),
(8,3),
(8,4),
(8,5),
(8,6),
(8,7),
(8,8),
(8,9),
(8,10),
(8,11),
(8,12),
(8,13),
(8,14),
(8,15),
(8,16),
(8,17),
(8,18),
(8,19),
(8,20),
(8,21),
(8,22),
(8,23),
(8,24),
(8,25),
(8,26),
(8,27),
(8,28),
(8,29),
(8,30),
(8,31),
(8,32),
(8,33),
(8,34),
(8,35),
(8,36),
(8,37),
(8,38),
(8,39),
(8,40),
(8,41),
(8,42),
(8,43),
(8,44),
(8,45),
(8,46),
(8,47),
(8,48),
(8,50),
(8,51),
(8,52),
(8,53),
(8,54),
(9,1),
(9,2),
(9,3),
(9,4),
(9,5),
(9,6),
(9,7),
(9,8),
(9,9),
(9,10),
(9,11),
(9,15),
(9,16),
(9,24),
(9,25),
(9,26),
(9,27),
(9,28),
(9,29),
(9,30),
(9,47),
(9,50);
/*!40000 ALTER TABLE `role_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_rights_roles_descr` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'<reserved system role 1>',NULL),
(2,'<reserved system role 2>',NULL),
(3,'<no rights>',NULL),
(4,'test designer',NULL),
(5,'guest',NULL),
(6,'senior tester',NULL),
(7,'tester',NULL),
(8,'admin',NULL),
(9,'leader',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcsteps`
--

DROP TABLE IF EXISTS `tcsteps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tcsteps` (
  `id` int(10) unsigned NOT NULL,
  `step_number` int(11) NOT NULL DEFAULT 1,
  `actions` text DEFAULT NULL,
  `expected_results` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `execution_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 -> manual, 2 -> automated',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcsteps`
--

LOCK TABLES `tcsteps` WRITE;
/*!40000 ALTER TABLE `tcsteps` DISABLE KEYS */;
INSERT INTO `tcsteps` VALUES
(6,1,'<p>Acessar /view/carrinho/carrinho.html diretamente.</p>','<p>Redireciona para a tela de login.</p>',1,1),
(9,1,'<p>No menu, adicionar o X-Teste (R$ 10,00) ao carrinho.</p>','',1,1),
(10,2,'<p>Abrir o carrinho.</p>','<p>O carrinho lista o lanche com quantidade 1. Preço do item e total exibidos como R$ 10,00.</p>',1,1),
(13,1,'<p>No carrinho, clicar em &quot;+&quot; duas vezes.</p>','<p>Quantidade 3. Total R$ 30,00.</p>',1,1),
(16,1,'<p>Clicar em &quot;–&quot; uma vez.</p>','<p>Quantidade 1. Total R$ 10,00. O item continua no carrinho.</p>',1,1),
(19,1,'<p>Clicar em &quot;–&quot;.</p>','<p>O item é removido do carrinho. Total R$ 0,00.</p>',1,1),
(22,1,'<p>No menu, adicionar o X-Teste (R$ 10,00) e a Suco Teste (R$ 5,00).</p>','',1,1),
(23,2,'<p>Abrir o carrinho.</p>','<p>Os dois itens listados. Total R$ 15,00.</p>',1,1),
(26,1,'<p>Clicar em &quot;Método de pagamento&quot;.</p>','',1,1),
(27,2,'<p>Selecionar Crédito e Em casa.</p>','',1,1),
(28,3,'<p>Clicar em &quot;Finalizar&quot;.</p>','',1,1),
(29,4,'<p>Consultar o pedido no banco (consulta 1 da aba Verificação da planilha).</p>','<p>Mensagem de sucesso, carrinho esvaziado. No banco: pedido com valor_total 10.00 e o lanche vinculado com quantidade 1.</p>',1,1),
(32,1,'<p>Clicar em &quot;+&quot; duas vezes (quantidade 3).</p>','',1,1),
(33,2,'<p>Avançar para o pagamento, selecionar Crédito e Em casa.</p>','',1,1),
(34,3,'<p>Finalizar.</p>','',1,1),
(35,4,'<p>Consultar o pedido no banco (consulta 1).</p>','<p>Mensagem de sucesso. No banco: valor_total 30.00 e o lanche vinculado com quantidade 3.</p>',1,1),
(38,1,'<p>Abrir o carrinho.</p>','',1,1),
(39,2,'<p>Avançar para o pagamento.</p>','',1,1),
(40,3,'<p>Clicar em &quot;Finalizar&quot;.</p>','',1,1),
(41,4,'<p>Consultar a tabela de pedidos (consulta 2).</p>','<p>O sistema impede a finalização e avisa que o carrinho está vazio. Nenhum pedido é criado.</p>',1,1),
(44,1,'<p>Avançar para o pagamento sem selecionar nenhuma opção.</p>','',1,1),
(45,2,'<p>Clicar em &quot;Finalizar&quot;.</p>','<p>O sistema exige a escolha da forma de pagamento e da entrega antes de finalizar.</p>',1,1),
(48,1,'<p>Selecionar Débito e No estabelecimento.</p>','',1,1),
(49,2,'<p>Finalizar.</p>','',1,1),
(50,3,'<p>Verificar no banco se as escolhas foram registradas (consulta 1).</p>','<p>O pedido registra a forma de pagamento (Débito) e a forma de entrega (No estabelecimento).</p>',1,1),
(53,1,'<p>Clicar em &quot;+&quot; duas vezes (quantidade 3).</p>','',1,1),
(54,2,'<p>Recarregar a página (F5).</p>','<p>O carrinho mantém quantidade 3 e total R$ 30,00.</p>',1,1),
(57,1,'<p>Copiar o endereço do carrinho.</p>','',1,1),
(58,2,'<p>Abrir em uma nova aba do mesmo navegador.</p>','<p>O carrinho da nova aba mostra o mesmo lanche.</p>',1,1),
(61,1,'<p>No menu, adicionar o X-Teste (R$ 10,00).</p>','',1,1),
(62,2,'<p>Adicionar o mesmo lanche de novo.</p>','',1,1),
(63,3,'<p>Abrir o carrinho.</p>','<p>O carrinho mostra o lanche com quantidade 2 e total R$ 20,00.</p>',1,1),
(66,1,'<p>Na aba do admin, fechar a lanchonete.</p>','',1,1),
(67,2,'<p>Na aba do cliente, finalizar o pedido.</p>','',1,1),
(68,3,'<p>Consultar a tabela de pedidos (consulta 2).</p>','<p>O sistema recusa o pedido informando que a lanchonete está fechada. Nenhum pedido é criado.</p>',1,1),
(71,1,'<p>Clicar em &quot;Cancelar&quot;.</p>','',1,1),
(72,2,'<p>Voltar ao carrinho.</p>','<p>Volta para o menu. Ao reabrir o carrinho, o lanche continua lá.</p>',1,1),
(75,1,'<p>Avançar para o pagamento.</p>','',1,1),
(76,2,'<p>Clicar em &quot;Voltar para os Pedidos&quot;.</p>','<p>A lista de pedidos reaparece com quantidade 2 e total R$ 20,00.</p>',1,1),
(79,1,'<p>Avançar para o pagamento.</p>','',1,1),
(80,2,'<p>Conferir o resumo do pedido.</p>','<p>O resumo mostra cada item com quantidade e valor (2 × R$ 10,00 e 1 × R$ 5,00) e o total R$ 25,00.</p>',1,1);
/*!40000 ALTER TABLE `tcsteps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcversions`
--

DROP TABLE IF EXISTS `tcversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tcversions` (
  `id` int(10) unsigned NOT NULL,
  `tc_external_id` int(10) unsigned DEFAULT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT 1,
  `layout` smallint(5) unsigned NOT NULL DEFAULT 1,
  `status` smallint(5) unsigned NOT NULL DEFAULT 1,
  `summary` text DEFAULT NULL,
  `preconditions` text DEFAULT NULL,
  `importance` smallint(5) unsigned NOT NULL DEFAULT 2,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updater_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `execution_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 -> manual, 2 -> automated',
  `estimated_exec_duration` decimal(6,2) DEFAULT NULL COMMENT 'NULL will be considered as NO DATA Provided by user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcversions`
--

LOCK TABLES `tcversions` WRITE;
/*!40000 ALTER TABLE `tcversions` DISABLE KEYS */;
INSERT INTO `tcversions` VALUES
(5,1,1,1,1,'<p>Acesso ao carrinho sem login</p><p>Técnica: Partição de equivalência. Oráculo: Código.</p><p>Dados: -</p>','<p>Ambiente preparado; nenhum usuário logado (aba anônima)</p>',2,1,'2026-10-08 17:23:49',NULL,'2026-10-08 17:23:49',1,1,1,NULL),
(8,2,1,1,1,'<p>Carrinho com um lanche</p><p>Técnica: Partição de equivalência. Oráculo: Domínio.</p><p>Dados: X-Teste (R$ 10,00)</p>','<p>Ambiente preparado (lanchonete aberta; X-Teste a R$ 10,00 e Suco Teste a R$ 5,00 cadastrados); cliente logado</p>',2,1,'2026-10-08 17:23:49',NULL,'2026-10-08 17:23:49',1,1,1,NULL),
(12,3,1,1,1,'<p>Aumentar a quantidade</p><p>Técnica: Partição de equivalência. Oráculo: Domínio.</p><p>Dados: X-Teste (R$ 10,00)</p>','<p>Ambiente preparado (lanchonete aberta; X-Teste a R$ 10,00 e Suco Teste a R$ 5,00 cadastrados); cliente logado; X-Teste (R$ 10,00) no carrinho</p>',2,1,'2026-10-08 17:23:49',NULL,'2026-10-08 17:23:49',1,1,1,NULL),
(15,4,1,1,1,'<p>Diminuir a quantidade</p><p>Técnica: Partição de equivalência. Oráculo: Domínio.</p><p>Dados: X-Teste (R$ 10,00)</p>','<p>Ambiente preparado (lanchonete aberta; X-Teste a R$ 10,00 e Suco Teste a R$ 5,00 cadastrados); cliente logado; X-Teste (R$ 10,00) no carrinho com quantidade 2</p>',2,1,'2026-10-08 17:23:49',NULL,'2026-10-08 17:23:49',1,1,1,NULL),
(18,5,1,1,1,'<p>Diminuir com quantidade 1 (remoção)</p><p>Técnica: Análise de valor limite. Oráculo: Domínio.</p><p>Dados: X-Teste (R$ 10,00)</p>','<p>Ambiente preparado (lanchonete aberta; X-Teste a R$ 10,00 e Suco Teste a R$ 5,00 cadastrados); cliente logado; X-Teste (R$ 10,00) no carrinho com quantidade 1</p>',2,1,'2026-10-08 17:23:49',NULL,'2026-10-08 17:23:49',1,1,1,NULL),
(21,6,1,1,1,'<p>Carrinho com lanche e bebida</p><p>Técnica: Partição de equivalência. Oráculo: Domínio.</p><p>Dados: X-Teste (R$ 10,00) e Suco Teste (R$ 5,00)</p>','<p>Ambiente preparado (lanchonete aberta; X-Teste a R$ 10,00 e Suco Teste a R$ 5,00 cadastrados); cliente logado</p>',2,1,'2026-10-08 17:23:49',NULL,'2026-10-08 17:23:49',1,1,1,NULL),
(25,7,1,1,1,'<p>Finalizar pedido com um item</p><p>Técnica: Partição de equivalência. Oráculo: Domínio.</p><p>Dados: X-Teste (R$ 10,00)</p>','<p>Ambiente preparado (lanchonete aberta; X-Teste a R$ 10,00 e Suco Teste a R$ 5,00 cadastrados); cliente logado; X-Teste (R$ 10,00) no carrinho com quantidade 1</p>',2,1,'2026-10-08 17:23:49',NULL,'2026-10-08 17:23:49',1,1,1,NULL),
(31,8,1,1,1,'<p>Finalizar pedido com quantidade maior que 1</p><p>Técnica: Partição de equivalência. Oráculo: Domínio.</p><p>Dados: X-Teste (R$ 10,00), quantidade 3</p>','<p>Ambiente preparado (lanchonete aberta; X-Teste a R$ 10,00 e Suco Teste a R$ 5,00 cadastrados); cliente logado; X-Teste (R$ 10,00) no carrinho</p>',2,1,'2026-10-08 17:23:49',NULL,'2026-10-08 17:23:49',1,1,1,NULL),
(37,9,1,1,1,'<p>Finalizar com o carrinho vazio</p><p>Técnica: Análise de valor limite. Oráculo: Domínio.</p><p>Dados: -</p>','<p>Ambiente preparado (lanchonete aberta; X-Teste a R$ 10,00 e Suco Teste a R$ 5,00 cadastrados); cliente logado; carrinho vazio</p>',2,1,'2026-10-08 17:23:49',NULL,'2026-10-08 17:23:49',1,1,1,NULL),
(43,10,1,1,1,'<p>Finalizar sem escolher pagamento e entrega</p><p>Técnica: Partição de equivalência. Oráculo: Domínio.</p><p>Dados: X-Teste (R$ 10,00)</p>','<p>Ambiente preparado (lanchonete aberta; X-Teste a R$ 10,00 e Suco Teste a R$ 5,00 cadastrados); cliente logado; X-Teste (R$ 10,00) no carrinho</p>',2,1,'2026-10-08 17:23:49',NULL,'2026-10-08 17:23:49',1,1,1,NULL),
(47,11,1,1,1,'<p>Registro da forma de pagamento e entrega</p><p>Técnica: Partição de equivalência. Oráculo: Domínio.</p><p>Dados: X-Teste (R$ 10,00)</p>','<p>Ambiente preparado (lanchonete aberta; X-Teste a R$ 10,00 e Suco Teste a R$ 5,00 cadastrados); cliente logado; X-Teste (R$ 10,00) no carrinho</p>',2,1,'2026-10-08 17:23:49',NULL,'2026-10-08 17:23:49',1,1,1,NULL),
(52,12,1,1,1,'<p>Recarregar a página após alterar a quantidade</p><p>Técnica: Transição de estado. Oráculo: Domínio.</p><p>Dados: X-Teste (R$ 10,00)</p>','<p>Ambiente preparado (lanchonete aberta; X-Teste a R$ 10,00 e Suco Teste a R$ 5,00 cadastrados); cliente logado; X-Teste (R$ 10,00) no carrinho</p>',2,1,'2026-10-08 17:23:49',NULL,'2026-10-08 17:23:49',1,1,1,NULL),
(56,13,1,1,1,'<p>Abrir o carrinho em outra aba</p><p>Técnica: Transição de estado. Oráculo: Domínio.</p><p>Dados: X-Teste (R$ 10,00)</p>','<p>Ambiente preparado (lanchonete aberta; X-Teste a R$ 10,00 e Suco Teste a R$ 5,00 cadastrados); cliente logado; X-Teste (R$ 10,00) no carrinho</p>',2,1,'2026-10-08 17:23:49',NULL,'2026-10-08 17:23:49',1,1,1,NULL),
(60,14,1,1,1,'<p>Adicionar o mesmo lanche duas vezes pelo menu</p><p>Técnica: Partição de equivalência. Oráculo: Domínio.</p><p>Dados: X-Teste (R$ 10,00)</p>','<p>Ambiente preparado (lanchonete aberta; X-Teste a R$ 10,00 e Suco Teste a R$ 5,00 cadastrados); cliente logado; carrinho vazio</p>',2,1,'2026-10-08 17:23:49',NULL,'2026-10-08 17:23:49',1,1,1,NULL),
(65,15,1,1,1,'<p>Lanchonete fecha antes da finalização</p><p>Técnica: Transição de estado. Oráculo: Domínio.</p><p>Dados: X-Teste (R$ 10,00)</p>','<p>Ambiente preparado (lanchonete aberta; X-Teste a R$ 10,00 e Suco Teste a R$ 5,00 cadastrados); cliente logado; X-Teste (R$ 10,00) no carrinho; outra aba logada como admin</p>',2,1,'2026-10-08 17:23:49',NULL,'2026-10-08 17:23:49',1,1,1,NULL),
(70,16,1,1,1,'<p>Cancelar no carrinho</p><p>Técnica: Transição de estado. Oráculo: Domínio.</p><p>Dados: X-Teste (R$ 10,00)</p>','<p>Ambiente preparado (lanchonete aberta; X-Teste a R$ 10,00 e Suco Teste a R$ 5,00 cadastrados); cliente logado; X-Teste (R$ 10,00) no carrinho</p>',2,1,'2026-10-08 17:23:49',NULL,'2026-10-08 17:23:49',1,1,1,NULL),
(74,17,1,1,1,'<p>Voltar da tela de pagamento</p><p>Técnica: Transição de estado. Oráculo: Domínio.</p><p>Dados: X-Teste (R$ 10,00)</p>','<p>Ambiente preparado (lanchonete aberta; X-Teste a R$ 10,00 e Suco Teste a R$ 5,00 cadastrados); cliente logado; X-Teste (R$ 10,00) no carrinho com quantidade 2</p>',2,1,'2026-10-08 17:23:49',NULL,'2026-10-08 17:23:49',1,1,1,NULL),
(78,18,1,1,1,'<p>Resumo do pedido</p><p>Técnica: Partição de equivalência. Oráculo: Domínio.</p><p>Dados: X-Teste (R$ 10,00) (2) e Suco Teste (R$ 5,00) (1)</p>','<p>Ambiente preparado (lanchonete aberta; X-Teste a R$ 10,00 e Suco Teste a R$ 5,00 cadastrados); cliente logado; X-Teste (R$ 10,00) com quantidade 2 e Suco Teste (R$ 5,00) com quantidade 1</p>',2,1,'2026-10-08 17:23:49',NULL,'2026-10-08 17:23:49',1,1,1,NULL);
/*!40000 ALTER TABLE `tcversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `tcversions_without_keywords`
--

DROP TABLE IF EXISTS `tcversions_without_keywords`;
/*!50001 DROP VIEW IF EXISTS `tcversions_without_keywords`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `tcversions_without_keywords` AS SELECT
 NULL AS `testcase_id`,
 NULL AS `id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `tcversions_without_platforms`
--

DROP TABLE IF EXISTS `tcversions_without_platforms`;
/*!50001 DROP VIEW IF EXISTS `tcversions_without_platforms`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `tcversions_without_platforms` AS SELECT
 NULL AS `testcase_id`,
 NULL AS `id` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `testcase_keywords`
--

DROP TABLE IF EXISTS `testcase_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `testcase_keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testcase_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT 0,
  `keyword_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx01_testcase_keywords` (`testcase_id`,`tcversion_id`,`keyword_id`),
  KEY `idx02_testcase_keywords` (`tcversion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcase_keywords`
--

LOCK TABLES `testcase_keywords` WRITE;
/*!40000 ALTER TABLE `testcase_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcase_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcase_platforms`
--

DROP TABLE IF EXISTS `testcase_platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `testcase_platforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testcase_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT 0,
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx01_testcase_platform` (`testcase_id`,`tcversion_id`,`platform_id`),
  KEY `idx02_testcase_platform` (`tcversion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcase_platforms`
--

LOCK TABLES `testcase_platforms` WRITE;
/*!40000 ALTER TABLE `testcase_platforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcase_platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcase_relations`
--

DROP TABLE IF EXISTS `testcase_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `testcase_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(10) unsigned NOT NULL,
  `destination_id` int(10) unsigned NOT NULL,
  `link_status` tinyint(1) NOT NULL DEFAULT 1,
  `relation_type` smallint(5) unsigned NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcase_relations`
--

LOCK TABLES `testcase_relations` WRITE;
/*!40000 ALTER TABLE `testcase_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcase_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcase_script_links`
--

DROP TABLE IF EXISTS `testcase_script_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `testcase_script_links` (
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT 0,
  `project_key` varchar(64) NOT NULL,
  `repository_name` varchar(64) NOT NULL,
  `code_path` varchar(255) NOT NULL,
  `branch_name` varchar(64) DEFAULT NULL,
  `commit_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`tcversion_id`,`project_key`,`repository_name`,`code_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcase_script_links`
--

LOCK TABLES `testcase_script_links` WRITE;
/*!40000 ALTER TABLE `testcase_script_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcase_script_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplan_platforms`
--

DROP TABLE IF EXISTS `testplan_platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `testplan_platforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL,
  `platform_id` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_testplan_platforms` (`testplan_id`,`platform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Connects a testplan with platforms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplan_platforms`
--

LOCK TABLES `testplan_platforms` WRITE;
/*!40000 ALTER TABLE `testplan_platforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `testplan_platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplan_tcversions`
--

DROP TABLE IF EXISTS `testplan_tcversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `testplan_tcversions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT 0,
  `node_order` int(10) unsigned NOT NULL DEFAULT 1,
  `urgency` smallint(5) NOT NULL DEFAULT 2,
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `testplan_tcversions_tplan_tcversion` (`testplan_id`,`tcversion_id`,`platform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplan_tcversions`
--

LOCK TABLES `testplan_tcversions` WRITE;
/*!40000 ALTER TABLE `testplan_tcversions` DISABLE KEYS */;
INSERT INTO `testplan_tcversions` VALUES
(1,81,5,10,2,0,1,'2026-10-08 17:30:30'),
(2,81,8,10,2,0,1,'2026-10-08 17:30:30'),
(3,81,12,10,2,0,1,'2026-10-08 17:30:30'),
(4,81,15,10,2,0,1,'2026-10-08 17:30:30'),
(5,81,18,10,2,0,1,'2026-10-08 17:30:30'),
(6,81,21,10,2,0,1,'2026-10-08 17:30:30'),
(7,81,25,10,2,0,1,'2026-10-08 17:30:30'),
(8,81,31,10,2,0,1,'2026-10-08 17:30:30'),
(9,81,37,10,2,0,1,'2026-10-08 17:30:30'),
(10,81,43,10,2,0,1,'2026-10-08 17:30:30'),
(11,81,47,10,2,0,1,'2026-10-08 17:30:30'),
(12,81,52,10,2,0,1,'2026-10-08 17:30:30'),
(13,81,56,10,2,0,1,'2026-10-08 17:30:30'),
(14,81,60,10,2,0,1,'2026-10-08 17:30:30'),
(15,81,65,10,2,0,1,'2026-10-08 17:30:30'),
(16,81,70,10,2,0,1,'2026-10-08 17:30:30'),
(17,81,74,10,2,0,1,'2026-10-08 17:30:30'),
(18,81,78,10,2,0,1,'2026-10-08 17:30:30');
/*!40000 ALTER TABLE `testplan_tcversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplans`
--

DROP TABLE IF EXISTS `testplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `testplans` (
  `id` int(10) unsigned NOT NULL,
  `testproject_id` int(10) unsigned NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `api_key` varchar(64) NOT NULL DEFAULT '829a2ded3ed0829a2dedd8ab81dfa2c77e8235bc3ed0d8ab81dfa2c77e8235bc',
  PRIMARY KEY (`id`),
  UNIQUE KEY `testplans_api_key` (`api_key`),
  KEY `testplans_testproject_id_active` (`testproject_id`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplans`
--

LOCK TABLES `testplans` WRITE;
/*!40000 ALTER TABLE `testplans` DISABLE KEYS */;
INSERT INTO `testplans` VALUES
(81,1,'<p>&nbsp;</p>\r\n<g0-textarea-recorder-host id=\"g0-textarea-recorder\"></g0-textarea-recorder-host>',1,1,0,'483f11766f4ed0ccf08cc789061d8f97c540cf40dca6b8e3e7a6f2ba0baba949');
/*!40000 ALTER TABLE `testplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testproject_codetracker`
--

DROP TABLE IF EXISTS `testproject_codetracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `testproject_codetracker` (
  `testproject_id` int(10) unsigned NOT NULL,
  `codetracker_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testproject_codetracker`
--

LOCK TABLES `testproject_codetracker` WRITE;
/*!40000 ALTER TABLE `testproject_codetracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `testproject_codetracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testproject_issuetracker`
--

DROP TABLE IF EXISTS `testproject_issuetracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `testproject_issuetracker` (
  `testproject_id` int(10) unsigned NOT NULL,
  `issuetracker_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testproject_issuetracker`
--

LOCK TABLES `testproject_issuetracker` WRITE;
/*!40000 ALTER TABLE `testproject_issuetracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `testproject_issuetracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testproject_reqmgrsystem`
--

DROP TABLE IF EXISTS `testproject_reqmgrsystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `testproject_reqmgrsystem` (
  `testproject_id` int(10) unsigned NOT NULL,
  `reqmgrsystem_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testproject_reqmgrsystem`
--

LOCK TABLES `testproject_reqmgrsystem` WRITE;
/*!40000 ALTER TABLE `testproject_reqmgrsystem` DISABLE KEYS */;
/*!40000 ALTER TABLE `testproject_reqmgrsystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testprojects`
--

DROP TABLE IF EXISTS `testprojects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `testprojects` (
  `id` int(10) unsigned NOT NULL,
  `notes` text DEFAULT NULL,
  `color` varchar(12) NOT NULL DEFAULT '#9BD',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `option_reqs` tinyint(1) NOT NULL DEFAULT 0,
  `option_priority` tinyint(1) NOT NULL DEFAULT 0,
  `option_automation` tinyint(1) NOT NULL DEFAULT 0,
  `options` text DEFAULT NULL,
  `prefix` varchar(16) NOT NULL,
  `tc_counter` int(10) unsigned NOT NULL DEFAULT 0,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `issue_tracker_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `code_tracker_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `reqmgr_integration_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `api_key` varchar(64) NOT NULL DEFAULT '0d8ab81dfa2c77e8235bc829a2ded3edfa2c78235bc829a27eded3ed0d8ab81d',
  PRIMARY KEY (`id`),
  UNIQUE KEY `testprojects_prefix` (`prefix`),
  UNIQUE KEY `testprojects_api_key` (`api_key`),
  KEY `testprojects_id_active` (`id`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testprojects`
--

LOCK TABLES `testprojects` WRITE;
/*!40000 ALTER TABLE `testprojects` DISABLE KEYS */;
INSERT INTO `testprojects` VALUES
(1,'<p>&nbsp;</p>\r\n<g0-textarea-recorder-host id=\"g0-textarea-recorder\"></g0-textarea-recorder-host>','',1,0,0,0,'O:8:\"stdClass\":4:{s:19:\"requirementsEnabled\";i:0;s:19:\"testPriorityEnabled\";i:1;s:17:\"automationEnabled\";i:1;s:16:\"inventoryEnabled\";i:0;}','LO',18,1,0,0,0,'6b91f96f53f6fa5ae6b051010262eb99743b4f1f8e2bee8ae8c3064273646f0d');
/*!40000 ALTER TABLE `testprojects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testsuites`
--

DROP TABLE IF EXISTS `testsuites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `testsuites` (
  `id` int(10) unsigned NOT NULL,
  `details` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testsuites`
--

LOCK TABLES `testsuites` WRITE;
/*!40000 ALTER TABLE `testsuites` DISABLE KEYS */;
INSERT INTO `testsuites` VALUES
(3,'<p>Casos de teste manuais da funcionalidade de carrinho e finalização do pedido da Lanchonete Online. Responsável: Rafaella Lenzi.</p>');
/*!40000 ALTER TABLE `testsuites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_templates`
--

DROP TABLE IF EXISTS `text_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `text_templates` (
  `id` int(10) unsigned NOT NULL,
  `type` smallint(5) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `template_data` text DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  UNIQUE KEY `idx_text_templates` (`type`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='Global Project Templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_templates`
--

LOCK TABLES `text_templates` WRITE;
/*!40000 ALTER TABLE `text_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `text_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_point` varchar(45) NOT NULL DEFAULT '',
  `start_time` int(10) unsigned NOT NULL DEFAULT 0,
  `end_time` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `session_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES
(1,'/login.php',1791479439,1791479439,1,'84438b2272b616611afc2539853a8891'),
(2,'/lib/usermanagement/userInfo.php',1791479466,1791479466,1,'84438b2272b616611afc2539853a8891'),
(3,'/lib/usermanagement/userInfo.php',1791479510,1791479510,1,'84438b2272b616611afc2539853a8891'),
(4,'/lib/usermanagement/userInfo.php',1791479513,1791479513,1,'84438b2272b616611afc2539853a8891'),
(5,'/logout.php',1791479516,1791479516,1,'84438b2272b616611afc2539853a8891'),
(6,'/login.php',1791479525,1791479525,1,'84438b2272b616611afc2539853a8891'),
(7,'/lib/project/projectEdit.php',1791479579,1791479579,1,'84438b2272b616611afc2539853a8891'),
(8,'/lib/project/projectView.php',1791479659,1791479659,1,'84438b2272b616611afc2539853a8891'),
(9,'/lib/project/projectEdit.php',1791479678,1791479678,1,'84438b2272b616611afc2539853a8891'),
(10,'/lib/project/projectView.php',1791479697,1791479697,1,'84438b2272b616611afc2539853a8891'),
(11,'/lib/project/projectView.php',1791479805,1791479805,1,'84438b2272b616611afc2539853a8891'),
(12,'/lib/project/projectView.php',1791479824,1791479824,1,'84438b2272b616611afc2539853a8891'),
(13,'/login.php',1791479888,1791479888,1,'84438b2272b616611afc2539853a8891'),
(14,'/logout.php',1791479898,1791479898,1,'84438b2272b616611afc2539853a8891'),
(15,'/login.php',1791479902,1791479902,1,'84438b2272b616611afc2539853a8891'),
(16,'/lib/results/printDocument.php',1791480111,1791480111,1,'84438b2272b616611afc2539853a8891'),
(17,'/lib/project/projectView.php',1791480264,1791480264,1,'84438b2272b616611afc2539853a8891'),
(18,'/lib/plan/planEdit.php',1791480274,1791480274,1,'84438b2272b616611afc2539853a8891'),
(19,'/lib/plan/planEdit.php',1791480313,1791480313,1,'84438b2272b616611afc2539853a8891'),
(20,'/lib/plan/planEdit.php',1791480323,1791480323,1,'84438b2272b616611afc2539853a8891'),
(21,'/lib/plan/planEdit.php',1791480330,1791480330,1,'84438b2272b616611afc2539853a8891'),
(22,'/lib/plan/planEdit.php',1791480380,1791480380,1,'84438b2272b616611afc2539853a8891'),
(23,'/lib/plan/planEdit.php',1791480403,1791480403,1,'84438b2272b616611afc2539853a8891'),
(24,'/lib/usermanagement/usersAssign.php',1791480409,1791480409,1,'84438b2272b616611afc2539853a8891'),
(25,'/lib/usermanagement/usersAssign.php',1791480414,1791480414,1,'84438b2272b616611afc2539853a8891'),
(26,'/lib/usermanagement/usersAssign.php',1791480416,1791480416,1,'84438b2272b616611afc2539853a8891'),
(27,'/lib/project/projectView.php',1791480521,1791480521,1,'84438b2272b616611afc2539853a8891'),
(28,'/lib/plan/planEdit.php',1791480529,1791480529,1,'84438b2272b616611afc2539853a8891'),
(29,'/lib/plan/planEdit.php',1791480598,1791480598,1,'84438b2272b616611afc2539853a8891'),
(30,'/lib/plan/planAddTC.php',1791480630,1791480631,1,'84438b2272b616611afc2539853a8891'),
(31,'/lib/plan/buildEdit.php',1791480713,1791480713,1,'84438b2272b616611afc2539853a8891'),
(32,'/lib/plan/planEdit.php',1791480726,1791480726,1,'84438b2272b616611afc2539853a8891'),
(33,'/lib/plan/planEdit.php',1791480736,1791480736,1,'84438b2272b616611afc2539853a8891'),
(34,'/lib/execute/execSetResults.php',1791480817,1791480817,1,'84438b2272b616611afc2539853a8891'),
(35,'/lib/execute/execSetResults.php',1791480953,1791480953,1,'84438b2272b616611afc2539853a8891'),
(36,'/lib/execute/execSetResults.php',1791481030,1791481030,1,'84438b2272b616611afc2539853a8891'),
(37,'/lib/execute/execSetResults.php',1791481054,1791481054,1,'84438b2272b616611afc2539853a8891'),
(38,'/lib/execute/execSetResults.php',1791481134,1791481134,1,'84438b2272b616611afc2539853a8891'),
(39,'/lib/execute/execSetResults.php',1791481146,1791481146,1,'84438b2272b616611afc2539853a8891'),
(40,'/login.php',1791481859,1791481859,1,'84438b2272b616611afc2539853a8891'),
(41,'/lib/execute/execSetResults.php',1791481878,1791481878,1,'84438b2272b616611afc2539853a8891'),
(42,'/lib/execute/execSetResults.php',1791481884,1791481885,1,'84438b2272b616611afc2539853a8891'),
(43,'/lib/execute/execSetResults.php',1791481888,1791481890,1,'84438b2272b616611afc2539853a8891'),
(44,'/lib/execute/execSetResults.php',1791481906,1791481906,1,'84438b2272b616611afc2539853a8891'),
(45,'/lib/execute/execSetResults.php',1791481921,1791481921,1,'84438b2272b616611afc2539853a8891'),
(46,'/lib/execute/execSetResults.php',1791481944,1791481944,1,'84438b2272b616611afc2539853a8891'),
(47,'/lib/execute/execSetResults.php',1791481949,1791481949,1,'84438b2272b616611afc2539853a8891'),
(48,'/lib/execute/execSetResults.php',1791481961,1791481961,1,'84438b2272b616611afc2539853a8891'),
(49,'/lib/execute/execSetResults.php',1791482477,1791482477,1,'84438b2272b616611afc2539853a8891'),
(50,'/lib/execute/execSetResults.php',1791482486,1791482486,1,'84438b2272b616611afc2539853a8891'),
(51,'/lib/execute/execSetResults.php',1791482549,1791482549,1,'84438b2272b616611afc2539853a8891'),
(52,'/lib/execute/execSetResults.php',1791482555,1791482555,1,'84438b2272b616611afc2539853a8891'),
(53,'/lib/execute/execSetResults.php',1791482583,1791482583,1,'84438b2272b616611afc2539853a8891'),
(54,'/lib/execute/execSetResults.php',1791482607,1791482607,1,'84438b2272b616611afc2539853a8891'),
(55,'/lib/execute/execSetResults.php',1791482620,1791482620,1,'84438b2272b616611afc2539853a8891'),
(56,'/lib/execute/execSetResults.php',1791482624,1791482624,1,'84438b2272b616611afc2539853a8891'),
(57,'/lib/execute/execSetResults.php',1791482673,1791482673,1,'84438b2272b616611afc2539853a8891'),
(58,'/lib/execute/execSetResults.php',1791482772,1791482772,1,'84438b2272b616611afc2539853a8891'),
(59,'/lib/execute/execSetResults.php',1791482789,1791482789,1,'84438b2272b616611afc2539853a8891'),
(60,'/lib/execute/execSetResults.php',1791482805,1791482805,1,'84438b2272b616611afc2539853a8891'),
(61,'/lib/execute/execSetResults.php',1791482812,1791482812,1,'84438b2272b616611afc2539853a8891'),
(62,'/lib/execute/execSetResults.php',1791482825,1791482825,1,'84438b2272b616611afc2539853a8891'),
(63,'/lib/execute/execSetResults.php',1791482829,1791482829,1,'84438b2272b616611afc2539853a8891'),
(64,'/lib/execute/execSetResults.php',1791482832,1791482832,1,'84438b2272b616611afc2539853a8891'),
(65,'/lib/execute/execSetResults.php',1791483275,1791483275,1,'84438b2272b616611afc2539853a8891'),
(66,'/lib/execute/execSetResults.php',1791483288,1791483288,1,'84438b2272b616611afc2539853a8891'),
(67,'/lib/execute/execSetResults.php',1791483520,1791483520,1,'84438b2272b616611afc2539853a8891'),
(68,'/lib/execute/execSetResults.php',1791483527,1791483527,1,'84438b2272b616611afc2539853a8891'),
(69,'/lib/execute/execSetResults.php',1791483598,1791483598,1,'84438b2272b616611afc2539853a8891'),
(70,'/lib/execute/execSetResults.php',1791483617,1791483617,1,'84438b2272b616611afc2539853a8891'),
(71,'/lib/execute/execSetResults.php',1791483907,1791483907,1,'84438b2272b616611afc2539853a8891'),
(72,'/lib/execute/execSetResults.php',1791483911,1791483911,1,'84438b2272b616611afc2539853a8891'),
(73,'/lib/execute/execSetResults.php',1791483952,1791483952,1,'84438b2272b616611afc2539853a8891'),
(74,'/lib/execute/execSetResults.php',1791483958,1791483958,1,'84438b2272b616611afc2539853a8891'),
(75,'/lib/execute/execSetResults.php',1791484309,1791484309,1,'84438b2272b616611afc2539853a8891'),
(76,'/lib/execute/execSetResults.php',1791484317,1791484317,1,'84438b2272b616611afc2539853a8891'),
(77,'/lib/execute/execSetResults.php',1791484395,1791484395,1,'84438b2272b616611afc2539853a8891'),
(78,'/lib/execute/execSetResults.php',1791484404,1791484404,1,'84438b2272b616611afc2539853a8891'),
(79,'/lib/execute/execSetResults.php',1791484419,1791484419,1,'84438b2272b616611afc2539853a8891'),
(80,'/lib/execute/execSetResults.php',1791484424,1791484424,1,'84438b2272b616611afc2539853a8891'),
(81,'/lib/execute/execSetResults.php',1791484475,1791484475,1,'84438b2272b616611afc2539853a8891'),
(82,'/lib/execute/execSetResults.php',1791484482,1791484482,1,'84438b2272b616611afc2539853a8891'),
(83,'/lib/execute/execSetResults.php',1791484522,1791484522,1,'84438b2272b616611afc2539853a8891'),
(84,'/lib/execute/execSetResults.php',1791484527,1791484527,1,'84438b2272b616611afc2539853a8891'),
(85,'/lib/execute/execSetResults.php',1791484528,1791484528,1,'84438b2272b616611afc2539853a8891'),
(86,'/lib/execute/execSetResults.php',1791484568,1791484568,1,'84438b2272b616611afc2539853a8891'),
(87,'/lib/execute/execSetResults.php',1791484585,1791484585,1,'84438b2272b616611afc2539853a8891'),
(88,'/lib/execute/execSetResults.php',1791484588,1791484588,1,'84438b2272b616611afc2539853a8891'),
(89,'/lib/execute/execSetResults.php',1791484635,1791484635,1,'84438b2272b616611afc2539853a8891'),
(90,'/lib/execute/execSetResults.php',1791484638,1791484638,1,'84438b2272b616611afc2539853a8891'),
(91,'/lib/execute/execSetResults.php',1791484693,1791484693,1,'84438b2272b616611afc2539853a8891'),
(92,'/lib/execute/execSetResults.php',1791484698,1791484698,1,'84438b2272b616611afc2539853a8891'),
(93,'/lib/execute/execSetResults.php',1791484725,1791484725,1,'84438b2272b616611afc2539853a8891'),
(94,'/lib/execute/execSetResults.php',1791484727,1791484727,1,'84438b2272b616611afc2539853a8891'),
(95,'/lib/execute/execSetResults.php',1791484735,1791484735,1,'84438b2272b616611afc2539853a8891'),
(96,'/lib/execute/execSetResults.php',1791484740,1791484740,1,'84438b2272b616611afc2539853a8891'),
(97,'/lib/execute/execSetResults.php',1791484843,1791484843,1,'84438b2272b616611afc2539853a8891'),
(98,'/lib/testcases/tcExport.php',1791484991,1791484991,1,'84438b2272b616611afc2539853a8891'),
(99,'/lib/results/printDocument.php',1791485044,1791485044,1,'84438b2272b616611afc2539853a8891'),
(100,'/lib/results/printDocument.php',1791485085,1791485085,1,'84438b2272b616611afc2539853a8891');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `tsuites_tree_depth_2`
--

DROP TABLE IF EXISTS `tsuites_tree_depth_2`;
/*!50001 DROP VIEW IF EXISTS `tsuites_tree_depth_2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `tsuites_tree_depth_2` AS SELECT
 NULL AS `prefix`,
 NULL AS `testproject_name`,
 NULL AS `level1_name`,
 NULL AS `level2_name`,
 NULL AS `testproject_id`,
 NULL AS `level1_id`,
 NULL AS `level2_id` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_assignments`
--

DROP TABLE IF EXISTS `user_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_assignments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT 1,
  `feature_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned DEFAULT 0,
  `build_id` int(10) unsigned DEFAULT 0,
  `deadline_ts` datetime DEFAULT NULL,
  `assigner_id` int(10) unsigned DEFAULT 0,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(10) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `user_assignments_feature_id` (`feature_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_assignments`
--

LOCK TABLES `user_assignments` WRITE;
/*!40000 ALTER TABLE `user_assignments` DISABLE KEYS */;
INSERT INTO `user_assignments` VALUES
(1,1,1,1,1,NULL,1,'2026-10-08 17:51:46',1);
/*!40000 ALTER TABLE `user_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_group` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_assign`
--

DROP TABLE IF EXISTS `user_group_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_assign` (
  `usergroup_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `idx_user_group_assign` (`usergroup_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_assign`
--

LOCK TABLES `user_group_assign` WRITE;
/*!40000 ALTER TABLE `user_group_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_testplan_roles`
--

DROP TABLE IF EXISTS `user_testplan_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_testplan_roles` (
  `user_id` int(10) NOT NULL DEFAULT 0,
  `testplan_id` int(10) NOT NULL DEFAULT 0,
  `role_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`testplan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_testplan_roles`
--

LOCK TABLES `user_testplan_roles` WRITE;
/*!40000 ALTER TABLE `user_testplan_roles` DISABLE KEYS */;
INSERT INTO `user_testplan_roles` VALUES
(1,81,8);
/*!40000 ALTER TABLE `user_testplan_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_testproject_roles`
--

DROP TABLE IF EXISTS `user_testproject_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_testproject_roles` (
  `user_id` int(10) NOT NULL DEFAULT 0,
  `testproject_id` int(10) NOT NULL DEFAULT 0,
  `role_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_testproject_roles`
--

LOCK TABLES `user_testproject_roles` WRITE;
/*!40000 ALTER TABLE `user_testproject_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_testproject_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `role_id` int(10) unsigned NOT NULL DEFAULT 0,
  `email` varchar(100) NOT NULL DEFAULT '',
  `first` varchar(50) NOT NULL DEFAULT '',
  `last` varchar(50) NOT NULL DEFAULT '',
  `locale` varchar(10) NOT NULL DEFAULT 'en_GB',
  `default_testproject_id` int(10) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `script_key` varchar(32) DEFAULT NULL,
  `cookie_string` varchar(64) NOT NULL DEFAULT '',
  `auth_method` varchar(10) DEFAULT '',
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `expiration_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_login` (`login`),
  UNIQUE KEY `users_cookie_string` (`cookie_string`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='User information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'admin','$2y$10$GBT3SaQszEVLXQDgMckm2.YPQy4Xc32kd89WT40HCx/oi0DO6k6mG',8,'lenzirafaella@gmail.com','Rafaella','Lenzi','en_GB',NULL,1,NULL,'3085c9092065e069d4dc7886c7ec1c230dd05e8c5c3f04dd5d38d8d37279d25b','','2026-10-08 17:09:32',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `exec_by_date_time`
--

/*!50001 DROP VIEW IF EXISTS `exec_by_date_time`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `exec_by_date_time` AS (select `NHTPL`.`name` AS `testplan_name`,date_format(`E`.`execution_ts`,'%Y-%m-%d') AS `yyyy_mm_dd`,date_format(`E`.`execution_ts`,'%Y-%m') AS `yyyy_mm`,date_format(`E`.`execution_ts`,'%H') AS `hh`,date_format(`E`.`execution_ts`,'%k') AS `hour`,`E`.`id` AS `id`,`E`.`build_id` AS `build_id`,`E`.`tester_id` AS `tester_id`,`E`.`execution_ts` AS `execution_ts`,`E`.`status` AS `status`,`E`.`testplan_id` AS `testplan_id`,`E`.`tcversion_id` AS `tcversion_id`,`E`.`tcversion_number` AS `tcversion_number`,`E`.`platform_id` AS `platform_id`,`E`.`execution_type` AS `execution_type`,`E`.`execution_duration` AS `execution_duration`,`E`.`notes` AS `notes` from ((`executions` `E` join `testplans` `TPL` on(`TPL`.`id` = `E`.`testplan_id`)) join `nodes_hierarchy` `NHTPL` on(`NHTPL`.`id` = `TPL`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_exec_by_context`
--

/*!50001 DROP VIEW IF EXISTS `latest_exec_by_context`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_exec_by_context` AS select `executions`.`tcversion_id` AS `tcversion_id`,`executions`.`testplan_id` AS `testplan_id`,`executions`.`build_id` AS `build_id`,`executions`.`platform_id` AS `platform_id`,max(`executions`.`id`) AS `id` from `executions` group by `executions`.`tcversion_id`,`executions`.`testplan_id`,`executions`.`build_id`,`executions`.`platform_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_exec_by_testplan`
--

/*!50001 DROP VIEW IF EXISTS `latest_exec_by_testplan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_exec_by_testplan` AS select `executions`.`tcversion_id` AS `tcversion_id`,`executions`.`testplan_id` AS `testplan_id`,max(`executions`.`id`) AS `id` from `executions` group by `executions`.`tcversion_id`,`executions`.`testplan_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_exec_by_testplan_plat`
--

/*!50001 DROP VIEW IF EXISTS `latest_exec_by_testplan_plat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_exec_by_testplan_plat` AS select `executions`.`tcversion_id` AS `tcversion_id`,`executions`.`testplan_id` AS `testplan_id`,`executions`.`platform_id` AS `platform_id`,max(`executions`.`id`) AS `id` from `executions` group by `executions`.`tcversion_id`,`executions`.`testplan_id`,`executions`.`platform_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_req_version`
--

/*!50001 DROP VIEW IF EXISTS `latest_req_version`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_req_version` AS select `RQ`.`id` AS `req_id`,max(`RQV`.`version`) AS `version` from ((`nodes_hierarchy` `NHRQV` join `requirements` `RQ` on(`RQ`.`id` = `NHRQV`.`parent_id`)) join `req_versions` `RQV` on(`RQV`.`id` = `NHRQV`.`id`)) group by `RQ`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_req_version_id`
--

/*!50001 DROP VIEW IF EXISTS `latest_req_version_id`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_req_version_id` AS select `LRQVN`.`req_id` AS `req_id`,`LRQVN`.`version` AS `version`,`REQV`.`id` AS `req_version_id` from ((`latest_req_version` `LRQVN` join `nodes_hierarchy` `NHRQV` on(`NHRQV`.`parent_id` = `LRQVN`.`req_id`)) join `req_versions` `REQV` on(`REQV`.`id` = `NHRQV`.`id` and `REQV`.`version` = `LRQVN`.`version`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_rspec_revision`
--

/*!50001 DROP VIEW IF EXISTS `latest_rspec_revision`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_rspec_revision` AS select `RSR`.`parent_id` AS `req_spec_id`,`RS`.`testproject_id` AS `testproject_id`,max(`RSR`.`revision`) AS `revision` from (`req_specs_revisions` `RSR` join `req_specs` `RS` on(`RS`.`id` = `RSR`.`parent_id`)) group by `RSR`.`parent_id`,`RS`.`testproject_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_tcase_version_id`
--

/*!50001 DROP VIEW IF EXISTS `latest_tcase_version_id`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_tcase_version_id` AS select `LTCVN`.`testcase_id` AS `testcase_id`,`LTCVN`.`version` AS `version`,`TCV`.`id` AS `tcversion_id` from ((`latest_tcase_version_number` `LTCVN` join `nodes_hierarchy` `NHTCV` on(`NHTCV`.`parent_id` = `LTCVN`.`testcase_id`)) join `tcversions` `TCV` on(`TCV`.`id` = `NHTCV`.`id` and `TCV`.`version` = `LTCVN`.`version`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_tcase_version_number`
--

/*!50001 DROP VIEW IF EXISTS `latest_tcase_version_number`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_tcase_version_number` AS select `NH_TC`.`id` AS `testcase_id`,max(`TCV`.`version`) AS `version` from ((`nodes_hierarchy` `NH_TC` join `nodes_hierarchy` `NH_TCV` on(`NH_TCV`.`parent_id` = `NH_TC`.`id`)) join `tcversions` `TCV` on(`NH_TCV`.`id` = `TCV`.`id`)) group by `NH_TC`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tcversions_without_keywords`
--

/*!50001 DROP VIEW IF EXISTS `tcversions_without_keywords`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `tcversions_without_keywords` AS select `NHTCV`.`parent_id` AS `testcase_id`,`NHTCV`.`id` AS `id` from `nodes_hierarchy` `NHTCV` where `NHTCV`.`node_type_id` = 4 and !exists(select 1 from `testcase_keywords` `TCK` where `TCK`.`tcversion_id` = `NHTCV`.`id` limit 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tcversions_without_platforms`
--

/*!50001 DROP VIEW IF EXISTS `tcversions_without_platforms`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `tcversions_without_platforms` AS select `NHTCV`.`parent_id` AS `testcase_id`,`NHTCV`.`id` AS `id` from `nodes_hierarchy` `NHTCV` where `NHTCV`.`node_type_id` = 4 and !exists(select 1 from `testcase_platforms` `TCPL` where `TCPL`.`tcversion_id` = `NHTCV`.`id` limit 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tsuites_tree_depth_2`
--

/*!50001 DROP VIEW IF EXISTS `tsuites_tree_depth_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `tsuites_tree_depth_2` AS select `TPRJ`.`prefix` AS `prefix`,`NHTPRJ`.`name` AS `testproject_name`,`NHTS_L1`.`name` AS `level1_name`,`NHTS_L2`.`name` AS `level2_name`,`NHTPRJ`.`id` AS `testproject_id`,`NHTS_L1`.`id` AS `level1_id`,`NHTS_L2`.`id` AS `level2_id` from (((`testprojects` `TPRJ` join `nodes_hierarchy` `NHTPRJ` on(`TPRJ`.`id` = `NHTPRJ`.`id`)) left join `nodes_hierarchy` `NHTS_L1` on(`NHTS_L1`.`parent_id` = `NHTPRJ`.`id`)) left join `nodes_hierarchy` `NHTS_L2` on(`NHTS_L2`.`parent_id` = `NHTS_L1`.`id`)) where `NHTPRJ`.`node_type_id` = 1 and `NHTS_L1`.`node_type_id` = 2 and `NHTS_L2`.`node_type_id` = 2 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-08 18:46:39
