-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2022 at 07:37 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dukaletu`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'backend/image/default-user.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '2022-08-19 23:31:12', '$2y$10$pZrsDkiaZg6uAR3uDZJdcuvSoL/STv8iVNAVHdvGs6QhFQb/zpgRK', 'user/FILE_635cc30dbd9b4635cc30d.jpg', 'AqaQnZJFE0unrvnT2Redc8FPB1cYcnWI21TtlNFDNmlsZ4CzjLqvxrkdh308', '2022-08-19 23:31:12', '2022-10-28 14:37:09');

-- --------------------------------------------------------

--
-- Table structure for table `admin_searches`
--

CREATE TABLE `admin_searches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_phone` tinyint(1) NOT NULL DEFAULT 1,
  `phone_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','sold','pending','declined') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `total_reports` int(11) NOT NULL DEFAULT 0,
  `total_views` int(11) NOT NULL DEFAULT 0,
  `is_blocked` tinyint(1) NOT NULL DEFAULT 0,
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
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `title`, `slug`, `user_id`, `category_id`, `subcategory_id`, `brand_id`, `price`, `description`, `phone`, `show_phone`, `phone_2`, `thumbnail`, `status`, `featured`, `total_reports`, `total_views`, `is_blocked`, `drafted_at`, `created_at`, `updated_at`, `address`, `neighborhood`, `locality`, `place`, `district`, `postcode`, `region`, `country`, `long`, `lat`, `whatsapp`) VALUES
(1, 'Where does it come from?', 'where-does-it-come-from', 1, 1, NULL, 1, 343.00, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', NULL, 1, NULL, 'uploads/addss_image/1666680407_63578657368ea.jpg', 'active', 1, 0, 1, 0, NULL, '2022-10-24 22:31:49', '2022-10-26 14:24:03', '', '', '', '', '', '', NULL, NULL, 89.35108982767852, 23.476001306434195, ''),
(2, 'Lorem Ipsum is simply dummy text of the', 'lorem-ipsum-is-simply-dummy-text-of-the', 1, 1, NULL, 1, 545.00, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', NULL, 1, NULL, 'uploads/addss_image/1666674205_63576e1d93d30.jpg', 'active', 1, 0, 20, 0, NULL, '2022-10-24 22:31:49', '2022-10-25 05:26:03', '', '', '', '', '', '', NULL, NULL, 89.35108982767852, 23.476001306434195, ''),
(3, 'Lorem Ipsum is simply dummy text of', 'lorem-ipsum-is-simply-dummy-text-of', 1, 1, NULL, 1, 45887.00, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', NULL, 1, NULL, 'uploads/addss_image/1666674217_63576e29dc2ef.png', 'active', 1, 0, 7, 0, NULL, '2022-10-24 22:31:49', '2022-10-25 05:10:39', '', '', '', '', '', '', NULL, NULL, 89.35108982767852, 23.476001306434195, ''),
(4, 'What is Lorem Ipsum?', 'what-is-lorem-ipsum', 1, 1, NULL, 1, 258.00, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', NULL, 1, NULL, 'uploads/addss_image/1666676188_635775dc0de8b.jpg', 'active', 1, 0, 35, 0, NULL, '2022-10-24 22:31:49', '2022-10-25 06:15:32', '', '', '', '', '', '', NULL, NULL, 89.35108982767852, 23.476001306434195, ''),
(5, 'Why do we use it?', 'why-do-we-use-it', 1, 1, NULL, 1, 569.00, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', NULL, 1, NULL, 'uploads/addss_image/1666676229_63577605c173e.jpg', 'active', 1, 0, 33, 0, NULL, '2022-10-24 22:31:49', '2022-10-25 06:24:17', '', '', '', '', '', '', NULL, NULL, 89.35108982767852, 23.476001306434195, ''),
(6, 'Where can I get some?', 'where-can-i-get-some', 1, 1, NULL, 1, 343.00, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', NULL, 1, NULL, 'uploads/addss_image/1666676239_6357760fd1262.jpg', 'active', 1, 0, 2, 0, NULL, '2022-10-24 22:31:49', '2022-10-26 07:42:30', '', '', '', '', '', '', NULL, NULL, 89.35108982767852, 23.476001306434195, ''),
(7, 'The standard chunk of Lorem Ipsum', 'the-standard-chunk-of-lorem-ipsum', 1, 1, NULL, 1, 343.00, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', NULL, 1, NULL, 'uploads/addss_image/1666676249_63577619d66a1.jpg', 'active', 1, 0, 11, 0, NULL, '2022-10-24 22:31:49', '2022-10-25 04:14:53', '', '', '', '', '', '', NULL, NULL, 89.35108982767852, 23.476001306434195, ''),
(8, 'Contrary to popular belief, Lorem Ipsum is not simply random text', 'contrary-to-popular-belief-lorem-ipsum-is-not-simply-random-text', 1, 1, NULL, 1, 343.00, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', NULL, 1, NULL, 'uploads/addss_image/1666679356_6357823c57f41.jpg', 'active', 1, 0, 0, 0, NULL, '2022-10-24 22:31:49', '2022-10-25 00:29:16', '', '', '', '', '', '', NULL, NULL, 89.35108982767852, 23.476001306434195, ''),
(9, 'Auto Focus Case for Apple iPhone 11/iPhone 11 Pro/iPhone 11', 'auto-focus-case-for-apple-iphone-11iphone-11-proiphone-11', 1, 1, 5, 1, 343.00, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', '0704342252', 1, NULL, 'uploads/addss_image/1666679367_6357824713f03.jpg', 'active', 1, 0, 3, 0, NULL, '2022-10-24 22:31:49', '2022-10-28 15:42:47', '', '', '', '', '', '', NULL, NULL, 89.35108982767852, 23.476001306434195, ''),
(10, 'Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC', 'section-11032-of-de-finibus-bonorum-et-malorum-written-by-cicero-in-45-bc', 1, 1, NULL, 1, 343.00, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', NULL, 1, NULL, 'uploads/addss_image/1666679376_63578250f0df7.jpg', 'active', 1, 0, 1, 0, NULL, '2022-10-24 22:31:49', '2022-10-25 06:16:24', '', '', '', '', '', '', NULL, NULL, 89.35108982767852, 23.476001306434195, ''),
(11, '1914 translation by H. Rackham', '1914-translation-by-h-rackham', 1, 1, NULL, 1, 343.00, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', NULL, 1, NULL, 'uploads/addss_image/1666679511_635782d7026d1.jpg', 'active', 1, 0, 22, 0, NULL, '2022-10-24 22:31:49', '2022-10-25 04:56:19', '', '', '', '', '', '', NULL, NULL, 89.35108982767852, 23.476001306434195, ''),
(12, 'Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC', 'section-11033-of-de-finibus-bonorum-et-malorum-written-by-cicero-in-45-bc', 1, 1, NULL, 1, 343.00, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', NULL, 1, NULL, 'uploads/addss_image/1666679522_635782e2d7d5e.jpg', 'active', 1, 0, 3, 0, NULL, '2022-10-24 22:31:49', '2022-10-25 06:16:18', '', '', '', '', '', '', NULL, NULL, 89.35108982767852, 23.476001306434195, ''),
(13, 'On the other hand, we denounce with righteous indignation', 'on-the-other-hand-we-denounce-with-righteous-indignation', 1, 1, NULL, 1, 343.00, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', NULL, 1, NULL, 'uploads/addss_image/1666679548_635782fc8651c.jpg', 'active', 1, 0, 4, 0, NULL, '2022-10-24 22:31:49', '2022-10-25 06:24:07', '', '', '', '', '', '', NULL, NULL, 89.35108982767852, 23.476001306434195, ''),
(14, 'Apakah Lorem Ipsum itu?\r\n', 'on-the-other-hand-we-denounce-with-righteous-indignation', 1, 1, NULL, 1, 343.00, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', NULL, 1, NULL, 'uploads/addss_image/1666679548_635782fc8651c.jpg', 'active', 0, 0, 0, 0, NULL, '2022-10-24 22:31:49', '2022-10-25 00:32:28', '', '', '', '', '', '', NULL, NULL, 89.35108982767852, 23.476001306434195, ''),
(15, 'Mengapa kita menggunakannya?', 'mengapa-kita-menggunakannya', 1, 1, NULL, 1, 343.00, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', NULL, 1, NULL, 'uploads/addss_image/1666680392_63578648b2c3d.jpg', 'active', 0, 0, 4, 0, NULL, '2022-10-24 22:31:49', '2022-10-25 03:58:39', '', '', '', '', '', '', NULL, NULL, 89.35108982767852, 23.476001306434195, ''),
(16, 'Dari mana saya bisa mendapatkannya?', 'dari-mana-saya-bisa-mendapatkannya', 1, 1, NULL, 1, 343.00, '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>', NULL, 1, NULL, 'uploads/addss_image/1666680437_635786757b71a.jpg', 'active', 0, 0, 1, 0, NULL, '2022-10-24 22:31:49', '2022-10-25 06:27:03', '', '', '', '', '', '', NULL, NULL, 89.35108982767852, 23.476001306434195, NULL),
(17, 'Volkswagen Golf GTI 2011 Black', 'volkswagen-golf-gti-2011-black', 1, 2, 1, 1, 20.00, '<p>2011 VW Golf GTI Very mint condition 2000cc Automatic Petrol 108k kms genuine Bone Stock! No mods at all. OEM rims Android radio 1,549,999/=</p>', NULL, 1, NULL, 'uploads/addss_images/1666775771_6358fadb0e8ef.jpg', 'active', 1, 0, 4, 0, NULL, '2022-10-26 15:16:11', '2022-10-28 15:34:07', 'kenya', '', '', '', '', '', NULL, 'Kenya', 36.811355321719354, -1.3000507696303443, ''),
(18, 'Mercedes-Benz CLS 2011 350 White', 'mercedes-benz-cls-2011-350-white', 1, 2, 1, 1, 500.00, '<p>Original parts,No faults,Unpainted</p><p>SECOND CONDITION</p><p>Mercedes-Benz</p><p>MAKE</p><p>CLS</p><p>MODEL</p><p>2011</p><p>YEAR OF MANUFACTURE</p><p>350</p><p>TRIM</p><p>Sedan</p><p>BODY</p><p>Rear Wheel</p><p>DRIVETRAIN</p><p>3500&nbsp;cc</p><p>ENGINE SIZE</p><p>6</p><p>NUMBER OF CYLINDERS</p><p>309&nbsp;hp</p><p>HORSE POWER</p><p>White</p><p>COLOR</p><p>4</p><p>SEATS</p><p>Yes</p><p>REGISTERED CAR</p><p>No</p><p>EXCHANGE POSSIBLE</p><p>Functional Sunroof Fully loaded Mileage low Indian owned Brand new tyres</p>', NULL, 1, NULL, 'uploads/addss_images/1666775879_6358fb479c4ad.jpg', 'active', 0, 0, 0, 0, NULL, '2022-10-26 15:17:59', '2022-10-26 15:18:10', '', '', '', '', '', '', NULL, NULL, 91.03749119486602, 23.072309952517415, ''),
(19, 'Apple iPhone 7 Plus 128 GB Black', 'apple-iphone-7-plus-128-gb-black', 1, 3, 11, 1, 200.00, '<p>Apple</p><p>BRAND</p><p>iPhone 7 Plus</p><p>MODEL</p><p>Used</p><p>CONDITION</p><p>No cracks</p><p>SECOND CONDITION</p><p>Nano-SIM</p><p>SIM</p><p>IPS LCD</p><p>DISPLAY TYPE</p><p>6.1 &gt; inches</p><p>SCREEN SIZE</p><p>1080 x 1920</p><p>RESOLUTION</p><p>4 GB</p><p>RAM</p><p>128 GB</p><p>INTERNAL STORAGE</p><p>No</p><p>CARD SLOT</p><p>Dual 12 MP / 12 MP</p><p>MAIN CAMERA</p><p>7 MP (f/2.2)</p><p>SELFIE CAMERA</p><p>IOS</p><p>OPERATING SYSTEM</p><p>Black</p><p>COLOR</p><p>2900&nbsp;mAh</p><p>BATTERY</p><p>Apple iphone 7plus, 128GB storage</p><p>&nbsp;</p>', NULL, 1, NULL, 'uploads/addss_images/1666776052_6358fbf448df3.jpg', 'active', 1, 0, 1, 0, NULL, '2022-10-26 15:20:52', '2022-10-26 15:25:55', '', '', '', '', '', '', NULL, NULL, 92.05372654642852, 25.038483283056948, ''),
(20, 'Itel Smart Android 43', 'itel-smart-android-43', 1, 1, 14, 2, 250.00, '<p>Itel Smart Android 43</p>', NULL, 1, NULL, 'uploads/addss_images/1666776485_6358fda567968.jpg', 'active', 1, 0, 0, 0, NULL, '2022-10-26 15:28:05', '2022-10-26 15:29:03', '', '', '', '', '', '', NULL, NULL, 91.20228611674102, 24.539784778661804, ''),
(21, 'Best Quality 32 S 51', 'best-quality-32-s-51', 1, 1, 14, 2, 200.00, '<p>Other</p><p>TYPE</p><p>Other</p><p>BRAND</p><p>other</p><p>MODEL</p><p>Brand New</p><p>CONDITION</p><p>It comes with a free stabilizer which works with google assistant airplay enabled built in Chromecast display</p>', NULL, 1, NULL, 'uploads/addss_images/1666776647_6358fe4733346.jpg', 'active', 1, 0, 1, 0, NULL, '2022-10-26 15:30:47', '2022-10-28 13:48:47', '', '', '', '', '', '', NULL, NULL, 90.33436619486602, 24.72952622089298, ''),
(22, 'Mi Android Tv Stick', 'mi-android-tv-stick', 1, 1, 14, 5, 350.00, '<p>Other</p><p>BRAND</p><p>TV Boxes</p><p>TYPE</p><p>Brand New</p><p>CONDITION</p><p>With chrome cast built-in easily cast your favorite movie shows apps game and more from smart devices directly to your mi tv stick</p>', NULL, 1, NULL, 'uploads/addss_images/1666776764_6358febcbcffd.jpg', 'active', 1, 0, 0, 0, NULL, '2022-10-26 15:32:44', '2022-10-26 15:42:22', '', '', '', '', '', '', NULL, NULL, 88.64247166361602, 24.519795252893566, ''),
(23, 'Laptop HP EliteBook Folio G1 8GB Intel Core M SSD 256GB', 'laptop-hp-elitebook-folio-g1-8gb-intel-core-m-ssd-256gb', 1, 1, 5, 1, 200.00, '<p>Refurbished</p><p>CONDITION</p><p>Laptop</p><p>TYPE</p><p>HP</p><p>BRAND</p><p>EliteBook Folio G1</p><p>MODEL</p><p>Ultrabook</p><p>SUBTYPE</p><p>8GB</p><p>RAM</p><p>Intel Core M</p><p>PROCESSOR</p><p>256GB</p><p>STORAGE CAPACITY</p><p>SSD</p><p>STORAGE TYPE</p><p>12&quot; / 12.3&quot;</p><p>DISPLAY SIZE</p><p>Windows 10</p><p>OPERATING SYSTEM</p><p>Gray</p><p>COLOR</p><p>Hp folio G1 Intel core m5 8gb ram 256gb ssd 12.5inch FHD display back-lit keyboard</p>', NULL, 1, NULL, 'uploads/addss_images/1666776912_6358ff50dd8db.jpg', 'active', 1, 0, 0, 0, NULL, '2022-10-26 15:35:12', '2022-10-26 15:42:16', '', '', '', '', '', '', NULL, NULL, 90.45521580424102, 24.339746578305718, ''),
(24, 'TX6 Android Box (4gb,16gb)', 'tx6-android-box-4gb16gb', 1, 1, 14, 2, 250.00, '<p>Other</p><p>BRAND</p><p>TV Boxes</p><p>TYPE</p><p>Brand New</p><p>CONDITION</p>', NULL, 1, NULL, 'uploads/addss_images/1666777023_6358ffbf4c079.jpg', 'active', 0, 0, 0, 0, NULL, '2022-10-26 15:37:03', '2022-10-26 15:42:11', '', '', '', '', '', '', NULL, NULL, 88.62049900736602, 24.60972303552577, ''),
(25, 'Amazfit Bip U Health Fitness Smartwatch - Black', 'amazfit-bip-u-health-fitness-smartwatch-black', 1, 3, 13, 1, 99.00, '<p>Amazfit</p><p>BRAND</p><p>Amazfit Bip U</p><p>MODEL</p><p>Fitness Trackers</p><p>TYPE</p><p>Black</p><p>BAND COLOR</p><p>Other</p><p>BAND MATERIAL</p><p>Brand New</p><p>CONDITION</p><p>Display: 1.43&quot;, 320x302 pixel TFT color screen, 2.5D Gorilla Glass 3 Straps: Detachable silicone rubber straps, 20mm width, 76-118mm adjustable length Features: Real-time heart rate monitor, Blood oxygen level measurement, Stress Monitor, 5ATM water resistance, Sleep Tracking, Menstrual Cycle Tracker, Sports Tracking, Step Counter, Call and App Notification alerts, Standing Reminder, Phone Finder, Weather Forecast, Camera and Music Control, World Clock, Pomodoro Tracker Sports Modes: More than 60 sports modes, including Walking, Outdoor Cycling, Yoga, Pool Swimming, and Cricket Sensors: BioTracker 2 PPG Biological Optical Sensor, SpO2 Sensor, Accelerometer, Gyroscope Connectivity: BLE 5.0, Compatible with Android 5.0+ and iOS 10.0+ Positioning: Relies on connected smartphone&#39;s GPS Battery: 230mAh Colors: Black, Pink, and Green Dimensions: 40.9 x 35.5 x 11.4 mm Weight: 31 grams</p>', NULL, 1, NULL, 'uploads/addss_images/1666777155_635900435f657.jpg', 'active', 1, 0, 1, 0, NULL, '2022-10-26 15:39:15', '2022-10-28 14:12:59', '', '', '', '', '', '', NULL, NULL, 90.36732517924102, 22.778872883014333, ''),
(26, 'Samsung Galaxy Watch5 Pro 45MM', 'samsung-galaxy-watch5-pro-45mm', 1, 3, 13, 1, 999.00, '<p>Samsung</p><p>BRAND</p><p>Watch5 pro</p><p>MODEL</p><p>Smart Watches</p><p>TYPE</p><p>Black</p><p>BAND COLOR</p><p>Ceramic</p><p>BAND MATERIAL</p><p>Brand New</p><p>CONDITION</p>', NULL, 1, NULL, 'uploads/addss_images/1666777305_635900d92a1b1.jpg', 'active', 1, 0, 5, 0, NULL, '2022-10-26 15:41:45', '2022-10-31 20:12:19', '', '', '', '', '', '', NULL, NULL, 89.05995213236602, 24.16946524476771, ''),
(27, 'Isuzu Executive Bus 2013 Blue', 'isuzu-executive-bus-2013-blue', 1, 2, 2, 1, 1500.00, '<p>Kenyan Used</p><p>CONDITION</p><p>First owner</p><p>SECOND CONDITION</p><p>Isuzu</p><p>MAKE</p><p>Executive Bus</p><p>MODEL</p><p>2013</p><p>YEAR OF MANUFACTURE</p><p>Blue</p><p>COLOR</p><p>156000&nbsp;km</p><p>MILEAGE</p><p>Manual</p><p>TRANSMISSION</p><p>Diesel</p><p>FUEL</p>', NULL, 1, NULL, 'uploads/addss_images/1666777479_6359018798ec6.jpg', 'active', 0, 0, 1, 0, NULL, '2022-10-26 15:44:39', '2022-10-28 14:37:23', '', '', '', '', '', '', NULL, NULL, 89.34559666361602, 23.828221536903335, ''),
(28, 'New Jincheng 2022 Orange', 'new-jincheng-2022-orange', 1, 2, 3, 3, 1100.00, '<p>Brand New</p><p>CONDITION</p><p>Jincheng</p><p>MAKE</p><p>Other</p><p>MODEL</p><p>2022</p><p>YEAR OF MANUFACTURE</p><p>400&nbsp;cc</p><p>ENGINE CAPACITY</p><p>Orange</p><p>COLOR</p><p>Sport Bike</p><p>TYPE</p><p>26.67&nbsp;hp</p><p>HORSEPOWER</p><p>6500&nbsp;rpm</p><p>MAX TORQUE</p><p>6</p><p>NUMBER OF GEARS</p><p>18&nbsp;L</p><p>FUEL CAPACITY</p><p>0&nbsp;km</p><p>MILEAGE</p><p>Manual</p><p>TRANSMISSION</p><p>Front tyre 110/70-17 Rear tyre 150/70-17 Disc breaking system 18litres full tank capacity top speed;180km/h</p>', NULL, 1, NULL, 'uploads/addss_images/1666777621_63590215bab48.jpg', 'active', 1, 0, 1, 0, NULL, '2022-10-26 15:47:01', '2022-10-28 14:10:25', '', '', '', '', '', '', NULL, NULL, 89.37855564799102, 24.928941850814066, ''),
(29, 'Jincheng JC 150 T Eupolo 2020 Red', 'jincheng-jc-150-t-eupolo-2020-red', 1, 2, 3, 3, 150.00, '<p>Kenyan Used</p><p>CONDITION</p><p>Jincheng</p><p>MAKE</p><p>JC 150 T Eupolo</p><p>MODEL</p><p>2020</p><p>YEAR OF MANUFACTURE</p><p>150&nbsp;cc</p><p>ENGINE CAPACITY</p><p>Red</p><p>COLOR</p><p>Dual Sport</p><p>TYPE</p><p>6</p><p>NUMBER OF GEARS</p><p>130&nbsp;km/h</p><p>TOP SPEED</p><p>2850&nbsp;km</p><p>MILEAGE</p><p>Manual</p><p>TRANSMISSION</p><p>Im selling my sportbike because im relocating back to America, this bike is basically brand new. Logbook and Service records available. Neon Light package, ALarm system (2remotes), Bluetooth Radio with Phone charger , LED Night Riding Bar light. Absolutely no issues bring your mechanic. Just Crank &amp; Go. please Text Me- I work from 10am- 9pm. I will respond back on breaktime. very nice and fast bike.</p>', NULL, 1, NULL, 'uploads/addss_images/1666777779_635902b3a7b49.jpg', 'active', 1, 0, 1, 0, NULL, '2022-10-26 15:49:39', '2022-10-28 14:13:08', '', '', '', '', '', '', NULL, NULL, 90.64198338236602, 24.269658353933934, ''),
(30, 'Tata Tipper 2015 Local', 'tata-tipper-2015-local', 1, 2, 4, 1, 2000.00, '<p>Heavy-Duty Trucks</p><p>TYPE</p><p>Used</p><p>CONDITION</p><p>Tata</p><p>MAKE</p><p>2015</p><p>YEAR OF MANUFACTURE</p><p>White</p><p>COLOR</p><p>Manual</p><p>TRANSMISSION</p><p>Diesel</p><p>FUEL</p><p>Yes</p><p>EXCHANGE POSSIBLE</p><p>Tata Tipper model 2015 Local Awesome condition Chases intact No mechanical issues No dents Diesel manual Financing allowed Tyers 90% Logbook Transfer ready Location bypass Utawala</p>', NULL, 1, NULL, 'uploads/addss_images/1666777940_6359035483b08.jpg', 'active', 1, 0, 1, 0, NULL, '2022-10-26 15:52:20', '2022-10-28 14:12:53', '', '', '', '', '', '', NULL, NULL, 88.91712986674102, 24.049129663274815, ''),
(31, 'New Apple iPad 10.2 (2020) Wi-Fi 128 GB', 'new-apple-ipad-102-2020-wi-fi-128-gb', 1, 3, 12, 1, 1500.00, '<p>Apple</p><p>BRAND</p><p>iPad 10.2 (2020) Wi-Fi</p><p>MODEL</p><p>Brand New</p><p>CONDITION</p><p>128 GB</p><p>STORAGE CAPACITY</p><p>iOS</p><p>OPERATING SYSTEM</p><p>4 GB</p><p>RAM</p><p>IPS LCD</p><p>DISPLAY TYPE</p><p>1620 x 2160</p><p>RESOLUTION</p><p>No</p><p>SIM</p><p>No</p><p>CARD SLOT</p><p>8 MP</p><p>MAIN CAMERA</p><p>1.2MP</p><p>SELFIE CAMERA</p><p>8827&nbsp;mAh</p><p>BATTERY</p><p>Ipad 8th gen new in our shop 1 year warranty</p>', NULL, 1, NULL, 'uploads/addss_images/1666778047_635903bf2fa3b.jpg', 'active', 1, 0, 4, 0, NULL, '2022-10-26 15:54:07', '2022-11-03 16:39:58', '', '', '', '', '', '', NULL, NULL, 90.99354588236602, 24.499802545470814, ''),
(33, 'Hp Elitebook 830 G5, Cor i5 8th gen, 8GB RAM, 256GB SSD', 'hp-elitebook-830-g5-cor-i5-8th-gen-8gb-ram-256gb-ssd', 3, 3, 13, 4, 250.00, '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p>&nbsp;</p><p>&nbsp;</p><p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '01990572321', 0, '01990572321', NULL, 'pending', 0, 0, 0, 0, NULL, '2022-10-30 20:12:34', '2022-10-30 20:12:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01990572321');

-- --------------------------------------------------------

--
-- Table structure for table `ad_features`
--

CREATE TABLE `ad_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ad_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ad_features`
--

INSERT INTO `ad_features` (`id`, `ad_id`, `name`, `created_at`, `updated_at`) VALUES
(4, 9, '4G Network', '2022-10-28 14:18:03', '2022-10-28 14:18:03'),
(5, 9, '128 Rom', '2022-10-28 14:18:03', '2022-10-28 14:18:03'),
(6, 9, '256 Ram', '2022-10-28 14:18:03', '2022-10-28 14:18:03');

-- --------------------------------------------------------

--
-- Table structure for table `ad_galleries`
--

CREATE TABLE `ad_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ad_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ad_galleries`
--

INSERT INTO `ad_galleries` (`id`, `ad_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'uploads/addss_multiple/1666672338_635766d213ba2.jpg', '2022-10-24 22:32:18', '2022-10-24 22:32:18'),
(2, 1, 'uploads/addss_multiple/1666672338_635766d214d24.jpg', '2022-10-24 22:32:18', '2022-10-24 22:32:18'),
(3, 1, 'uploads/addss_multiple/1666672338_635766d2165d6.jpg', '2022-10-24 22:32:18', '2022-10-24 22:32:18'),
(4, 5, 'uploads/addss_multiple/1666695475_6357c133be728.jpg', '2022-10-25 04:57:55', '2022-10-25 04:57:55'),
(5, 5, 'uploads/addss_multiple/1666695475_6357c133c094c.jpg', '2022-10-25 04:57:55', '2022-10-25 04:57:55'),
(6, 5, 'uploads/addss_multiple/1666695475_6357c133c1410.jpg', '2022-10-25 04:57:55', '2022-10-25 04:57:55'),
(7, 5, 'uploads/addss_multiple/1666695475_6357c133c2289.jpg', '2022-10-25 04:57:55', '2022-10-25 04:57:55'),
(8, 5, 'uploads/addss_multiple/1666695475_6357c133c317f.jpg', '2022-10-25 04:57:55', '2022-10-25 04:57:55'),
(9, 5, 'uploads/addss_multiple/1666695475_6357c133c3b45.jpg', '2022-10-25 04:57:55', '2022-10-25 04:57:55'),
(10, 5, 'uploads/addss_multiple/1666695475_6357c133c486e.jpg', '2022-10-25 04:57:55', '2022-10-25 04:57:55'),
(11, 5, 'uploads/addss_multiple/1666695475_6357c133c5257.jpg', '2022-10-25 04:57:55', '2022-10-25 04:57:55'),
(12, 5, 'uploads/addss_multiple/1666695475_6357c133c5f1e.jpg', '2022-10-25 04:57:55', '2022-10-25 04:57:55');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Apple', 'apple', '2022-10-24 22:28:35', '2022-10-24 22:28:35'),
(2, 'Sony', 'sony', '2022-10-26 15:22:53', '2022-10-26 15:22:53'),
(3, 'Audi', 'audi', '2022-10-26 15:22:57', '2022-10-26 15:22:57'),
(4, 'Mercedes', 'mercedes', '2022-10-26 15:23:03', '2022-10-26 15:23:03'),
(5, 'Samsung', 'samsung', '2022-10-26 15:24:52', '2022-10-26 15:24:52');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `slug`, `icon`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Electronics & Gedgets', 'uploads/category\\yg6Dm4UWXrDpliuGSAvzMd8C4CXlEYjssJB6uuLH.png', 'electronics-gedgets', 'fab fa-bluetooth-b', 0, 1, '2022-10-24 22:25:27', '2022-10-24 22:25:27'),
(2, 'Vehicles', 'uploads/category/pcwGPwHBGKrLNCbQV34LOT2AlZju39As0XYJ8puY.jpg', 'vehicles', 'fas fa-car-side', 0, 1, '2022-10-26 14:47:30', '2022-10-26 14:47:30'),
(3, 'Mobile phones and tablets', 'uploads/category/jTcOLORUxrxWzSoA7GEeA0cWQppfAxKH1nNYtqhg.jpg', 'mobile-phones-and-tablets', 'fas fa-mobile-alt', 0, 1, '2022-10-26 14:48:43', '2022-10-26 14:48:43'),
(4, 'Electronics', 'uploads/category/FkpaXbBaDA6lE2XofGQ0cQYXazaVjnQVCSIOERqf.jpg', 'electronics', 'fas fa-dharmachakra', 0, 1, '2022-10-26 14:49:26', '2022-10-26 14:49:26'),
(5, 'Fashion', 'uploads/category/hwCG4aNWKaqLIs7ueS3p5NUI0L8fG0S2VEI3hAtc.jpg', 'fashion', 'fas fa-ad', 0, 1, '2022-10-26 14:50:05', '2022-10-26 14:50:05'),
(6, 'Home, Furniture and Appliances', 'uploads/category/90SQ4WvzOEltJia6HeLbyxvQaI4ktkXmBALTvMm4.jpg', 'home-furniture-and-appliances', 'fas fa-home', 0, 1, '2022-10-26 18:20:07', '2022-10-26 18:20:07'),
(7, 'Health and Beauty', 'uploads/category/K6wguddC1bfvRZuRdO6mGZbUhKeLgatzDWbswXO6.jpg', 'health-and-beauty', 'fas fa-beer', 0, 1, '2022-10-26 18:20:57', '2022-10-26 18:20:57'),
(8, 'Sports, Arts and Outdoors', 'uploads/category/U3zmSgRMAPpYrX44ZVabJbWGuF2Jg8NWdBEif1Lf.jpg', 'sports-arts-and-outdoors', 'fas fa-passport', 0, 1, '2022-10-26 18:21:35', '2022-10-26 18:21:35'),
(9, 'Services', 'uploads/category/xjsu7e1FKhbbxGtYGURCRrSD5PYODXkAn2W7SWmX.jpg', 'services', 'fas fa-server', 0, 1, '2022-10-26 18:22:08', '2022-10-26 18:22:08'),
(10, 'Jobs', 'uploads/category/2QQYf49mkgM0Nx4AJnk8OVdg8HOeFGxRb3BSOVcV.png', 'jobs', 'fab fa-joomla', 0, 1, '2022-10-26 18:22:43', '2022-10-26 18:22:43'),
(11, 'Babies and Kids', 'uploads/category/0iEzhnSFTCluF6wEHTqf4yshsbYg2dpjkZjoqCAB.jpg', 'babies-and-kids', 'fab fa-kickstarter-k', 0, 1, '2022-10-26 18:23:22', '2022-10-26 18:23:22'),
(12, 'Animals and Pets', 'uploads/category/JGdVItbCfZyKEBbSWrrBPpoOsbStv8hOnfMPLHXF.jpg', 'animals-and-pets', 'fas fa-pastafarianism', 0, 1, '2022-10-26 18:24:25', '2022-10-26 18:24:25'),
(13, 'Agriculture and Food', 'uploads/category/PurXWOiAYVN4YutelTqxKCxKjUoVFrlLiuCrYxHB.jpg', 'agriculture-and-food', 'fas fa-paragraph', 0, 1, '2022-10-26 18:25:14', '2022-10-26 18:25:14'),
(14, 'Repair and Construction', 'uploads/category/LrruQbG3yO1IHS9KLUNvDd0d0ehpDYg8DSbSlGWI.png', 'repair-and-construction', 'fab fa-autoprefixer', 0, 1, '2022-10-26 18:25:52', '2022-10-26 18:25:52'),
(15, 'Commercial equipment and tools', 'uploads/category/1UiPcEAOham1RKHRS1pveysdsc4zqhrw0qC8LaQH.jpg', 'commercial-equipment-and-tools', 'fas fa-comment-slash', 0, 1, '2022-10-26 18:26:38', '2022-10-26 18:26:38');

-- --------------------------------------------------------

--
-- Table structure for table `category_custom_field`
--

CREATE TABLE `category_custom_field` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `custom_field_id` bigint(20) UNSIGNED NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

CREATE TABLE `cms` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `terms_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_video_thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy_background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `posting_rules_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`id`, `home_main_banner`, `home_counter_background`, `home_mobile_app_banner`, `home_title`, `home_description`, `download_app`, `newsletter_content`, `membership_content`, `create_account`, `post_ads`, `start_earning`, `terms_background`, `terms_body`, `about_background`, `about_video_thumb`, `about_body`, `privacy_background`, `privacy_body`, `contact_background`, `contact_number`, `contact_email`, `contact_address`, `get_membership_background`, `get_membership_image`, `pricing_plan_background`, `faq_background`, `faq_content`, `manage_ads_content`, `chat_content`, `verified_user_content`, `dashboard_overview_background`, `dashboard_post_ads_background`, `dashboard_my_ads_background`, `dashboard_plan_background`, `dashboard_account_setting_background`, `dashboard_favorite_ads_background`, `dashboard_messenger_background`, `posting_rules_background`, `posting_rules_body`, `blog_background`, `ads_background`, `coming_soon_title`, `coming_soon_subtitle`, `maintenance_title`, `maintenance_subtitle`, `e404_title`, `e404_subtitle`, `e404_image`, `e500_title`, `e500_subtitle`, `e500_image`, `e503_title`, `e503_subtitle`, `e503_image`, `created_at`, `updated_at`) VALUES
(1, 'uploads/banners/o4zEERTXVrO5uwifXs1GmdzaeVKYVOeru52PivC1.jpg', NULL, NULL, 'Buy, Sell Anyting in Kenya', 'Buy And Sell Everything of your USED Products', 'Sed Luctus Nibh At Consectetur Tempor. Proin Et Ipsum Tincidunt, Maximus Turpis Id, Mollis Lacus. Maecenas Nec Risus A Urna Sollicitudin Aliquet. Maecenas Pretium Tristique Sapien', 'Vestibulum Consectetur Placerat Tellus. Sed Faucibus Fermentum Purus, At Facilisis.', 'Vestibulum Consectetur Placerat Tellus. Sed Faucibus Fermentum Purus, At Facilisis Neque Auctor.', 'Vestibulum Ante Ipsum Primis In Faucibus Orci Luctus Et Ultrices Posuere Cubilia Curae. Donec Non Lorem Erat. Sed Vitae Vene.', 'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Mauris Eu Aliquet Odio. Nulla Pretium Congue Eros, Nec Rhoncus Mi.', 'Vestibulum Quis Consectetur Est. Fusce Hendrerit Neque At Facilisis Facilisis. Praesent A Pretium Elit. Nulla Aliquam Puru.', NULL, '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br>&nbsp;</p>', NULL, 'uploads/banners/DSOVpts5q3TEHWU9ty98jhFnoBnoDARrqVomHGgT.png', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br>&nbsp;</p>', NULL, '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br>&nbsp;</p><p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br>&nbsp;</p>', NULL, '+1-202-555-0125', 'info@dukaletu.com', NULL, NULL, NULL, NULL, NULL, 'Praesent Finibus Dictum Nisl Sit Amet Vulputate. Fusce A Metus Eu Velit Posuere Semper A Bibendum Ante. Donec Eu Tellus Dapibus, Semper Orci Eget, Commodo Lacu Praesent Ullamcorper.', 'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Etiam Commodo Vel Ligula.', 'Class Aptent Taciti Sociosqu Ad Litora Torquent Per Conubia Nostra, Per Inceptos Himenaeos.', 'Class Aptent Taciti Sociosqu Ad Litora Torquent Per Conubia Nostra, Per Inceptos Himenaeos.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Mauris Eu Aliquet Odio. Nulla Pretium Congue Eros, Nec Rhoncus Mi<p>', NULL, NULL, NULL, NULL, NULL, NULL, 'Opps! Page Not Found!', 'Something went wrong. It\'s look like the link is broken or the page is removed.', 'frontend/images/bg/error.png', 'Internal Server Error', 'Something went wrong. It\'s look like the Internal Server has some errors.', 'frontend/default_images/error-banner.png', 'Service Unavailable', 'Something went wrong. It\'s look like the Internal Server has some errors.', 'frontend/default_images/error-banner.png', '2022-08-19 23:31:12', '2022-10-30 19:51:41');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cookies`
--

CREATE TABLE `cookies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `allow_cookies` tinyint(1) NOT NULL DEFAULT 1,
  `cookie_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gdpr_cookie',
  `cookie_expiration` tinyint(4) NOT NULL DEFAULT 30,
  `force_consent` tinyint(1) NOT NULL DEFAULT 0,
  `darkmode` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `approve_button_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decline_button_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cookies`
--

INSERT INTO `cookies` (`id`, `allow_cookies`, `cookie_name`, `cookie_expiration`, `force_consent`, `darkmode`, `language`, `title`, `description`, `approve_button_text`, `decline_button_text`, `created_at`, `updated_at`) VALUES
(1, 1, 'gdpr_cookie', 30, 0, 0, 'en', 'We use cookies!', 'Hi, this website uses essential cookies to ensure its proper operation and tracking cookies to understand how you interact with it. The latter will be set only after consent. <button type=\"button\" data-cc=\"c-settings\" class=\"cc-link\">Let me choose</button>', 'Allow all Cookies', 'Reject all Cookies', '2022-08-19 23:31:12', '2022-08-19 23:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol_position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'left',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `symbol_position`, `created_at`, `updated_at`) VALUES
(1, 'Kenyan shilling', 'KSH', 'KSh', 'left', '2022-08-19 23:31:12', '2022-10-24 23:14:15');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `custom_field_group_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('text','textarea','select','radio','file','url','number','date','checkbox','checkbox_multiple') COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `filterable` tinyint(1) NOT NULL DEFAULT 0,
  `listable` tinyint(1) NOT NULL DEFAULT 0,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fas fa-cube',
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_groups`
--

CREATE TABLE `custom_field_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `custom_field_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `database_backups`
--

CREATE TABLE `database_backups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `database_backups`
--

INSERT INTO `database_backups` (`id`, `name`, `file_path`, `created_at`, `updated_at`) VALUES
(1, 'database-backup-2022-11-03-20.gz', 'C:\\xampp\\htdocs\\webdevs\\dukaletu\\storage/app/backup/database/database-backup-2022-11-03-20.gz', '2022-11-03 11:28:20', '2022-11-03 11:28:20');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `faq_category_id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `faq_category_id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 1, 'How can i post an Ads ?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2022-10-28 14:43:12', '2022-10-28 14:43:12'),
(2, 1, 'How to become a member ?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2022-10-28 14:43:41', '2022-10-28 14:44:07');

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `slug`, `icon`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Posting Rules', 'posting-rules', 'fab fa-avianex', 0, '2022-10-28 14:42:45', '2022-10-28 14:42:45');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `direction`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'flag-icon-gb', 'ltr', '2022-08-19 23:31:12', '2022-08-19 23:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `messengers`
--

CREATE TABLE `messengers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_id` bigint(20) UNSIGNED NOT NULL,
  `to_id` bigint(20) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2012_07_14_154223_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_11_12_184107_create_permission_tables', 1),
(5, '2020_12_20_161857_create_brands_table', 1),
(6, '2020_12_23_122556_create_contacts_table', 1),
(7, '2021_02_17_110211_create_testimonials_table', 1),
(8, '2021_02_18_112239_create_admins_table', 1),
(9, '2021_08_22_051131_create_categories_table', 1),
(10, '2021_08_22_051134_create_sub_categories_table', 1),
(11, '2021_08_22_051135_create_ads_table', 1),
(12, '2021_08_22_051198_create_post_categories_table', 1),
(13, '2021_08_22_051199_create_posts_table', 1),
(14, '2021_08_23_115402_create_settings_table', 1),
(15, '2021_08_25_061331_create_languages_table', 1),
(16, '2021_09_04_105120_create_blog_comments_table', 1),
(17, '2021_09_05_120235_create_ad_features_table', 1),
(18, '2021_09_05_120248_create_ad_galleries_table', 1),
(19, '2021_09_19_141812_create_plans_table', 1),
(20, '2021_11_13_114825_create_messengers_table', 1),
(21, '2021_11_15_112417_create_user_plans_table', 1),
(22, '2021_11_15_112949_create_transactions_table', 1),
(23, '2021_12_14_142236_create_emails_table', 1),
(24, '2021_12_15_161624_create_module_settings_table', 1),
(25, '2021_12_19_101413_create_cms_table', 1),
(26, '2021_12_19_152529_create_faq_categories_table', 1),
(27, '2021_12_21_105713_create_faqs_table', 1),
(28, '2022_01_25_131111_add_fields_to_settings_table', 1),
(29, '2022_01_26_091457_add_social_login_fields_to_users_table', 1),
(30, '2022_02_16_152704_add_loader_fields_to_settings_table', 1),
(31, '2022_03_05_125615_create_currencies_table', 1),
(32, '2022_03_08_110749_add_website_configuration_to_settings_table', 1),
(33, '2022_03_27_175435_create_orders_table', 1),
(34, '2022_03_28_093629_add_socialite_column_to_users_table', 1),
(35, '2022_03_29_100616_create_timezones_table', 1),
(36, '2022_03_29_121851_create_admin_searches_table', 1),
(37, '2022_03_30_082959_create_cookies_table', 1),
(38, '2022_03_30_114924_create_seos_table', 1),
(39, '2022_03_30_121200_create_database_backups_table', 1),
(40, '2022_04_25_132657_create_setup_guides_table', 1),
(41, '2022_04_28_134721_create_mobile_app_configs_table', 1),
(42, '2022_04_28_142433_create_mobile_app_sliders_table', 1),
(43, '2022_06_06_041744_add_field_to_users_table', 1),
(44, '2022_06_06_052533_create_notifications_table', 1),
(45, '2022_06_06_092421_create_themes_table', 1),
(46, '2022_06_08_053638_create_custom_field_groups_table', 1),
(47, '2022_06_08_060821_create_custom_fields_table', 1),
(48, '2022_06_08_061216_create_custom_field_values_table', 1),
(49, '2022_06_08_061928_create_category_custom_field_table', 1),
(50, '2022_06_08_091126_create_product_custom_fields_table', 1),
(51, '2022_06_14_051918_add_fields_to_user_plans_table', 1),
(52, '2022_06_14_095728_add_fields_to_plans_table', 1),
(53, '2022_06_18_031525_add_full_address_to_ads_table', 1),
(54, '2022_06_27_050337_add_map_to_settings_table', 1),
(55, '2022_07_03_030110_add_whatsapp_field_to_ads_table', 1),
(56, '2022_07_04_042533_create_jobs_table', 1),
(57, '2022_07_05_081552_create_reports_table', 1),
(58, '2022_07_05_112407_create_social_media_table', 1),
(59, '2022_07_14_151623_create_wishlists_table', 1),
(60, '2022_07_14_155901_create_reviews_table', 1),
(61, '2022_07_24_110337_create_user_device_token_tbale', 1),
(62, '2022_07_25_024244_add_push_notification_settings_table', 1),
(63, '2022_08_20_041304_add_social_fields_to_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mobile_app_configs`
--

CREATE TABLE `mobile_app_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `android_download_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ios_download_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms_and_condition_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mobile_app_configs`
--

INSERT INTO `mobile_app_configs` (`id`, `android_download_url`, `ios_download_url`, `privacy_url`, `support_url`, `terms_and_condition_url`, `created_at`, `updated_at`) VALUES
(1, 'https://playstore.com', 'https://applestore.com', 'https://www.appname.com/privacy-policy', 'https://www.appname.com/support', 'https://www.appname.com/terms-and-conditions', '2022-08-19 23:31:12', '2022-10-28 14:02:50');

-- --------------------------------------------------------

--
-- Table structure for table `mobile_app_sliders`
--

CREATE TABLE `mobile_app_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `background` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `module_settings`
--

CREATE TABLE `module_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog` tinyint(1) NOT NULL DEFAULT 1,
  `newsletter` tinyint(1) NOT NULL DEFAULT 1,
  `language` tinyint(1) NOT NULL DEFAULT 1,
  `contact` tinyint(1) NOT NULL DEFAULT 1,
  `faq` tinyint(1) NOT NULL DEFAULT 1,
  `testimonial` tinyint(1) NOT NULL DEFAULT 1,
  `price_plan` tinyint(1) NOT NULL DEFAULT 1,
  `appearance` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module_settings`
--

INSERT INTO `module_settings` (`id`, `blog`, `newsletter`, `language`, `contact`, `faq`, `testimonial`, `price_plan`, `appearance`) VALUES
(1, 0, 0, 0, 1, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0d15799a-3306-49ce-a2a4-1e3a0a774d37', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 3, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/ad\\/details\\/samsung-galaxy-a23-64-gb\"}', NULL, '2022-10-28 14:59:07', '2022-10-28 14:59:07'),
('28e0ea8b-eefa-4558-a181-1be2ce16aba2', 'App\\Notifications\\AdApprovedNotification', 'App\\Models\\User', 3, '{\"msg\":\"Ad Approved\",\"type\":\"adapproved\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/ad\\/details\\/samsung-galaxy-a23-64-gb\"}', NULL, '2022-10-28 14:59:02', '2022-10-28 14:59:02'),
('f3cfed90-d362-48f6-958b-136f782b554f', 'App\\Notifications\\LogoutNotification', 'App\\Models\\User', 3, '{\"msg\":\"You\'re loggedout successfully\",\"type\":\"loggedout\"}', NULL, '2022-10-28 15:32:12', '2022-10-28 15:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `payment_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Waiting for payment, 2=Already paid, 3=Expired',
  `snap_token` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard.view', 'admin', 'dashboard', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(2, 'admin.create', 'admin', 'admin', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(3, 'admin.view', 'admin', 'admin', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(4, 'admin.edit', 'admin', 'admin', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(5, 'admin.delete', 'admin', 'admin', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(6, 'role.create', 'admin', 'role', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(7, 'role.view', 'admin', 'role', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(8, 'role.edit', 'admin', 'role', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(9, 'role.delete', 'admin', 'role', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(10, 'map.create', 'admin', 'map', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(11, 'map.view', 'admin', 'map', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(12, 'map.edit', 'admin', 'map', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(13, 'map.delete', 'admin', 'map', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(14, 'profile.view', 'admin', 'profile', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(15, 'profile.edit', 'admin', 'profile', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(16, 'setting.view', 'admin', 'settings', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(17, 'setting.update', 'admin', 'settings', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(18, 'ad.create', 'admin', 'ad', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(19, 'ad.view', 'admin', 'ad', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(20, 'ad.update', 'admin', 'ad', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(21, 'ad.delete', 'admin', 'ad', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(22, 'category.create', 'admin', 'category', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(23, 'category.view', 'admin', 'category', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(24, 'category.update', 'admin', 'category', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(25, 'category.delete', 'admin', 'category', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(26, 'subcategory.create', 'admin', 'category', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(27, 'subcategory.view', 'admin', 'category', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(28, 'subcategory.update', 'admin', 'category', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(29, 'subcategory.delete', 'admin', 'category', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(30, 'custom-field.create', 'admin', 'custom-field', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(31, 'custom-field.view', 'admin', 'custom-field', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(32, 'custom-field.update', 'admin', 'custom-field', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(33, 'custom-field.delete', 'admin', 'custom-field', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(34, 'custom-field-group.create', 'admin', 'custom-field', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(35, 'custom-field-group.view', 'admin', 'custom-field', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(36, 'custom-field-group.update', 'admin', 'custom-field', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(37, 'custom-field-group.delete', 'admin', 'custom-field', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(38, 'newsletter.view', 'admin', 'newsletter', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(39, 'newsletter.mailsend', 'admin', 'newsletter', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(40, 'newsletter.delete', 'admin', 'newsletter', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(41, 'brand.create', 'admin', 'brand', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(42, 'brand.view', 'admin', 'brand', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(43, 'brand.update', 'admin', 'brand', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(44, 'brand.delete', 'admin', 'brand', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(45, 'plan.create', 'admin', 'plan', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(46, 'plan.view', 'admin', 'plan', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(47, 'plan.update', 'admin', 'plan', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(48, 'plan.delete', 'admin', 'plan', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(49, 'postcategory.create', 'admin', 'Blog', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(50, 'postcategory.view', 'admin', 'Blog', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(51, 'postcategory.update', 'admin', 'Blog', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(52, 'postcategory.delete', 'admin', 'Blog', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(53, 'post.create', 'admin', 'Blog', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(54, 'post.view', 'admin', 'Blog', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(55, 'post.update', 'admin', 'Blog', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(56, 'post.delete', 'admin', 'Blog', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(57, 'tag.create', 'admin', 'Blog', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(58, 'tag.view', 'admin', 'Blog', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(59, 'tag.update', 'admin', 'Blog', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(60, 'tag.delete', 'admin', 'Blog', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(61, 'testimonial.create', 'admin', 'testimonial', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(62, 'testimonial.view', 'admin', 'testimonial', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(63, 'testimonial.update', 'admin', 'testimonial', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(64, 'testimonial.delete', 'admin', 'testimonial', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(65, 'faqcategory.create', 'admin', 'faq', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(66, 'faqcategory.view', 'admin', 'faq', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(67, 'faqcategory.update', 'admin', 'faq', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(68, 'faqcategory.delete', 'admin', 'faq', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(69, 'faq.create', 'admin', 'faq', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(70, 'faq.view', 'admin', 'faq', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(71, 'faq.update', 'admin', 'faq', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(72, 'faq.delete', 'admin', 'faq', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(73, 'customer.view', 'admin', 'others', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(74, 'contact.view', 'admin', 'others', '2022-08-19 23:31:12', '2022-08-19 23:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `ad_limit` int(11) NOT NULL,
  `featured_limit` int(11) NOT NULL,
  `badge` tinyint(1) NOT NULL,
  `recommended` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interval` enum('monthly','yearly','custom_date') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_interval_days` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `label`, `price`, `ad_limit`, `featured_limit`, `badge`, `recommended`, `created_at`, `updated_at`, `interval`, `custom_interval_days`) VALUES
(1, 'Basic', 0.00, 50, 20, 0, 0, '2022-10-30 19:56:26', '2022-10-30 19:56:26', 'monthly', 15),
(2, 'Standard', 10.00, 100, 30, 1, 0, '2022-10-30 19:56:56', '2022-10-30 19:56:56', 'monthly', 15),
(3, 'Premium', 30.00, 200, 50, 1, 0, '2022-10-30 19:57:21', '2022-10-30 19:57:21', 'monthly', 15);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_custom_fields`
--

CREATE TABLE `product_custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ad_id` bigint(20) UNSIGNED NOT NULL,
  `custom_field_id` bigint(20) UNSIGNED NOT NULL,
  `custom_field_group_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `report_from_id` bigint(20) UNSIGNED NOT NULL,
  `report_to_id` bigint(20) UNSIGNED NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `stars` int(11) NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `stars`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 5, 'dd', 1, '2022-10-25 05:19:46', '2022-10-25 05:19:46');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'admin', '2022-08-19 23:31:12', '2022-08-19 23:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1);

-- --------------------------------------------------------

--
-- Table structure for table `seos`
--

CREATE TABLE `seos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seos`
--

INSERT INTO `seos` (`id`, `page_slug`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'home', 'Welcome To Dukaletu', 'Dukaletu- Largest Classifieds Portal', 'backend/image/default.png', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(2, 'about', 'About', 'Dukaletu- Largest Classifieds Portal', 'backend/image/default.png', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(3, 'contact', 'About', 'Dukaletu- Largest Classifieds Portal', 'backend/image/default.png', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(4, 'ads', 'Ads', 'Dukaletu- Largest Classifieds Portal', 'backend/image/default.png', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(5, 'blog', 'Blog', 'Dukaletu- Largest Classifieds Portal', 'backend/image/default.png', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(6, 'pricing', 'Pricing', 'Dukaletu- Largest Classifieds Portal', 'backend/image/default.png', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(7, 'login', 'Login', 'Dukaletu- Largest Classifieds Portal', 'backend/image/default.png', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(8, 'register', 'Register', 'Dukaletu- Largest Classifieds Portal', 'backend/image/default.png', '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(9, 'faq', 'FAQ', 'Dukaletu- Largest Classifieds Portal', 'backend/image/default.png', '2022-08-19 23:31:12', '2022-08-19 23:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `white_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_css` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_script` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body_script` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free_featured_ad_limit` int(11) NOT NULL DEFAULT 3,
  `regular_ads_homepage` tinyint(1) NOT NULL DEFAULT 0,
  `featured_ads_homepage` tinyint(1) NOT NULL DEFAULT 1,
  `customer_email_verification` tinyint(1) NOT NULL DEFAULT 0,
  `maximum_ad_image_limit` int(10) UNSIGNED NOT NULL DEFAULT 5,
  `subscription_type` enum('one_time','recurring') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'one_time',
  `ads_admin_approval` tinyint(1) NOT NULL DEFAULT 0,
  `free_ad_limit` int(11) NOT NULL DEFAULT 5,
  `sidebar_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nav_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sidebar_txt_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nav_txt_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accent_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frontend_primary_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frontend_secondary_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dark_mode` tinyint(1) NOT NULL DEFAULT 0,
  `facebook_pixel` tinyint(1) NOT NULL DEFAULT 0,
  `google_analytics` tinyint(1) NOT NULL DEFAULT 0,
  `search_engine_indexing` tinyint(1) NOT NULL DEFAULT 1,
  `default_layout` tinyint(1) NOT NULL DEFAULT 1,
  `website_loader` tinyint(1) NOT NULL DEFAULT 1,
  `loader_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_changing` tinyint(1) NOT NULL DEFAULT 1,
  `email_verification` tinyint(1) NOT NULL DEFAULT 0,
  `watermark_status` tinyint(1) NOT NULL DEFAULT 0,
  `watermark_type` enum('text','image') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `watermark_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Dukaletu',
  `watermark_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'frontend/images/logo.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `default_map` enum('google-map','map-box') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'google-map',
  `google_map_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_box_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_long` double NOT NULL DEFAULT -100,
  `default_lat` double NOT NULL DEFAULT 40,
  `push_notification_status` tinyint(1) NOT NULL DEFAULT 1,
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
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo_image`, `white_logo`, `favicon_image`, `header_css`, `header_script`, `body_script`, `free_featured_ad_limit`, `regular_ads_homepage`, `featured_ads_homepage`, `customer_email_verification`, `maximum_ad_image_limit`, `subscription_type`, `ads_admin_approval`, `free_ad_limit`, `sidebar_color`, `nav_color`, `sidebar_txt_color`, `nav_txt_color`, `main_color`, `accent_color`, `frontend_primary_color`, `frontend_secondary_color`, `dark_mode`, `facebook_pixel`, `google_analytics`, `search_engine_indexing`, `default_layout`, `website_loader`, `loader_image`, `language_changing`, `email_verification`, `watermark_status`, `watermark_type`, `watermark_text`, `watermark_image`, `created_at`, `updated_at`, `default_map`, `google_map_key`, `map_box_key`, `default_long`, `default_lat`, `push_notification_status`, `server_key`, `api_key`, `auth_domain`, `project_id`, `storage_bucket`, `messaging_sender_id`, `app_id`, `measurement_id`, `facebook`, `twitter`, `instagram`, `youtube`, `linkdin`, `whatsapp`) VALUES
(1, 'uploads/app/logo\\o5cLJ1S3qDEGpBVhK2dPjsG4y43JNUodisa1oSjM.png', 'uploads/app/logo\\wNUnMrh5vOJwPC4zdJux2C4gClD3089XGlZcnvs5.png', 'uploads/app/logo\\zitPolRGGS7vMdroGm4u0b2n3NEB0sbVaBHSXu3Z.png', NULL, NULL, NULL, 1, 1, 1, 0, 5, 'recurring', 1, 3, '#022446', '#0a243e', '#e0e9f2', '#e0e9f2', '#05c279', '#ffc107', '#05c279', '#ffc107', 0, 0, 0, 1, 1, 0, NULL, 0, 0, 1, 'text', 'Dukaletu', 'frontend/images/logo.png', '2022-08-19 23:31:12', '2022-10-28 14:54:14', 'google-map', 'AIzaSyA0gxkGb2UmHjxv9ftK8LjX9vQ-SnmJJ20', '', 90.411270491741, 23.757853442383, 0, 'your-server-key', 'your-api-key', 'your-auth-domain', 'your-project-id', 'your-storage-bucket', 'your-messaging-sender-id', 'your-app-id', 'your-measurement-id', 'https://facebook.com/zakirsoft', 'https://twitter.com/zakirsoft', 'https://instagram.com/zakirsoft', 'https://www.youtube.com/channel/UCMSp_qPtYbaUMjEICDLhDCQ', 'https://www.linkedin.com/in/zakirsoft', 'https://web.whatsapp.com/');

-- --------------------------------------------------------

--
-- Table structure for table `setup_guides`
--

CREATE TABLE `setup_guides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setup_guides`
--

INSERT INTO `setup_guides` (`id`, `task_name`, `title`, `description`, `action_route`, `action_label`, `status`, `created_at`, `updated_at`) VALUES
(1, 'app_setting', 'App Information ', 'Add your app logo, name, description, owner and other information.', 'settings.general', 'Add App Information', 1, '2022-08-19 23:31:12', '2022-10-25 01:33:08'),
(2, 'smtp_setting', 'SMTP Configuration', 'Add your app logo, name, description, owner and other information.', 'settings.email', 'Add Mail Configuration', 1, '2022-08-19 23:31:12', '2022-10-28 13:41:01'),
(3, 'payment_setting', 'Enable Payment Method', 'Enable to payment methods to receive payments from your customer.', 'settings.payment', 'Add Payment', 0, '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(4, 'theme_setting', 'Customize Theme', 'Customize your theme to make your app look more attractive.', 'settings.theme', 'Customize Your App Now', 0, '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(5, 'map_setting', 'Map Configuration', 'Configure your map setting api to create ad in any location.', 'settings.system', 'Add Map API', 1, '2022-08-19 23:31:12', '2022-10-28 14:54:14'),
(6, 'pusher_setting', 'Pusher Configuration', 'Configure your pusher setting api for the chat application', 'settings.system', 'Add Pusher API', 0, '2022-08-19 23:31:12', '2022-08-19 23:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `social_media` enum('facebook','twitter','instagram','youtube','linkedin','pinterest','reddit','github','other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Cars', 'cars', 1, '2022-10-26 14:50:39', '2022-10-26 14:50:39'),
(2, 2, 'Buses and Microbuses', 'buses-and-microbuses', 1, '2022-10-26 14:50:49', '2022-10-26 14:50:49'),
(3, 2, 'Motorcycles and Scooters', 'motorcycles-and-scooters', 1, '2022-10-26 14:51:05', '2022-10-26 14:51:05'),
(4, 2, 'Trucks', 'trucks', 1, '2022-10-26 14:51:23', '2022-10-26 14:51:23'),
(5, 1, 'TV and DVD equipments', 'tv-and-dvd-equipments', 1, '2022-10-26 14:55:28', '2022-10-26 14:55:28'),
(6, 1, 'Laptop and Computers', 'laptop-and-computers', 1, '2022-10-26 14:55:49', '2022-10-26 14:55:49'),
(7, 1, 'Headphones', 'headphones', 1, '2022-10-26 14:56:02', '2022-10-26 14:56:02'),
(8, 5, 'Bags', 'bags', 1, '2022-10-26 14:56:17', '2022-10-26 14:56:17'),
(9, 5, 'Clothing', 'clothing', 1, '2022-10-26 14:56:25', '2022-10-26 14:56:25'),
(10, 5, 'Jewelry', 'jewelry', 1, '2022-10-26 14:56:33', '2022-10-26 14:56:33'),
(11, 3, 'Mobile phones', 'mobile-phones', 1, '2022-10-26 14:56:50', '2022-10-26 14:56:50'),
(12, 3, 'Tablets', 'tablets', 1, '2022-10-26 14:56:56', '2022-10-26 14:56:56'),
(13, 3, 'Smartwatches', 'smartwatches', 1, '2022-10-26 14:58:40', '2022-10-26 14:58:40'),
(14, 1, 'TV', 'tv', 1, '2022-10-26 15:27:18', '2022-10-26 15:27:18');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stars` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `home_page` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timezones`
--

INSERT INTO `timezones` (`id`, `value`) VALUES
(1, 'Africa/Abidjan'),
(2, 'Africa/Accra'),
(3, 'Africa/Addis_Ababa'),
(4, 'Africa/Algiers'),
(5, 'Africa/Asmara'),
(6, 'Africa/Bamako'),
(7, 'Africa/Bangui'),
(8, 'Africa/Banjul'),
(9, 'Africa/Bissau'),
(10, 'Africa/Blantyre'),
(11, 'Africa/Brazzaville'),
(12, 'Africa/Bujumbura'),
(13, 'Africa/Cairo'),
(14, 'Africa/Casablanca'),
(15, 'Africa/Ceuta'),
(16, 'Africa/Conakry'),
(17, 'Africa/Dakar'),
(18, 'Africa/Dar_es_Salaam'),
(19, 'Africa/Djibouti'),
(20, 'Africa/Douala'),
(21, 'Africa/El_Aaiun'),
(22, 'Africa/Freetown'),
(23, 'Africa/Gaborone'),
(24, 'Africa/Harare'),
(25, 'Africa/Johannesburg'),
(26, 'Africa/Juba'),
(27, 'Africa/Kampala'),
(28, 'Africa/Khartoum'),
(29, 'Africa/Kigali'),
(30, 'Africa/Kinshasa'),
(31, 'Africa/Lagos'),
(32, 'Africa/Libreville'),
(33, 'Africa/Lome'),
(34, 'Africa/Luanda'),
(35, 'Africa/Lubumbashi'),
(36, 'Africa/Lusaka'),
(37, 'Africa/Malabo'),
(38, 'Africa/Maputo'),
(39, 'Africa/Maseru'),
(40, 'Africa/Mbabane'),
(41, 'Africa/Mogadishu'),
(42, 'Africa/Monrovia'),
(43, 'Africa/Nairobi'),
(44, 'Africa/Ndjamena'),
(45, 'Africa/Niamey'),
(46, 'Africa/Nouakchott'),
(47, 'Africa/Ouagadougou'),
(48, 'Africa/Porto-Novo'),
(49, 'Africa/Sao_Tome'),
(50, 'Africa/Tripoli'),
(51, 'Africa/Tunis'),
(52, 'Africa/Windhoek'),
(53, 'America/Adak'),
(54, 'America/Anchorage'),
(55, 'America/Anguilla'),
(56, 'America/Antigua'),
(57, 'America/Araguaina'),
(58, 'America/Argentina/Buenos_Aires'),
(59, 'America/Argentina/Catamarca'),
(60, 'America/Argentina/Cordoba'),
(61, 'America/Argentina/Jujuy'),
(62, 'America/Argentina/La_Rioja'),
(63, 'America/Argentina/Mendoza'),
(64, 'America/Argentina/Rio_Gallegos'),
(65, 'America/Argentina/Salta'),
(66, 'America/Argentina/San_Juan'),
(67, 'America/Argentina/San_Luis'),
(68, 'America/Argentina/Tucuman'),
(69, 'America/Argentina/Ushuaia'),
(70, 'America/Aruba'),
(71, 'America/Asuncion'),
(72, 'America/Atikokan'),
(73, 'America/Bahia'),
(74, 'America/Bahia_Banderas'),
(75, 'America/Barbados'),
(76, 'America/Belem'),
(77, 'America/Belize'),
(78, 'America/Blanc-Sablon'),
(79, 'America/Boa_Vista'),
(80, 'America/Bogota'),
(81, 'America/Boise'),
(82, 'America/Cambridge_Bay'),
(83, 'America/Campo_Grande'),
(84, 'America/Cancun'),
(85, 'America/Caracas'),
(86, 'America/Cayenne'),
(87, 'America/Cayman'),
(88, 'America/Chicago'),
(89, 'America/Chihuahua'),
(90, 'America/Costa_Rica'),
(91, 'America/Creston'),
(92, 'America/Cuiaba'),
(93, 'America/Curacao'),
(94, 'America/Danmarkshavn'),
(95, 'America/Dawson'),
(96, 'America/Dawson_Creek'),
(97, 'America/Denver'),
(98, 'America/Detroit'),
(99, 'America/Dominica'),
(100, 'America/Edmonton'),
(101, 'America/Eirunepe'),
(102, 'America/El_Salvador'),
(103, 'America/Fort_Nelson'),
(104, 'America/Fortaleza'),
(105, 'America/Glace_Bay'),
(106, 'America/Goose_Bay'),
(107, 'America/Grand_Turk'),
(108, 'America/Grenada'),
(109, 'America/Guadeloupe'),
(110, 'America/Guatemala'),
(111, 'America/Guayaquil'),
(112, 'America/Guyana'),
(113, 'America/Halifax'),
(114, 'America/Havana'),
(115, 'America/Hermosillo'),
(116, 'America/Indiana/Indianapolis'),
(117, 'America/Indiana/Knox'),
(118, 'America/Indiana/Marengo'),
(119, 'America/Indiana/Petersburg'),
(120, 'America/Indiana/Tell_City'),
(121, 'America/Indiana/Vevay'),
(122, 'America/Indiana/Vincennes'),
(123, 'America/Indiana/Winamac'),
(124, 'America/Inuvik'),
(125, 'America/Iqaluit'),
(126, 'America/Jamaica'),
(127, 'America/Juneau'),
(128, 'America/Kentucky/Louisville'),
(129, 'America/Kentucky/Monticello'),
(130, 'America/Kralendijk'),
(131, 'America/La_Paz'),
(132, 'America/Lima'),
(133, 'America/Los_Angeles'),
(134, 'America/Lower_Princes'),
(135, 'America/Maceio'),
(136, 'America/Managua'),
(137, 'America/Manaus'),
(138, 'America/Marigot'),
(139, 'America/Martinique'),
(140, 'America/Matamoros'),
(141, 'America/Mazatlan'),
(142, 'America/Menominee'),
(143, 'America/Merida'),
(144, 'America/Metlakatla'),
(145, 'America/Mexico_City'),
(146, 'America/Miquelon'),
(147, 'America/Moncton'),
(148, 'America/Monterrey'),
(149, 'America/Montevideo'),
(150, 'America/Montserrat'),
(151, 'America/Nassau'),
(152, 'America/New_York'),
(153, 'America/Nipigon'),
(154, 'America/Nome'),
(155, 'America/Noronha'),
(156, 'America/North_Dakota/Beulah'),
(157, 'America/North_Dakota/Center'),
(158, 'America/North_Dakota/New_Salem'),
(159, 'America/Nuuk'),
(160, 'America/Ojinaga'),
(161, 'America/Panama'),
(162, 'America/Pangnirtung'),
(163, 'America/Paramaribo'),
(164, 'America/Phoenix'),
(165, 'America/Port-au-Prince'),
(166, 'America/Port_of_Spain'),
(167, 'America/Porto_Velho'),
(168, 'America/Puerto_Rico'),
(169, 'America/Punta_Arenas'),
(170, 'America/Rainy_River'),
(171, 'America/Rankin_Inlet'),
(172, 'America/Recife'),
(173, 'America/Regina'),
(174, 'America/Resolute'),
(175, 'America/Rio_Branco'),
(176, 'America/Santarem'),
(177, 'America/Santiago'),
(178, 'America/Santo_Domingo'),
(179, 'America/Sao_Paulo'),
(180, 'America/Scoresbysund'),
(181, 'America/Sitka'),
(182, 'America/St_Barthelemy'),
(183, 'America/St_Johns'),
(184, 'America/St_Kitts'),
(185, 'America/St_Lucia'),
(186, 'America/St_Thomas'),
(187, 'America/St_Vincent'),
(188, 'America/Swift_Current'),
(189, 'America/Tegucigalpa'),
(190, 'America/Thule'),
(191, 'America/Thunder_Bay'),
(192, 'America/Tijuana'),
(193, 'America/Toronto'),
(194, 'America/Tortola'),
(195, 'America/Vancouver'),
(196, 'America/Whitehorse'),
(197, 'America/Winnipeg'),
(198, 'America/Yakutat'),
(199, 'America/Yellowknife'),
(200, 'Antarctica/Casey'),
(201, 'Antarctica/Davis'),
(202, 'Antarctica/DumontDUrville'),
(203, 'Antarctica/Macquarie'),
(204, 'Antarctica/Mawson'),
(205, 'Antarctica/McMurdo'),
(206, 'Antarctica/Palmer'),
(207, 'Antarctica/Rothera'),
(208, 'Antarctica/Syowa'),
(209, 'Antarctica/Troll'),
(210, 'Antarctica/Vostok'),
(211, 'Arctic/Longyearbyen'),
(212, 'Asia/Aden'),
(213, 'Asia/Almaty'),
(214, 'Asia/Amman'),
(215, 'Asia/Anadyr'),
(216, 'Asia/Aqtau'),
(217, 'Asia/Aqtobe'),
(218, 'Asia/Ashgabat'),
(219, 'Asia/Atyrau'),
(220, 'Asia/Baghdad'),
(221, 'Asia/Bahrain'),
(222, 'Asia/Baku'),
(223, 'Asia/Bangkok'),
(224, 'Asia/Barnaul'),
(225, 'Asia/Beirut'),
(226, 'Asia/Bishkek'),
(227, 'Asia/Brunei'),
(228, 'Asia/Chita'),
(229, 'Asia/Choibalsan'),
(230, 'Asia/Colombo'),
(231, 'Asia/Damascus'),
(232, 'Asia/Dhaka'),
(233, 'Asia/Dili'),
(234, 'Asia/Dubai'),
(235, 'Asia/Dushanbe'),
(236, 'Asia/Famagusta'),
(237, 'Asia/Gaza'),
(238, 'Asia/Hebron'),
(239, 'Asia/Ho_Chi_Minh'),
(240, 'Asia/Hong_Kong'),
(241, 'Asia/Hovd'),
(242, 'Asia/Irkutsk'),
(243, 'Asia/Jakarta'),
(244, 'Asia/Jayapura'),
(245, 'Asia/Jerusalem'),
(246, 'Asia/Kabul'),
(247, 'Asia/Kamchatka'),
(248, 'Asia/Karachi'),
(249, 'Asia/Kathmandu'),
(250, 'Asia/Khandyga'),
(251, 'Asia/Kolkata'),
(252, 'Asia/Krasnoyarsk'),
(253, 'Asia/Kuala_Lumpur'),
(254, 'Asia/Kuching'),
(255, 'Asia/Kuwait'),
(256, 'Asia/Macau'),
(257, 'Asia/Magadan'),
(258, 'Asia/Makassar'),
(259, 'Asia/Manila'),
(260, 'Asia/Muscat'),
(261, 'Asia/Nicosia'),
(262, 'Asia/Novokuznetsk'),
(263, 'Asia/Novosibirsk'),
(264, 'Asia/Omsk'),
(265, 'Asia/Oral'),
(266, 'Asia/Phnom_Penh'),
(267, 'Asia/Pontianak'),
(268, 'Asia/Pyongyang'),
(269, 'Asia/Qatar'),
(270, 'Asia/Qostanay'),
(271, 'Asia/Qyzylorda'),
(272, 'Asia/Riyadh'),
(273, 'Asia/Sakhalin'),
(274, 'Asia/Samarkand'),
(275, 'Asia/Seoul'),
(276, 'Asia/Shanghai'),
(277, 'Asia/Singapore'),
(278, 'Asia/Srednekolymsk'),
(279, 'Asia/Taipei'),
(280, 'Asia/Tashkent'),
(281, 'Asia/Tbilisi'),
(282, 'Asia/Tehran'),
(283, 'Asia/Thimphu'),
(284, 'Asia/Tokyo'),
(285, 'Asia/Tomsk'),
(286, 'Asia/Ulaanbaatar'),
(287, 'Asia/Urumqi'),
(288, 'Asia/Ust-Nera'),
(289, 'Asia/Vientiane'),
(290, 'Asia/Vladivostok'),
(291, 'Asia/Yakutsk'),
(292, 'Asia/Yangon'),
(293, 'Asia/Yekaterinburg'),
(294, 'Asia/Yerevan'),
(295, 'Atlantic/Azores'),
(296, 'Atlantic/Bermuda'),
(297, 'Atlantic/Canary'),
(298, 'Atlantic/Cape_Verde'),
(299, 'Atlantic/Faroe'),
(300, 'Atlantic/Madeira'),
(301, 'Atlantic/Reykjavik'),
(302, 'Atlantic/South_Georgia'),
(303, 'Atlantic/St_Helena'),
(304, 'Atlantic/Stanley'),
(305, 'Australia/Adelaide'),
(306, 'Australia/Brisbane'),
(307, 'Australia/Broken_Hill'),
(308, 'Australia/Darwin'),
(309, 'Australia/Eucla'),
(310, 'Australia/Hobart'),
(311, 'Australia/Lindeman'),
(312, 'Australia/Lord_Howe'),
(313, 'Australia/Melbourne'),
(314, 'Australia/Perth'),
(315, 'Australia/Sydney'),
(316, 'Europe/Amsterdam'),
(317, 'Europe/Andorra'),
(318, 'Europe/Astrakhan'),
(319, 'Europe/Athens'),
(320, 'Europe/Belgrade'),
(321, 'Europe/Berlin'),
(322, 'Europe/Bratislava'),
(323, 'Europe/Brussels'),
(324, 'Europe/Bucharest'),
(325, 'Europe/Budapest'),
(326, 'Europe/Busingen'),
(327, 'Europe/Chisinau'),
(328, 'Europe/Copenhagen'),
(329, 'Europe/Dublin'),
(330, 'Europe/Gibraltar'),
(331, 'Europe/Guernsey'),
(332, 'Europe/Helsinki'),
(333, 'Europe/Isle_of_Man'),
(334, 'Europe/Istanbul'),
(335, 'Europe/Jersey'),
(336, 'Europe/Kaliningrad'),
(337, 'Europe/Kiev'),
(338, 'Europe/Kirov'),
(339, 'Europe/Lisbon'),
(340, 'Europe/Ljubljana'),
(341, 'Europe/London'),
(342, 'Europe/Luxembourg'),
(343, 'Europe/Madrid'),
(344, 'Europe/Malta'),
(345, 'Europe/Mariehamn'),
(346, 'Europe/Minsk'),
(347, 'Europe/Monaco'),
(348, 'Europe/Moscow'),
(349, 'Europe/Oslo'),
(350, 'Europe/Paris'),
(351, 'Europe/Podgorica'),
(352, 'Europe/Prague'),
(353, 'Europe/Riga'),
(354, 'Europe/Rome'),
(355, 'Europe/Samara'),
(356, 'Europe/San_Marino'),
(357, 'Europe/Sarajevo'),
(358, 'Europe/Saratov'),
(359, 'Europe/Simferopol'),
(360, 'Europe/Skopje'),
(361, 'Europe/Sofia'),
(362, 'Europe/Stockholm'),
(363, 'Europe/Tallinn'),
(364, 'Europe/Tirane'),
(365, 'Europe/Ulyanovsk'),
(366, 'Europe/Uzhgorod'),
(367, 'Europe/Vaduz'),
(368, 'Europe/Vatican'),
(369, 'Europe/Vienna'),
(370, 'Europe/Vilnius'),
(371, 'Europe/Volgograd'),
(372, 'Europe/Warsaw'),
(373, 'Europe/Zagreb'),
(374, 'Europe/Zaporozhye'),
(375, 'Europe/Zurich'),
(376, 'Indian/Antananarivo'),
(377, 'Indian/Chagos'),
(378, 'Indian/Christmas'),
(379, 'Indian/Cocos'),
(380, 'Indian/Comoro'),
(381, 'Indian/Kerguelen'),
(382, 'Indian/Mahe'),
(383, 'Indian/Maldives'),
(384, 'Indian/Mauritius'),
(385, 'Indian/Mayotte'),
(386, 'Indian/Reunion'),
(387, 'Pacific/Apia'),
(388, 'Pacific/Auckland'),
(389, 'Pacific/Bougainville'),
(390, 'Pacific/Chatham'),
(391, 'Pacific/Chuuk'),
(392, 'Pacific/Easter'),
(393, 'Pacific/Efate'),
(394, 'Pacific/Fakaofo'),
(395, 'Pacific/Fiji'),
(396, 'Pacific/Funafuti'),
(397, 'Pacific/Galapagos'),
(398, 'Pacific/Gambier'),
(399, 'Pacific/Guadalcanal'),
(400, 'Pacific/Guam'),
(401, 'Pacific/Honolulu'),
(402, 'Pacific/Kanton'),
(403, 'Pacific/Kiritimati'),
(404, 'Pacific/Kosrae'),
(405, 'Pacific/Kwajalein'),
(406, 'Pacific/Majuro'),
(407, 'Pacific/Marquesas'),
(408, 'Pacific/Midway'),
(409, 'Pacific/Nauru'),
(410, 'Pacific/Niue'),
(411, 'Pacific/Norfolk'),
(412, 'Pacific/Noumea'),
(413, 'Pacific/Pago_Pago'),
(414, 'Pacific/Palau'),
(415, 'Pacific/Pitcairn'),
(416, 'Pacific/Pohnpei'),
(417, 'Pacific/Port_Moresby'),
(418, 'Pacific/Rarotonga'),
(419, 'Pacific/Saipan'),
(420, 'Pacific/Tahiti'),
(421, 'Pacific/Tarawa'),
(422, 'Pacific/Tongatapu'),
(423, 'Pacific/Wake'),
(424, 'Pacific/Wallis'),
(425, 'UTC'),
(426, 'Africa/Abidjan'),
(427, 'Africa/Accra'),
(428, 'Africa/Addis_Ababa'),
(429, 'Africa/Algiers'),
(430, 'Africa/Asmara'),
(431, 'Africa/Bamako'),
(432, 'Africa/Bangui'),
(433, 'Africa/Banjul'),
(434, 'Africa/Bissau'),
(435, 'Africa/Blantyre'),
(436, 'Africa/Brazzaville'),
(437, 'Africa/Bujumbura'),
(438, 'Africa/Cairo'),
(439, 'Africa/Casablanca'),
(440, 'Africa/Ceuta'),
(441, 'Africa/Conakry'),
(442, 'Africa/Dakar'),
(443, 'Africa/Dar_es_Salaam'),
(444, 'Africa/Djibouti'),
(445, 'Africa/Douala'),
(446, 'Africa/El_Aaiun'),
(447, 'Africa/Freetown'),
(448, 'Africa/Gaborone'),
(449, 'Africa/Harare'),
(450, 'Africa/Johannesburg'),
(451, 'Africa/Juba'),
(452, 'Africa/Kampala'),
(453, 'Africa/Khartoum'),
(454, 'Africa/Kigali'),
(455, 'Africa/Kinshasa'),
(456, 'Africa/Lagos'),
(457, 'Africa/Libreville'),
(458, 'Africa/Lome'),
(459, 'Africa/Luanda'),
(460, 'Africa/Lubumbashi'),
(461, 'Africa/Lusaka'),
(462, 'Africa/Malabo'),
(463, 'Africa/Maputo'),
(464, 'Africa/Maseru'),
(465, 'Africa/Mbabane'),
(466, 'Africa/Mogadishu'),
(467, 'Africa/Monrovia'),
(468, 'Africa/Nairobi'),
(469, 'Africa/Ndjamena'),
(470, 'Africa/Niamey'),
(471, 'Africa/Nouakchott'),
(472, 'Africa/Ouagadougou'),
(473, 'Africa/Porto-Novo'),
(474, 'Africa/Sao_Tome'),
(475, 'Africa/Tripoli'),
(476, 'Africa/Tunis'),
(477, 'Africa/Windhoek'),
(478, 'America/Adak'),
(479, 'America/Anchorage'),
(480, 'America/Anguilla'),
(481, 'America/Antigua'),
(482, 'America/Araguaina'),
(483, 'America/Argentina/Buenos_Aires'),
(484, 'America/Argentina/Catamarca'),
(485, 'America/Argentina/Cordoba'),
(486, 'America/Argentina/Jujuy'),
(487, 'America/Argentina/La_Rioja'),
(488, 'America/Argentina/Mendoza'),
(489, 'America/Argentina/Rio_Gallegos'),
(490, 'America/Argentina/Salta'),
(491, 'America/Argentina/San_Juan'),
(492, 'America/Argentina/San_Luis'),
(493, 'America/Argentina/Tucuman'),
(494, 'America/Argentina/Ushuaia'),
(495, 'America/Aruba'),
(496, 'America/Asuncion'),
(497, 'America/Atikokan'),
(498, 'America/Bahia'),
(499, 'America/Bahia_Banderas'),
(500, 'America/Barbados'),
(501, 'America/Belem'),
(502, 'America/Belize'),
(503, 'America/Blanc-Sablon'),
(504, 'America/Boa_Vista'),
(505, 'America/Bogota'),
(506, 'America/Boise'),
(507, 'America/Cambridge_Bay'),
(508, 'America/Campo_Grande'),
(509, 'America/Cancun'),
(510, 'America/Caracas'),
(511, 'America/Cayenne'),
(512, 'America/Cayman'),
(513, 'America/Chicago'),
(514, 'America/Chihuahua'),
(515, 'America/Costa_Rica'),
(516, 'America/Creston'),
(517, 'America/Cuiaba'),
(518, 'America/Curacao'),
(519, 'America/Danmarkshavn'),
(520, 'America/Dawson'),
(521, 'America/Dawson_Creek'),
(522, 'America/Denver'),
(523, 'America/Detroit'),
(524, 'America/Dominica'),
(525, 'America/Edmonton'),
(526, 'America/Eirunepe'),
(527, 'America/El_Salvador'),
(528, 'America/Fort_Nelson'),
(529, 'America/Fortaleza'),
(530, 'America/Glace_Bay'),
(531, 'America/Goose_Bay'),
(532, 'America/Grand_Turk'),
(533, 'America/Grenada'),
(534, 'America/Guadeloupe'),
(535, 'America/Guatemala'),
(536, 'America/Guayaquil'),
(537, 'America/Guyana'),
(538, 'America/Halifax'),
(539, 'America/Havana'),
(540, 'America/Hermosillo'),
(541, 'America/Indiana/Indianapolis'),
(542, 'America/Indiana/Knox'),
(543, 'America/Indiana/Marengo'),
(544, 'America/Indiana/Petersburg'),
(545, 'America/Indiana/Tell_City'),
(546, 'America/Indiana/Vevay'),
(547, 'America/Indiana/Vincennes'),
(548, 'America/Indiana/Winamac'),
(549, 'America/Inuvik'),
(550, 'America/Iqaluit'),
(551, 'America/Jamaica'),
(552, 'America/Juneau'),
(553, 'America/Kentucky/Louisville'),
(554, 'America/Kentucky/Monticello'),
(555, 'America/Kralendijk'),
(556, 'America/La_Paz'),
(557, 'America/Lima'),
(558, 'America/Los_Angeles'),
(559, 'America/Lower_Princes'),
(560, 'America/Maceio'),
(561, 'America/Managua'),
(562, 'America/Manaus'),
(563, 'America/Marigot'),
(564, 'America/Martinique'),
(565, 'America/Matamoros'),
(566, 'America/Mazatlan'),
(567, 'America/Menominee'),
(568, 'America/Merida'),
(569, 'America/Metlakatla'),
(570, 'America/Mexico_City'),
(571, 'America/Miquelon'),
(572, 'America/Moncton'),
(573, 'America/Monterrey'),
(574, 'America/Montevideo'),
(575, 'America/Montserrat'),
(576, 'America/Nassau'),
(577, 'America/New_York'),
(578, 'America/Nipigon'),
(579, 'America/Nome'),
(580, 'America/Noronha'),
(581, 'America/North_Dakota/Beulah'),
(582, 'America/North_Dakota/Center'),
(583, 'America/North_Dakota/New_Salem'),
(584, 'America/Nuuk'),
(585, 'America/Ojinaga'),
(586, 'America/Panama'),
(587, 'America/Pangnirtung'),
(588, 'America/Paramaribo'),
(589, 'America/Phoenix'),
(590, 'America/Port-au-Prince'),
(591, 'America/Port_of_Spain'),
(592, 'America/Porto_Velho'),
(593, 'America/Puerto_Rico'),
(594, 'America/Punta_Arenas'),
(595, 'America/Rainy_River'),
(596, 'America/Rankin_Inlet'),
(597, 'America/Recife'),
(598, 'America/Regina'),
(599, 'America/Resolute'),
(600, 'America/Rio_Branco'),
(601, 'America/Santarem'),
(602, 'America/Santiago'),
(603, 'America/Santo_Domingo'),
(604, 'America/Sao_Paulo'),
(605, 'America/Scoresbysund'),
(606, 'America/Sitka'),
(607, 'America/St_Barthelemy'),
(608, 'America/St_Johns'),
(609, 'America/St_Kitts'),
(610, 'America/St_Lucia'),
(611, 'America/St_Thomas'),
(612, 'America/St_Vincent'),
(613, 'America/Swift_Current'),
(614, 'America/Tegucigalpa'),
(615, 'America/Thule'),
(616, 'America/Thunder_Bay'),
(617, 'America/Tijuana'),
(618, 'America/Toronto'),
(619, 'America/Tortola'),
(620, 'America/Vancouver'),
(621, 'America/Whitehorse'),
(622, 'America/Winnipeg'),
(623, 'America/Yakutat'),
(624, 'America/Yellowknife'),
(625, 'Antarctica/Casey'),
(626, 'Antarctica/Davis'),
(627, 'Antarctica/DumontDUrville'),
(628, 'Antarctica/Macquarie'),
(629, 'Antarctica/Mawson'),
(630, 'Antarctica/McMurdo'),
(631, 'Antarctica/Palmer'),
(632, 'Antarctica/Rothera'),
(633, 'Antarctica/Syowa'),
(634, 'Antarctica/Troll'),
(635, 'Antarctica/Vostok'),
(636, 'Arctic/Longyearbyen'),
(637, 'Asia/Aden'),
(638, 'Asia/Almaty'),
(639, 'Asia/Amman'),
(640, 'Asia/Anadyr'),
(641, 'Asia/Aqtau'),
(642, 'Asia/Aqtobe'),
(643, 'Asia/Ashgabat'),
(644, 'Asia/Atyrau'),
(645, 'Asia/Baghdad'),
(646, 'Asia/Bahrain'),
(647, 'Asia/Baku'),
(648, 'Asia/Bangkok'),
(649, 'Asia/Barnaul'),
(650, 'Asia/Beirut'),
(651, 'Asia/Bishkek'),
(652, 'Asia/Brunei'),
(653, 'Asia/Chita'),
(654, 'Asia/Choibalsan'),
(655, 'Asia/Colombo'),
(656, 'Asia/Damascus'),
(657, 'Asia/Dhaka'),
(658, 'Asia/Dili'),
(659, 'Asia/Dubai'),
(660, 'Asia/Dushanbe'),
(661, 'Asia/Famagusta'),
(662, 'Asia/Gaza'),
(663, 'Asia/Hebron'),
(664, 'Asia/Ho_Chi_Minh'),
(665, 'Asia/Hong_Kong'),
(666, 'Asia/Hovd'),
(667, 'Asia/Irkutsk'),
(668, 'Asia/Jakarta'),
(669, 'Asia/Jayapura'),
(670, 'Asia/Jerusalem'),
(671, 'Asia/Kabul'),
(672, 'Asia/Kamchatka'),
(673, 'Asia/Karachi'),
(674, 'Asia/Kathmandu'),
(675, 'Asia/Khandyga'),
(676, 'Asia/Kolkata'),
(677, 'Asia/Krasnoyarsk'),
(678, 'Asia/Kuala_Lumpur'),
(679, 'Asia/Kuching'),
(680, 'Asia/Kuwait'),
(681, 'Asia/Macau'),
(682, 'Asia/Magadan'),
(683, 'Asia/Makassar'),
(684, 'Asia/Manila'),
(685, 'Asia/Muscat'),
(686, 'Asia/Nicosia'),
(687, 'Asia/Novokuznetsk'),
(688, 'Asia/Novosibirsk'),
(689, 'Asia/Omsk'),
(690, 'Asia/Oral'),
(691, 'Asia/Phnom_Penh'),
(692, 'Asia/Pontianak'),
(693, 'Asia/Pyongyang'),
(694, 'Asia/Qatar'),
(695, 'Asia/Qostanay'),
(696, 'Asia/Qyzylorda'),
(697, 'Asia/Riyadh'),
(698, 'Asia/Sakhalin'),
(699, 'Asia/Samarkand'),
(700, 'Asia/Seoul'),
(701, 'Asia/Shanghai'),
(702, 'Asia/Singapore'),
(703, 'Asia/Srednekolymsk'),
(704, 'Asia/Taipei'),
(705, 'Asia/Tashkent'),
(706, 'Asia/Tbilisi'),
(707, 'Asia/Tehran'),
(708, 'Asia/Thimphu'),
(709, 'Asia/Tokyo'),
(710, 'Asia/Tomsk'),
(711, 'Asia/Ulaanbaatar'),
(712, 'Asia/Urumqi'),
(713, 'Asia/Ust-Nera'),
(714, 'Asia/Vientiane'),
(715, 'Asia/Vladivostok'),
(716, 'Asia/Yakutsk'),
(717, 'Asia/Yangon'),
(718, 'Asia/Yekaterinburg'),
(719, 'Asia/Yerevan'),
(720, 'Atlantic/Azores'),
(721, 'Atlantic/Bermuda'),
(722, 'Atlantic/Canary'),
(723, 'Atlantic/Cape_Verde'),
(724, 'Atlantic/Faroe'),
(725, 'Atlantic/Madeira'),
(726, 'Atlantic/Reykjavik'),
(727, 'Atlantic/South_Georgia'),
(728, 'Atlantic/St_Helena'),
(729, 'Atlantic/Stanley'),
(730, 'Australia/Adelaide'),
(731, 'Australia/Brisbane'),
(732, 'Australia/Broken_Hill'),
(733, 'Australia/Darwin'),
(734, 'Australia/Eucla'),
(735, 'Australia/Hobart'),
(736, 'Australia/Lindeman'),
(737, 'Australia/Lord_Howe'),
(738, 'Australia/Melbourne'),
(739, 'Australia/Perth'),
(740, 'Australia/Sydney'),
(741, 'Europe/Amsterdam'),
(742, 'Europe/Andorra'),
(743, 'Europe/Astrakhan'),
(744, 'Europe/Athens'),
(745, 'Europe/Belgrade'),
(746, 'Europe/Berlin'),
(747, 'Europe/Bratislava'),
(748, 'Europe/Brussels'),
(749, 'Europe/Bucharest'),
(750, 'Europe/Budapest'),
(751, 'Europe/Busingen'),
(752, 'Europe/Chisinau'),
(753, 'Europe/Copenhagen'),
(754, 'Europe/Dublin'),
(755, 'Europe/Gibraltar'),
(756, 'Europe/Guernsey'),
(757, 'Europe/Helsinki'),
(758, 'Europe/Isle_of_Man'),
(759, 'Europe/Istanbul'),
(760, 'Europe/Jersey'),
(761, 'Europe/Kaliningrad'),
(762, 'Europe/Kiev'),
(763, 'Europe/Kirov'),
(764, 'Europe/Lisbon'),
(765, 'Europe/Ljubljana'),
(766, 'Europe/London'),
(767, 'Europe/Luxembourg'),
(768, 'Europe/Madrid'),
(769, 'Europe/Malta'),
(770, 'Europe/Mariehamn'),
(771, 'Europe/Minsk'),
(772, 'Europe/Monaco'),
(773, 'Europe/Moscow'),
(774, 'Europe/Oslo'),
(775, 'Europe/Paris'),
(776, 'Europe/Podgorica'),
(777, 'Europe/Prague'),
(778, 'Europe/Riga'),
(779, 'Europe/Rome'),
(780, 'Europe/Samara'),
(781, 'Europe/San_Marino'),
(782, 'Europe/Sarajevo'),
(783, 'Europe/Saratov'),
(784, 'Europe/Simferopol'),
(785, 'Europe/Skopje'),
(786, 'Europe/Sofia'),
(787, 'Europe/Stockholm'),
(788, 'Europe/Tallinn'),
(789, 'Europe/Tirane'),
(790, 'Europe/Ulyanovsk'),
(791, 'Europe/Uzhgorod'),
(792, 'Europe/Vaduz'),
(793, 'Europe/Vatican'),
(794, 'Europe/Vienna'),
(795, 'Europe/Vilnius'),
(796, 'Europe/Volgograd'),
(797, 'Europe/Warsaw'),
(798, 'Europe/Zagreb'),
(799, 'Europe/Zaporozhye'),
(800, 'Europe/Zurich'),
(801, 'Indian/Antananarivo'),
(802, 'Indian/Chagos'),
(803, 'Indian/Christmas'),
(804, 'Indian/Cocos'),
(805, 'Indian/Comoro'),
(806, 'Indian/Kerguelen'),
(807, 'Indian/Mahe'),
(808, 'Indian/Maldives'),
(809, 'Indian/Mauritius'),
(810, 'Indian/Mayotte'),
(811, 'Indian/Reunion'),
(812, 'Pacific/Apia'),
(813, 'Pacific/Auckland'),
(814, 'Pacific/Bougainville'),
(815, 'Pacific/Chatham'),
(816, 'Pacific/Chuuk'),
(817, 'Pacific/Easter'),
(818, 'Pacific/Efate'),
(819, 'Pacific/Fakaofo'),
(820, 'Pacific/Fiji'),
(821, 'Pacific/Funafuti'),
(822, 'Pacific/Galapagos'),
(823, 'Pacific/Gambier'),
(824, 'Pacific/Guadalcanal'),
(825, 'Pacific/Guam'),
(826, 'Pacific/Honolulu'),
(827, 'Pacific/Kanton'),
(828, 'Pacific/Kiritimati'),
(829, 'Pacific/Kosrae'),
(830, 'Pacific/Kwajalein'),
(831, 'Pacific/Majuro'),
(832, 'Pacific/Marquesas'),
(833, 'Pacific/Midway'),
(834, 'Pacific/Nauru'),
(835, 'Pacific/Niue'),
(836, 'Pacific/Norfolk'),
(837, 'Pacific/Noumea'),
(838, 'Pacific/Pago_Pago'),
(839, 'Pacific/Palau'),
(840, 'Pacific/Pitcairn'),
(841, 'Pacific/Pohnpei'),
(842, 'Pacific/Port_Moresby'),
(843, 'Pacific/Rarotonga'),
(844, 'Pacific/Saipan'),
(845, 'Pacific/Tahiti'),
(846, 'Pacific/Tarawa'),
(847, 'Pacific/Tongatapu'),
(848, 'Pacific/Wake'),
(849, 'Pacific/Wallis'),
(850, 'UTC');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_provider` enum('flutterwave','mollie','midtrans','paypal','paystack','razorpay','sslcommerz','stripe','instamojo','offline') COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usd_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'backend/image/default-user.png',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_seen` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'email',
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `phone`, `email_verified_at`, `password`, `web`, `image`, `token`, `last_seen`, `remember_token`, `created_at`, `updated_at`, `auth_type`, `provider`, `provider_id`, `fcm_token`) VALUES
(1, 'Rabin', 'rabin', 'rabin@gamil.com', NULL, NULL, '$2y$10$244eiPuv2Gd60YiHihMZ3O3Z2G5/2enfmatxR8GMkM37NQglSdNui', NULL, 'uploads/customer\\6k09ewQyaxWuZ7ucZ4qoVB9j2MbwZyOvJkInruHd.jpg', NULL, '2022-10-25 12:27:26', NULL, '2022-10-24 22:26:00', '2022-10-25 06:27:26', 'email', NULL, NULL, NULL),
(2, 'rabin', 'rabin_1666700362', 'rabin@gmail.com', NULL, NULL, '$2y$10$4X7B4HSEA9JRdf/99n6dFuvPUbzliQHOddNCKWUV62Cmc1GHEstV6', NULL, 'uploads/customer\\BlKK8lcCL02hOQ8XKYhJmUGgZUR6VCvp0bfCqFnv.jpg', NULL, '2022-10-26 16:11:32', NULL, '2022-10-25 02:50:52', '2022-10-26 16:11:32', 'email', NULL, NULL, NULL),
(3, 'Rony', 'ronymia', 'ronymia.tech@gmail.com', NULL, NULL, '$2y$10$fo5KFcD9Zbh7amRYcIjmneElP8eg1KSH/kBEFJPRscD/wYIo7Rf26', NULL, 'backend/image/default-user.png', NULL, '2022-10-31 02:17:24', NULL, '2022-10-28 14:45:19', '2022-10-31 02:17:24', 'email', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_device_tokens`
--

CREATE TABLE `user_device_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `device_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_plans`
--

CREATE TABLE `user_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ad_limit` bigint(20) UNSIGNED NOT NULL DEFAULT 3,
  `featured_limit` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `badge` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subscription_type` enum('one_time','recurring') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'one_time',
  `expired_date` date DEFAULT NULL,
  `current_plan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_restored_plan_benefits` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_plans`
--

INSERT INTO `user_plans` (`id`, `user_id`, `ad_limit`, `featured_limit`, `badge`, `created_at`, `updated_at`, `subscription_type`, `expired_date`, `current_plan_id`, `is_restored_plan_benefits`) VALUES
(1, 1, 0, 0, 0, '2022-10-24 22:26:00', '2022-10-26 15:18:16', 'recurring', NULL, NULL, 0),
(2, 2, 3, 1, 0, '2022-10-25 02:50:52', '2022-10-25 02:50:52', 'recurring', NULL, NULL, 0),
(3, 3, 2, 0, 0, '2022-10-28 14:45:19', '2022-10-28 14:58:53', 'recurring', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ad_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_searches`
--
ALTER TABLE `admin_searches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ads_user_id_foreign` (`user_id`),
  ADD KEY `ads_category_id_foreign` (`category_id`),
  ADD KEY `ads_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `ad_features`
--
ALTER TABLE `ad_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ad_features_ad_id_foreign` (`ad_id`);

--
-- Indexes for table `ad_galleries`
--
ALTER TABLE `ad_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_custom_field`
--
ALTER TABLE `category_custom_field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_custom_field_category_id_foreign` (`category_id`),
  ADD KEY `category_custom_field_custom_field_id_foreign` (`custom_field_id`);

--
-- Indexes for table `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cookies`
--
ALTER TABLE `cookies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_fields_custom_field_group_id_foreign` (`custom_field_group_id`);

--
-- Indexes for table `custom_field_groups`
--
ALTER TABLE `custom_field_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_values_custom_field_id_foreign` (`custom_field_id`);

--
-- Indexes for table `database_backups`
--
ALTER TABLE `database_backups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emails_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_faq_category_id_foreign` (`faq_category_id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faq_categories_name_unique` (`name`),
  ADD UNIQUE KEY `faq_categories_slug_unique` (`slug`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_name_unique` (`name`),
  ADD UNIQUE KEY `languages_code_unique` (`code`),
  ADD UNIQUE KEY `languages_icon_unique` (`icon`);

--
-- Indexes for table `messengers`
--
ALTER TABLE `messengers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_app_configs`
--
ALTER TABLE `mobile_app_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_app_sliders`
--
ALTER TABLE `mobile_app_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `module_settings`
--
ALTER TABLE `module_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_label_unique` (`label`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_category_id_foreign` (`category_id`),
  ADD KEY `posts_author_id_foreign` (`author_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_custom_fields`
--
ALTER TABLE `product_custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_custom_fields_ad_id_foreign` (`ad_id`),
  ADD KEY `product_custom_fields_custom_field_id_foreign` (`custom_field_id`),
  ADD KEY `product_custom_fields_custom_field_group_id_foreign` (`custom_field_group_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_report_from_id_foreign` (`report_from_id`),
  ADD KEY `reports_report_to_id_foreign` (`report_to_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `seos`
--
ALTER TABLE `seos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setup_guides`
--
ALTER TABLE `setup_guides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_media_user_id_foreign` (`user_id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_plan_id_foreign` (`plan_id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_web_unique` (`web`);

--
-- Indexes for table `user_device_tokens`
--
ALTER TABLE `user_device_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_device_tokens_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_plans`
--
ALTER TABLE `user_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_plans_user_id_foreign` (`user_id`),
  ADD KEY `user_plans_current_plan_id_foreign` (`current_plan_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_ad_id_foreign` (`ad_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_searches`
--
ALTER TABLE `admin_searches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `ad_features`
--
ALTER TABLE `ad_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ad_galleries`
--
ALTER TABLE `ad_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `category_custom_field`
--
ALTER TABLE `category_custom_field`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms`
--
ALTER TABLE `cms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cookies`
--
ALTER TABLE `cookies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field_groups`
--
ALTER TABLE `custom_field_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `database_backups`
--
ALTER TABLE `database_backups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messengers`
--
ALTER TABLE `messengers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `mobile_app_configs`
--
ALTER TABLE `mobile_app_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mobile_app_sliders`
--
ALTER TABLE `mobile_app_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module_settings`
--
ALTER TABLE `module_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_custom_fields`
--
ALTER TABLE `product_custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seos`
--
ALTER TABLE `seos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `setup_guides`
--
ALTER TABLE `setup_guides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=851;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_device_tokens`
--
ALTER TABLE `user_device_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_plans`
--
ALTER TABLE `user_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ads`
--
ALTER TABLE `ads`
  ADD CONSTRAINT `ads_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ads_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ad_features`
--
ALTER TABLE `ad_features`
  ADD CONSTRAINT `ad_features_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `blog_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_custom_field`
--
ALTER TABLE `category_custom_field`
  ADD CONSTRAINT `category_custom_field_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_custom_field_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD CONSTRAINT `custom_fields_custom_field_group_id_foreign` FOREIGN KEY (`custom_field_group_id`) REFERENCES `custom_field_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD CONSTRAINT `custom_field_values_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `post_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_custom_fields`
--
ALTER TABLE `product_custom_fields`
  ADD CONSTRAINT `product_custom_fields_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_custom_fields_custom_field_group_id_foreign` FOREIGN KEY (`custom_field_group_id`) REFERENCES `custom_field_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_custom_fields_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_report_from_id_foreign` FOREIGN KEY (`report_from_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reports_report_to_id_foreign` FOREIGN KEY (`report_to_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_media`
--
ALTER TABLE `social_media`
  ADD CONSTRAINT `social_media_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_device_tokens`
--
ALTER TABLE `user_device_tokens`
  ADD CONSTRAINT `user_device_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_plans`
--
ALTER TABLE `user_plans`
  ADD CONSTRAINT `user_plans_current_plan_id_foreign` FOREIGN KEY (`current_plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_plans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_ad_id_foreign` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
