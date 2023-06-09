# ************************************************************
# Sequel Ace SQL dump
# Version 3038
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 8.0.23)
# Database: test
# Generation Time: 2022-08-20 05:33:43 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ad_features
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ad_features`;

CREATE TABLE `ad_features` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ad_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ad_features_ad_id_foreign` (`ad_id`),
  CONSTRAINT `ad_features_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table ad_galleries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ad_galleries`;

CREATE TABLE `ad_galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ad_id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table admin_searches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_searches`;

CREATE TABLE `admin_searches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table admins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'backend/image/default-user.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `image`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Admin','admin@mail.com','2022-08-20 05:31:12','$2y$10$tEDeoPKI/bOzDmv1f9jKseoCbA7/VRfUmRSxAwK745Tirw1RBO/i.','backend/image/default-user.png','l7YKpZOgDn','2022-08-20 05:31:12','2022-08-20 05:31:12');

/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ads`;

CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `subcategory_id` bigint unsigned DEFAULT NULL,
  `brand_id` bigint unsigned NOT NULL,
  `price` double(8,2) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_phone` tinyint(1) NOT NULL DEFAULT '1',
  `phone_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','sold','pending','declined') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `total_reports` int NOT NULL DEFAULT '0',
  `total_views` int NOT NULL DEFAULT '0',
  `is_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `drafted_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `neighborhood` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ads_user_id_foreign` (`user_id`),
  KEY `ads_category_id_foreign` (`category_id`),
  KEY `ads_brand_id_foreign` (`brand_id`),
  CONSTRAINT `ads_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ads_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table blog_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_comments`;

CREATE TABLE `blog_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_comments_post_id_foreign` (`post_id`),
  CONSTRAINT `blog_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table brands
# ------------------------------------------------------------

DROP TABLE IF EXISTS `brands`;

CREATE TABLE `brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` longtext COLLATE utf8mb4_unicode_ci,
  `order` int unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table category_custom_field
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category_custom_field`;

CREATE TABLE `category_custom_field` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `custom_field_id` bigint unsigned NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_custom_field_category_id_foreign` (`category_id`),
  KEY `category_custom_field_custom_field_id_foreign` (`custom_field_id`),
  CONSTRAINT `category_custom_field_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_custom_field_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms`;

CREATE TABLE `cms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `home_main_banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_counter_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_mobile_app_banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `download_app` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `newsletter_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membership_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_ads` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_earning` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms_body` text COLLATE utf8mb4_unicode_ci,
  `about_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_video_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_body` text COLLATE utf8mb4_unicode_ci,
  `privacy_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy_body` text COLLATE utf8mb4_unicode_ci,
  `contact_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `get_membership_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `get_membership_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pricing_plan_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faq_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faq_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manage_ads_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chat_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified_user_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_overview_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_post_ads_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_my_ads_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_plan_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_account_setting_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_favorite_ads_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_messenger_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posting_rules_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posting_rules_body` text COLLATE utf8mb4_unicode_ci,
  `blog_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ads_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coming_soon_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coming_soon_subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maintenance_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maintenance_subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e404_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e404_subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e404_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e500_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e500_subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e500_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e503_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e503_subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e503_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cms` WRITE;
/*!40000 ALTER TABLE `cms` DISABLE KEYS */;

INSERT INTO `cms` (`id`, `home_main_banner`, `home_counter_background`, `home_mobile_app_banner`, `home_title`, `home_description`, `download_app`, `newsletter_content`, `membership_content`, `create_account`, `post_ads`, `start_earning`, `terms_background`, `terms_body`, `about_background`, `about_video_thumb`, `about_body`, `privacy_background`, `privacy_body`, `contact_background`, `contact_number`, `contact_email`, `contact_address`, `get_membership_background`, `get_membership_image`, `pricing_plan_background`, `faq_background`, `faq_content`, `manage_ads_content`, `chat_content`, `verified_user_content`, `dashboard_overview_background`, `dashboard_post_ads_background`, `dashboard_my_ads_background`, `dashboard_plan_background`, `dashboard_account_setting_background`, `dashboard_favorite_ads_background`, `dashboard_messenger_background`, `posting_rules_background`, `posting_rules_body`, `blog_background`, `ads_background`, `coming_soon_title`, `coming_soon_subtitle`, `maintenance_title`, `maintenance_subtitle`, `e404_title`, `e404_subtitle`, `e404_image`, `e500_title`, `e500_subtitle`, `e500_image`, `e503_title`, `e503_subtitle`, `e503_image`, `created_at`, `updated_at`)
VALUES
	(1,NULL,NULL,NULL,'Buy, Sell And Find Just About Anythink.','Buy And Sell Everything From Used Cars To Mobile Phones And Computers, Or Search For Property And More All Over The World!','Sed Luctus Nibh At Consectetur Tempor. Proin Et Ipsum Tincidunt, Maximus Turpis Id, Mollis Lacus. Maecenas Nec Risus A Urna Sollicitudin Aliquet. Maecenas Pretium Tristique Sapien','Vestibulum Consectetur Placerat Tellus. Sed Faucibus Fermentum Purus, At Facilisis.','Vestibulum Consectetur Placerat Tellus. Sed Faucibus Fermentum Purus, At Facilisis Neque Auctor.','Vestibulum Ante Ipsum Primis In Faucibus Orci Luctus Et Ultrices Posuere Cubilia Curae. Donec Non Lorem Erat. Sed Vitae Vene.','Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Mauris Eu Aliquet Odio. Nulla Pretium Congue Eros, Nec Rhoncus Mi.','Vestibulum Quis Consectetur Est. Fusce Hendrerit Neque At Facilisis Facilisis. Praesent A Pretium Elit. Nulla Aliquam Puru.',NULL,'<p>Praesent Finibus Dictum Nisl Sit Amet Vulputate. Fusce A Metus Eu Velit Posuere Semper A Bibendum Ante. Donec Eu Tellus Dapibus, Semper Orci Eget, Commodo Lacu Praesent Ullamcorper.</p>',NULL,'https://youtu.be/s7wmiS2mSXY','Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Mauris Eu Aliquet Odio. Nulla Pretium Congue Eros, Nec Rhoncus Mi.',NULL,'<p>Praesent Finibus Dictum Nisl Sit Amet Vulputate. Fusce A Metus Eu Velit Posuere Semper A Bibendum Ante. Donec Eu Tellus Dapibus, Semper Orci Eget, Commodo Lacu Praesent Ullamcorper.</p>',NULL,'+1-202-555-0125','templatecookie@gmail.com','Mohammadpur, Dhaka, Bangladesh',NULL,NULL,NULL,NULL,'Praesent Finibus Dictum Nisl Sit Amet Vulputate. Fusce A Metus Eu Velit Posuere Semper A Bibendum Ante. Donec Eu Tellus Dapibus, Semper Orci Eget, Commodo Lacu Praesent Ullamcorper.','Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Etiam Commodo Vel Ligula.','Class Aptent Taciti Sociosqu Ad Litora Torquent Per Conubia Nostra, Per Inceptos Himenaeos.','Class Aptent Taciti Sociosqu Ad Litora Torquent Per Conubia Nostra, Per Inceptos Himenaeos.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Mauris Eu Aliquet Odio. Nulla Pretium Congue Eros, Nec Rhoncus Mi<p>',NULL,NULL,NULL,NULL,NULL,NULL,'Opps! Page Not Found!','Something went wrong. It\'s look like the link is broken or the page is removed.','frontend/images/bg/error.png','Internal Server Error','Something went wrong. It\'s look like the Internal Server has some errors.','frontend/default_images/error-banner.png','Service Unavailable','Something went wrong. It\'s look like the Internal Server has some errors.','frontend/default_images/error-banner.png','2022-08-20 05:31:12','2022-08-20 05:31:12');

/*!40000 ALTER TABLE `cms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table contacts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cookies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cookies`;

CREATE TABLE `cookies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `allow_cookies` tinyint(1) NOT NULL DEFAULT '1',
  `cookie_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gdpr_cookie',
  `cookie_expiration` tinyint NOT NULL DEFAULT '30',
  `force_consent` tinyint(1) NOT NULL DEFAULT '0',
  `darkmode` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `approve_button_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decline_button_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cookies` WRITE;
/*!40000 ALTER TABLE `cookies` DISABLE KEYS */;

