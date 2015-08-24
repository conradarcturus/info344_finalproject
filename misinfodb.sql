-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: misinfodb
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_p_permission_id_c332dbf815a4403_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_p_permission_id_c332dbf815a4403_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_568301dde7405af5_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_6e765d2f42a00318_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add event',7,'add_event'),(20,'Can change event',7,'change_event'),(21,'Can delete event',7,'delete_event'),(22,'Can add rumor',8,'add_rumor'),(23,'Can change rumor',8,'change_rumor'),(24,'Can delete rumor',8,'delete_rumor'),(25,'Can add input',9,'add_input'),(26,'Can change input',9,'change_input'),(27,'Can delete input',9,'delete_input'),(28,'Can add feature set',10,'add_featureset'),(29,'Can change feature set',10,'change_featureset'),(30,'Can delete feature set',10,'delete_featureset'),(31,'Can add feature script',11,'add_featurescript'),(32,'Can change feature script',11,'change_featurescript'),(33,'Can delete feature script',11,'delete_featurescript'),(34,'Can add analysis',12,'add_analysis'),(35,'Can change analysis',12,'change_analysis'),(36,'Can delete analysis',12,'delete_analysis'),(37,'Can add result',13,'add_result'),(38,'Can change result',13,'change_result'),(39,'Can delete result',13,'delete_result'),(40,'Can add input file',14,'add_inputfile'),(41,'Can change input file',14,'change_inputfile'),(42,'Can delete input file',14,'delete_inputfile'),(43,'Can add annotated file',15,'add_annotatedfile'),(44,'Can change annotated file',15,'change_annotatedfile'),(45,'Can delete annotated file',15,'delete_annotatedfile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$Sa1CAWvejnIR$qH0B1iuvBpJKhtUpssQeEiBJXh7/HLoyLMv4+d1k+jY=','2015-08-19 20:16:29',1,'admin','','','anied@cs.washington.edu',1,1,'2015-08-19 00:39:31'),(2,'pbkdf2_sha256$20000$ot24n81etMaJ$klv+OFU1k5RpEY4CFgwp+lW0jubeSerwoGABMe9rKeA=','2015-08-20 02:13:30',1,'leech123','Chris','Lee','',1,1,'2015-08-19 19:44:50'),(3,'pbkdf2_sha256$20000$IiDtEPnXloub$lBV4dbkRWQ2gBqXH8XVFWaDE9QlfcwSINHXQoOhHopw=','2015-08-19 19:52:28',1,'anied','Conrad','Nied','',1,1,'2015-08-19 19:45:18');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_3bb4a02ff75193f5_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_3bb4a02ff75193f5_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4c0dfdcf05449b5f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_2ca4dc4a10595f25_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_2ca4dc4a10595f25_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissio_user_id_c04004eeb12edc7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_599d0231799b5d2b_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_44327706ce16f049_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_44327706ce16f049_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_599d0231799b5d2b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-08-19 00:40:26','Sydney Siege','Sydney Siege',1,'',7,1),(2,'2015-08-19 00:40:44','Hadley','Rumor object',1,'',8,1),(3,'2015-08-19 00:41:24','Feature set','FeatureSet object',1,'',10,1),(4,'2015-08-19 03:01:58','Boston Marathon Bombing','Boston Marathon Bombing',1,'',7,1),(5,'2015-08-19 03:02:05','Navy Shooting','Navy Shooting',1,'',7,1),(6,'2015-08-19 03:02:11','Lafayette Shooting','Lafayette Shooting',1,'',7,1),(7,'2015-08-19 03:04:47','Flag','Flag',1,'',8,1),(8,'2015-08-19 03:05:03','Airspace','Airspace',1,'',8,1),(9,'2015-08-19 03:05:11','Lakemba','Lakemba',1,'',8,1),(10,'2015-08-19 03:05:17','Suicide','Suicide',1,'',8,1),(11,'2015-08-19 03:49:05','Example','FeatureScript object',1,'',11,1),(12,'2015-08-19 03:51:47','Feature set','Feature set',2,'Changed feature_script, rumors and features.',10,1),(13,'2015-08-19 03:51:59','Example','Example',2,'Changed name.',10,1),(14,'2015-08-19 03:52:15','Feature set','Feature set',3,'',10,1),(15,'2015-08-19 03:53:07','Example','Example',1,'',12,1),(16,'2015-08-19 04:01:30','2015-08-19 04:01:30.996099+00:00','Sydney Siege Airspace',1,'',9,1),(17,'2015-08-19 04:10:36','2015-08-19 04:10:36.248278+00:00','Sydney Siege Flag',1,'',9,1),(18,'2015-08-19 04:10:42','2015-08-19 04:10:36+00:00','Sydney Siege Flag',2,'No fields changed.',9,1),(19,'2015-08-19 04:42:20','2015-08-19 04:42:20.685233+00:00','Sydney Siege Flag shortened csv flag file',1,'',14,1),(20,'2015-08-19 04:49:06','2015-08-19 04:42:20+00:00','Sydney Siege Flag shortened csv flag file',2,'Changed data_csv.',14,1),(21,'2015-08-19 04:50:21','2015-08-19 04:42:20+00:00','Sydney Siege Flag shortened csv flag file',2,'Changed data_csv.',14,1),(22,'2015-08-19 04:51:33','2015-08-19 04:51:33.659112+00:00','Sydney Siege Flag shortened flag',1,'',14,1),(23,'2015-08-19 05:07:31','2015-08-19 04:42:20+00:00','Sydney Siege Flag shortened csv flag file',3,'',14,1),(24,'2015-08-19 19:44:50','2','leech123',1,'',4,1),(25,'2015-08-19 19:45:00','2','leech123',2,'Changed first_name and last_name.',4,1),(26,'2015-08-19 19:45:18','3','anied',1,'',4,1),(27,'2015-08-19 19:45:26','3','anied',2,'Changed first_name and last_name.',4,1),(28,'2015-08-19 19:45:51','2','leech123',2,'Changed is_staff.',4,1),(29,'2015-08-19 19:45:58','3','anied',2,'Changed is_staff.',4,1),(30,'2015-08-19 19:46:03','1','admin',2,'No fields changed.',4,1),(31,'2015-08-19 19:46:16','3','anied',2,'Changed is_superuser.',4,1),(32,'2015-08-19 19:46:24','2','leech123',2,'Changed is_superuser.',4,1),(33,'2015-08-20 22:24:39','This is a new input','This is a new input',3,'',11,1),(34,'2015-08-20 22:24:39','Test','Test',3,'',11,1),(35,'2015-08-20 22:24:39','Example','Example',3,'',11,1),(36,'2015-08-20 22:25:24','2015-08-20 02:49:47+00:00','Sydney Siege Hadley ',3,'',14,1),(37,'2015-08-20 22:25:24','2015-08-20 02:49:42+00:00','Sydney Siege Hadley ',3,'',14,1),(38,'2015-08-20 22:25:24','2015-08-20 02:49:24+00:00','Sydney Siege Hadley ',3,'',14,1),(39,'2015-08-20 22:25:24','2015-08-20 02:49:14+00:00','Sydney Siege Hadley ',3,'',14,1),(40,'2015-08-20 23:23:56','Support Vector Machine','Support Vector Machine',2,'Changed script.',12,1),(41,'2015-08-20 23:24:06','Example','Example',3,'',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_4186071e6837f8c8_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(12,'shine','analysis'),(15,'shine','annotatedfile'),(7,'shine','event'),(11,'shine','featurescript'),(10,'shine','featureset'),(9,'shine','input'),(14,'shine','inputfile'),(13,'shine','result'),(8,'shine','rumor');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'shine','0001_initial','2015-08-19 00:37:11'),(2,'contenttypes','0001_initial','2015-08-19 00:37:50'),(3,'auth','0001_initial','2015-08-19 00:37:50'),(4,'admin','0001_initial','2015-08-19 00:37:51'),(5,'contenttypes','0002_remove_content_type_name','2015-08-19 00:37:51'),(6,'auth','0002_alter_permission_name_max_length','2015-08-19 00:37:51'),(7,'auth','0003_alter_user_email_max_length','2015-08-19 00:37:51'),(8,'auth','0004_alter_user_username_opts','2015-08-19 00:37:51'),(9,'auth','0005_alter_user_last_login_null','2015-08-19 00:37:51'),(10,'auth','0006_require_contenttypes_0002','2015-08-19 00:37:51'),(11,'sessions','0001_initial','2015-08-19 00:37:51'),(12,'shine','0002_inputfile','2015-08-19 04:37:01'),(13,'shine','0003_inputfile_description','2015-08-19 04:41:21'),(14,'shine','0004_auto_20150820_1740','2015-08-21 00:40:31');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('d0y0s7ik37vpre3qafhadnpj8x49rm0k','YzBiNTAxNzc1MWJhYTQyMTVkODg4NzU4NWYwOTY2NmRjOTMwNjFmODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MWViNmFhNDBlYjkxYTA0OWY3MmZmNGFiMWNjOGQ2OGRlMWU3ODNlIn0=','2015-09-02 20:16:29'),('dh3d1jl6xwtm7nnf8tbahghmsjm80zw2','ZDljY2Q5ZDdjZjNmNzE0YmE2YjQ1OWIxYTI2NTRhMmM1ZWY1ZmExYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjA5OTFjZDVjMTNjYTY0MmM0YWZhZGYzY2JjMzkxYTk3YTBmZGZiZmUiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2015-09-03 02:13:30'),('kzh43xa42mtlrskcthwmgearebpbjddg','YWQ3MDQ1ZTk4ZjUxYmJjMGQyNzhhNjk3ZTNhMGIzMzg1OTY1MjQ3MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjQxZWI2YWE0MGViOTFhMDQ5ZjcyZmY0YWIxY2M4ZDY4ZGUxZTc4M2UiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2015-09-02 00:39:35');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shine_analysis`
--

DROP TABLE IF EXISTS `shine_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shine_analysis` (
  `created` datetime NOT NULL,
  `name` varchar(200) NOT NULL,
  `script` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shine_analysis`
