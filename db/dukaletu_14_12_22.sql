-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2022 at 03:31 PM
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
(1, 'Admin', 'admin@gmail.com', '2022-08-19 23:31:12', '$2y$10$lvuKcw/YJBHfsyzvPgjPa.hgijcwFMLnobD4FELsjyO/.nqrkcq9e', 'uploads/user/1668418873_63720d395efe3.jpg', 'e6LSfw35mpvbAfCNJ8vnUPbmKlSdZhWchOySHXqthwYUXmfJFcWQbUWZCKib', '2022-08-19 23:31:12', '2022-11-14 14:41:13');

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
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
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
(40, 'Ember Demi Trail Men\'s Hiking Shoes', 'ember-demi-trail-mens-hiking-shoes', 1, 5, 8, NULL, 100.00, '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '01794798227', 0, NULL, 'uploads/addss_image/1670928436_63985834dcd7c.jpg', 'pending', 0, 0, 1, 0, NULL, '2022-12-13 15:45:21', '2022-12-13 15:47:32', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', NULL, NULL, NULL, 'Gazipur', NULL, NULL, 'Bangladesh', NULL, NULL, ''),
(41, 'Ember Demi Trail Men\'s Hiking Shoes', 'ember-demi-trail-mens-hiking-shoes-41', 1, 5, NULL, NULL, 100.00, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu egestas tellus. Maecenas consectetur libero non velit laoreet posuere. Nulla sit amet volutpat augue. Quisque malesuada vulputate ligula, non vehicula eros porttitor ut. Etiam mattis, leo vel ornare tincidunt, mi mauris aliquam magna, sit amet consectetur nibh tortor sed leo. In vel sollicitudin urna. Duis in lectus vel ipsum laoreet cursus ut sit amet orci. Aenean tincidunt elementum nunc, nec efficitur risus consectetur consequat.</p>', '1794798227', 0, NULL, 'uploads/addss_image/1670928600_639858d843531.jpg', 'pending', 0, 0, 1, 0, NULL, '2022-12-13 15:50:00', '2022-12-13 15:50:09', 'Lorem ipsum dolo', NULL, NULL, NULL, 'ada', NULL, NULL, 'Bangladesh', NULL, NULL, ''),
(42, 'Ember Demi Trail Men\'s Hiking Shoes', 'ember-demi-trail-mens-hiking-shoes-42', 1, 5, 8, NULL, 300.00, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu egestas tellus. Maecenas consectetur libero non velit laoreet posuere. Nulla sit amet volutpat augue. Quisque malesuada vulputate ligula, non vehicula eros porttitor ut. Etiam mattis, leo vel ornare tincidunt, mi mauris aliquam magna, sit amet consectetur nibh tortor sed leo. In vel sollicitudin urna. Duis in lectus vel ipsum laoreet cursus ut sit amet orci. Aenean tincidunt elementum nunc, nec efficitur risus consectetur consequat.</p>', '01794798227', 1, NULL, 'uploads/addss_images/1671008084_63998f54af377.jpg', 'active', 0, 0, 0, 0, NULL, '2022-12-14 13:54:44', '2022-12-14 14:00:30', 'mawna,sreepur', NULL, NULL, NULL, 'Gazipur', NULL, NULL, 'Bangladesh', 0, 0, '');

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
(12, 5, 'uploads/addss_multiple/1666695475_6357c133c5f1e.jpg', '2022-10-25 04:57:55', '2022-10-25 04:57:55'),
(13, 34, 'uploads/adds_multiple/1667900539_636a247be0dd7.jpg', '2022-11-08 14:42:19', '2022-11-08 14:42:19'),
(14, 34, 'uploads/adds_multiple/1667900539_636a247be50d2.jpg', '2022-11-08 14:42:19', '2022-11-08 14:42:19'),
(15, 34, 'uploads/adds_multiple/1667900539_636a247be6014.jpg', '2022-11-08 14:42:19', '2022-11-08 14:42:19'),
(16, 35, 'uploads/adds_multiple/1667900667_636a24fb41f7f.jpg', '2022-11-08 14:44:27', '2022-11-08 14:44:27'),
(17, 35, 'uploads/adds_multiple/1667900667_636a24fb43044.jpg', '2022-11-08 14:44:27', '2022-11-08 14:44:27'),
(18, 35, 'uploads/adds_multiple/1667900667_636a24fb43f01.jpg', '2022-11-08 14:44:27', '2022-11-08 14:44:27'),
(19, 36, 'uploads/adds_multiple/1667905543_636a380733b7b.jpg', '2022-11-08 16:05:43', '2022-11-08 16:05:43'),
(20, 37, 'uploads/adds_multiple/1667905596_636a383c54cd5.jpg', '2022-11-08 16:06:36', '2022-11-08 16:06:36'),
(21, 38, 'uploads/adds_multiple/1667905653_636a3875b8d6f.jpg', '2022-11-08 16:07:33', '2022-11-08 16:07:33'),
(22, 39, 'uploads/adds_multiple/1668333832_6370c108760e4.jpg', '2022-11-13 15:03:52', '2022-11-13 15:03:52'),
(23, 40, 'uploads/adds_multiple/1670928436_63985834de272.jpg', '2022-12-13 15:47:16', '2022-12-13 15:47:16'),
(24, 40, 'uploads/adds_multiple/1670928436_63985834e4fbb.jpg', '2022-12-13 15:47:16', '2022-12-13 15:47:16'),
(25, 41, 'uploads/adds_multiple/1670928600_639858d844d64.jpg', '2022-12-13 15:50:00', '2022-12-13 15:50:00'),
(26, 41, 'uploads/adds_multiple/1670928600_639858d845d45.jpg', '2022-12-13 15:50:00', '2022-12-13 15:50:00');

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
-- Table structure for table `mobile_validations`
--

CREATE TABLE `mobile_validations` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `otp_code` varchar(6) NOT NULL,
  `expired_in` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `attempt` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mobile_validations`
--

INSERT INTO `mobile_validations` (`id`, `phone_number`, `otp_code`, `expired_in`, `attempt`, `created_at`, `updated_at`) VALUES
(1, '01794798227', '548697', '2022-11-17 15:13:06', 4, '2022-11-17 15:11:11', '2022-11-17 15:12:36'),
(2, '+254718438984', '178795', '2022-11-23 13:07:12', 1, '2022-11-23 13:06:42', '2022-11-23 13:06:42'),
(3, '0191899327', '284334', '2022-12-14 17:59:54', 1, '2022-12-14 17:59:24', '2022-12-14 17:59:24');

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
('00d733ef-4cd2-452e-ba5c-8144bbf85deb', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 9, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-11-13 14:06:55', '2022-11-13 14:06:55'),
('011592ea-73df-4ae4-b3f2-187e6afa2a56', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 9, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-11-13 14:34:01', '2022-11-13 14:34:01'),
('01ba9775-a228-4feb-8cc6-e49a77c76c66', 'App\\Notifications\\AdPendingNotification', 'App\\Models\\User', 9, '{\"msg\":\"Ad pending\",\"type\":\"adpending\"}', NULL, '2022-11-08 16:07:46', '2022-11-08 16:07:46'),
('03076739-6df4-4e66-8e26-7941c4cd4068', 'App\\Notifications\\LogoutNotification', 'App\\Models\\User', 9, '{\"msg\":\"You\'re loggedout successfully\",\"type\":\"loggedout\"}', NULL, '2022-11-08 19:00:17', '2022-11-08 19:00:17'),
('0a8621c4-42f7-4e0c-baac-675fbb3858e7', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-12-06 17:09:35', '2022-12-06 17:09:35'),
('0d15799a-3306-49ce-a2a4-1e3a0a774d37', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 3, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/ad\\/details\\/samsung-galaxy-a23-64-gb\"}', NULL, '2022-10-28 14:59:07', '2022-10-28 14:59:07'),
('0eef6e92-a6cb-4950-8fa2-03f307760a11', 'App\\Notifications\\AdWishlistNotification', 'App\\Models\\User', 9, '{\"msg\":\"Removed a ad from favourite list\",\"type\":\"added_to_favourite\",\"url\":\"http:\\/\\/localhost:8000\\/ad\\/details\\/tata-tipper-2015-local\"}', NULL, '2022-11-14 10:14:38', '2022-11-14 10:14:38'),
('0fad6574-d8cc-4b15-a42b-f66fa43f3a14', 'App\\Notifications\\LogoutNotification', 'App\\Models\\User', 9, '{\"msg\":\"You\'re loggedout successfully\",\"type\":\"loggedout\"}', NULL, '2022-11-09 12:49:15', '2022-11-09 12:49:15'),
('126b0e4f-3559-449d-ac56-f104df30038b', 'App\\Notifications\\AdWishlistNotification', 'App\\Models\\User', 9, '{\"msg\":\"Added a ad to favourite list\",\"type\":\"added_to_favourite\",\"url\":\"http:\\/\\/localhost:8000\\/ad\\/details\\/tata-tipper-2015-local\"}', NULL, '2022-11-14 10:14:13', '2022-11-14 10:14:13'),
('178ebf41-75bb-4dbe-9ac2-af85e2cca179', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 6, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-11-08 10:41:21', '2022-11-08 10:41:21'),
('17ab2fc9-9a2d-402a-9539-b122fda7ccd9', 'App\\Notifications\\LogoutNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedout successfully\",\"type\":\"loggedout\"}', NULL, '2022-12-13 11:04:48', '2022-12-13 11:04:48'),
('19afc3e4-9ea6-4c77-a75b-fcff96c80af0', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-12-13 09:20:04', '2022-12-13 09:20:04'),
('21187561-b72a-4912-986b-ae371d824fbd', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-12-08 11:04:34', '2022-12-08 11:04:34'),
('243a036c-45a4-414d-b2cb-0b013b3c8df9', 'App\\Notifications\\AdApprovedNotification', 'App\\Models\\User', 9, '{\"msg\":\"Ad Approved\",\"type\":\"adapproved\",\"url\":\"http:\\/\\/localhost:8000\\/ad\\/details\\/test-title\"}', NULL, '2022-11-08 16:10:38', '2022-11-08 16:10:38'),
('24fdfe97-89fe-4b22-b58c-8c645abd24a3', 'App\\Notifications\\LogoutNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedout successfully\",\"type\":\"loggedout\"}', NULL, '2022-12-06 16:56:16', '2022-12-06 16:56:16'),
('28e0ea8b-eefa-4558-a181-1be2ce16aba2', 'App\\Notifications\\AdApprovedNotification', 'App\\Models\\User', 3, '{\"msg\":\"Ad Approved\",\"type\":\"adapproved\",\"url\":\"http:\\/\\/127.0.0.1:8000\\/ad\\/details\\/samsung-galaxy-a23-64-gb\"}', NULL, '2022-10-28 14:59:02', '2022-10-28 14:59:02'),
('2b78eda7-fe28-4699-a12a-befeaf99afa6', 'App\\Notifications\\AdPendingNotification', 'App\\Models\\User', 9, '{\"msg\":\"Ad pending\",\"type\":\"adpending\"}', NULL, '2022-11-08 16:05:51', '2022-11-08 16:05:51'),
('329b952f-ff85-45a3-9698-b2f986135339', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 9, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-11-08 16:03:29', '2022-11-08 16:03:29'),
('3ab44f51-b927-42ec-93a0-093df4e95c32', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 9, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"http:\\/\\/localhost:8000\\/ad\\/details\\/ember-demi-trail-mens-hiking-shoes45345345345\"}', NULL, '2022-11-08 16:11:02', '2022-11-08 16:11:02'),
('41f32f70-d037-450e-90fe-12f67778ee1e', 'App\\Notifications\\AdPendingNotification', 'App\\Models\\User', 9, '{\"msg\":\"Ad pending\",\"type\":\"adpending\"}', NULL, '2022-11-08 16:06:43', '2022-11-08 16:06:43'),
('443c185f-43b5-4678-88da-2d7493b9da7c', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-12-06 13:40:22', '2022-12-06 13:40:22'),
('48183570-8fff-4207-adf3-36088f61fada', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 6, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-11-08 14:32:38', '2022-11-08 14:32:38'),
('4d6759d0-b57d-4a33-931a-ac161858c5c5', 'App\\Notifications\\AdApprovedNotification', 'App\\Models\\User', 9, '{\"msg\":\"Ad Approved\",\"type\":\"adapproved\",\"url\":\"http:\\/\\/localhost:8000\\/ad\\/details\\/test-title-3fdasd\"}', NULL, '2022-11-08 16:10:11', '2022-11-08 16:10:11'),
('50f3ab3c-97fc-4592-b410-ad41de03745a', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-11-15 13:31:13', '2022-11-15 13:31:13'),
('591de6c9-8e86-4f8f-89be-1fca248bffdf', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 9, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"http:\\/\\/localhost:8000\\/ad\\/details\\/test-title\"}', NULL, '2022-11-08 16:10:45', '2022-11-08 16:10:45'),
('5fe3a258-44f0-47e2-bbca-ae3eb68ad372', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-12-13 11:05:01', '2022-12-13 11:05:01'),
('60fc5ec6-f3a0-4571-abb7-6514d8f03127', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 9, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-11-09 12:48:07', '2022-11-09 12:48:07'),
('63f39af6-b797-41b6-b17a-fe241f845a3c', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-12-06 16:18:27', '2022-12-06 16:18:27'),
('64db615e-0b72-42ac-a65e-b9f0eb66e8ea', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 9, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-11-09 12:50:07', '2022-11-09 12:50:07'),
('671cc62e-6478-432a-9d2c-ede2b35470f0', 'App\\Notifications\\MembershipUpgradeNotification', 'App\\Models\\User', 1, '{\"msg\":\"Upgrade to Standard plan\",\"type\":\"plan_upgrade\"}', NULL, '2022-11-15 11:22:08', '2022-11-15 11:22:08'),
('6c6d2eb1-521a-4897-a362-f8723bb1dfce', 'App\\Notifications\\AdWishlistNotification', 'App\\Models\\User', 9, '{\"msg\":\"Added a ad to favourite list\",\"type\":\"added_to_favourite\",\"url\":\"http:\\/\\/localhost:8000\\/ad\\/details\\/new-jincheng-2022-orange\"}', NULL, '2022-11-14 10:53:44', '2022-11-14 10:53:44'),
('7071d197-deb6-4067-b9dd-7a3f826c5e00', 'App\\Notifications\\AdPendingNotification', 'App\\Models\\User', 1, '{\"msg\":\"Ad pending\",\"type\":\"adpending\"}', NULL, '2022-12-13 15:47:28', '2022-12-13 15:47:28'),
('72d6c5cb-b0a5-4ad6-88a7-b3fedb074dd0', 'App\\Notifications\\AdPendingNotification', 'App\\Models\\User', 6, '{\"msg\":\"Ad pending\",\"type\":\"adpending\"}', NULL, '2022-11-08 14:44:37', '2022-11-08 14:44:37'),
('777901b5-7e72-4a52-a0df-67b2566c5528', 'App\\Notifications\\LogoutNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedout successfully\",\"type\":\"loggedout\"}', NULL, '2022-12-14 17:45:13', '2022-12-14 17:45:13'),
('796297dd-ea8a-44e1-b963-04550c6ac78c', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 3, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-11-05 16:11:12', '2022-11-05 16:11:12'),
('839ce642-d90a-42c5-992f-30d5ece21917', 'App\\Notifications\\LogoutNotification', 'App\\Models\\User', 6, '{\"msg\":\"You\'re loggedout successfully\",\"type\":\"loggedout\"}', NULL, '2022-11-07 18:03:14', '2022-11-07 18:03:14'),
('980e1da0-31b4-4366-9e99-2cbfbd595124', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-12-14 17:41:53', '2022-12-14 17:41:53'),
('9cfe57b5-d8eb-44c5-9d3c-23378d3f82cd', 'App\\Notifications\\LogoutNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedout successfully\",\"type\":\"loggedout\"}', NULL, '2022-12-07 13:45:12', '2022-12-07 13:45:12'),
('a64db3b2-6a9d-45b8-891d-6664f8c4db20', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 9, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-11-08 18:30:15', '2022-11-08 18:30:15'),
('a7708537-1774-4bfa-a961-6bddbe9d91cd', 'App\\Notifications\\AdPendingNotification', 'App\\Models\\User', 9, '{\"msg\":\"Ad pending\",\"type\":\"adpending\"}', NULL, '2022-11-13 15:04:02', '2022-11-13 15:04:02'),
('a9b056a6-1675-4060-8a28-a076a01369b5', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 9, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-11-13 18:24:12', '2022-11-13 18:24:12'),
('aa75f388-4610-4685-930b-ad952c60919c', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-11-19 10:38:19', '2022-11-19 10:38:19'),
('b03fb731-8ec6-4118-850d-0b4de44b8903', 'App\\Notifications\\LogoutNotification', 'App\\Models\\User', 9, '{\"msg\":\"You\'re loggedout successfully\",\"type\":\"loggedout\"}', NULL, '2022-11-08 19:01:08', '2022-11-08 19:01:08'),
('b3e9eaef-e0a6-4008-b5cd-b18522dcae65', 'App\\Notifications\\LogoutNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedout successfully\",\"type\":\"loggedout\"}', NULL, '2022-12-14 13:13:41', '2022-12-14 13:13:41'),
('b7bbcba0-e190-49cf-8d99-31e026765515', 'App\\Notifications\\AdApprovedNotification', 'App\\Models\\User', 9, '{\"msg\":\"Ad Approved\",\"type\":\"adapproved\",\"url\":\"http:\\/\\/localhost:8000\\/ad\\/details\\/ember-demi-trail-mens-hiking-shoes45345345345\"}', NULL, '2022-11-08 16:10:53', '2022-11-08 16:10:53'),
('bc60c8fe-ce1a-4b2a-bd87-dfbe4ae2f4a6', 'App\\Notifications\\AdApprovedNotification', 'App\\Models\\User', 1, '{\"msg\":\"Ad Approved\",\"type\":\"adapproved\",\"url\":\"http:\\/\\/localhost:8000\\/ad\\/details\\/ember-demi-trail-mens-hiking-shoes-42\"}', NULL, '2022-12-14 13:55:09', '2022-12-14 13:55:09'),
('bcf69e72-3c30-4cfc-a3ee-56b49a3be796', 'App\\Notifications\\LogoutNotification', 'App\\Models\\User', 3, '{\"msg\":\"You\'re loggedout successfully\",\"type\":\"loggedout\"}', NULL, '2022-11-05 17:08:06', '2022-11-05 17:08:06'),
('c40701fb-dc0a-41b6-a546-eda976d7e3d6', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 9, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"http:\\/\\/localhost:8000\\/ad\\/details\\/test-title-3fdasd\"}', NULL, '2022-11-08 16:10:21', '2022-11-08 16:10:21'),
('c5e34e0c-2cfc-46e9-9de6-c7085373723b', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-12-13 11:07:53', '2022-12-13 11:07:53'),
('cc4f873b-899f-4cb2-afbc-6b58fb82a9f6', 'App\\Notifications\\AdPendingNotification', 'App\\Models\\User', 6, '{\"msg\":\"Ad pending\",\"type\":\"adpending\"}', NULL, '2022-11-08 14:42:31', '2022-11-08 14:42:31'),
('d227d230-d07f-4c2d-8381-969d41795cf5', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-12-14 09:27:19', '2022-12-14 09:27:19'),
('d274168b-b530-4763-9ee9-859d7896e005', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"http:\\/\\/localhost:8000\\/ad\\/details\\/ember-demi-trail-mens-hiking-shoes-42\"}', NULL, '2022-12-14 13:55:14', '2022-12-14 13:55:14'),
('d34dccc3-0630-4fcf-a09a-b1d1411280a0', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-12-07 10:09:37', '2022-12-07 10:09:37'),
('d727e32c-5784-42ad-8d6b-43dd792d9c5f', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-12-07 13:36:20', '2022-12-07 13:36:20'),
('eafe38d1-4720-4105-bf92-a9a6ab436c66', 'App\\Notifications\\MembershipUpgradeNotification', 'App\\Models\\User', 1, '{\"msg\":\"Upgrade to Standard plan\",\"type\":\"plan_upgrade\"}', NULL, '2022-11-15 14:16:30', '2022-11-15 14:16:30'),
('ed31bf05-5776-4842-a837-468e63929fbf', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-12-07 14:49:07', '2022-12-07 14:49:07'),
('ee645a8d-7116-46cd-8658-4928f78aa01a', 'App\\Notifications\\LoginNotification', 'App\\Models\\User', 9, '{\"msg\":\"You\'re loggedin successfully\",\"type\":\"loggedin\"}', NULL, '2022-11-14 10:13:40', '2022-11-14 10:13:40'),
('f3cfed90-d362-48f6-958b-136f782b554f', 'App\\Notifications\\LogoutNotification', 'App\\Models\\User', 3, '{\"msg\":\"You\'re loggedout successfully\",\"type\":\"loggedout\"}', NULL, '2022-10-28 15:32:12', '2022-10-28 15:32:12'),
('f7f480a0-aad5-4437-aecf-d67a07877054', 'App\\Notifications\\AdPendingNotification', 'App\\Models\\User', 1, '{\"msg\":\"Ad pending\",\"type\":\"adpending\"}', NULL, '2022-12-13 15:50:05', '2022-12-13 15:50:05');

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
  `seller_id` int(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `stars`, `comment`, `seller_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 5, 'dd', 0, 1, '2022-10-25 05:19:46', '2022-10-25 05:19:46');

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
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_mode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'live/local'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo_image`, `white_logo`, `favicon_image`, `header_css`, `header_script`, `body_script`, `free_featured_ad_limit`, `regular_ads_homepage`, `featured_ads_homepage`, `customer_email_verification`, `maximum_ad_image_limit`, `subscription_type`, `ads_admin_approval`, `free_ad_limit`, `sidebar_color`, `nav_color`, `sidebar_txt_color`, `nav_txt_color`, `main_color`, `accent_color`, `frontend_primary_color`, `frontend_secondary_color`, `dark_mode`, `facebook_pixel`, `google_analytics`, `search_engine_indexing`, `default_layout`, `website_loader`, `loader_image`, `language_changing`, `email_verification`, `watermark_status`, `watermark_type`, `watermark_text`, `watermark_image`, `created_at`, `updated_at`, `default_map`, `google_map_key`, `map_box_key`, `default_long`, `default_lat`, `push_notification_status`, `server_key`, `api_key`, `auth_domain`, `project_id`, `storage_bucket`, `messaging_sender_id`, `app_id`, `measurement_id`, `facebook`, `twitter`, `instagram`, `youtube`, `linkdin`, `whatsapp`, `app_mode`) VALUES
(1, 'uploads/app/logo\\o5cLJ1S3qDEGpBVhK2dPjsG4y43JNUodisa1oSjM.png', 'uploads/app/logo\\wNUnMrh5vOJwPC4zdJux2C4gClD3089XGlZcnvs5.png', 'uploads/app/logo\\zitPolRGGS7vMdroGm4u0b2n3NEB0sbVaBHSXu3Z.png', NULL, NULL, NULL, 1, 1, 1, 0, 5, 'recurring', 1, 3, '#022446', '#0a243e', '#e0e9f2', '#e0e9f2', '#05c279', '#ffc107', '#05c279', '#ffc107', 0, 0, 0, 1, 1, 0, NULL, 0, 0, 1, 'text', 'Dukaletu', 'frontend/images/logo.png', '2022-08-19 23:31:12', '2022-10-28 14:54:14', 'google-map', 'AIzaSyA0gxkGb2UmHjxv9ftK8LjX9vQ-SnmJJ20', '', 90.411270491741, 23.757853442383, 0, 'your-server-key', 'your-api-key', 'your-auth-domain', 'your-project-id', 'your-storage-bucket', 'your-messaging-sender-id', 'your-app-id', 'your-measurement-id', 'https://facebook.com/zakirsoft', 'https://twitter.com/zakirsoft', 'https://instagram.com/zakirsoft', 'https://www.youtube.com/channel/UCMSp_qPtYbaUMjEICDLhDCQ', 'https://www.linkedin.com/in/zakirsoft', 'https://web.whatsapp.com/', 'local');

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
(3, 'payment_setting', 'Enable Payment Method', 'Enable to payment methods to receive payments from your customer.', 'settings.payment', 'Add Payment', 1, '2022-08-19 23:31:12', '2022-11-08 15:04:33'),
(4, 'theme_setting', 'Customize Theme', 'Customize your theme to make your app look more attractive.', 'settings.theme', 'Customize Your App Now', 0, '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(5, 'map_setting', 'Map Configuration', 'Configure your map setting api to create ad in any location.', 'settings.system', 'Add Map API', 1, '2022-08-19 23:31:12', '2022-10-28 14:54:14'),
(6, 'pusher_setting', 'Pusher Configuration', 'Configure your pusher setting api for the chat application', 'settings.system', 'Add Pusher API', 0, '2022-08-19 23:31:12', '2022-08-19 23:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `image`, `url`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Best Slider', 'media/slider/slider-6366404780dc5.jpg', 'slider.com', '1', '2022-11-05 15:51:51', NULL),
(4, 'New Slider', 'media/slider/slider-63664055b134d.jpg', 'new.com', '1', '2022-11-05 15:52:05', NULL),
(5, 'My Slider', 'media/slider/slider-636640655a2c8.jpg', 'my.com', '1', '2022-11-05 15:52:21', NULL),
(6, 'Best', 'media/slider/slider-636640845fa04.jpg', 'sdf sdaf', '1', '2022-11-05 15:56:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sms_marketings`
--

CREATE TABLE `sms_marketings` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sms_marketings`
--

INSERT INTO `sms_marketings` (`id`, `sender_id`, `phone_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1794798227, 0, '2022-12-08 11:30:34', '2022-12-08 11:30:34'),
(2, 1, 1855656071, 1, '2022-12-13 11:40:51', '2022-12-13 11:40:51'),
(3, 1, 1794798227, 1, '2022-12-13 11:40:51', '2022-12-13 11:40:51'),
(4, 1, 1988173070, 1, '2022-12-13 11:40:51', '2022-12-13 11:40:51'),
(5, 1, 1866745959, 1, '2022-12-13 11:40:51', '2022-12-13 11:40:51'),
(6, 1, 1777839611, 1, '2022-12-13 11:40:51', '2022-12-13 11:40:51'),
(7, 1, 1855656071, 1, '2022-12-13 11:42:33', '2022-12-13 11:42:33'),
(8, 1, 1794798227, 1, '2022-12-13 11:42:34', '2022-12-13 11:42:34'),
(9, 1, 1988173070, 1, '2022-12-13 11:42:35', '2022-12-13 11:42:35'),
(10, 1, 1866745959, 1, '2022-12-13 11:42:36', '2022-12-13 11:42:36'),
(11, 1, 1777839611, 1, '2022-12-13 11:42:37', '2022-12-13 11:42:37'),
(12, 1, 1855656071, 0, '2022-12-13 11:44:09', '2022-12-13 11:44:09'),
(13, 1, 1794798227, 0, '2022-12-13 11:44:10', '2022-12-13 11:44:10'),
(14, 1, 1988173070, 0, '2022-12-13 11:44:11', '2022-12-13 11:44:11'),
(15, 1, 1866745959, 0, '2022-12-13 11:44:12', '2022-12-13 11:44:12'),
(16, 1, 1777839611, 0, '2022-12-13 11:44:13', '2022-12-13 11:44:13'),
(17, 1, 1855656071, 0, '2022-12-14 10:39:55', '2022-12-14 10:39:55'),
(18, 1, 1855656071, 0, '2022-12-14 10:46:13', '2022-12-14 10:46:13'),
(19, 1, 1855656071, 0, '2022-12-14 10:47:22', '2022-12-14 10:47:22'),
(20, 1, 1777839611, 0, '2022-12-14 10:47:48', '2022-12-14 10:47:48'),
(21, 1, 1866745959, 0, '2022-12-14 10:48:51', '2022-12-14 10:48:51'),
(22, 1, 1939149328, 0, '2022-12-14 12:11:03', '2022-12-14 12:11:03');