INSERT INTO `cookies` (`id`, `allow_cookies`, `cookie_name`, `cookie_expiration`, `force_consent`, `darkmode`, `language`, `title`, `description`, `approve_button_text`, `decline_button_text`, `created_at`, `updated_at`)
VALUES
	(1,1,'gdpr_cookie',30,0,0,'en','We use cookies!','Hi, this website uses essential cookies to ensure its proper operation and tracking cookies to understand how you interact with it. The latter will be set only after consent. <button type=\"button\" data-cc=\"c-settings\" class=\"cc-link\">Let me choose</button>','Allow all Cookies','Reject all Cookies','2022-08-20 05:31:12','2022-08-20 05:31:12');

/*!40000 ALTER TABLE `cookies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table currencies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `currencies`;

CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol_position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'left',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `symbol_position`, `created_at`, `updated_at`)
VALUES
	(1,'United State Dollar','USD','$','left','2022-08-20 05:31:12','2022-08-20 05:31:12');

/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table custom_field_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `custom_field_groups`;

CREATE TABLE `custom_field_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table custom_field_values
# ------------------------------------------------------------

DROP TABLE IF EXISTS `custom_field_values`;

CREATE TABLE `custom_field_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_field_values_custom_field_id_foreign` (`custom_field_id`),
  CONSTRAINT `custom_field_values_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table custom_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `custom_fields`;

CREATE TABLE `custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_group_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('text','textarea','select','radio','file','url','number','date','checkbox','checkbox_multiple') COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `filterable` tinyint(1) NOT NULL DEFAULT '0',
  `listable` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fas fa-cube',
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_fields_custom_field_group_id_foreign` (`custom_field_group_id`),
  CONSTRAINT `custom_fields_custom_field_group_id_foreign` FOREIGN KEY (`custom_field_group_id`) REFERENCES `custom_field_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table database_backups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `database_backups`;

CREATE TABLE `database_backups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table emails
# ------------------------------------------------------------

DROP TABLE IF EXISTS `emails`;

CREATE TABLE `emails` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emails_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table faq_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `faq_categories`;

CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faq_categories_name_unique` (`name`),
  UNIQUE KEY `faq_categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table faqs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `faqs`;

CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `faq_category_id` bigint unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faqs_faq_category_id_foreign` (`faq_category_id`),
  CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table languages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `languages_name_unique` (`name`),
  UNIQUE KEY `languages_code_unique` (`code`),
  UNIQUE KEY `languages_icon_unique` (`icon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `direction`, `created_at`, `updated_at`)
VALUES
	(1,'English','en','flag-icon-gb','ltr','2022-08-20 05:31:12','2022-08-20 05:31:12');

/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table messengers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messengers`;

CREATE TABLE `messengers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_id` bigint unsigned NOT NULL,
  `to_id` bigint unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2012_07_14_154223_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2020_11_12_184107_create_permission_tables',1),
	(5,'2020_12_20_161857_create_brands_table',1),
	(6,'2020_12_23_122556_create_contacts_table',1),
	(7,'2021_02_17_110211_create_testimonials_table',1),
	(8,'2021_02_18_112239_create_admins_table',1),
	(9,'2021_08_22_051131_create_categories_table',1),
	(10,'2021_08_22_051134_create_sub_categories_table',1),
	(11,'2021_08_22_051135_create_ads_table',1),
	(12,'2021_08_22_051198_create_post_categories_table',1),
	(13,'2021_08_22_051199_create_posts_table',1),
	(14,'2021_08_23_115402_create_settings_table',1),
	(15,'2021_08_25_061331_create_languages_table',1),
	(16,'2021_09_04_105120_create_blog_comments_table',1),
	(17,'2021_09_05_120235_create_ad_features_table',1),
	(18,'2021_09_05_120248_create_ad_galleries_table',1),
	(19,'2021_09_19_141812_create_plans_table',1),
	(20,'2021_11_13_114825_create_messengers_table',1),
	(21,'2021_11_15_112417_create_user_plans_table',1),
	(22,'2021_11_15_112949_create_transactions_table',1),
	(23,'2021_12_14_142236_create_emails_table',1),
	(24,'2021_12_15_161624_create_module_settings_table',1),
	(25,'2021_12_19_101413_create_cms_table',1),
	(26,'2021_12_19_152529_create_faq_categories_table',1),
	(27,'2021_12_21_105713_create_faqs_table',1),
	(28,'2022_01_25_131111_add_fields_to_settings_table',1),
	(29,'2022_01_26_091457_add_social_login_fields_to_users_table',1),
	(30,'2022_02_16_152704_add_loader_fields_to_settings_table',1),
	(31,'2022_03_05_125615_create_currencies_table',1),
	(32,'2022_03_08_110749_add_website_configuration_to_settings_table',1),
	(33,'2022_03_27_175435_create_orders_table',1),
	(34,'2022_03_28_093629_add_socialite_column_to_users_table',1),
	(35,'2022_03_29_100616_create_timezones_table',1),
	(36,'2022_03_29_121851_create_admin_searches_table',1),
	(37,'2022_03_30_082959_create_cookies_table',1),
	(38,'2022_03_30_114924_create_seos_table',1),
	(39,'2022_03_30_121200_create_database_backups_table',1),
	(40,'2022_04_25_132657_create_setup_guides_table',1),
	(41,'2022_04_28_134721_create_mobile_app_configs_table',1),
	(42,'2022_04_28_142433_create_mobile_app_sliders_table',1),
	(43,'2022_06_06_041744_add_field_to_users_table',1),
	(44,'2022_06_06_052533_create_notifications_table',1),
	(45,'2022_06_06_092421_create_themes_table',1),
	(46,'2022_06_08_053638_create_custom_field_groups_table',1),
	(47,'2022_06_08_060821_create_custom_fields_table',1),
	(48,'2022_06_08_061216_create_custom_field_values_table',1),
	(49,'2022_06_08_061928_create_category_custom_field_table',1),
	(50,'2022_06_08_091126_create_product_custom_fields_table',1),
	(51,'2022_06_14_051918_add_fields_to_user_plans_table',1),
	(52,'2022_06_14_095728_add_fields_to_plans_table',1),
	(53,'2022_06_18_031525_add_full_address_to_ads_table',1),
	(54,'2022_06_27_050337_add_map_to_settings_table',1),
	(55,'2022_07_03_030110_add_whatsapp_field_to_ads_table',1),
	(56,'2022_07_04_042533_create_jobs_table',1),
	(57,'2022_07_05_081552_create_reports_table',1),
	(58,'2022_07_05_112407_create_social_media_table',1),
	(59,'2022_07_14_151623_create_wishlists_table',1),
	(60,'2022_07_14_155901_create_reviews_table',1),
	(61,'2022_07_24_110337_create_user_device_token_tbale',1),
	(62,'2022_07_25_024244_add_push_notification_settings_table',1),
	(63,'2022_08_20_041304_add_social_fields_to_settings_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mobile_app_configs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mobile_app_configs`;

CREATE TABLE `mobile_app_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `android_download_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ios_download_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms_and_condition_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `mobile_app_configs` WRITE;
/*!40000 ALTER TABLE `mobile_app_configs` DISABLE KEYS */;

INSERT INTO `mobile_app_configs` (`id`, `android_download_url`, `ios_download_url`, `privacy_url`, `support_url`, `terms_and_condition_url`, `created_at`, `updated_at`)
VALUES
	(1,'https://play.google.com/store/apps/details?id=com.app.appname','https://apps.apple.com/us/app/app-name/id1440990079','https://www.appname.com/privacy-policy','https://www.appname.com/support','https://www.appname.com/terms-and-conditions','2022-08-20 05:31:12','2022-08-20 05:31:12');

/*!40000 ALTER TABLE `mobile_app_configs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mobile_app_sliders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mobile_app_sliders`;

CREATE TABLE `mobile_app_sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `background` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table model_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table model_has_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`)
VALUES
	(1,'App\\Models\\Admin',1);

/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table module_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `module_settings`;

CREATE TABLE `module_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `blog` tinyint(1) NOT NULL DEFAULT '1',
  `newsletter` tinyint(1) NOT NULL DEFAULT '1',
  `language` tinyint(1) NOT NULL DEFAULT '1',
  `contact` tinyint(1) NOT NULL DEFAULT '1',
  `faq` tinyint(1) NOT NULL DEFAULT '1',
  `testimonial` tinyint(1) NOT NULL DEFAULT '1',
  `price_plan` tinyint(1) NOT NULL DEFAULT '1',
  `appearance` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `module_settings` WRITE;
/*!40000 ALTER TABLE `module_settings` DISABLE KEYS */;

INSERT INTO `module_settings` (`id`, `blog`, `newsletter`, `language`, `contact`, `faq`, `testimonial`, `price_plan`, `appearance`)
VALUES
	(1,1,1,1,1,1,1,1,1);