--

LOCK TABLES `shine_analysis` WRITE;
/*!40000 ALTER TABLE `shine_analysis` DISABLE KEYS */;
INSERT INTO `shine_analysis` VALUES ('2015-08-20 23:23:26','Support Vector Machine','from sklearn import svm\r\n\r\nX = [[0, 0], [1, 1]]\r\ny = [0, 1]\r\n\r\nclf = svm.SVC()\r\nclf.fit(X, y)  \r\n\r\nSVC(C=1.0, cache_size=200, class_weight=None, coef0=0.0, degree=3, gamma=0.0, kernel=\'rbf\', max_iter=-1, probability=False, random_state=None, shrinking=True, tol=0.001, verbose=False)');
/*!40000 ALTER TABLE `shine_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shine_annotatedfile`
--

DROP TABLE IF EXISTS `shine_annotatedfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shine_annotatedfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `feature_script_id` varchar(200) NOT NULL,
  `input_file_id` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `s_feature_script_id_5b970c33eca14122_fk_shine_featurescript_name` (`feature_script_id`),
  KEY `shine_annotatedfile_40268ddb` (`input_file_id`),
  CONSTRAINT `shine__input_file_id_612d7399405e51ee_fk_shine_inputfile_created` FOREIGN KEY (`input_file_id`) REFERENCES `shine_inputfile` (`created`),
  CONSTRAINT `s_feature_script_id_5b970c33eca14122_fk_shine_featurescript_name` FOREIGN KEY (`feature_script_id`) REFERENCES `shine_featurescript` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shine_annotatedfile`
--

LOCK TABLES `shine_annotatedfile` WRITE;
/*!40000 ALTER TABLE `shine_annotatedfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `shine_annotatedfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shine_event`
--

DROP TABLE IF EXISTS `shine_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shine_event` (
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shine_event`
--

LOCK TABLES `shine_event` WRITE;
/*!40000 ALTER TABLE `shine_event` DISABLE KEYS */;
INSERT INTO `shine_event` VALUES ('Boston Marathon Bombing',' '),('Lafayette Shooting',' '),('Navy Shooting',' '),('Sydney Siege',' ');
/*!40000 ALTER TABLE `shine_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shine_featurescript`
--

DROP TABLE IF EXISTS `shine_featurescript`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shine_featurescript` (
  `created` datetime NOT NULL,
  `name` varchar(200) NOT NULL,
  `script` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shine_featurescript`
--

LOCK TABLES `shine_featurescript` WRITE;
/*!40000 ALTER TABLE `shine_featurescript` DISABLE KEYS */;
INSERT INTO `shine_featurescript` VALUES ('2015-08-20 05:12:23','TweetLengthExtractor','output[\"tweet_length_with_spaces\"] = len(data.text)\r\noutput[\"tweet_length_no_spaces\"] = len(data.text.replace(\" \", \"\");'),('2015-08-20 05:16:58','TweetWordCount','import re\r\n\r\nregex = re.sub(r\'(http:*).*\\s\', \'\', data.text)\r\noutput[\"tweet_word_count\"] = regex.split();');
/*!40000 ALTER TABLE `shine_featurescript` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shine_featureset`
--

DROP TABLE IF EXISTS `shine_featureset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shine_featureset` (
  `created` datetime NOT NULL,
  `name` varchar(200) NOT NULL,
  `features` longtext NOT NULL,
  `event_id` varchar(200) NOT NULL,
  `feature_script_id` varchar(200) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `shine_featureset_event_id_38e62b22d44a5dcd_fk_shine_event_name` (`event_id`),
  KEY `shine_featureset_acacfe85` (`feature_script_id`),
  CONSTRAINT `shine_featureset_event_id_38e62b22d44a5dcd_fk_shine_event_name` FOREIGN KEY (`event_id`) REFERENCES `shine_event` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shine_featureset`
--

LOCK TABLES `shine_featureset` WRITE;
/*!40000 ALTER TABLE `shine_featureset` DISABLE KEYS */;
/*!40000 ALTER TABLE `shine_featureset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shine_featureset_rumors`
--

DROP TABLE IF EXISTS `shine_featureset_rumors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shine_featureset_rumors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `featureset_id` varchar(200) NOT NULL,
  `rumor_id` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `featureset_id` (`featureset_id`,`rumor_id`),
  KEY `shine_featureset_r_rumor_id_196d3bd70a652f90_fk_shine_rumor_name` (`rumor_id`),
  CONSTRAINT `shine_featureset_r_rumor_id_196d3bd70a652f90_fk_shine_rumor_name` FOREIGN KEY (`rumor_id`) REFERENCES `shine_rumor` (`name`),
  CONSTRAINT `shine_fea_featureset_id_b3cbcd4257415aa_fk_shine_featureset_name` FOREIGN KEY (`featureset_id`) REFERENCES `shine_featureset` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shine_featureset_rumors`
--

LOCK TABLES `shine_featureset_rumors` WRITE;
/*!40000 ALTER TABLE `shine_featureset_rumors` DISABLE KEYS */;
/*!40000 ALTER TABLE `shine_featureset_rumors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shine_input`
--

DROP TABLE IF EXISTS `shine_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shine_input` (
  `created` datetime NOT NULL,
  `tweets` longtext NOT NULL,
  `event_id` varchar(200) NOT NULL,
  `rumor_id` varchar(200) NOT NULL,
  PRIMARY KEY (`created`),
  KEY `shine_input_event_id_6e38830e92e0f50a_fk_shine_event_name` (`event_id`),
  KEY `shine_input_0de090c7` (`rumor_id`),
  CONSTRAINT `shine_input_rumor_id_57907891ad47dc1e_fk_shine_rumor_name` FOREIGN KEY (`rumor_id`) REFERENCES `shine_rumor` (`name`),
  CONSTRAINT `shine_input_event_id_6e38830e92e0f50a_fk_shine_event_name` FOREIGN KEY (`event_id`) REFERENCES `shine_event` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shine_input`
--

LOCK TABLES `shine_input` WRITE;
/*!40000 ALTER TABLE `shine_input` DISABLE KEYS */;
INSERT INTO `shine_input` VALUES ('2015-08-19 04:01:30','Tweet 1,This is an example tweet\r\nTweet 2,theeththrs','Sydney Siege','Airspace'),('2015-08-19 04:10:36','id_str	lang	created_ts	in_reply_to_screen_name	in_reply_to_status_id_str	in_reply_to_user_id_str	text	user.id_str	user.screen_name	user.friends_count	user.statuses_count	user.followers_count	user.favourites_count	user.utc_offset	user.time_zone	user.created_ts	codes.0.first_code	codes.0.second_code.0	codes.0.second_code.1	codes.0.second_code.2	codes.0.second_code.3	geo.coordinates.0	geo.coordinates.1	entities.user_mentions.0.id_str	entities.user_mentions.0.screen_name	entities.user_mentions.1.id_str	entities.user_mentions.1.screen_name	entities.user_mentions.2.id_str	entities.user_mentions.2.screen_name	entities.user_mentions.3.id_str	entities.user_mentions.3.screen_name	entities.user_mentions.4.id_str	entities.user_mentions.4.screen_name	entities.user_mentions.5.id_str	entities.user_mentions.5.screen_name	entities.hashtags.0.text	entities.hashtags.1.text	entities.hashtags.2.text	entities.hashtags.3.text	entities.hashtags.4.text	entities.hashtags.5.text	entities.urls.0.display_url	entities.urls.0.expanded_url	entities.urls.1.display_url	entities.urls.1.expanded_url	entities.urls.2.display_url	entities.urls.2.expanded_url	retweeted_status.id_str	retweeted_status.created_at	retweeted_status.text	retweeted_status.retweet_count	retweeted_status.favorite_count	retweeted_status.user.screen_name	retweeted_status.user.id_str	retweeted_status.user.time_zone	retweeted_status.user.friends_count	retweeted_status.user.statuses_count	retweeted_status.user.followers_count\r\n5.4433E+17	en	2014-12-15T03:16:21Z				RT @tomsteinfort: Terrifying photo of hostages in Martin Place in Sydney, being held by men waving an ISIS flag http://t.co/6ozBRQVNlG	119834432	Ark289	399	31480	399	1243	-10800	Santiago	2010-03-04T19:49:27Z	Affirm							25777812	tomsteinfort																							5.4427E+17	Sun Dec 14 23:17:34 +0000 2014	Terrifying photo of hostages in Martin Place in Sydney, being held by men waving an ISIS flag http://t.co/6ozBRQVNlG	639	99	tomsteinfort	25777812	Melbourne	390	753	14630\r\n5.4433E+17	en	2014-12-15T03:16:22Z				RT @MaajidNawaz: This is flag used in Sydney attack.Ideologically,it\'s Islamist.Operationally,could be al-Qaida,ISIL,or \"self-starter\" httpâ€¦	2738619012	joelchulsey	94	2050	34	510	-21600	Central Time (US & Canada)	2014-08-17T01:07:44Z	Deny	Adjudicate						46078438	MaajidNawaz																							5.44305E+17	Mon Dec 15 01:38:31 +0000 2014	This is flag used in Sydney attack.Ideologically,it\'s Islamist.Operationally,could be al-Qaida,ISIL,or \"self-starter\" http://t.co/yEMjO3Qz7f	76	19	MaajidNawaz	46078438	London	353	26066	31390\r\n5.4433E+17	en	2014-12-15T03:16:24Z				Black standard flag in Martin Place siege symbol of jihad and ISIS http://t.co/KGBXHHuB9nâ€»â€»Black flag black mind.	90389320	medbd333	537	745	65	1	-39600	International Date Line West	2009-11-16T13:08:20Z	Unrelated	Ambiguity	Adjudicate																							news.com.au/national/what-â€¦	http://www.news.com.au/national/what-does-the-black-standard-flag-carried-by-isis-supporters-and-jihadists-mean/story-fncynjr2-1227156323738															\r\n5.4433E+17	en	2014-12-15T03:16:33Z				RT @NBCNews: Flag held by Sydney hostage often used by Jabhat Al-Nusra &amp; other armed Islamist groups, but not ISIS, expert says http://t.coâ€¦	2792231265	anonymouslyoo	249	4210	193	1502			2014-09-29T17:33:34Z	Deny							14173315	NBCNews																	nbcnews.to/1yPUwpJ	http://nbcnews.to/1yPUwpJ					5.44324E+17	Mon Dec 15 02:51:53 +0000 2014	Flag held by Sydney hostage often used by Jabhat Al-Nusra &amp; other armed Islamist groups, but not ISIS, expert says http://t.co/ZtjDvjTt9c	109	20	NBCNews	14173315	Eastern Time (US & Canada)	2894	44337	1954299\r\n5.4433E+17	en	2014-12-15T03:16:39Z				Hostages Taken in #Sydney Cafe as Islamic Flag Reportedly Flown #Australia #ISIS #sydneysiege  http://t.co/wdH5naYO01	53525377	aramiskenderian	734	13851	792	1454	-28800	Pacific Time (US & Canada)	2009-07-03T22:59:07Z	Deny	Adjudicate																		Sydney	Australia	ISIS	sydneysiege			bloomberg.com/politics/articâ€¦	http://www.bloomberg.com/politics/articles/2014-12-14/hostages-taken-in-sydney-cafe-as-islamic-flag-reportedly-flown															\r\n5.4433E+17	en	2014-12-15T03:16:40Z	someone92883220	5.44327E+17	2891315523	@someone92883220 the \"expert\" giving #NBC false #Sydney #Australia flag info is from #newyork firm #ISIS posted on hostage pics	2891315523	someone92883220	12	1137	14	60			2014-11-24T21:38:25Z	Deny	Ambiguity						2891315523	someone92883220											NBC	Sydney	Australia	newyork	ISIS																		\r\n5.4433E+17	en	2014-12-15T03:16:49Z				RT @DailyMailAU: SYDNEY SIEGE: Gunman forces hostages to hold up ISIS flag in window http://t.co/9K3XXEiSFa http://t.co/cATxCjYXpy	28319081	timosteyn	264	8512	428	99	10800	Nairobi	2009-04-02T11:18:41Z	Affirm							1960878613	DailyMailAU																	dailym.ai/134wluW	http://dailym.ai/134wluW					5.44273E+17	Sun Dec 14 23:27:39 +0000 2014	SYDNEY SIEGE: Gunman forces hostages to hold up ISIS flag in window http://t.co/9K3XXEiSFa http://t.co/cATxCjYXpy	398	48	DailyMailAU	1960878613	Eastern Time (US & Canada)	130	573	1196\r\n5.4433E+17	en	2014-12-15T03:16:49Z				RT @BiryaniNazi: @AsnaSays someone has taken few people hostage in a cafe in Sydney.. carrying a flag of ISIS :(	1456100773	BoBhoomi	281	27283	528	11519	19800	New Delhi	2013-05-25T05:33:50Z	Affirm							21572577	BiryaniNazi	371636368	AsnaSays																					5.44328E+17	Mon Dec 15 03:08:20 +0000 2014	@AsnaSays someone has taken few people hostage in a cafe in Sydney.. carrying a flag of ISIS :(	1	0	BiryaniNazi	21572577	Hawaii	421	54089	1312\r\n5.4433E+17	en	2014-12-15T03:16:50Z				RT @NBCNews: Flag held by Sydney hostage often used by Jabhat Al-Nusra &amp; other armed Islamist groups, but not ISIS, expert says http://t.coâ€¦	16538183	pattiallen	326	1490	221	244	-18000	Eastern Time (US & Canada)	2008-10-01T01:17:16Z	Deny							14173315	NBCNews																	nbcnews.to/1yPUwpJ	http://nbcnews.to/1yPUwpJ					5.44324E+17	Mon Dec 15 02:51:53 +0000 2014	Flag held by Sydney hostage often used by Jabhat Al-Nusra &amp; other armed Islamist groups, but not ISIS, expert says http://t.co/ZtjDvjTt9c	110	20	NBCNews	14173315	Eastern Time (US & Canada)	2894	44334	1954229','Sydney Siege','Flag');
/*!40000 ALTER TABLE `shine_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shine_inputfile`
--

DROP TABLE IF EXISTS `shine_inputfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shine_inputfile` (
  `created` datetime NOT NULL,
  `data_csv` varchar(100) NOT NULL,
  `event_id` varchar(200) NOT NULL,
  `rumor_id` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`created`),
  KEY `shine_inputfile_event_id_6b55dfc5b155e87c_fk_shine_event_name` (`event_id`),
  KEY `shine_inputfile_rumor_id_279cf6d00982654e_fk_shine_rumor_name` (`rumor_id`),
  CONSTRAINT `shine_inputfile_event_id_6b55dfc5b155e87c_fk_shine_event_name` FOREIGN KEY (`event_id`) REFERENCES `shine_event` (`name`),
  CONSTRAINT `shine_inputfile_rumor_id_279cf6d00982654e_fk_shine_rumor_name` FOREIGN KEY (`rumor_id`) REFERENCES `shine_rumor` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shine_inputfile`
--

LOCK TABLES `shine_inputfile` WRITE;
/*!40000 ALTER TABLE `shine_inputfile` DISABLE KEYS */;
INSERT INTO `shine_inputfile` VALUES ('2015-08-19 04:51:33','data/flag_shortened.csv','Sydney Siege','Flag','shortened flag'),('2015-08-20 02:47:47','data/inputexample.csv','Sydney Siege','Hadley','');
/*!40000 ALTER TABLE `shine_inputfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shine_result`
--

DROP TABLE IF EXISTS `shine_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shine_result` (
  `created` datetime NOT NULL,
  `true_positive` double NOT NULL,
  `false_positive` double NOT NULL,
  `true_negative` double NOT NULL,
  `false_negative` double NOT NULL,
  `analysis_id` varchar(200) NOT NULL,
  `event_id` varchar(200) NOT NULL,
  `feature_set_id` varchar(200) NOT NULL,
  PRIMARY KEY (`created`),
  KEY `shine_result_analysis_id_15a8eac7cb03beab_fk_shine_analysis_name` (`analysis_id`),
  KEY `shine_result_event_id_31a4b018de7f1c82_fk_shine_event_name` (`event_id`),
  KEY `shine_r_feature_set_id_10fe9e79d76a8ecb_fk_shine_featureset_name` (`feature_set_id`),
  CONSTRAINT `shine_r_feature_set_id_10fe9e79d76a8ecb_fk_shine_featureset_name` FOREIGN KEY (`feature_set_id`) REFERENCES `shine_featureset` (`name`),
  CONSTRAINT `shine_result_analysis_id_15a8eac7cb03beab_fk_shine_analysis_name` FOREIGN KEY (`analysis_id`) REFERENCES `shine_analysis` (`name`),
  CONSTRAINT `shine_result_event_id_31a4b018de7f1c82_fk_shine_event_name` FOREIGN KEY (`event_id`) REFERENCES `shine_event` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shine_result`
--

LOCK TABLES `shine_result` WRITE;
/*!40000 ALTER TABLE `shine_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `shine_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shine_result_rumors`
--

DROP TABLE IF EXISTS `shine_result_rumors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shine_result_rumors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `result_id` datetime NOT NULL,
  `rumor_id` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `result_id` (`result_id`,`rumor_id`),
  KEY `shine_result_rumor_rumor_id_59028ace330b47c3_fk_shine_rumor_name` (`rumor_id`),
  CONSTRAINT `shine_result_rumor_rumor_id_59028ace330b47c3_fk_shine_rumor_name` FOREIGN KEY (`rumor_id`) REFERENCES `shine_rumor` (`name`),
  CONSTRAINT `shine_result_r_result_id_ff3bc6ce00b05d7_fk_shine_result_created` FOREIGN KEY (`result_id`) REFERENCES `shine_result` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shine_result_rumors`
--

LOCK TABLES `shine_result_rumors` WRITE;
/*!40000 ALTER TABLE `shine_result_rumors` DISABLE KEYS */;
/*!40000 ALTER TABLE `shine_result_rumors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shine_rumor`
--

DROP TABLE IF EXISTS `shine_rumor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shine_rumor` (
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `event_id` varchar(200) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `shine_rumor_event_id_318807a9c0afb0c6_fk_shine_event_name` (`event_id`),
  CONSTRAINT `shine_rumor_event_id_318807a9c0afb0c6_fk_shine_event_name` FOREIGN KEY (`event_id`) REFERENCES `shine_event` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shine_rumor`
--

LOCK TABLES `shine_rumor` WRITE;
/*!40000 ALTER TABLE `shine_rumor` DISABLE KEYS */;
INSERT INTO `shine_rumor` VALUES ('Airspace',' ','Sydney Siege'),('Flag',' ','Sydney Siege'),('Hadley',' ','Sydney Siege'),('Lakemba',' ','Sydney Siege'),('Suicide',' ','Sydney Siege');
/*!40000 ALTER TABLE `shine_rumor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-21  2:36:22