-- --------------------------------------------------------

--
-- Table structure for table `sms_packages`
--

CREATE TABLE `sms_packages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(255) NOT NULL,
  `amount_of_sms` int(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `validity` int(10) NOT NULL DEFAULT 1 COMMENT 'number of days '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sms_packages`
--

INSERT INTO `sms_packages` (`id`, `name`, `price`, `amount_of_sms`, `created_at`, `updated_at`, `status`, `validity`) VALUES
(1, 'Gold', 10, 200, '2022-12-06 12:55:33', '2022-12-06 13:39:11', 1, 1),
(2, 'Sliver', 200, 2000, '2022-12-06 12:56:15', '2022-12-07 09:27:38', 1, 10);

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
  `payment_provider` enum('flutterwave','mollie','midtrans','paypal','paystack','razorpay','sslcommerz','stripe','instamojo','offline','pesapal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sms_plan_id` int(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usd_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('paid','unpaid','failed','success') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `trackingid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `order_id`, `transaction_id`, `payment_provider`, `plan_id`, `sms_plan_id`, `user_id`, `amount`, `currency_symbol`, `usd_amount`, `payment_status`, `trackingid`, `created_at`, `updated_at`) VALUES
(57, 'PESAPALE7UUWER99F8M3SU', 'PESAPALB9XECEOJCZWFYPG', 'pesapal', 2, NULL, 1, '10', NULL, NULL, 'unpaid', '', '2022-12-06 14:34:27', '2022-12-06 14:34:27'),
(58, 'PESAPALQM3BY0QDKGTCFKZ', 'PESAPAL8ERVT013LOI2QWB', 'pesapal', 2, NULL, 1, '10', NULL, NULL, 'unpaid', '', '2022-12-06 14:37:59', '2022-12-06 14:37:59'),
(59, 'PESAPAL0FT3XJ6A9DAS8GG', 'PESAPALHBYZJUY5TMRG5PY', 'pesapal', 2, NULL, 1, '10', NULL, NULL, 'unpaid', '', '2022-12-06 14:52:39', '2022-12-06 14:52:39'),
(60, 'PESAPALGJLFV4NIXJBB66X', 'PESAPAL1KHOZZ7RPCL90GE', 'pesapal', 2, NULL, 1, '10', NULL, NULL, 'unpaid', '', '2022-12-06 14:53:07', '2022-12-06 14:53:07'),
(61, 'PESAPAL6E52TCR1TR7DQLY', 'PESAPALMTDQABFR7K27XAI', 'pesapal', 2, NULL, 1, '10', NULL, NULL, 'unpaid', '', '2022-12-06 14:55:36', '2022-12-06 14:55:36'),
(62, 'PESAPALTL0I03O838RZ8VQ', 'PESAPALQGEGYQSOU31FEQH', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', '', '2022-12-06 15:21:33', '2022-12-06 15:21:33'),
(63, 'PESAPALWWMFQK73PNO1S14', 'PESAPALETOMGY31VLWK7FI', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', '', '2022-12-06 15:35:10', '2022-12-06 15:35:10'),
(64, 'PESAPALVGC9LGMXN62N4X3', 'PESAPALRI1KLY6DRE33JQJ', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', '', '2022-12-06 15:38:19', '2022-12-06 15:38:19'),
(65, 'PESAPAL176VO8W3B24JZAW', 'PESAPALL28KE92KCK69VPS', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', '', '2022-12-06 15:38:36', '2022-12-06 15:38:36'),
(66, 'PESAPALKMHYJV3KLHNA3YM', 'PESAPALTAETUYBNJ1BAVRM', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', '', '2022-12-06 15:46:00', '2022-12-06 15:46:00'),
(67, 'PESAPALO62ZEPKUEG3UTW4', 'PESAPALGFSUKOHYHTRAXOR', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', '', '2022-12-06 15:49:20', '2022-12-06 15:49:20'),
(68, 'PESAPAL6PKDSPUCD4GJATM', 'PESAPALVUR374VARMOY5SY', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', '', '2022-12-06 15:51:18', '2022-12-06 15:51:18'),
(69, 'PESAPALTB0XIHXAAAYZWIF', 'PESAPALBQYOP4UPVJI5I6K', 'pesapal', 1, NULL, 1, '10', NULL, NULL, 'unpaid', '', '2022-12-06 15:53:38', '2022-12-06 15:53:38'),
(70, 'PESAPALHTRQ3FYTB23HNTG', 'PESAPALW48OCZ09HM61G39', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', '', '2022-12-06 15:55:34', '2022-12-06 15:55:34'),
(71, 'PESAPALO6NGOJHL8VNWV5A', 'PESAPAL4YIBY75KTF7NWH2', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', '', '2022-12-06 15:55:58', '2022-12-06 15:55:58'),
(72, 'PESAPALT87GRHUQ9P3N6DA', 'PESAPALJJRODA28HB5U59T', 'pesapal', 2, NULL, 1, '10', NULL, NULL, 'unpaid', '', '2022-12-06 15:57:05', '2022-12-06 15:57:05'),
(73, 'PESAPAL20YTQU1BDOKS96W', 'PESAPALNHXTQHK0VMG6ZNQ', 'pesapal', 2, NULL, 1, '10', NULL, NULL, 'unpaid', '', '2022-12-06 15:57:43', '2022-12-06 15:57:43'),
(74, 'PESAPALFRYLKYD2B9I0APT', 'PESAPALO5K1ES8N80VJTFM', 'pesapal', 2, NULL, 1, '10', NULL, NULL, 'unpaid', '', '2022-12-06 16:02:38', '2022-12-06 16:02:38'),
(75, 'PESAPALGAKE687TK8CMCGE', 'PESAPALKF772CS2PKTQR39', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', '', '2022-12-06 16:04:38', '2022-12-06 16:04:38'),
(76, 'PESAPAL62UKOSMQI56SR09', 'PESAPAL54LGA92GEWWZEWW', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', '', '2022-12-06 16:06:25', '2022-12-06 16:06:25'),
(77, 'PESAPALUR8KY5KAH3O58BD', 'PESAPALVBVDLL89WM7TJCL', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', '', '2022-12-06 16:07:50', '2022-12-06 16:07:50'),
(78, 'PESAPALDPE9BVZ3XUQJI9E', 'PESAPALBOJU3MZNKW76KTA', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', '', '2022-12-06 16:08:08', '2022-12-06 16:08:08'),
(79, 'PESAPAL1D95AQ1UK5JPVHM', 'PESAPALEY1ZBS40HU9E97V', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', '', '2022-12-06 16:08:33', '2022-12-06 16:08:33'),
(80, 'PESAPALEM1GEAARKWRNPIA', 'PESAPALQM8HG4CMINKX1M2', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', '', '2022-12-06 16:10:23', '2022-12-06 16:10:23'),
(81, 'PESAPALO9LOOILPULTRSG6', 'PESAPAL795A9QC7XJ1XUF3', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', '', '2022-12-06 16:11:53', '2022-12-06 16:11:53'),
(82, 'PESAPALYX403Y4XCFMH4Y7', 'PESAPAL9RT30JSN92RVHYD', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', '', '2022-12-06 16:14:00', '2022-12-06 16:14:00'),
(83, 'PESAPALDFEMUBPEGQ6I92C', 'PESAPALVG6GN4JLWKIKSD0', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', NULL, '2022-12-06 16:19:28', '2022-12-06 16:19:28'),
(84, 'PESAPALMFNMIQ6UQ7YOC9G', 'PESAPALKJRHB8R032JRP2N', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'paid', '9ef5d23e-eb11-4359-bad4-df49723730d7', '2022-12-06 16:20:14', '2022-12-06 16:21:00'),
(85, 'PESAPALN2E5QU1V0O1GINW', 'PESAPALTXCXWMVXRS3ADA6', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'unpaid', NULL, '2022-12-06 17:09:55', '2022-12-06 17:09:55'),
(86, 'PESAPALXUXCDO3Q8NEOMN8', 'PESAPALL9B3WIGDUAFI3EM', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'paid', 'ff8f6528-b5a0-499f-9a08-df4958a78177', '2022-12-06 17:16:06', '2022-12-06 17:16:58'),
(87, 'PESAPALUKZV1XFHAT9LH0Z', 'PESAPALD3MKNKNAVX05LS8', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'paid', '5f695c4e-4e24-4246-8431-df49194aa2e6', '2022-12-06 17:21:38', '2022-12-06 17:22:34'),
(88, 'PESAPALEH9U1ZD9UL99KDY', 'PESAPALESY513M9FFHMJSA', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'paid', '91e51822-8c85-4782-954c-df49866a6a0c', '2022-12-06 17:24:26', '2022-12-06 17:25:21'),
(89, 'PESAPALKMJQTDEL6RZOAHP', 'PESAPALQZPYB1XOVYF4RTJ', 'pesapal', 2, NULL, 1, '200', NULL, NULL, 'paid', 'ea9f6572-b506-44d9-acc6-df49803c6d6f', '2022-12-06 17:26:22', '2022-12-06 17:27:11'),
(90, 'PESAPALSDPM2NCHAE0KXVU', 'PESAPALS3JCX63M485QSSV', 'pesapal', NULL, 2, 1, '200', NULL, NULL, 'paid', '43185923-b233-4e93-9fb0-df492192121e', '2022-12-06 17:37:56', '2022-12-06 17:38:45'),
(91, 'PESAPALNJQB25RN9M80UF8', 'PESAPAL2SVASK0GLEV6EIH', 'pesapal', NULL, 2, 1, '200', NULL, NULL, 'paid', 'd8952614-2a75-43e9-a324-df492b121caa', '2022-12-06 17:49:48', '2022-12-06 17:50:36'),
(92, 'PESAPALZRHOZ2UFNT9WQYQ', 'PESAPAL0G6RWVO1LQHVHQ6', 'pesapal', NULL, 2, 1, '200', NULL, NULL, 'paid', 'ab88df77-f459-4224-86a4-df49a808ee28', '2022-12-06 17:52:40', '2022-12-06 17:53:34'),
(93, 'PESAPALTTTHOBKU3LK0K8J', 'PESAPAL5ECZJXSHVFA8378', 'pesapal', NULL, 2, 1, '200', NULL, NULL, 'paid', '4cfc023a-0ab0-483e-84ce-df4951bea49e', '2022-12-06 17:54:36', '2022-12-06 17:55:11'),
(94, 'PESAPAL0N9P8BYT13N2ABV', 'PESAPAL5ZYPWDWOSMR3AZ2', 'pesapal', NULL, 1, 1, '10', NULL, NULL, 'paid', '6354485b-3f5f-4c68-8b80-df478f160f4f', '2022-12-08 11:28:13', '2022-12-08 11:29:18'),
(100, 'PESAPALRAWPK91K9KU92AB', 'PESAPAL18PY6KQ99NT7HVO', 'pesapal', NULL, 2, 2, '200', NULL, NULL, 'failed', 'e8b358ce-bc9b-4e5e-97cc-df41f78174d1', '2022-12-14 18:39:11', '2022-12-14 18:43:32');

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
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_sms_stock` int(11) DEFAULT 0 COMMENT 'unused sms',
  `sms_plan_id` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `phone`, `email_verified_at`, `password`, `web`, `image`, `token`, `last_seen`, `remember_token`, `created_at`, `updated_at`, `auth_type`, `provider`, `provider_id`, `fcm_token`, `user_sms_stock`, `sms_plan_id`) VALUES
(1, 'Md Mridul', 'mdmridul608', 'mdmridul608@gmail.com', '01794798227', NULL, '$2y$10$CXyuDXFSNAjrNuqVzwai/OAG0PVo55g.tRlIYTDddsZHwcPn0Fsqq', NULL, 'backend/image/default-user.png', NULL, '2022-12-14 23:45:13', NULL, '2022-11-17 15:12:52', '2022-12-14 17:45:13', 'email', NULL, NULL, NULL, 200, 1),
(2, 'sakib khan', 'sakib', 'sakib@gmail.com', '0191899327', NULL, '$2y$10$Pkvm9yA4Vx3JWGMpKGgNRuXOR8FF8M20XWIvOFKE9AbzRP4lJRxeW', NULL, 'backend/image/default-user.png', NULL, '2022-12-15 01:25:35', NULL, '2022-12-14 18:00:37', '2022-12-14 19:25:35', 'email', NULL, NULL, NULL, 2000, 2);

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
-- Table structure for table `user_phone_books`
--

CREATE TABLE `user_phone_books` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_phone_books`
--

INSERT INTO `user_phone_books` (`id`, `user_id`, `phone_number`, `created_at`, `updated_at`) VALUES
(1, 1, '1855656071', '2022-12-14 12:47:51', '2022-12-14 12:47:51'),
(2, 1, '1794798227', '2022-12-14 12:47:51', '2022-12-14 12:47:51'),
(3, 1, '1988173070', '2022-12-14 12:47:51', '2022-12-14 12:47:51'),
(4, 1, '1866745959', '2022-12-14 12:47:51', '2022-12-14 12:47:51'),
(5, 1, '1777839611', '2022-12-14 12:47:51', '2022-12-14 12:47:51'),
(8, 1, '1939149328', '2022-12-14 12:50:13', '2022-12-14 12:50:13'),
(9, 2, '1855656071', '2022-12-14 18:58:49', '2022-12-14 18:58:49'),
(10, 2, '1794798227', '2022-12-14 18:58:49', '2022-12-14 18:58:49'),
(11, 2, '1988173070', '2022-12-14 18:58:49', '2022-12-14 18:58:49'),
(12, 2, '1866745959', '2022-12-14 18:58:49', '2022-12-14 18:58:49'),
(13, 2, '1777839611', '2022-12-14 18:58:49', '2022-12-14 18:58:49'),
(14, 2, '1939149328', '2022-12-14 18:58:49', '2022-12-14 18:58:49');

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
(1, 1, 2, 1, 0, '2022-11-17 15:12:52', '2022-12-14 13:54:59', 'recurring', NULL, NULL, 0),
(2, 2, 3, 1, 0, '2022-12-14 18:00:37', '2022-12-14 18:00:37', 'recurring', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_sms_stocks`
--

CREATE TABLE `user_sms_stocks` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `stock` int(255) NOT NULL,
  `status` enum('IN','OUT') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_sms_stocks`
--

INSERT INTO `user_sms_stocks` (`id`, `user_id`, `stock`, `status`, `created_at`, `updated_at`, `expire_date`) VALUES
(1, 1, 200, 'IN', '2022-12-14 12:21:03', '2022-12-14 12:21:03', '2022-12-24'),
(2, 1, -1, 'OUT', '2022-12-14 12:21:29', '2022-12-14 12:21:29', NULL),
(3, 1, 200, 'IN', '2022-12-14 12:21:03', '2022-12-14 12:21:03', '2022-12-24'),
(4, 1, -399, 'OUT', '2022-12-14 12:30:52', '2022-12-14 12:30:52', NULL),
(5, 1, 200, 'IN', '2022-12-14 12:21:03', '2022-12-14 12:21:03', '2022-12-24'),
(6, 2, 2000, 'IN', '2022-12-14 18:48:41', '2022-12-14 18:48:41', '1970-01-01');

--
-- Triggers `user_sms_stocks`
--
DELIMITER $$
CREATE TRIGGER `after_user_sms_stocks_insert` AFTER INSERT ON `user_sms_stocks` FOR EACH ROW begin
   
declare var_unused_sms int default 0 ;
select sum(user_sms_stocks.stock) into var_unused_sms from user_sms_stocks where user_id = new.user_id;

update users set user_sms_stock = var_unused_sms where id = new.user_id;


end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_user_sms_stocks_update` AFTER UPDATE ON `user_sms_stocks` FOR EACH ROW begin
   
declare var_unused_sms int default 0 ;
select sum(user_sms_stocks.stock) into var_unused_sms from user_sms_stocks where user_id = new.user_id;

update users set user_sms_stock = var_unused_sms where id = new.user_id;


end
$$
DELIMITER ;

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
-- Indexes for table `mobile_validations`
--
ALTER TABLE `mobile_validations`
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
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_marketings`
--
ALTER TABLE `sms_marketings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_packages`
--
ALTER TABLE `sms_packages`
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
-- Indexes for table `user_phone_books`
--
ALTER TABLE `user_phone_books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_plans`
--
ALTER TABLE `user_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_plans_user_id_foreign` (`user_id`),
  ADD KEY `user_plans_current_plan_id_foreign` (`current_plan_id`);

--
-- Indexes for table `user_sms_stocks`
--
ALTER TABLE `user_sms_stocks`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `ad_features`
--
ALTER TABLE `ad_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ad_galleries`
--
ALTER TABLE `ad_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
-- AUTO_INCREMENT for table `mobile_validations`
--
ALTER TABLE `mobile_validations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sms_marketings`
--
ALTER TABLE `sms_marketings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `sms_packages`
--
ALTER TABLE `sms_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_device_tokens`
--
ALTER TABLE `user_device_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_phone_books`
--
ALTER TABLE `user_phone_books`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_plans`
--
ALTER TABLE `user_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_sms_stocks`
--
ALTER TABLE `user_sms_stocks`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