/*!40000 ALTER TABLE `module_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `payment_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Waiting for payment, 2=Already paid, 3=Expired',
  `snap_token` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`)
VALUES
	(1,'dashboard.view','admin','dashboard','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(2,'admin.create','admin','admin','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(3,'admin.view','admin','admin','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(4,'admin.edit','admin','admin','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(5,'admin.delete','admin','admin','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(6,'role.create','admin','role','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(7,'role.view','admin','role','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(8,'role.edit','admin','role','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(9,'role.delete','admin','role','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(10,'map.create','admin','map','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(11,'map.view','admin','map','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(12,'map.edit','admin','map','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(13,'map.delete','admin','map','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(14,'profile.view','admin','profile','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(15,'profile.edit','admin','profile','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(16,'setting.view','admin','settings','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(17,'setting.update','admin','settings','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(18,'ad.create','admin','ad','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(19,'ad.view','admin','ad','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(20,'ad.update','admin','ad','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(21,'ad.delete','admin','ad','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(22,'category.create','admin','category','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(23,'category.view','admin','category','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(24,'category.update','admin','category','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(25,'category.delete','admin','category','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(26,'subcategory.create','admin','category','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(27,'subcategory.view','admin','category','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(28,'subcategory.update','admin','category','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(29,'subcategory.delete','admin','category','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(30,'custom-field.create','admin','custom-field','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(31,'custom-field.view','admin','custom-field','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(32,'custom-field.update','admin','custom-field','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(33,'custom-field.delete','admin','custom-field','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(34,'custom-field-group.create','admin','custom-field','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(35,'custom-field-group.view','admin','custom-field','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(36,'custom-field-group.update','admin','custom-field','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(37,'custom-field-group.delete','admin','custom-field','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(38,'newsletter.view','admin','newsletter','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(39,'newsletter.mailsend','admin','newsletter','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(40,'newsletter.delete','admin','newsletter','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(41,'brand.create','admin','brand','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(42,'brand.view','admin','brand','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(43,'brand.update','admin','brand','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(44,'brand.delete','admin','brand','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(45,'plan.create','admin','plan','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(46,'plan.view','admin','plan','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(47,'plan.update','admin','plan','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(48,'plan.delete','admin','plan','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(49,'postcategory.create','admin','Blog','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(50,'postcategory.view','admin','Blog','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(51,'postcategory.update','admin','Blog','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(52,'postcategory.delete','admin','Blog','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(53,'post.create','admin','Blog','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(54,'post.view','admin','Blog','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(55,'post.update','admin','Blog','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(56,'post.delete','admin','Blog','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(57,'tag.create','admin','Blog','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(58,'tag.view','admin','Blog','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(59,'tag.update','admin','Blog','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(60,'tag.delete','admin','Blog','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(61,'testimonial.create','admin','testimonial','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(62,'testimonial.view','admin','testimonial','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(63,'testimonial.update','admin','testimonial','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(64,'testimonial.delete','admin','testimonial','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(65,'faqcategory.create','admin','faq','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(66,'faqcategory.view','admin','faq','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(67,'faqcategory.update','admin','faq','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(68,'faqcategory.delete','admin','faq','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(69,'faq.create','admin','faq','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(70,'faq.view','admin','faq','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(71,'faq.update','admin','faq','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(72,'faq.delete','admin','faq','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(73,'customer.view','admin','others','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(74,'contact.view','admin','others','2022-08-20 05:31:12','2022-08-20 05:31:12');

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table plans
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plans`;

CREATE TABLE `plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `ad_limit` int NOT NULL,
  `featured_limit` int NOT NULL,
  `badge` tinyint(1) NOT NULL,
  `recommended` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interval` enum('monthly','yearly','custom_date') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_interval_days` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plans_label_unique` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table post_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_categories`;

CREATE TABLE `post_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `author_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_category_id_foreign` (`category_id`),
  KEY `posts_author_id_foreign` (`author_id`),
  CONSTRAINT `posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `post_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table product_custom_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_custom_fields`;

CREATE TABLE `product_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ad_id` bigint unsigned NOT NULL,
  `custom_field_id` bigint unsigned NOT NULL,
  `custom_field_group_id` bigint unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_custom_fields_ad_id_foreign` (`ad_id`),
  KEY `product_custom_fields_custom_field_id_foreign` (`custom_field_id`),
  KEY `product_custom_fields_custom_field_group_id_foreign` (`custom_field_group_id`),
  CONSTRAINT `product_custom_fields_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_custom_fields_custom_field_group_id_foreign` FOREIGN KEY (`custom_field_group_id`) REFERENCES `custom_field_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_custom_fields_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table reports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reports`;

CREATE TABLE `reports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `report_from_id` bigint unsigned NOT NULL,
  `report_to_id` bigint unsigned NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reports_report_from_id_foreign` (`report_from_id`),
  KEY `reports_report_to_id_foreign` (`report_to_id`),
  CONSTRAINT `reports_report_from_id_foreign` FOREIGN KEY (`report_from_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reports_report_to_id_foreign` FOREIGN KEY (`report_to_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table reviews
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `stars` int NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_user_id_foreign` (`user_id`),
  CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table role_has_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`)
VALUES
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(6,1),
	(7,1),
	(8,1),
	(9,1),
	(10,1),
	(11,1),
	(12,1),
	(13,1),
	(14,1),
	(15,1),
	(16,1),
	(17,1),
	(18,1),
	(19,1),
	(20,1),
	(21,1),
	(22,1),
	(23,1),
	(24,1),
	(25,1),
	(26,1),
	(27,1),
	(28,1),
	(29,1),
	(30,1),
	(31,1),
	(32,1),
	(33,1),
	(34,1),
	(35,1),
	(36,1),
	(37,1),
	(38,1),
	(39,1),
	(40,1),
	(41,1),
	(42,1),
	(43,1),
	(44,1),
	(45,1),
	(46,1),
	(47,1),
	(48,1),
	(49,1),
	(50,1),
	(51,1),
	(52,1),
	(53,1),
	(54,1),
	(55,1),
	(56,1),
	(57,1),
	(58,1),
	(59,1),
	(60,1),
	(61,1),
	(62,1),
	(63,1),
	(64,1),
	(65,1),
	(66,1),
	(67,1),
	(68,1),
	(69,1),
	(70,1),
	(71,1),
	(72,1),
	(73,1),
	(74,1);

/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`)
VALUES
	(1,'superadmin','admin','2022-08-20 05:31:12','2022-08-20 05:31:12');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table seos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `seos`;

CREATE TABLE `seos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `page_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `seos` WRITE;
/*!40000 ALTER TABLE `seos` DISABLE KEYS */;

INSERT INTO `seos` (`id`, `page_slug`, `title`, `description`, `image`, `created_at`, `updated_at`)
VALUES
	(1,'home','Welcome To adlisting','Adlisting - Laravel Classified Ads is a PHP script with minimal, clean, flexible, and structured code. This script will provide you amazing user interface with lots of dynamic frontend and backend features.','backend/image/default.png','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(2,'about','About','Adlisting - Laravel Classified Ads is a PHP script with minimal, clean, flexible, and structured code. This script will provide you amazing user interface with lots of dynamic frontend and backend features.','backend/image/default.png','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(3,'contact','About','Adlisting - Laravel Classified Ads is a PHP script with minimal, clean, flexible, and structured code. This script will provide you amazing user interface with lots of dynamic frontend and backend features.','backend/image/default.png','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(4,'ads','Ads','Adlisting - Laravel Classified Ads is a PHP script with minimal, clean, flexible, and structured code. This script will provide you amazing user interface with lots of dynamic frontend and backend features.','backend/image/default.png','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(5,'blog','Blog','Adlisting - Laravel Classified Ads is a PHP script with minimal, clean, flexible, and structured code. This script will provide you amazing user interface with lots of dynamic frontend and backend features.','backend/image/default.png','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(6,'pricing','Pricing','Adlisting - Laravel Classified Ads is a PHP script with minimal, clean, flexible, and structured code. This script will provide you amazing user interface with lots of dynamic frontend and backend features.','backend/image/default.png','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(7,'login','Login','Adlisting - Laravel Classified Ads is a PHP script with minimal, clean, flexible, and structured code. This script will provide you amazing user interface with lots of dynamic frontend and backend features.','backend/image/default.png','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(8,'register','Register','Adlisting - Laravel Classified Ads is a PHP script with minimal, clean, flexible, and structured code. This script will provide you amazing user interface with lots of dynamic frontend and backend features.','backend/image/default.png','2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(9,'faq','FAQ','Adlisting - Laravel Classified Ads is a PHP script with minimal, clean, flexible, and structured code. This script will provide you amazing user interface with lots of dynamic frontend and backend features.','backend/image/default.png','2022-08-20 05:31:12','2022-08-20 05:31:12');

/*!40000 ALTER TABLE `seos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `logo_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `white_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_css` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_script` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body_script` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free_featured_ad_limit` int NOT NULL DEFAULT '3',
  `regular_ads_homepage` tinyint(1) NOT NULL DEFAULT '0',
  `featured_ads_homepage` tinyint(1) NOT NULL DEFAULT '1',
  `customer_email_verification` tinyint(1) NOT NULL DEFAULT '0',
  `maximum_ad_image_limit` int unsigned NOT NULL DEFAULT '5',
  `subscription_type` enum('one_time','recurring') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'one_time',
  `ads_admin_approval` tinyint(1) NOT NULL DEFAULT '0',
  `free_ad_limit` int NOT NULL DEFAULT '5',
  `sidebar_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nav_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sidebar_txt_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nav_txt_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accent_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frontend_primary_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frontend_secondary_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dark_mode` tinyint(1) NOT NULL DEFAULT '0',
  `facebook_pixel` tinyint(1) NOT NULL DEFAULT '0',
  `google_analytics` tinyint(1) NOT NULL DEFAULT '0',
  `search_engine_indexing` tinyint(1) NOT NULL DEFAULT '1',
  `default_layout` tinyint(1) NOT NULL DEFAULT '1',
  `website_loader` tinyint(1) NOT NULL DEFAULT '1',
  `loader_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_changing` tinyint(1) NOT NULL DEFAULT '1',
  `email_verification` tinyint(1) NOT NULL DEFAULT '0',
  `watermark_status` tinyint(1) NOT NULL DEFAULT '0',
  `watermark_type` enum('text','image') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `watermark_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ZakirSoft',
  `watermark_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'frontend/images/logo.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `default_map` enum('google-map','map-box') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'google-map',
  `google_map_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_box_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_long` double NOT NULL DEFAULT '-100',
  `default_lat` double NOT NULL DEFAULT '40',
  `push_notification_status` tinyint(1) NOT NULL DEFAULT '1',
  `server_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_bucket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `messaging_sender_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `measurement_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkdin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;

INSERT INTO `settings` (`id`, `logo_image`, `white_logo`, `favicon_image`, `header_css`, `header_script`, `body_script`, `free_featured_ad_limit`, `regular_ads_homepage`, `featured_ads_homepage`, `customer_email_verification`, `maximum_ad_image_limit`, `subscription_type`, `ads_admin_approval`, `free_ad_limit`, `sidebar_color`, `nav_color`, `sidebar_txt_color`, `nav_txt_color`, `main_color`, `accent_color`, `frontend_primary_color`, `frontend_secondary_color`, `dark_mode`, `facebook_pixel`, `google_analytics`, `search_engine_indexing`, `default_layout`, `website_loader`, `loader_image`, `language_changing`, `email_verification`, `watermark_status`, `watermark_type`, `watermark_text`, `watermark_image`, `created_at`, `updated_at`, `default_map`, `google_map_key`, `map_box_key`, `default_long`, `default_lat`, `push_notification_status`, `server_key`, `api_key`, `auth_domain`, `project_id`, `storage_bucket`, `messaging_sender_id`, `app_id`, `measurement_id`, `facebook`, `twitter`, `instagram`, `youtube`, `linkdin`, `whatsapp`)
VALUES
	(1,'frontend/images/logo.png','frontend/images/logo-white.png','frontend/images/icon/notepad.png',NULL,NULL,NULL,1,0,1,0,5,'recurring',0,3,'#022446','#0a243e','#e0e9f2','#e0e9f2','#05c279','#ffc107','#05c279','#ffc107',0,0,0,1,1,0,NULL,1,0,0,'text','ZakirSoft','frontend/images/logo.png','2022-08-20 05:31:12','2022-08-20 05:31:12','map-box','','',90.411270491741,23.757853442383,0,'your-server-key','your-api-key','your-auth-domain','your-project-id','your-storage-bucket','your-messaging-sender-id','your-app-id','your-measurement-id','https://facebook.com/zakirsoft','https://twitter.com/zakirsoft','https://instagram.com/zakirsoft','https://www.youtube.com/channel/UCMSp_qPtYbaUMjEICDLhDCQ','https://www.linkedin.com/in/zakirsoft','https://web.whatsapp.com/');

/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table setup_guides
# ------------------------------------------------------------

DROP TABLE IF EXISTS `setup_guides`;

CREATE TABLE `setup_guides` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `setup_guides` WRITE;
/*!40000 ALTER TABLE `setup_guides` DISABLE KEYS */;

INSERT INTO `setup_guides` (`id`, `task_name`, `title`, `description`, `action_route`, `action_label`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'app_setting','App Information ','Add your app logo, name, description, owner and other information.','settings.general','Add App Information',0,'2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(2,'smtp_setting','SMTP Configuration','Add your app logo, name, description, owner and other information.','settings.email','Add Mail Configuration',0,'2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(3,'payment_setting','Enable Payment Method','Enable to payment methods to receive payments from your customer.','settings.payment','Add Payment',0,'2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(4,'theme_setting','Customize Theme','Customize your theme to make your app look more attractive.','settings.theme','Customize Your App Now',0,'2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(5,'map_setting','Map Configuration','Configure your map setting api to create ad in any location.','settings.system','Add Map API',0,'2022-08-20 05:31:12','2022-08-20 05:31:12'),
	(6,'pusher_setting','Pusher Configuration','Configure your pusher setting api for the chat application','settings.system','Add Pusher API',0,'2022-08-20 05:31:12','2022-08-20 05:31:12');

/*!40000 ALTER TABLE `setup_guides` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table social_media
# ------------------------------------------------------------

DROP TABLE IF EXISTS `social_media`;

CREATE TABLE `social_media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `social_media` enum('facebook','twitter','instagram','youtube','linkedin','pinterest','reddit','github','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_media_user_id_foreign` (`user_id`),
  CONSTRAINT `social_media_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table sub_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sub_categories`;

CREATE TABLE `sub_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table testimonials
# ------------------------------------------------------------

DROP TABLE IF EXISTS `testimonials`;

CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stars` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table themes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `themes`;

CREATE TABLE `themes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `home_page` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table timezones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `timezones`;

CREATE TABLE `timezones` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `timezones` WRITE;
/*!40000 ALTER TABLE `timezones` DISABLE KEYS */;

INSERT INTO `timezones` (`id`, `value`)
VALUES
	(1,'Africa/Abidjan'),
	(2,'Africa/Accra'),
	(3,'Africa/Addis_Ababa'),
	(4,'Africa/Algiers'),
	(5,'Africa/Asmara'),
	(6,'Africa/Bamako'),
	(7,'Africa/Bangui'),
	(8,'Africa/Banjul'),
	(9,'Africa/Bissau'),
	(10,'Africa/Blantyre'),
	(11,'Africa/Brazzaville'),
	(12,'Africa/Bujumbura'),
	(13,'Africa/Cairo'),
	(14,'Africa/Casablanca'),
	(15,'Africa/Ceuta'),
	(16,'Africa/Conakry'),
	(17,'Africa/Dakar'),
	(18,'Africa/Dar_es_Salaam'),
	(19,'Africa/Djibouti'),
	(20,'Africa/Douala'),
	(21,'Africa/El_Aaiun'),
	(22,'Africa/Freetown'),
	(23,'Africa/Gaborone'),
	(24,'Africa/Harare'),
	(25,'Africa/Johannesburg'),
	(26,'Africa/Juba'),
	(27,'Africa/Kampala'),
	(28,'Africa/Khartoum'),
	(29,'Africa/Kigali'),
	(30,'Africa/Kinshasa'),
	(31,'Africa/Lagos'),
	(32,'Africa/Libreville'),
	(33,'Africa/Lome'),
	(34,'Africa/Luanda'),
	(35,'Africa/Lubumbashi'),
	(36,'Africa/Lusaka'),
	(37,'Africa/Malabo'),
	(38,'Africa/Maputo'),
	(39,'Africa/Maseru'),
	(40,'Africa/Mbabane'),
	(41,'Africa/Mogadishu'),
	(42,'Africa/Monrovia'),
	(43,'Africa/Nairobi'),
	(44,'Africa/Ndjamena'),
	(45,'Africa/Niamey'),
	(46,'Africa/Nouakchott'),
	(47,'Africa/Ouagadougou'),
	(48,'Africa/Porto-Novo'),
	(49,'Africa/Sao_Tome'),
	(50,'Africa/Tripoli'),
	(51,'Africa/Tunis'),
	(52,'Africa/Windhoek'),
	(53,'America/Adak'),
	(54,'America/Anchorage'),
	(55,'America/Anguilla'),
	(56,'America/Antigua'),
	(57,'America/Araguaina'),
	(58,'America/Argentina/Buenos_Aires'),
	(59,'America/Argentina/Catamarca'),
	(60,'America/Argentina/Cordoba'),
	(61,'America/Argentina/Jujuy'),
	(62,'America/Argentina/La_Rioja'),
	(63,'America/Argentina/Mendoza'),
	(64,'America/Argentina/Rio_Gallegos'),
	(65,'America/Argentina/Salta'),
	(66,'America/Argentina/San_Juan'),
	(67,'America/Argentina/San_Luis'),
	(68,'America/Argentina/Tucuman'),
	(69,'America/Argentina/Ushuaia'),
	(70,'America/Aruba'),
	(71,'America/Asuncion'),
	(72,'America/Atikokan'),
	(73,'America/Bahia'),
	(74,'America/Bahia_Banderas'),
	(75,'America/Barbados'),
	(76,'America/Belem'),
	(77,'America/Belize'),
	(78,'America/Blanc-Sablon'),
	(79,'America/Boa_Vista'),
	(80,'America/Bogota'),
	(81,'America/Boise'),
	(82,'America/Cambridge_Bay'),
	(83,'America/Campo_Grande'),
	(84,'America/Cancun'),
	(85,'America/Caracas'),
	(86,'America/Cayenne'),
	(87,'America/Cayman'),
	(88,'America/Chicago'),
	(89,'America/Chihuahua'),
	(90,'America/Costa_Rica'),
	(91,'America/Creston'),
	(92,'America/Cuiaba'),
	(93,'America/Curacao'),
	(94,'America/Danmarkshavn'),
	(95,'America/Dawson'),
	(96,'America/Dawson_Creek'),
	(97,'America/Denver'),
	(98,'America/Detroit'),
	(99,'America/Dominica'),
	(100,'America/Edmonton'),
	(101,'America/Eirunepe'),
	(102,'America/El_Salvador'),
	(103,'America/Fort_Nelson'),
	(104,'America/Fortaleza'),
	(105,'America/Glace_Bay'),
	(106,'America/Goose_Bay'),
	(107,'America/Grand_Turk'),
	(108,'America/Grenada'),
	(109,'America/Guadeloupe'),
	(110,'America/Guatemala'),
	(111,'America/Guayaquil'),
	(112,'America/Guyana'),
	(113,'America/Halifax'),
	(114,'America/Havana'),
	(115,'America/Hermosillo'),
	(116,'America/Indiana/Indianapolis'),
	(117,'America/Indiana/Knox'),
	(118,'America/Indiana/Marengo'),
	(119,'America/Indiana/Petersburg'),
	(120,'America/Indiana/Tell_City'),
	(121,'America/Indiana/Vevay'),
	(122,'America/Indiana/Vincennes'),
	(123,'America/Indiana/Winamac'),
	(124,'America/Inuvik'),
	(125,'America/Iqaluit'),
	(126,'America/Jamaica'),
	(127,'America/Juneau'),
	(128,'America/Kentucky/Louisville'),
	(129,'America/Kentucky/Monticello'),
	(130,'America/Kralendijk'),
	(131,'America/La_Paz'),
	(132,'America/Lima'),
	(133,'America/Los_Angeles'),
	(134,'America/Lower_Princes'),
	(135,'America/Maceio'),
	(136,'America/Managua'),
	(137,'America/Manaus'),
	(138,'America/Marigot'),
	(139,'America/Martinique'),
	(140,'America/Matamoros'),
	(141,'America/Mazatlan'),
	(142,'America/Menominee'),
	(143,'America/Merida'),
	(144,'America/Metlakatla'),
	(145,'America/Mexico_City'),
	(146,'America/Miquelon'),
	(147,'America/Moncton'),
	(148,'America/Monterrey'),
	(149,'America/Montevideo'),
	(150,'America/Montserrat'),
	(151,'America/Nassau'),
	(152,'America/New_York'),
	(153,'America/Nipigon'),
	(154,'America/Nome'),
	(155,'America/Noronha'),
	(156,'America/North_Dakota/Beulah'),
	(157,'America/North_Dakota/Center'),
	(158,'America/North_Dakota/New_Salem'),
	(159,'America/Nuuk'),
	(160,'America/Ojinaga'),
	(161,'America/Panama'),
	(162,'America/Pangnirtung'),
	(163,'America/Paramaribo'),
	(164,'America/Phoenix'),
	(165,'America/Port-au-Prince'),
	(166,'America/Port_of_Spain'),
	(167,'America/Porto_Velho'),
	(168,'America/Puerto_Rico'),
	(169,'America/Punta_Arenas'),
	(170,'America/Rainy_River'),
	(171,'America/Rankin_Inlet'),
	(172,'America/Recife'),
	(173,'America/Regina'),
	(174,'America/Resolute'),
	(175,'America/Rio_Branco'),
	(176,'America/Santarem'),
	(177,'America/Santiago'),
	(178,'America/Santo_Domingo'),
	(179,'America/Sao_Paulo'),
	(180,'America/Scoresbysund'),
	(181,'America/Sitka'),
	(182,'America/St_Barthelemy'),
	(183,'America/St_Johns'),
	(184,'America/St_Kitts'),
	(185,'America/St_Lucia'),
	(186,'America/St_Thomas'),
	(187,'America/St_Vincent'),
	(188,'America/Swift_Current'),
	(189,'America/Tegucigalpa'),
	(190,'America/Thule'),
	(191,'America/Thunder_Bay'),
	(192,'America/Tijuana'),
	(193,'America/Toronto'),
	(194,'America/Tortola'),
	(195,'America/Vancouver'),
	(196,'America/Whitehorse'),
	(197,'America/Winnipeg'),
	(198,'America/Yakutat'),
	(199,'America/Yellowknife'),
	(200,'Antarctica/Casey'),
	(201,'Antarctica/Davis'),
	(202,'Antarctica/DumontDUrville'),
	(203,'Antarctica/Macquarie'),
	(204,'Antarctica/Mawson'),
	(205,'Antarctica/McMurdo'),
	(206,'Antarctica/Palmer'),
	(207,'Antarctica/Rothera'),
	(208,'Antarctica/Syowa'),
	(209,'Antarctica/Troll'),
	(210,'Antarctica/Vostok'),
	(211,'Arctic/Longyearbyen'),
	(212,'Asia/Aden'),
	(213,'Asia/Almaty'),
	(214,'Asia/Amman'),
	(215,'Asia/Anadyr'),
	(216,'Asia/Aqtau'),
	(217,'Asia/Aqtobe'),
	(218,'Asia/Ashgabat'),
	(219,'Asia/Atyrau'),
	(220,'Asia/Baghdad'),
	(221,'Asia/Bahrain'),
	(222,'Asia/Baku'),
	(223,'Asia/Bangkok'),
	(224,'Asia/Barnaul'),
	(225,'Asia/Beirut'),
	(226,'Asia/Bishkek'),
	(227,'Asia/Brunei'),
	(228,'Asia/Chita'),
	(229,'Asia/Choibalsan'),
	(230,'Asia/Colombo'),
	(231,'Asia/Damascus'),
	(232,'Asia/Dhaka'),
	(233,'Asia/Dili'),
	(234,'Asia/Dubai'),
	(235,'Asia/Dushanbe'),
	(236,'Asia/Famagusta'),
	(237,'Asia/Gaza'),
	(238,'Asia/Hebron'),
	(239,'Asia/Ho_Chi_Minh'),
	(240,'Asia/Hong_Kong'),
	(241,'Asia/Hovd'),
	(242,'Asia/Irkutsk'),
	(243,'Asia/Jakarta'),
	(244,'Asia/Jayapura'),
	(245,'Asia/Jerusalem'),
	(246,'Asia/Kabul'),
	(247,'Asia/Kamchatka'),
	(248,'Asia/Karachi'),
	(249,'Asia/Kathmandu'),
	(250,'Asia/Khandyga'),
	(251,'Asia/Kolkata'),
	(252,'Asia/Krasnoyarsk'),
	(253,'Asia/Kuala_Lumpur'),
	(254,'Asia/Kuching'),
	(255,'Asia/Kuwait'),
	(256,'Asia/Macau'),
	(257,'Asia/Magadan'),
	(258,'Asia/Makassar'),
	(259,'Asia/Manila'),
	(260,'Asia/Muscat'),
	(261,'Asia/Nicosia'),
	(262,'Asia/Novokuznetsk'),
	(263,'Asia/Novosibirsk'),
	(264,'Asia/Omsk'),
	(265,'Asia/Oral'),
	(266,'Asia/Phnom_Penh'),
	(267,'Asia/Pontianak'),
	(268,'Asia/Pyongyang'),
	(269,'Asia/Qatar'),
	(270,'Asia/Qostanay'),
	(271,'Asia/Qyzylorda'),
	(272,'Asia/Riyadh'),
	(273,'Asia/Sakhalin'),
	(274,'Asia/Samarkand'),
	(275,'Asia/Seoul'),
	(276,'Asia/Shanghai'),
	(277,'Asia/Singapore'),
	(278,'Asia/Srednekolymsk'),
	(279,'Asia/Taipei'),
	(280,'Asia/Tashkent'),
	(281,'Asia/Tbilisi'),
	(282,'Asia/Tehran'),
	(283,'Asia/Thimphu'),
	(284,'Asia/Tokyo'),
	(285,'Asia/Tomsk'),
	(286,'Asia/Ulaanbaatar'),
	(287,'Asia/Urumqi'),
	(288,'Asia/Ust-Nera'),
	(289,'Asia/Vientiane'),
	(290,'Asia/Vladivostok'),
	(291,'Asia/Yakutsk'),
	(292,'Asia/Yangon'),
	(293,'Asia/Yekaterinburg'),
	(294,'Asia/Yerevan'),
	(295,'Atlantic/Azores'),
	(296,'Atlantic/Bermuda'),
	(297,'Atlantic/Canary'),
	(298,'Atlantic/Cape_Verde'),
	(299,'Atlantic/Faroe'),
	(300,'Atlantic/Madeira'),
	(301,'Atlantic/Reykjavik'),
	(302,'Atlantic/South_Georgia'),
	(303,'Atlantic/St_Helena'),
	(304,'Atlantic/Stanley'),
	(305,'Australia/Adelaide'),
	(306,'Australia/Brisbane'),
	(307,'Australia/Broken_Hill'),
	(308,'Australia/Darwin'),
	(309,'Australia/Eucla'),
	(310,'Australia/Hobart'),
	(311,'Australia/Lindeman'),
	(312,'Australia/Lord_Howe'),
	(313,'Australia/Melbourne'),
	(314,'Australia/Perth'),
	(315,'Australia/Sydney'),
	(316,'Europe/Amsterdam'),
	(317,'Europe/Andorra'),
	(318,'Europe/Astrakhan'),
	(319,'Europe/Athens'),
	(320,'Europe/Belgrade'),
	(321,'Europe/Berlin'),
	(322,'Europe/Bratislava'),
	(323,'Europe/Brussels'),
	(324,'Europe/Bucharest'),
	(325,'Europe/Budapest'),
	(326,'Europe/Busingen'),
	(327,'Europe/Chisinau'),
	(328,'Europe/Copenhagen'),
	(329,'Europe/Dublin'),
	(330,'Europe/Gibraltar'),
	(331,'Europe/Guernsey'),
	(332,'Europe/Helsinki'),
	(333,'Europe/Isle_of_Man'),
	(334,'Europe/Istanbul'),
	(335,'Europe/Jersey'),
	(336,'Europe/Kaliningrad'),
	(337,'Europe/Kiev'),
	(338,'Europe/Kirov'),
	(339,'Europe/Lisbon'),
	(340,'Europe/Ljubljana'),
	(341,'Europe/London'),
	(342,'Europe/Luxembourg'),
	(343,'Europe/Madrid'),
	(344,'Europe/Malta'),
	(345,'Europe/Mariehamn'),
	(346,'Europe/Minsk'),
	(347,'Europe/Monaco'),
	(348,'Europe/Moscow'),
	(349,'Europe/Oslo'),
	(350,'Europe/Paris'),
	(351,'Europe/Podgorica'),
	(352,'Europe/Prague'),
	(353,'Europe/Riga'),
	(354,'Europe/Rome'),
	(355,'Europe/Samara'),
	(356,'Europe/San_Marino'),
	(357,'Europe/Sarajevo'),
	(358,'Europe/Saratov'),
	(359,'Europe/Simferopol'),
	(360,'Europe/Skopje'),
	(361,'Europe/Sofia'),
	(362,'Europe/Stockholm'),
	(363,'Europe/Tallinn'),
	(364,'Europe/Tirane'),
	(365,'Europe/Ulyanovsk'),
	(366,'Europe/Uzhgorod'),
	(367,'Europe/Vaduz'),
	(368,'Europe/Vatican'),
	(369,'Europe/Vienna'),
	(370,'Europe/Vilnius'),
	(371,'Europe/Volgograd'),
	(372,'Europe/Warsaw'),
	(373,'Europe/Zagreb'),
	(374,'Europe/Zaporozhye'),
	(375,'Europe/Zurich'),
	(376,'Indian/Antananarivo'),
	(377,'Indian/Chagos'),
	(378,'Indian/Christmas'),
	(379,'Indian/Cocos'),
	(380,'Indian/Comoro'),
	(381,'Indian/Kerguelen'),
	(382,'Indian/Mahe'),
	(383,'Indian/Maldives'),
	(384,'Indian/Mauritius'),
	(385,'Indian/Mayotte'),
	(386,'Indian/Reunion'),
	(387,'Pacific/Apia'),
	(388,'Pacific/Auckland'),
	(389,'Pacific/Bougainville'),
	(390,'Pacific/Chatham'),
	(391,'Pacific/Chuuk'),
	(392,'Pacific/Easter'),
	(393,'Pacific/Efate'),
	(394,'Pacific/Fakaofo'),
	(395,'Pacific/Fiji'),
	(396,'Pacific/Funafuti'),
	(397,'Pacific/Galapagos'),
	(398,'Pacific/Gambier'),
	(399,'Pacific/Guadalcanal'),
	(400,'Pacific/Guam'),
	(401,'Pacific/Honolulu'),
	(402,'Pacific/Kanton'),
	(403,'Pacific/Kiritimati'),
	(404,'Pacific/Kosrae'),
	(405,'Pacific/Kwajalein'),
	(406,'Pacific/Majuro'),
	(407,'Pacific/Marquesas'),
	(408,'Pacific/Midway'),
	(409,'Pacific/Nauru'),
	(410,'Pacific/Niue'),
	(411,'Pacific/Norfolk'),
	(412,'Pacific/Noumea'),
	(413,'Pacific/Pago_Pago'),
	(414,'Pacific/Palau'),
	(415,'Pacific/Pitcairn'),
	(416,'Pacific/Pohnpei'),
	(417,'Pacific/Port_Moresby'),
	(418,'Pacific/Rarotonga'),
	(419,'Pacific/Saipan'),
	(420,'Pacific/Tahiti'),
	(421,'Pacific/Tarawa'),
	(422,'Pacific/Tongatapu'),
	(423,'Pacific/Wake'),
	(424,'Pacific/Wallis'),
	(425,'UTC'),
	(426,'Africa/Abidjan'),
	(427,'Africa/Accra'),
	(428,'Africa/Addis_Ababa'),
	(429,'Africa/Algiers'),
	(430,'Africa/Asmara'),
	(431,'Africa/Bamako'),
	(432,'Africa/Bangui'),
	(433,'Africa/Banjul'),
	(434,'Africa/Bissau'),
	(435,'Africa/Blantyre'),
	(436,'Africa/Brazzaville'),
	(437,'Africa/Bujumbura'),
	(438,'Africa/Cairo'),
	(439,'Africa/Casablanca'),
	(440,'Africa/Ceuta'),
	(441,'Africa/Conakry'),
	(442,'Africa/Dakar'),
	(443,'Africa/Dar_es_Salaam'),
	(444,'Africa/Djibouti'),
	(445,'Africa/Douala'),
	(446,'Africa/El_Aaiun'),
	(447,'Africa/Freetown'),
	(448,'Africa/Gaborone'),
	(449,'Africa/Harare'),
	(450,'Africa/Johannesburg'),
	(451,'Africa/Juba'),
	(452,'Africa/Kampala'),
	(453,'Africa/Khartoum'),
	(454,'Africa/Kigali'),
	(455,'Africa/Kinshasa'),
	(456,'Africa/Lagos'),
	(457,'Africa/Libreville'),
	(458,'Africa/Lome'),
	(459,'Africa/Luanda'),
	(460,'Africa/Lubumbashi'),
	(461,'Africa/Lusaka'),
	(462,'Africa/Malabo'),
	(463,'Africa/Maputo'),
	(464,'Africa/Maseru'),
	(465,'Africa/Mbabane'),
	(466,'Africa/Mogadishu'),
	(467,'Africa/Monrovia'),
	(468,'Africa/Nairobi'),
	(469,'Africa/Ndjamena'),
	(470,'Africa/Niamey'),
	(471,'Africa/Nouakchott'),
	(472,'Africa/Ouagadougou'),
	(473,'Africa/Porto-Novo'),
	(474,'Africa/Sao_Tome'),
	(475,'Africa/Tripoli'),
	(476,'Africa/Tunis'),
	(477,'Africa/Windhoek'),
	(478,'America/Adak'),
	(479,'America/Anchorage'),
	(480,'America/Anguilla'),
	(481,'America/Antigua'),
	(482,'America/Araguaina'),
	(483,'America/Argentina/Buenos_Aires'),
	(484,'America/Argentina/Catamarca'),
	(485,'America/Argentina/Cordoba'),
	(486,'America/Argentina/Jujuy'),
	(487,'America/Argentina/La_Rioja'),
	(488,'America/Argentina/Mendoza'),
	(489,'America/Argentina/Rio_Gallegos'),
	(490,'America/Argentina/Salta'),
	(491,'America/Argentina/San_Juan'),
	(492,'America/Argentina/San_Luis'),
	(493,'America/Argentina/Tucuman'),
	(494,'America/Argentina/Ushuaia'),
	(495,'America/Aruba'),
	(496,'America/Asuncion'),
	(497,'America/Atikokan'),
	(498,'America/Bahia'),
	(499,'America/Bahia_Banderas'),
	(500,'America/Barbados'),
	(501,'America/Belem'),
	(502,'America/Belize'),
	(503,'America/Blanc-Sablon'),
	(504,'America/Boa_Vista'),
	(505,'America/Bogota'),
	(506,'America/Boise'),
	(507,'America/Cambridge_Bay'),
	(508,'America/Campo_Grande'),
	(509,'America/Cancun'),
	(510,'America/Caracas'),
	(511,'America/Cayenne'),
	(512,'America/Cayman'),
	(513,'America/Chicago'),
	(514,'America/Chihuahua'),
	(515,'America/Costa_Rica'),
	(516,'America/Creston'),
	(517,'America/Cuiaba'),
	(518,'America/Curacao'),
	(519,'America/Danmarkshavn'),
	(520,'America/Dawson'),
	(521,'America/Dawson_Creek'),
	(522,'America/Denver'),
	(523,'America/Detroit'),
	(524,'America/Dominica'),
	(525,'America/Edmonton'),
	(526,'America/Eirunepe'),
	(527,'America/El_Salvador'),
	(528,'America/Fort_Nelson'),
	(529,'America/Fortaleza'),
	(530,'America/Glace_Bay'),
	(531,'America/Goose_Bay'),
	(532,'America/Grand_Turk'),
	(533,'America/Grenada'),
	(534,'America/Guadeloupe'),
	(535,'America/Guatemala'),
	(536,'America/Guayaquil'),
	(537,'America/Guyana'),
	(538,'America/Halifax'),
	(539,'America/Havana'),
	(540,'America/Hermosillo'),
	(541,'America/Indiana/Indianapolis'),
	(542,'America/Indiana/Knox'),
	(543,'America/Indiana/Marengo'),
	(544,'America/Indiana/Petersburg'),
	(545,'America/Indiana/Tell_City'),
	(546,'America/Indiana/Vevay'),
	(547,'America/Indiana/Vincennes'),
	(548,'America/Indiana/Winamac'),
	(549,'America/Inuvik'),
	(550,'America/Iqaluit'),
	(551,'America/Jamaica'),
	(552,'America/Juneau'),
	(553,'America/Kentucky/Louisville'),
	(554,'America/Kentucky/Monticello'),
	(555,'America/Kralendijk'),
	(556,'America/La_Paz'),
	(557,'America/Lima'),
	(558,'America/Los_Angeles'),
	(559,'America/Lower_Princes'),
	(560,'America/Maceio'),
	(561,'America/Managua'),
	(562,'America/Manaus'),
	(563,'America/Marigot'),
	(564,'America/Martinique'),
	(565,'America/Matamoros'),
	(566,'America/Mazatlan'),
	(567,'America/Menominee'),
	(568,'America/Merida'),
	(569,'America/Metlakatla'),
	(570,'America/Mexico_City'),
	(571,'America/Miquelon'),
	(572,'America/Moncton'),
	(573,'America/Monterrey'),
	(574,'America/Montevideo'),
	(575,'America/Montserrat'),
	(576,'America/Nassau'),
	(577,'America/New_York'),
	(578,'America/Nipigon'),
	(579,'America/Nome'),
	(580,'America/Noronha'),
	(581,'America/North_Dakota/Beulah'),
	(582,'America/North_Dakota/Center'),
	(583,'America/North_Dakota/New_Salem'),
	(584,'America/Nuuk'),
	(585,'America/Ojinaga'),
	(586,'America/Panama'),
	(587,'America/Pangnirtung'),
	(588,'America/Paramaribo'),
	(589,'America/Phoenix'),
	(590,'America/Port-au-Prince'),
	(591,'America/Port_of_Spain'),
	(592,'America/Porto_Velho'),
	(593,'America/Puerto_Rico'),
	(594,'America/Punta_Arenas'),
	(595,'America/Rainy_River'),
	(596,'America/Rankin_Inlet'),
	(597,'America/Recife'),
	(598,'America/Regina'),
	(599,'America/Resolute'),
	(600,'America/Rio_Branco'),
	(601,'America/Santarem'),
	(602,'America/Santiago'),
	(603,'America/Santo_Domingo'),
	(604,'America/Sao_Paulo'),
	(605,'America/Scoresbysund'),
	(606,'America/Sitka'),
	(607,'America/St_Barthelemy'),
	(608,'America/St_Johns'),
	(609,'America/St_Kitts'),
	(610,'America/St_Lucia'),
	(611,'America/St_Thomas'),
	(612,'America/St_Vincent'),
	(613,'America/Swift_Current'),
	(614,'America/Tegucigalpa'),
	(615,'America/Thule'),
	(616,'America/Thunder_Bay'),
	(617,'America/Tijuana'),
	(618,'America/Toronto'),
	(619,'America/Tortola'),
	(620,'America/Vancouver'),
	(621,'America/Whitehorse'),
	(622,'America/Winnipeg'),
	(623,'America/Yakutat'),
	(624,'America/Yellowknife'),
	(625,'Antarctica/Casey'),
	(626,'Antarctica/Davis'),
	(627,'Antarctica/DumontDUrville'),
	(628,'Antarctica/Macquarie'),
	(629,'Antarctica/Mawson'),
	(630,'Antarctica/McMurdo'),
	(631,'Antarctica/Palmer'),
	(632,'Antarctica/Rothera'),
	(633,'Antarctica/Syowa'),
	(634,'Antarctica/Troll'),
	(635,'Antarctica/Vostok'),
	(636,'Arctic/Longyearbyen'),
	(637,'Asia/Aden'),
	(638,'Asia/Almaty'),
	(639,'Asia/Amman'),
	(640,'Asia/Anadyr'),
	(641,'Asia/Aqtau'),
	(642,'Asia/Aqtobe'),
	(643,'Asia/Ashgabat'),
	(644,'Asia/Atyrau'),
	(645,'Asia/Baghdad'),
	(646,'Asia/Bahrain'),
	(647,'Asia/Baku'),
	(648,'Asia/Bangkok'),
	(649,'Asia/Barnaul'),
	(650,'Asia/Beirut'),
	(651,'Asia/Bishkek'),
	(652,'Asia/Brunei'),
	(653,'Asia/Chita'),
	(654,'Asia/Choibalsan'),
	(655,'Asia/Colombo'),
	(656,'Asia/Damascus'),
	(657,'Asia/Dhaka'),
	(658,'Asia/Dili'),
	(659,'Asia/Dubai'),
	(660,'Asia/Dushanbe'),
	(661,'Asia/Famagusta'),
	(662,'Asia/Gaza'),
	(663,'Asia/Hebron'),
	(664,'Asia/Ho_Chi_Minh'),
	(665,'Asia/Hong_Kong'),
	(666,'Asia/Hovd'),
	(667,'Asia/Irkutsk'),
	(668,'Asia/Jakarta'),
	(669,'Asia/Jayapura'),
	(670,'Asia/Jerusalem'),
	(671,'Asia/Kabul'),
	(672,'Asia/Kamchatka'),
	(673,'Asia/Karachi'),
	(674,'Asia/Kathmandu'),
	(675,'Asia/Khandyga'),
	(676,'Asia/Kolkata'),
	(677,'Asia/Krasnoyarsk'),
	(678,'Asia/Kuala_Lumpur'),
	(679,'Asia/Kuching'),
	(680,'Asia/Kuwait'),
	(681,'Asia/Macau'),
	(682,'Asia/Magadan'),
	(683,'Asia/Makassar'),
	(684,'Asia/Manila'),
	(685,'Asia/Muscat'),
	(686,'Asia/Nicosia'),
	(687,'Asia/Novokuznetsk'),
	(688,'Asia/Novosibirsk'),
	(689,'Asia/Omsk'),
	(690,'Asia/Oral'),
	(691,'Asia/Phnom_Penh'),
	(692,'Asia/Pontianak'),
	(693,'Asia/Pyongyang'),
	(694,'Asia/Qatar'),
	(695,'Asia/Qostanay'),
	(696,'Asia/Qyzylorda'),
	(697,'Asia/Riyadh'),
	(698,'Asia/Sakhalin'),
	(699,'Asia/Samarkand'),
	(700,'Asia/Seoul'),
	(701,'Asia/Shanghai'),
	(702,'Asia/Singapore'),
	(703,'Asia/Srednekolymsk'),
	(704,'Asia/Taipei'),
	(705,'Asia/Tashkent'),
	(706,'Asia/Tbilisi'),
	(707,'Asia/Tehran'),
	(708,'Asia/Thimphu'),
	(709,'Asia/Tokyo'),
	(710,'Asia/Tomsk'),
	(711,'Asia/Ulaanbaatar'),
	(712,'Asia/Urumqi'),
	(713,'Asia/Ust-Nera'),
	(714,'Asia/Vientiane'),
	(715,'Asia/Vladivostok'),
	(716,'Asia/Yakutsk'),
	(717,'Asia/Yangon'),
	(718,'Asia/Yekaterinburg'),
	(719,'Asia/Yerevan'),
	(720,'Atlantic/Azores'),
	(721,'Atlantic/Bermuda'),
	(722,'Atlantic/Canary'),
	(723,'Atlantic/Cape_Verde'),
	(724,'Atlantic/Faroe'),
	(725,'Atlantic/Madeira'),
	(726,'Atlantic/Reykjavik'),
	(727,'Atlantic/South_Georgia'),
	(728,'Atlantic/St_Helena'),
	(729,'Atlantic/Stanley'),
	(730,'Australia/Adelaide'),
	(731,'Australia/Brisbane'),
	(732,'Australia/Broken_Hill'),
	(733,'Australia/Darwin'),
	(734,'Australia/Eucla'),
	(735,'Australia/Hobart'),
	(736,'Australia/Lindeman'),
	(737,'Australia/Lord_Howe'),
	(738,'Australia/Melbourne'),
	(739,'Australia/Perth'),
	(740,'Australia/Sydney'),
	(741,'Europe/Amsterdam'),
	(742,'Europe/Andorra'),
	(743,'Europe/Astrakhan'),
	(744,'Europe/Athens'),
	(745,'Europe/Belgrade'),
	(746,'Europe/Berlin'),
	(747,'Europe/Bratislava'),
	(748,'Europe/Brussels'),
	(749,'Europe/Bucharest'),
	(750,'Europe/Budapest'),
	(751,'Europe/Busingen'),
	(752,'Europe/Chisinau'),
	(753,'Europe/Copenhagen'),
	(754,'Europe/Dublin'),
	(755,'Europe/Gibraltar'),
	(756,'Europe/Guernsey'),
	(757,'Europe/Helsinki'),
	(758,'Europe/Isle_of_Man'),
	(759,'Europe/Istanbul'),
	(760,'Europe/Jersey'),
	(761,'Europe/Kaliningrad'),
	(762,'Europe/Kiev'),
	(763,'Europe/Kirov'),
	(764,'Europe/Lisbon'),
	(765,'Europe/Ljubljana'),
	(766,'Europe/London'),
	(767,'Europe/Luxembourg'),
	(768,'Europe/Madrid'),
	(769,'Europe/Malta'),
	(770,'Europe/Mariehamn'),
	(771,'Europe/Minsk'),
	(772,'Europe/Monaco'),
	(773,'Europe/Moscow'),
	(774,'Europe/Oslo'),
	(775,'Europe/Paris'),
	(776,'Europe/Podgorica'),
	(777,'Europe/Prague'),
	(778,'Europe/Riga'),
	(779,'Europe/Rome'),
	(780,'Europe/Samara'),
	(781,'Europe/San_Marino'),
	(782,'Europe/Sarajevo'),
	(783,'Europe/Saratov'),
	(784,'Europe/Simferopol'),
	(785,'Europe/Skopje'),
	(786,'Europe/Sofia'),
	(787,'Europe/Stockholm'),
	(788,'Europe/Tallinn'),
	(789,'Europe/Tirane'),
	(790,'Europe/Ulyanovsk'),
	(791,'Europe/Uzhgorod'),
	(792,'Europe/Vaduz'),
	(793,'Europe/Vatican'),
	(794,'Europe/Vienna'),
	(795,'Europe/Vilnius'),
	(796,'Europe/Volgograd'),
	(797,'Europe/Warsaw'),
	(798,'Europe/Zagreb'),
	(799,'Europe/Zaporozhye'),
	(800,'Europe/Zurich'),
	(801,'Indian/Antananarivo'),
	(802,'Indian/Chagos'),
	(803,'Indian/Christmas'),
	(804,'Indian/Cocos'),
	(805,'Indian/Comoro'),
	(806,'Indian/Kerguelen'),
	(807,'Indian/Mahe'),
	(808,'Indian/Maldives'),
	(809,'Indian/Mauritius'),
	(810,'Indian/Mayotte'),
	(811,'Indian/Reunion'),
	(812,'Pacific/Apia'),
	(813,'Pacific/Auckland'),
	(814,'Pacific/Bougainville'),
	(815,'Pacific/Chatham'),
	(816,'Pacific/Chuuk'),
	(817,'Pacific/Easter'),
	(818,'Pacific/Efate'),
	(819,'Pacific/Fakaofo'),
	(820,'Pacific/Fiji'),
	(821,'Pacific/Funafuti'),
	(822,'Pacific/Galapagos'),
	(823,'Pacific/Gambier'),
	(824,'Pacific/Guadalcanal'),
	(825,'Pacific/Guam'),
	(826,'Pacific/Honolulu'),
	(827,'Pacific/Kanton'),
	(828,'Pacific/Kiritimati'),
	(829,'Pacific/Kosrae'),
	(830,'Pacific/Kwajalein'),
	(831,'Pacific/Majuro'),
	(832,'Pacific/Marquesas'),
	(833,'Pacific/Midway'),
	(834,'Pacific/Nauru'),
	(835,'Pacific/Niue'),
	(836,'Pacific/Norfolk'),
	(837,'Pacific/Noumea'),
	(838,'Pacific/Pago_Pago'),
	(839,'Pacific/Palau'),
	(840,'Pacific/Pitcairn'),
	(841,'Pacific/Pohnpei'),
	(842,'Pacific/Port_Moresby'),
	(843,'Pacific/Rarotonga'),
	(844,'Pacific/Saipan'),
	(845,'Pacific/Tahiti'),
	(846,'Pacific/Tarawa'),
	(847,'Pacific/Tongatapu'),
	(848,'Pacific/Wake'),
	(849,'Pacific/Wallis'),
	(850,'UTC');

/*!40000 ALTER TABLE `timezones` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_provider` enum('flutterwave','mollie','midtrans','paypal','paystack','razorpay','sslcommerz','stripe','instamojo','offline') COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usd_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_plan_id_foreign` (`plan_id`),
  KEY `transactions_user_id_foreign` (`user_id`),
  CONSTRAINT `transactions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table user_device_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_device_tokens`;

CREATE TABLE `user_device_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `device_token` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_device_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `user_device_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table user_plans
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_plans`;

CREATE TABLE `user_plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `ad_limit` bigint unsigned NOT NULL DEFAULT '3',
  `featured_limit` bigint unsigned NOT NULL DEFAULT '0',
  `badge` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subscription_type` enum('one_time','recurring') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'one_time',
  `expired_date` date DEFAULT NULL,
  `current_plan_id` bigint unsigned DEFAULT NULL,
  `is_restored_plan_benefits` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_plans_user_id_foreign` (`user_id`),
  KEY `user_plans_current_plan_id_foreign` (`current_plan_id`),
  CONSTRAINT `user_plans_current_plan_id_foreign` FOREIGN KEY (`current_plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_plans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'backend/image/default-user.png',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_seen` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'email',
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  UNIQUE KEY `users_web_unique` (`web`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wishlists
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wishlists`;

CREATE TABLE `wishlists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ad_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlists_ad_id_foreign` (`ad_id`),
  KEY `wishlists_user_id_foreign` (`user_id`),
  CONSTRAINT `wishlists_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
