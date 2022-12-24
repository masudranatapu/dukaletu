-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 20, 2022 at 04:50 AM
-- Server version: 8.0.21-0ubuntu0.20.04.4
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dukalet2_mainclassified`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'backend/image/default-user.png',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'arobil@gmail.com', '2022-08-19 23:31:12', '$2y$10$pZrsDkiaZg6uAR3uDZJdcuvSoL/STv8iVNAVHdvGs6QhFQb/zpgRK', 'uploads/user/1668418982_63720da67be99.webp', 'ofZblu9D7UaOx3l6GexHdNx3e5nQ82jk4gbE4kbxXxj2yDVCXTSqOv2i304t', '2022-08-19 23:31:12', '2022-11-14 17:43:02'),
(3, 'Dukaletu', 'dukaletustores@gmail.com', NULL, '$2y$10$zqDxjZP0kDzanzFOMgVUPejX12/GC4/4mkkCRuZxTAYqFElEQv9u6', 'uploads/user/1669888067_63887843b25fb.JPG', NULL, '2022-12-01 18:57:30', '2022-12-01 20:47:47');

-- --------------------------------------------------------

--
-- Table structure for table `admin_searches`
--

CREATE TABLE `admin_searches` (
  `id` bigint UNSIGNED NOT NULL,
  `page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `subcategory_id` bigint UNSIGNED DEFAULT NULL,
  `brand_id` bigint UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_phone` tinyint(1) NOT NULL DEFAULT '1',
  `phone_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','sold','pending','declined','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_featured` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'no' COMMENT 'no:not_featured; yes:yes_featured',
  `total_reports` int NOT NULL DEFAULT '0',
  `total_views` int NOT NULL DEFAULT '0',
  `is_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `drafted_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `neighborhood` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `long` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `whatsapp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `title`, `slug`, `user_id`, `category_id`, `subcategory_id`, `brand_id`, `price`, `description`, `phone`, `show_phone`, `phone_2`, `thumbnail`, `status`, `featured`, `is_featured`, `total_reports`, `total_views`, `is_blocked`, `drafted_at`, `created_at`, `updated_at`, `address`, `neighborhood`, `locality`, `place`, `district`, `postcode`, `region`, `country_id`, `long`, `lat`, `whatsapp`) VALUES
(3, 'Best ads', 'best-ads', 2, 5, 9, 2, 213.00, '<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.&nbsp;<a data-ved=\"2ahUKEwj26ry9ltj7AhV21jgGHejYCV0QmhN6BAgqEAI\" ping=\"/url?sa=t&amp;source=web&amp;rct=j&amp;url=https://en.wikipedia.org/wiki/Lorem_ipsum&amp;ved=2ahUKEwj26ry9ltj7AhV21jgGHejYCV0QmhN6BAgqEAI\" target=\"_blank\" rel=\"noopener\" href=\"https://en.wikipedia.org/wiki/Lorem_ipsum\">Wikipedia</a></p>', NULL, 0, NULL, 'uploads/addss_image/1669889337_63887d398367d.jpg', 'active', 1, 'yes', 0, 25, 0, NULL, '2022-12-01 20:46:35', '2022-12-19 05:59:47', 'muranga-kenya', '', '', '', '', '', 'Muranga', 1, 37.06990854687501, -0.6355441127325975, NULL),
(4, 'The Lush Blunt Bob Wig', 'the-lush-blunt-bob-wig', 5, 7, 20, 2, 15699.00, '<p>Who doesn&rsquo;t love the Lush Blunt Bob Wig?</p><p>Not only is the 8 Inch 4x4 closure wig full human Hair, but its heavy density at 150% density.&nbsp; The lush blunt bob wig is less maintenance and, in many ways, more versatile.</p><p>Lush blunt bob made of full human hair gives the most natural-looking wig compared to the synthetic one. The lush blunt bob wig is Burmese, known for its health, resilient and long-lasting qualities.</p><p>Lush Hair is quality virgin hair with no shedding, no tangles and easy to wear. The product has a 100% breathable net within the network make you feel comfortable when you wear it.</p><p>Additionally, it comes with elegant packaging.</p><p>Try one today to refresh your look to a whole new level!</p><p><strong>Highlight:</strong></p><ul><li>More versatile</li><li>Full Human Hair</li><li>Heavy Density</li><li>No Shedding</li><li>No Tangles</li><li>Easy to wear</li></ul>', '0782151528', 1, '0782151528', 'uploads/addss_images/1669893398_63888d168f4dd.jpeg', 'active', 1, 'no', 0, 115, 0, NULL, '2022-12-01 22:16:38', '2022-12-20 15:02:46', 'kenya', '', '', '', '', '', NULL, 1, 36.894986629486084, -1.2869014993595724, ''),
(8, 'The Lush Blunt Bob Wig Tall', 'the-lush-blunt-bob-wig-tall', 4, 7, 20, 2, 17000.00, '<p class=\"MsoNormal\">Who doesn&rsquo;t love the Lush Blunt Bob Wig?<o:p></o:p></p><p class=\"MsoNormal\">Not only is the 8 Inch 4x4 closure wig full human Hair, but its heavy density at 150% density.<span style=\"mso-spacerun:yes\">&nbsp; </span>The lush blunt bob wig is less maintenance and, in many ways, more versatile.<o:p></o:p></p><p class=\"MsoNormal\">Lush blunt bob made of full human hair gives the most natural-looking wig compared to the synthetic one. The lush blunt bob wig is Burmese, known for its health, resilient and long-lasting qualities.<o:p></o:p></p><p class=\"MsoNormal\">Lush Hair is quality virgin hair with no shedding, no tangles and easy to wear. The product has a 100% breathable net within the network make you feel comfortable when you wear it.<o:p></o:p></p><p class=\"MsoNormal\">Additionally, it comes with elegant packaging.<o:p></o:p></p><p class=\"MsoNormal\">Try one today to refresh your look to a whole new level!<o:p></o:p></p>', NULL, 0, NULL, 'uploads/addss_image/1670668185_63945f99a4118.jpeg', 'active', 1, 'yes', 0, 16, 0, NULL, '2022-12-10 21:29:45', '2022-12-17 22:22:14', 'nyeri-kenya', '', '', '', '', '', 'Nyeri', 1, 37.0919205437074, -0.1626346412592092, ''),
(18, 'Acer Laptop', 'acer-laptop', 6, 4, 24, NULL, 23000.00, '<p><em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.</p>', NULL, 0, NULL, 'uploads/addss_image/1671106587_639b101b3cd38.jpg', 'active', 0, 'no', 0, 3, 0, NULL, '2022-12-15 23:16:27', '2022-12-18 23:01:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, ''),
(20, 'Yamaha R15 FZS V4', 'yamaha-r15-fzs-v4', 6, 1, 17, NULL, 325000.00, '<h3 class=\"styling__title\" style=\"box-sizing: border-box; margin: 0px 0px 1.5rem; font-family: BarlowSemiCondensed; font-weight: 400; line-height: 1.2; font-size: 2rem; color: rgb(1, 13, 170); letter-spacing: 0.0625rem; padding: 0px; text-align: left; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">155 cc LC4V SOHC FI Engine with VVA</h3><p><span style=\"color: rgb(51, 50, 53); font-family: Barlow, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 22px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">The liquid cooled single overhead camshaft fuel injection engine churns out a maximum horse power of 13.5kW(18.4PS)/10000r/min and maximum torque of 14.2N.m (1.4kgf.m) / 7500r/min. What&rsquo;s more the engine is equipped with a Traction Control System and a Quick Shifter* (up-shift) too!</span><br style=\"box-sizing: border-box; color: rgb(51, 50, 53); font-family: Barlow, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 22px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" /><small style=\"box-sizing: border-box; font-size: 17.6px; font-weight: 400; color: rgb(51, 50, 53); font-family: Barlow, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">*(Standard for Racing Blue color)</small></p>', NULL, 0, NULL, 'uploads/addss_image/1671109013_639b1995625e6.jpg', 'active', 0, 'no', 0, 7, 0, NULL, '2022-12-15 23:56:53', '2022-12-18 20:12:01', '', NULL, NULL, NULL, '', NULL, NULL, 1, NULL, NULL, ''),
(21, 'Accontant', 'accontant', 6, 10, 162, NULL, 12500.00, '<p><em style=\"-webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-sizing: border-box; color: rgb(255, 255, 255); font-family: &quot;Quarto A&quot;, &quot;Quarto B&quot;, Georgia, Times, &quot;Times New Roman&quot;, &quot;Microsoft YaHei New&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, 宋体, SimSun, STXihei, 华文细黑, serif; font-size: 47px; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; letter-spacing: 1.175px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(85, 98, 113); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Lorem ipsum</em><span style=\"color: rgb(255, 255, 255); font-family: &quot;Quarto A&quot;, &quot;Quarto B&quot;, Georgia, Times, &quot;Times New Roman&quot;, &quot;Microsoft YaHei New&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, 宋体, SimSun, STXihei, 华文细黑, serif; font-size: 47px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; letter-spacing: 1.175px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(85, 98, 113); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\"><span>&nbsp;</span>is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.</span></p>', NULL, 0, NULL, 'uploads/addss_image/1671109891_639b1d03485e1.jpg', 'active', 0, 'no', 0, 2, 0, NULL, '2022-12-16 00:11:31', '2022-12-19 12:59:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, ''),
(22, 'TEST', 'test', 1, 1, 52, NULL, 10.00, '<p>testttttttttttttt</p>', '01918993427', 0, NULL, 'uploads/addss_image/1671110461_639b1f3d61349.png', 'active', 0, 'no', 0, 5, 0, NULL, '2022-12-16 00:21:01', '2022-12-20 03:16:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, ''),
(23, 'test', 'test-23', 1, 26, 185, NULL, 10.00, '<p>testtttttttttttttt</p>', '01918993427', 0, NULL, 'uploads/addss_image/1671111652_639b23e47c272.png', 'active', 0, 'no', 0, 4, 0, NULL, '2022-12-16 00:40:52', '2022-12-19 20:20:55', '', NULL, NULL, NULL, '', NULL, NULL, 1, NULL, NULL, ''),
(24, 'test', 'test-24', 1, 24, 111, NULL, 10.00, '<p>DhakaDhaka</p>', '01918993427', 0, NULL, 'uploads/addss_image/1671112161_639b25e168d60.png', 'active', 0, 'no', 0, 2, 0, NULL, '2022-12-16 00:49:21', '2022-12-20 03:15:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, ''),
(25, 'Ember Demi Trail Men\'s Hiking Shoes', 'ember-demi-trail-mens-hiking-shoes', 10, 22, 98, NULL, 100.00, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu egestas tellus. Maecenas consectetur libero non velit laoreet posuere. Nulla sit amet volutpat augue. Quisque malesuada vulputate ligula, non vehicula eros porttitor ut. Etiam mattis, leo vel ornare tincidunt, mi mauris aliquam magna, sit amet consectetur nibh tortor sed leo. In vel sollicitudin urna. Duis in lectus vel ipsum laoreet cursus ut sit amet orci. Aenean tincidunt elementum nunc, nec efficitur risus consectetur consequat.</p>', '123456789', 0, NULL, 'uploads/addss_image/1671270514_639d9072cbe3c.jpg', 'active', 0, 'no', 0, 3, 0, NULL, '2022-12-17 20:48:34', '2022-12-19 12:59:54', 'Lorem ipsum dolor', NULL, NULL, NULL, 'Gazipur', NULL, NULL, 1, NULL, NULL, ''),
(26, 'Ember Demi Trail Men\'s Hiking Shoes', 'ember-demi-trail-mens-hiking-shoes-26', 10, 22, 97, NULL, 300.00, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu egestas tellus. Maecenas consectetur libero non velit laoreet posuere. Nulla sit amet volutpat augue. Quisque malesuada vulputate ligula, non vehicula eros porttitor ut. Etiam mattis, leo vel ornare tincidunt, mi mauris aliquam magna, sit amet consectetur nibh tortor sed leo. In vel sollicitudin urna. Duis in lectus vel ipsum laoreet cursus ut sit amet orci. Aenean tincidunt elementum nunc, nec efficitur risus consectetur consequat.</p>', '123456789', 0, NULL, 'uploads/addss_image/1671270633_639d90e94a916.jpg', 'active', 0, 'no', 0, 3, 0, NULL, '2022-12-17 20:50:33', '2022-12-19 12:59:59', 'joyna', NULL, NULL, NULL, 'Gazipur Sadar', NULL, NULL, 1, 0, 0, NULL),
(27, 'test title 3', 'test-title-3', 10, 23, 105, NULL, 100.00, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam eu egestas tellus. Maecenas consectetur libero non velit laoreet posuere. Nulla sit amet volutpat augue. Quisque malesuada vulputate ligula, non vehicula eros porttitor ut. Etiam mattis, leo vel ornare tincidunt, mi mauris aliquam magna, sit amet consectetur nibh tortor sed leo. In vel sollicitudin urna. Duis in lectus vel ipsum laoreet cursus ut sit amet orci. Aenean tincidunt elementum nunc, nec efficitur risus consectetur consequat.</p>', '123456789', 0, NULL, 'uploads/addss_image/1671288020_639dd4d441f76.jpg', 'active', 1, 'no', 0, 5, 0, NULL, '2022-12-18 01:40:20', '2022-12-19 13:00:41', 'mawna', NULL, NULL, NULL, 'Gazipur', NULL, NULL, 1, NULL, NULL, ''),
(28, 'BMW Blue Coupe', 'bmw-blue-coupe', 11, 1, 7, NULL, 260000.00, '<p><em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.</p>', NULL, 0, NULL, 'uploads/addss_image/1671355088_639edad006004.jpeg', 'active', 1, 'no', 0, 5, 0, NULL, '2022-12-18 20:18:08', '2022-12-19 17:37:50', 'Banani', NULL, NULL, NULL, 'Dhaka', NULL, NULL, 1, 0, 0, NULL),
(29, 'Samsung Led TV', 'samsung-led-tv', 11, 4, 33, NULL, 16500.00, '<p><em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.</p>', NULL, 0, NULL, 'uploads/addds_image/1671356367_639edfcf9c978.jpg', 'active', 0, 'no', 0, 5, 0, NULL, '2022-12-18 20:34:04', '2022-12-20 09:43:26', 'Saturiya', NULL, NULL, NULL, 'Manikgonj', NULL, NULL, 1, 0, 0, NULL),
(30, 'Dream House', 'dream-house', 11, 2, 58, NULL, 56230.00, '<p><em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.</p>', NULL, 0, NULL, 'uploads/addss_image/1671357318_639ee38641d03.jpg', 'active', 0, 'no', 0, 4, 0, NULL, '2022-12-18 20:53:29', '2022-12-20 09:43:22', 'Khaliya', NULL, NULL, NULL, 'Khulna', NULL, NULL, 1, 0, 0, NULL),
(31, 'Premium Sunglass', 'premium-sunglass', 11, 21, 91, NULL, 450.00, '<p><em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.</p>', NULL, 0, NULL, 'uploads/addss_image/1671360965_639ef1c5ca25a.png', 'active', 1, 'no', 0, 3, 0, NULL, '2022-12-18 21:56:05', '2022-12-20 09:43:24', 'Saturiya', NULL, NULL, NULL, 'Manikgonj', NULL, NULL, 1, NULL, NULL, ''),
(34, 'Accountant', 'accountant', 11, 10, 162, NULL, 12000.00, '<p><em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.<em>Lorem ipsum</em>&nbsp;is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.</p>', NULL, 0, NULL, 'uploads/addss_image/1671364325_639efee508d48.jpg', 'active', 1, 'no', 0, 2, 0, NULL, '2022-12-18 22:52:05', '2022-12-19 17:37:46', 'Farmgate', NULL, NULL, NULL, 'Dhaka', NULL, NULL, 1, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `ad_features`
--

CREATE TABLE `ad_features` (
  `id` bigint UNSIGNED NOT NULL,
  `ad_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ad_features`
--

INSERT INTO `ad_features` (`id`, `ad_id`, `name`, `created_at`, `updated_at`) VALUES
(10, 3, 'Good', '2022-12-01 21:11:11', '2022-12-01 21:11:11'),
(11, 4, 'More versatile', '2022-12-01 22:16:38', '2022-12-01 22:16:38'),
(23, 8, NULL, '2022-12-10 21:29:45', '2022-12-10 21:29:45');

-- --------------------------------------------------------

--
-- Table structure for table `ad_galleries`
--

CREATE TABLE `ad_galleries` (
  `id` bigint UNSIGNED NOT NULL,
  `ad_id` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ad_galleries`
--

INSERT INTO `ad_galleries` (`id`, `ad_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'uploads/adds_multiple/1669796314_638711da779b8.jpg', '2022-11-30 19:18:34', '2022-11-30 19:18:34'),
(2, 2, 'uploads/adds_multiple/1669796666_6387133a7507b.jpg', '2022-11-30 19:24:26', '2022-11-30 19:24:26'),
(3, 3, 'uploads/adds_multiple/1669889337_63887d3984f8c.jpg', '2022-12-01 21:08:57', '2022-12-01 21:08:57'),
(4, 5, 'uploads/adds_multiple/1670069894_638b3e86d3980.jpeg', '2022-12-03 23:18:14', '2022-12-03 23:18:14'),
(5, 6, 'uploads/adds_multiple/1670071007_638b42df066db.jpg', '2022-12-03 23:36:47', '2022-12-03 23:36:47'),
(6, 7, 'uploads/adds_multiple/1670071538_638b44f2ee914.jpg', '2022-12-03 23:45:38', '2022-12-03 23:45:38'),
(7, 8, 'uploads/adds_multiple/1670668185_63945f99a63ad.jpeg', '2022-12-10 21:29:45', '2022-12-10 21:29:45'),
(8, 9, 'uploads/adds_multiple/1671015060_6399aa9468d2e.jpg', '2022-12-14 21:51:00', '2022-12-14 21:51:00'),
(9, 10, 'uploads/adds_multiple/1671078130_639aa0f258620.jpg', '2022-12-15 15:22:10', '2022-12-15 15:22:10'),
(10, 11, 'uploads/adds_multiple/1671078562_639aa2a2088f7.jpg', '2022-12-15 15:29:22', '2022-12-15 15:29:22'),
(11, 12, 'uploads/adds_multiple/1671079555_639aa6830bd0f.jpg', '2022-12-15 15:45:55', '2022-12-15 15:45:55'),
(12, 13, 'uploads/adds_multiple/1671087852_639ac6ece7607.jpg', '2022-12-15 18:04:12', '2022-12-15 18:04:12'),
(13, 14, 'uploads/adds_multiple/1671088462_639ac94ec5bfe.jpg', '2022-12-15 18:14:22', '2022-12-15 18:14:22'),
(14, 15, 'uploads/adds_multiple/1671088877_639acaed58743.jpg', '2022-12-15 18:21:17', '2022-12-15 18:21:17'),
(15, 16, 'uploads/adds_multiple/1671089173_639acc153fbc9.jpg', '2022-12-15 18:26:13', '2022-12-15 18:26:13'),
(16, 17, 'uploads/adds_multiple/1671090882_639ad2c22e40c.jpg', '2022-12-15 18:54:42', '2022-12-15 18:54:42'),
(17, 18, 'uploads/adds_multiple/1671106587_639b101b3df92.jpg', '2022-12-15 23:16:27', '2022-12-15 23:16:27'),
(18, 19, 'uploads/adds_multiple/1671107049_639b11e9cd000.jpg', '2022-12-15 23:24:09', '2022-12-15 23:24:09'),
(19, 20, 'uploads/adds_multiple/1671109013_639b199563f3a.jpg', '2022-12-15 23:56:53', '2022-12-15 23:56:53'),
(20, 21, 'uploads/adds_multiple/1671109891_639b1d0349ba1.jpg', '2022-12-16 00:11:31', '2022-12-16 00:11:31'),
(21, 22, 'uploads/adds_multiple/1671110461_639b1f3d635c7.png', '2022-12-16 00:21:01', '2022-12-16 00:21:01'),
(22, 23, 'uploads/adds_multiple/1671111652_639b23e47d3e6.png', '2022-12-16 00:40:52', '2022-12-16 00:40:52'),
(23, 24, 'uploads/adds_multiple/1671112161_639b25e16a4df.png', '2022-12-16 00:49:21', '2022-12-16 00:49:21'),
(24, 25, 'uploads/adds_multiple/1671270514_639d9072ccf1f.jpg', '2022-12-17 20:48:34', '2022-12-17 20:48:34'),
(25, 26, 'uploads/adds_multiple/1671270633_639d90e94c2b0.jpg', '2022-12-17 20:50:33', '2022-12-17 20:50:33'),
(26, 27, 'uploads/adds_multiple/1671288020_639dd4d4430e0.jpg', '2022-12-18 01:40:20', '2022-12-18 01:40:20'),
(27, 28, 'uploads/adds_multiple/1671355088_639edad007aa1.jpeg', '2022-12-18 20:18:08', '2022-12-18 20:18:08'),
(28, 29, 'uploads/adds_multiple/1671356044_639ede8c9094b.jpg', '2022-12-18 20:34:04', '2022-12-18 20:34:04'),
(29, 30, 'uploads/adds_multiple/1671357318_639ee386431a0.jpg', '2022-12-18 20:55:18', '2022-12-18 20:55:18'),
(30, 31, 'uploads/adds_multiple/1671360965_639ef1c5cbdbf.png', '2022-12-18 21:56:05', '2022-12-18 21:56:05'),
(31, 32, 'uploads/adds_multiple/1671362002_639ef5d236936.jpg', '2022-12-18 22:13:22', '2022-12-18 22:13:22'),
(32, 33, 'uploads/adds_multiple/1671362291_639ef6f328299.jpg', '2022-12-18 22:18:11', '2022-12-18 22:18:11'),
(33, 34, 'uploads/adds_multiple/1671364325_639efee50a028.jpg', '2022-12-18 22:52:05', '2022-12-18 22:52:05');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Own', 'own', '2022-10-24 22:28:35', '2022-12-01 22:04:11'),
(2, 'Other', 'other', '2022-10-26 15:22:53', '2022-12-01 22:03:51'),
(6, 'Akij', 'akij', '2022-12-14 22:11:00', '2022-12-14 22:11:00'),
(7, 'Alfa Romeo', 'alfa-romeo', '2022-12-14 22:11:11', '2022-12-14 22:11:11'),
(8, 'Audi', 'audi', '2022-12-14 22:11:30', '2022-12-14 22:11:30'),
(9, 'BAIC', 'baic', '2022-12-14 22:11:47', '2022-12-14 22:11:47'),
(10, 'BMW', 'bmw', '2022-12-14 22:11:55', '2022-12-14 22:11:55'),
(11, 'Buick', 'buick', '2022-12-14 22:12:04', '2022-12-14 22:12:04'),
(12, 'Cadillac', 'cadillac', '2022-12-14 22:12:14', '2022-12-14 22:12:14'),
(13, 'Changan', 'changan', '2022-12-14 22:12:23', '2022-12-14 22:12:23'),
(14, 'Chery', 'chery', '2022-12-14 22:12:33', '2022-12-14 22:12:33'),
(15, 'Chevrolet', 'chevrolet', '2022-12-14 22:12:44', '2022-12-14 22:12:44'),
(16, 'Chrysler', 'chrysler', '2022-12-14 22:12:51', '2022-12-14 22:12:51'),
(17, 'Citroen', 'citroen', '2022-12-14 22:13:03', '2022-12-14 22:13:03'),
(18, 'Daewoo', 'daewoo', '2022-12-14 22:13:13', '2022-12-14 22:13:13'),
(19, 'Daihatsu', 'daihatsu', '2022-12-14 22:13:24', '2022-12-14 22:13:24'),
(20, 'Datsun', 'datsun', '2022-12-14 22:13:37', '2022-12-14 22:13:37');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_show_brand` int NOT NULL DEFAULT '1' COMMENT '1=yes 0=no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `slug`, `icon`, `order`, `status`, `is_show_brand`, `created_at`, `updated_at`) VALUES
(1, 'Vehicles', 'uploads/category/yDYvJkToJswxYpllag2hPXVUW8jU1uLVvvBfQUY7.jpg', 'vehicles', 'fas fa-car', 0, 1, 0, '2022-10-24 22:25:27', '2022-12-03 23:16:08'),
(2, 'Property', 'uploads/category/WYe7Egr7z0MZZ7aSffjj3fXQYawPlGTz1mmxwgO2.jpg', 'property', 'fas fa-landmark', 0, 1, 1, '2022-10-26 14:47:30', '2022-12-01 21:14:09'),
(3, 'Mobile phones & tablets', 'uploads/category/jTcOLORUxrxWzSoA7GEeA0cWQppfAxKH1nNYtqhg.jpg', 'mobile-phones-tablets', 'fas fa-mobile-alt', 0, 1, 1, '2022-10-26 14:48:43', '2022-12-01 21:15:37'),
(4, 'Electronics', 'uploads/category/FkpaXbBaDA6lE2XofGQ0cQYXazaVjnQVCSIOERqf.jpg', 'electronics', 'fas fa-battery-half', 0, 1, 1, '2022-10-26 14:49:26', '2022-12-01 21:16:48'),
(5, 'Fashion', 'uploads/category/hwCG4aNWKaqLIs7ueS3p5NUI0L8fG0S2VEI3hAtc.jpg', 'fashion', 'fas fa-ad', 0, 1, 1, '2022-10-26 14:50:05', '2022-10-26 14:50:05'),
(6, 'Home, Furniture and Appliances', 'uploads/category/90SQ4WvzOEltJia6HeLbyxvQaI4ktkXmBALTvMm4.jpg', 'home-furniture-and-appliances', 'fas fa-home', 0, 1, 1, '2022-10-26 18:20:07', '2022-10-26 18:20:07'),
(7, 'Health & Beauty', 'uploads/category/K6wguddC1bfvRZuRdO6mGZbUhKeLgatzDWbswXO6.jpg', 'health-beauty', 'fas fa-beer', 0, 1, 1, '2022-10-26 18:20:57', '2022-12-01 21:34:49'),
(8, 'Sports, Arts and Outdoors', 'uploads/category/U3zmSgRMAPpYrX44ZVabJbWGuF2Jg8NWdBEif1Lf.jpg', 'sports-arts-and-outdoors', 'fas fa-passport', 0, 1, 1, '2022-10-26 18:21:35', '2022-10-26 18:21:35'),
(9, 'Services', 'uploads/category/xjsu7e1FKhbbxGtYGURCRrSD5PYODXkAn2W7SWmX.jpg', 'services', 'fas fa-server', 0, 1, 1, '2022-10-26 18:22:08', '2022-10-26 18:22:08'),
(10, 'Jobs', 'uploads/category/2QQYf49mkgM0Nx4AJnk8OVdg8HOeFGxRb3BSOVcV.png', 'jobs', 'fab fa-joomla', 0, 1, 1, '2022-10-26 18:22:43', '2022-10-26 18:22:43'),
(11, 'Babies and Kids', 'uploads/category/0iEzhnSFTCluF6wEHTqf4yshsbYg2dpjkZjoqCAB.jpg', 'babies-and-kids', 'fab fa-kickstarter-k', 0, 1, 1, '2022-10-26 18:23:22', '2022-10-26 18:23:22'),
(14, 'Repair and Construction', 'uploads/category/LrruQbG3yO1IHS9KLUNvDd0d0ehpDYg8DSbSlGWI.png', 'repair-and-construction', 'fab fa-autoprefixer', 0, 1, 1, '2022-10-26 18:25:52', '2022-10-26 18:25:52'),
(15, 'Commercial equipment and tools', 'uploads/category/1UiPcEAOham1RKHRS1pveysdsc4zqhrw0qC8LaQH.jpg', 'commercial-equipment-and-tools', 'fas fa-comment-slash', 0, 1, 1, '2022-10-26 18:26:38', '2022-10-26 18:26:38'),
(16, 'Phone', 'uploads/category/5GWv52yhhJb3lTA2QM1uEYgHrCe55qbjRE4WHqwV.jpg', 'phone', 'fas fa-mobile-alt', 0, 1, 1, '2022-12-04 00:36:08', '2022-12-04 00:36:08'),
(17, 'Mobiles', 'uploads/category/8zYmYseyRCYGB8CYDIsR7Gb2XTWbDQ1m2tVYvFHh.jpg', 'mobiles', 'fas fa-mobile-alt', 0, 1, 1, '2022-12-13 15:34:11', '2022-12-13 15:34:11'),
(18, 'Home & Living', 'uploads/category/BhIbj3rotDw7zpZ05HcP0yLtB2I9eGoQrT8UF6JY.jpg', 'home-living', 'fas fa-home', 0, 1, 0, '2022-12-13 15:35:50', '2022-12-13 15:35:50'),
(19, 'Pets & Animals', 'uploads/category/lqd1CrQb8XW2jW6PnV4ubesZPX1VqeERNXtfb4P0.jpg', 'pets-animals', 'fab fa-wolf-pack-battalion', 0, 1, 0, '2022-12-13 15:37:10', '2022-12-13 15:37:10'),
(20, 'Hobbies, Sports & Kids', 'uploads/category/w264Mn1qJHks0HjjYMEURkPxMiS04TWjy2W58dey.jpg', 'hobbies-sports-kids', 'fas fa-football-ball', 0, 1, 1, '2022-12-13 15:38:31', '2022-12-13 15:38:31'),
(21, 'Men\'s Fashion & Grooming', 'uploads/category/7gi19aNWS9uuAi2ZDAFVDehCZENXMM7ErrzToKME.jpg', 'mens-fashion-grooming', 'fas fa-tshirt', 0, 1, 1, '2022-12-13 15:39:28', '2022-12-13 15:39:28'),
(22, 'Women\'s Fashion & Beauty', 'uploads/category/bQH21VRYqCGRAxUc4OTpgsb6GlqzQFAFnFBu3hbB.jpg', 'womens-fashion-beauty', 'fas fa-paint-brush', 0, 1, 1, '2022-12-13 15:41:48', '2022-12-13 15:41:48'),
(23, 'Business & Industry', 'uploads/category/AaoDMarb7rV9rLqF0NAyexqbikbGZ1520jJNFCXq.jpg', 'business-industry', 'fas fa-industry', 0, 1, 0, '2022-12-13 15:42:55', '2022-12-13 15:42:55'),
(24, 'Essentials', 'uploads/category/ECBoPaANcPEisj1mmSOiT1tEtOgioK82SjdB2y7P.jpg', 'essentials', 'fas fa-box', 0, 1, 0, '2022-12-13 15:43:46', '2022-12-13 15:43:46'),
(25, 'Education', 'uploads/category/PX1qP47hn7fZsLtZkj7ueQvGmij9HC9MAEXZRTpo.jpg', 'education', 'fas fa-school', 0, 1, 0, '2022-12-13 15:44:36', '2022-12-13 15:44:36'),
(26, 'Agriculture', 'uploads/category/0MOWx2SAnkocYdcSUq6LvMoTfcYjPKMt9BJSfpBn.jpg', 'agriculture', 'fab fa-angrycreative', 0, 1, 0, '2022-12-13 15:48:58', '2022-12-13 15:48:58'),
(27, 'Overseas Jobs', 'uploads/category/27yXi8dyUUPNPjW8SjYIr6pCOnceMUTrHR68o0Ql.jpg', 'overseas-jobs', 'fas fa-briefcase', 0, 1, 0, '2022-12-13 15:49:42', '2022-12-13 15:49:42');

-- --------------------------------------------------------

--
-- Table structure for table `category_custom_field`
--

CREATE TABLE `category_custom_field` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `custom_field_id` bigint UNSIGNED NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_custom_field`
--

INSERT INTO `category_custom_field` (`id`, `category_id`, `custom_field_id`, `order`, `created_at`, `updated_at`) VALUES
(17, 17, 2, 0, NULL, NULL),
(18, 17, 3, 0, NULL, NULL),
(19, 17, 4, 0, NULL, NULL),
(20, 4, 5, 0, NULL, NULL),
(22, 4, 6, 0, NULL, NULL),
(23, 4, 7, 0, NULL, NULL),
(24, 4, 8, 0, NULL, NULL),
(25, 4, 9, 0, NULL, NULL),
(26, 17, 5, 0, NULL, NULL),
(28, 1, 10, 0, NULL, NULL),
(29, 1, 11, 0, NULL, NULL),
(30, 1, 12, 0, NULL, NULL),
(31, 1, 13, 0, NULL, NULL),
(32, 1, 14, 0, NULL, NULL),
(33, 1, 15, 0, NULL, NULL),
(34, 1, 16, 0, NULL, NULL),
(35, 1, 17, 0, NULL, NULL),
(36, 2, 18, 0, NULL, NULL),
(37, 2, 19, 0, NULL, NULL),
(38, 2, 20, 0, NULL, NULL),
(39, 2, 21, 0, NULL, NULL),
(40, 2, 22, 0, NULL, NULL),
(41, 2, 23, 0, NULL, NULL),
(42, 2, 24, 0, NULL, NULL),
(43, 2, 25, 0, NULL, NULL),
(45, 18, 26, 0, NULL, NULL),
(46, 1, 27, 0, NULL, NULL),
(48, 21, 28, 0, NULL, NULL),
(50, 22, 29, 0, NULL, NULL),
(51, 19, 30, 0, NULL, NULL),
(53, 20, 31, 0, NULL, NULL),
(55, 25, 32, 0, NULL, NULL),
(56, 25, 33, 0, NULL, NULL),
(57, 24, 34, 0, NULL, NULL),
(58, 9, 35, 0, NULL, NULL),
(59, 26, 36, 0, NULL, NULL),
(60, 10, 37, 0, NULL, NULL),
(61, 10, 38, 0, NULL, NULL),
(62, 10, 39, 0, NULL, NULL),
(63, 10, 40, 0, NULL, NULL),
(64, 10, 41, 0, NULL, NULL),
(65, 10, 42, 0, NULL, NULL),
(66, 10, 43, 0, NULL, NULL),
(67, 10, 44, 0, NULL, NULL),
(68, 10, 45, 0, NULL, NULL),
(70, 10, 47, 0, NULL, NULL),
(74, 27, 51, 0, NULL, NULL),
(75, 27, 52, 0, NULL, NULL),
(77, 27, 54, 0, NULL, NULL),
(78, 27, 55, 0, NULL, NULL),
(79, 27, 56, 0, NULL, NULL),
(80, 27, 57, 0, NULL, NULL),
(81, 27, 58, 0, NULL, NULL),
(82, 27, 59, 0, NULL, NULL),
(83, 21, 60, 0, NULL, NULL),
(84, 22, 61, 0, NULL, NULL),
(85, 23, 62, 0, NULL, NULL),
(86, 20, 63, 0, NULL, NULL),
(87, 18, 64, 0, NULL, NULL),
(88, 4, 65, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

CREATE TABLE `cms` (
  `id` bigint UNSIGNED NOT NULL,
  `home_main_banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_counter_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_mobile_app_banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `download_app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `newsletter_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membership_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_ads` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_earning` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `about_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_video_thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `privacy_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contact_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `get_membership_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `get_membership_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pricing_plan_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faq_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faq_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manage_ads_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chat_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified_user_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_overview_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_post_ads_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_my_ads_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_plan_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_account_setting_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_favorite_ads_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_messenger_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posting_rules_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posting_rules_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `blog_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ads_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coming_soon_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coming_soon_subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maintenance_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maintenance_subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e404_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e404_subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e404_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e500_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e500_subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e500_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e503_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e503_subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e503_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`id`, `home_main_banner`, `home_counter_background`, `home_mobile_app_banner`, `home_title`, `home_description`, `download_app`, `newsletter_content`, `membership_content`, `create_account`, `post_ads`, `start_earning`, `terms_background`, `terms_body`, `about_background`, `about_video_thumb`, `about_body`, `privacy_background`, `privacy_body`, `contact_background`, `contact_number`, `contact_email`, `contact_address`, `get_membership_background`, `get_membership_image`, `pricing_plan_background`, `faq_background`, `faq_content`, `manage_ads_content`, `chat_content`, `verified_user_content`, `dashboard_overview_background`, `dashboard_post_ads_background`, `dashboard_my_ads_background`, `dashboard_plan_background`, `dashboard_account_setting_background`, `dashboard_favorite_ads_background`, `dashboard_messenger_background`, `posting_rules_background`, `posting_rules_body`, `blog_background`, `ads_background`, `coming_soon_title`, `coming_soon_subtitle`, `maintenance_title`, `maintenance_subtitle`, `e404_title`, `e404_subtitle`, `e404_image`, `e500_title`, `e500_subtitle`, `e500_image`, `e503_title`, `e503_subtitle`, `e503_image`, `created_at`, `updated_at`) VALUES
(1, 'uploads/banners/o4zEERTXVrO5uwifXs1GmdzaeVKYVOeru52PivC1.jpg', NULL, NULL, 'Buy & Sell anything in Kenya', 'Buy and Sell NEW & USED Items', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br>&nbsp;</p>', NULL, 'uploads/banners/DSOVpts5q3TEHWU9ty98jhFnoBnoDARrqVomHGgT.png', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br>&nbsp;</p>', NULL, '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br>&nbsp;</p><p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br>&nbsp;</p>', NULL, '0787 300 000', 'info@dukaletu.co.ke', 'Kenya', NULL, NULL, NULL, NULL, 'Praesent Finibus Dictum Nisl Sit Amet Vulputate. Fusce A Metus Eu Velit Posuere Semper A Bibendum Ante. Donec Eu Tellus Dapibus, Semper Orci Eget, Commodo Lacu Praesent Ullamcorper.', 'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Etiam Commodo Vel Ligula.', 'Class Aptent Taciti Sociosqu Ad Litora Torquent Per Conubia Nostra, Per Inceptos Himenaeos.', 'Class Aptent Taciti Sociosqu Ad Litora Torquent Per Conubia Nostra, Per Inceptos Himenaeos.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p>Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit. Mauris Eu Aliquet Odio. Nulla Pretium Congue Eros, Nec Rhoncus Mi<p>', NULL, NULL, NULL, NULL, NULL, NULL, 'Opps! Page Not Found!', 'Something went wrong. It\'s look like the link is broken or the page is removed.', 'frontend/images/bg/error.png', 'Internal Server Error', 'Something went wrong. It\'s look like the Internal Server has some errors.', 'frontend/default_images/error-banner.png', 'Service Unavailable', 'Something went wrong. It\'s look like the Internal Server has some errors.', 'frontend/default_images/error-banner.png', '2022-08-19 23:31:12', '2022-12-10 21:33:19');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Ziaur Rahman', 'ziariyad018@gmail.com', 'Buy', 'Please help product buy', '2022-11-27 16:43:47', '2022-11-27 16:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `cookies`
--

CREATE TABLE `cookies` (
  `id` bigint UNSIGNED NOT NULL,
  `allow_cookies` tinyint(1) NOT NULL DEFAULT '1',
  `cookie_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gdpr_cookie',
  `cookie_expiration` tinyint NOT NULL DEFAULT '30',
  `force_consent` tinyint(1) NOT NULL DEFAULT '0',
  `darkmode` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `approve_button_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `decline_button_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'left',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `symbol_position`, `created_at`, `updated_at`) VALUES
(1, 'Kenyan Shilling', 'KSH', 'KSh.', 'left', '2022-08-19 23:31:12', '2022-11-22 06:45:50');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint UNSIGNED NOT NULL,
  `custom_field_group_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('text','textarea','select','radio','file','url','number','date','checkbox','checkbox_multiple') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `filterable` tinyint(1) NOT NULL DEFAULT '0',
  `listable` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fas fa-cube',
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `custom_field_group_id`, `name`, `slug`, `type`, `required`, `filterable`, `listable`, `icon`, `order`, `created_at`, `updated_at`) VALUES
(2, 3, 'Condition', 'condition', 'radio', 1, 1, 1, 'fas fa-bomb', 0, '2022-12-13 17:25:17', '2022-12-15 18:49:53'),
(3, 3, 'Authenticity', 'authenticity', 'radio', 0, 1, 1, 'fab fa-autoprefixer', 0, '2022-12-13 17:32:30', '2022-12-13 17:34:09'),
(4, 3, 'Model', 'model', 'select', 0, 1, 1, 'fas fa-mobile', 0, '2022-12-13 17:43:59', '2022-12-15 16:35:34'),
(5, 2, 'Item Type', 'item-type', 'select', 0, 1, 1, 'fas fa-charging-station', 0, '2022-12-13 19:27:18', '2022-12-18 20:31:39'),
(6, 2, 'Model', 'model', 'select', 1, 1, 1, 'fas fa-laptop', 0, '2022-12-13 19:36:53', '2022-12-18 20:35:59'),
(7, 2, 'RAM', 'ram', 'select', 0, 1, 1, 'fas fa-laptop', 0, '2022-12-13 19:41:11', '2022-12-13 19:41:11'),
(8, 2, 'Processor', 'processor', 'select', 0, 1, 1, 'fas fa-bomb', 0, '2022-12-13 19:45:51', '2022-12-13 19:45:51'),
(9, 2, 'HDD', 'hdd', 'select', 0, 1, 1, 'fas fa-bomb', 0, '2022-12-13 19:48:22', '2022-12-13 19:48:22'),
(10, 4, 'Model', 'model', 'select', 1, 1, 1, 'fas fa-bus', 0, '2022-12-13 20:09:52', '2022-12-15 23:37:09'),
(11, 4, 'Trim / Edition', 'trim-edition', 'text', 0, 1, 1, 'fas fa-bus', 0, '2022-12-13 20:11:18', '2022-12-13 20:12:10'),
(12, 4, 'Year of Manufacture', 'year-of-manufacture', 'number', 1, 1, 1, 'fas fa-bus', 0, '2022-12-13 20:13:06', '2022-12-13 20:14:45'),
(13, 4, 'Kilometers run (km)', 'kilometers-run-km', 'number', 1, 1, 1, 'fas fa-bus-alt', 0, '2022-12-13 20:15:33', '2022-12-13 20:15:33'),
(14, 4, 'Engine capacity (cc)', 'engine-capacity-cc', 'number', 1, 1, 1, 'fas fa-bus', 0, '2022-12-13 20:16:08', '2022-12-13 20:16:08'),
(15, 4, 'Fuel type', 'fuel-type', 'checkbox_multiple', 1, 0, 1, 'fas fa-bus', 0, '2022-12-13 20:18:32', '2022-12-13 20:18:32'),
(16, 4, 'Transmission', 'transmission', 'radio', 0, 1, 1, 'fas fa-bus', 0, '2022-12-13 20:21:26', '2022-12-13 20:21:26'),
(17, 4, 'Registration year', 'registration-year', 'number', 1, 1, 1, 'fas fa-bus', 0, '2022-12-13 20:22:02', '2022-12-13 20:22:02'),
(18, 5, 'Land type', 'land-type', 'checkbox_multiple', 1, 1, 1, 'fas fa-landmark', 0, '2022-12-13 20:30:30', '2022-12-14 15:58:00'),
(19, 5, 'Land size', 'land-size', 'number', 1, 1, 1, 'fas fa-landmark', 0, '2022-12-13 20:31:56', '2022-12-13 20:31:56'),
(20, 5, 'Unit', 'unit', 'select', 1, 1, 1, 'fas fa-landmark', 0, '2022-12-13 20:33:53', '2022-12-13 20:33:53'),
(21, 5, 'Bedrooms', 'bedrooms', 'select', 0, 1, 1, 'fas fa-landmark', 0, '2022-12-13 20:37:09', '2022-12-13 20:40:00'),
(22, 5, 'Bathrooms', 'bathrooms', 'select', 0, 1, 1, 'fas fa-landmark', 0, '2022-12-13 20:38:17', '2022-12-13 20:38:17'),
(23, 5, 'Size (sqft)', 'size-sqft', 'number', 0, 1, 1, 'fas fa-landmark', 0, '2022-12-13 20:41:30', '2022-12-13 20:41:30'),
(24, 5, 'Facing', 'facing', 'select', 0, 1, 1, 'fas fa-landmark', 0, '2022-12-13 20:42:48', '2022-12-13 20:42:48'),
(25, 5, 'Completion Status', 'completion-status', 'radio', 0, 1, 1, 'fas fa-landmark', 0, '2022-12-13 20:44:07', '2022-12-13 20:44:07'),
(26, 6, 'Furniture type', 'furniture-type', 'select', 1, 1, 1, 'fas fa-archive', 0, '2022-12-13 20:54:28', '2022-12-13 20:54:28'),
(27, 4, 'Condition', 'condition', 'radio', 1, 1, 1, 'fas fa-bus', 0, '2022-12-13 20:58:36', '2022-12-13 20:58:36'),
(28, 7, 'Item Type', 'item-type', 'select', 1, 1, 1, 'fas fa-tshirt', 0, '2022-12-13 21:14:09', '2022-12-13 21:30:40'),
(29, 8, 'Item Type', 'item-type', 'select', 1, 1, 1, 'fas fa-tshirt', 0, '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(30, 9, 'Type Of Animals', 'type-of-animals', 'select', 1, 1, 1, 'fab fa-wolf-pack-battalion', 0, '2022-12-13 21:56:47', '2022-12-13 21:56:47'),
(31, 10, 'Item Type', 'item-type', 'select', 1, 1, 1, 'fas fa-bomb', 0, '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(32, 11, 'Condition', 'condition', 'radio', 0, 1, 1, 'fas fa-bomb', 0, '2022-12-14 15:43:39', '2022-12-14 15:43:39'),
(33, 11, 'Book Type', 'book-type', 'radio', 0, 1, 1, 'fas fa-bomb', 0, '2022-12-14 15:47:03', '2022-12-14 15:47:03'),
(34, 12, 'Type', 'type', 'select', 1, 1, 1, 'fas fa-bomb', 0, '2022-12-14 16:10:30', '2022-12-14 16:10:30'),
(35, 13, 'Service Type', 'service-type', 'select', 1, 1, 1, 'fab fa-servicestack', 0, '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(36, 14, 'Condition', 'condition', 'radio', 0, 1, 1, 'fas fa-ankh', 0, '2022-12-14 16:52:52', '2022-12-14 16:52:52'),
(37, 15, 'Role', 'role', 'select', 1, 1, 1, 'fas fa-briefcase', 0, '2022-12-14 18:12:53', '2022-12-19 21:08:32'),
(38, 15, 'Job Type', 'job-type', 'select', 1, 1, 1, 'fas fa-briefcase', 0, '2022-12-14 19:53:19', '2022-12-14 19:53:19'),
(39, 15, 'How do you want to receive applications?', 'how-do-you-want-to-receive-applications', 'checkbox_multiple', 1, 1, 1, 'fas fa-briefcase', 0, '2022-12-14 19:58:59', '2022-12-14 19:58:59'),
(40, 15, 'Required work experience (years)', 'required-work-experience-years', 'number', 1, 1, 1, 'fas fa-briefcase', 0, '2022-12-14 20:00:57', '2022-12-14 20:00:57'),
(41, 15, 'Required education', 'required-education', 'select', 1, 1, 1, 'fas fa-briefcase', 0, '2022-12-14 20:04:30', '2022-12-14 20:04:30'),
(42, 15, 'Salary per month ( From)', 'salary-per-month-from', 'number', 1, 1, 1, 'fas fa-briefcase', 0, '2022-12-14 20:06:52', '2022-12-18 22:29:12'),
(43, 15, 'Salary per month ( To)', 'salary-per-month-to', 'number', 1, 1, 1, 'fas fa-briefcase', 0, '2022-12-14 20:07:51', '2022-12-18 22:29:42'),
(44, 15, 'Application deadline (optional)', 'application-deadline-optional', 'date', 0, 1, 1, 'fas fa-briefcase', 0, '2022-12-14 20:08:51', '2022-12-14 20:08:51'),
(45, 15, 'Employer Name', 'employer-name', 'text', 1, 1, 1, 'fas fa-briefcase', 0, '2022-12-14 20:10:01', '2022-12-14 20:10:01'),
(47, 15, 'Attach logo (optional)', 'attach-logo-optional', 'file', 0, 1, 1, 'fas fa-briefcase', 0, '2022-12-14 20:12:44', '2022-12-14 20:12:44'),
(51, 16, 'Industry', 'industry', 'select', 1, 1, 1, 'fas fa-briefcase', 0, '2022-12-14 21:35:23', '2022-12-14 21:35:23'),
(52, 16, 'Apply via', 'apply-via', 'text', 1, 1, 1, 'fas fa-briefcase', 0, '2022-12-14 21:36:01', '2022-12-14 21:36:01'),
(54, 16, 'Job type', 'job-type', 'select', 1, 1, 1, 'fas fa-briefcase', 0, '2022-12-14 21:38:31', '2022-12-14 21:38:31'),
(55, 16, 'Application deadline (optional)', 'application-deadline-optional', 'date', 0, 1, 1, 'fas fa-briefcase', 0, '2022-12-14 21:39:08', '2022-12-14 21:39:08'),
(56, 16, 'Attach logo (optional)', 'attach-logo-optional', 'file', 0, 1, 1, 'fas fa-briefcase', 0, '2022-12-14 21:39:52', '2022-12-14 21:39:52'),
(57, 16, 'Salary', 'salary', 'number', 0, 1, 1, 'fas fa-briefcase', 0, '2022-12-14 21:40:31', '2022-12-14 21:41:28'),
(58, 16, 'Unit', 'unit', 'select', 0, 1, 1, 'fas fa-briefcase', 0, '2022-12-14 21:43:44', '2022-12-14 21:43:44'),
(59, 16, 'Negotiable', 'negotiable', 'checkbox', 0, 1, 1, 'fas fa-briefcase', 0, '2022-12-14 21:45:14', '2022-12-14 21:45:14'),
(60, 7, 'Condition', 'condition', 'radio', 1, 1, 1, 'fas fa-bomb', 0, '2022-12-15 17:57:12', '2022-12-15 17:57:12'),
(61, 8, 'Condition', 'condition', 'radio', 1, 1, 1, 'fas fa-bomb', 0, '2022-12-15 18:10:22', '2022-12-15 18:10:22'),
(62, 17, 'Condition', 'condition', 'radio', 0, 1, 1, 'fas fa-bomb', 0, '2022-12-15 18:19:03', '2022-12-15 18:19:03'),
(63, 10, 'Condition', 'condition', 'radio', 1, 1, 1, 'fas fa-bomb', 0, '2022-12-15 18:24:00', '2022-12-15 18:24:00'),
(64, 6, 'Condition', 'condition', 'radio', 1, 1, 1, 'fas fa-bomb', 0, '2022-12-15 18:33:24', '2022-12-15 18:33:24'),
(65, 2, 'Condition', 'condition', 'radio', 1, 1, 1, 'fas fa-bomb', 0, '2022-12-15 18:50:37', '2022-12-15 18:50:37');

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_groups`
--

CREATE TABLE `custom_field_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_field_groups`
--

INSERT INTO `custom_field_groups` (`id`, `name`, `slug`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Ad Details', 'ad-details', 0, '2022-12-10 19:49:53', '2022-12-10 19:49:53'),
(2, 'Electronics', 'electronics', 0, '2022-12-13 17:03:36', '2022-12-13 17:03:36'),
(3, 'Mobiles', 'mobiles', 0, '2022-12-13 17:22:59', '2022-12-13 17:22:59'),
(4, 'Vehicles', 'vehicles', 0, '2022-12-13 20:05:41', '2022-12-13 20:05:41'),
(5, 'Property', 'property', 0, '2022-12-13 20:27:43', '2022-12-13 20:27:43'),
(6, 'Home & Living', 'home-living', 0, '2022-12-13 20:50:01', '2022-12-13 20:50:01'),
(7, 'Men\'s Fashion & Grooming', 'mens-fashion-grooming', 0, '2022-12-13 21:01:36', '2022-12-13 21:01:36'),
(8, 'Women Fashion & Beauty', 'women-fashion-beauty', 0, '2022-12-13 21:34:32', '2022-12-13 21:34:32'),
(9, 'Pets & Animals', 'pets-animals', 0, '2022-12-13 21:52:20', '2022-12-13 21:52:20'),
(10, 'Hobbies, Sports & Kids', 'hobbies-sports-kids', 0, '2022-12-13 22:03:00', '2022-12-13 22:03:00'),
(11, 'Education', 'education', 0, '2022-12-14 15:41:35', '2022-12-14 15:41:35'),
(12, 'Essentials', 'essentials', 0, '2022-12-14 15:54:08', '2022-12-14 15:54:08'),
(13, 'Services', 'services', 0, '2022-12-14 16:23:31', '2022-12-14 16:23:31'),
(14, 'Agriculture', 'agriculture', 0, '2022-12-14 16:50:03', '2022-12-14 16:50:03'),
(15, 'Jobs', 'jobs', 0, '2022-12-14 17:11:17', '2022-12-14 17:11:17'),
(16, 'Overseas Job', 'overseas-job', 0, '2022-12-14 20:35:34', '2022-12-14 20:35:34'),
(17, 'Business & Industry', 'business-industry', 0, '2022-12-15 18:17:49', '2022-12-15 18:17:49');

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` bigint UNSIGNED NOT NULL,
  `custom_field_id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_field_values`
--

INSERT INTO `custom_field_values` (`id`, `custom_field_id`, `value`, `created_at`, `updated_at`) VALUES
(14, 3, 'Original', '2022-12-13 17:34:09', '2022-12-13 17:34:09'),
(15, 3, 'Refurbished', '2022-12-13 17:34:09', '2022-12-13 17:34:09'),
(129, 7, 'None', '2022-12-13 19:41:11', '2022-12-13 19:41:11'),
(130, 7, '1 GB', '2022-12-13 19:41:11', '2022-12-13 19:41:11'),
(131, 7, '2 GB', '2022-12-13 19:41:11', '2022-12-13 19:41:11'),
(132, 7, '4 GB', '2022-12-13 19:41:11', '2022-12-13 19:41:11'),
(133, 7, '6 GB', '2022-12-13 19:41:11', '2022-12-13 19:41:11'),
(134, 7, '8 GB', '2022-12-13 19:41:11', '2022-12-13 19:41:11'),
(135, 7, '16 GB & Above', '2022-12-13 19:41:11', '2022-12-13 19:41:11'),
(136, 8, 'None', '2022-12-13 19:45:51', '2022-12-13 19:45:51'),
(137, 8, 'Dual Core', '2022-12-13 19:45:51', '2022-12-13 19:45:51'),
(138, 8, 'Quad Core', '2022-12-13 19:45:51', '2022-12-13 19:45:51'),
(139, 8, 'i3', '2022-12-13 19:45:51', '2022-12-13 19:45:51'),
(140, 8, 'i5', '2022-12-13 19:45:51', '2022-12-13 19:45:51'),
(141, 8, 'i7', '2022-12-13 19:45:51', '2022-12-13 19:45:51'),
(142, 8, 'i9', '2022-12-13 19:45:51', '2022-12-13 19:45:51'),
(143, 9, 'None', '2022-12-13 19:48:22', '2022-12-13 19:48:22'),
(144, 9, '500 GB', '2022-12-13 19:48:22', '2022-12-13 19:48:22'),
(145, 9, '1TB', '2022-12-13 19:48:22', '2022-12-13 19:48:22'),
(146, 9, '2TB', '2022-12-13 19:48:22', '2022-12-13 19:48:22'),
(147, 9, '3TB', '2022-12-13 19:48:22', '2022-12-13 19:48:22'),
(148, 9, '4TB', '2022-12-13 19:48:22', '2022-12-13 19:48:22'),
(149, 9, '5TB & Above', '2022-12-13 19:48:22', '2022-12-13 19:48:22'),
(213, 15, 'Diesel', '2022-12-13 20:18:32', '2022-12-13 20:18:32'),
(214, 15, 'Petrol', '2022-12-13 20:18:32', '2022-12-13 20:18:32'),
(215, 15, 'CNG', '2022-12-13 20:18:32', '2022-12-13 20:18:32'),
(216, 15, 'Hybrid', '2022-12-13 20:18:32', '2022-12-13 20:18:32'),
(217, 15, 'Electric', '2022-12-13 20:18:32', '2022-12-13 20:18:32'),
(218, 15, 'Octane', '2022-12-13 20:18:32', '2022-12-13 20:18:32'),
(219, 15, 'LPG', '2022-12-13 20:18:32', '2022-12-13 20:18:32'),
(220, 15, 'Other fuel type', '2022-12-13 20:18:32', '2022-12-13 20:18:32'),
(221, 16, 'Manual', '2022-12-13 20:21:26', '2022-12-13 20:21:26'),
(222, 16, 'Other transmission', '2022-12-13 20:21:26', '2022-12-13 20:21:26'),
(223, 16, 'Automatic', '2022-12-13 20:21:26', '2022-12-13 20:21:26'),
(228, 20, 'katha', '2022-12-13 20:33:53', '2022-12-13 20:33:53'),
(229, 20, 'bigha', '2022-12-13 20:33:53', '2022-12-13 20:33:53'),
(230, 20, 'acres', '2022-12-13 20:33:53', '2022-12-13 20:33:53'),
(231, 20, 'shotok', '2022-12-13 20:33:53', '2022-12-13 20:33:53'),
(232, 20, 'decimal', '2022-12-13 20:33:53', '2022-12-13 20:33:53'),
(243, 22, 'none', '2022-12-13 20:38:17', '2022-12-13 20:38:17'),
(244, 22, '1', '2022-12-13 20:38:17', '2022-12-13 20:38:17'),
(245, 22, '2', '2022-12-13 20:38:17', '2022-12-13 20:38:17'),
(246, 22, '3', '2022-12-13 20:38:17', '2022-12-13 20:38:17'),
(247, 22, '4', '2022-12-13 20:38:17', '2022-12-13 20:38:17'),
(248, 22, '5', '2022-12-13 20:38:17', '2022-12-13 20:38:17'),
(249, 22, '6', '2022-12-13 20:38:17', '2022-12-13 20:38:17'),
(250, 22, '7', '2022-12-13 20:38:17', '2022-12-13 20:38:17'),
(251, 22, '8', '2022-12-13 20:38:17', '2022-12-13 20:38:17'),
(252, 22, '9', '2022-12-13 20:38:17', '2022-12-13 20:38:17'),
(253, 22, '10', '2022-12-13 20:38:17', '2022-12-13 20:38:17'),
(254, 21, 'none', '2022-12-13 20:40:00', '2022-12-13 20:40:00'),
(255, 21, '1', '2022-12-13 20:40:00', '2022-12-13 20:40:00'),
(256, 21, '2', '2022-12-13 20:40:00', '2022-12-13 20:40:00'),
(257, 21, '3', '2022-12-13 20:40:00', '2022-12-13 20:40:00'),
(258, 21, '4', '2022-12-13 20:40:00', '2022-12-13 20:40:00'),
(259, 21, '5', '2022-12-13 20:40:00', '2022-12-13 20:40:00'),
(260, 21, '6', '2022-12-13 20:40:00', '2022-12-13 20:40:00'),
(261, 21, '7', '2022-12-13 20:40:00', '2022-12-13 20:40:00'),
(262, 21, '8', '2022-12-13 20:40:00', '2022-12-13 20:40:00'),
(263, 21, '9', '2022-12-13 20:40:00', '2022-12-13 20:40:00'),
(264, 21, '10', '2022-12-13 20:40:00', '2022-12-13 20:40:00'),
(265, 24, 'South Facing', '2022-12-13 20:42:48', '2022-12-13 20:42:48'),
(266, 24, 'East Facing', '2022-12-13 20:42:48', '2022-12-13 20:42:48'),
(267, 24, 'West Facing', '2022-12-13 20:42:48', '2022-12-13 20:42:48'),
(268, 24, 'North Facing', '2022-12-13 20:42:48', '2022-12-13 20:42:48'),
(269, 25, 'Ready', '2022-12-13 20:44:07', '2022-12-13 20:44:07'),
(270, 25, 'Upcoming', '2022-12-13 20:44:07', '2022-12-13 20:44:07'),
(271, 25, 'Ongoing', '2022-12-13 20:44:07', '2022-12-13 20:44:07'),
(275, 26, 'Bookcases & Shelves', '2022-12-13 20:54:28', '2022-12-13 20:54:28'),
(276, 26, 'Centre & Side Tables', '2022-12-13 20:54:28', '2022-12-13 20:54:28'),
(277, 26, 'Dolna', '2022-12-13 20:54:28', '2022-12-13 20:54:28'),
(278, 26, 'Mora', '2022-12-13 20:54:28', '2022-12-13 20:54:28'),
(279, 26, 'Rocking Chair', '2022-12-13 20:54:28', '2022-12-13 20:54:28'),
(280, 26, 'Shoe Racks', '2022-12-13 20:54:28', '2022-12-13 20:54:28'),
(281, 26, 'Showcases', '2022-12-13 20:54:28', '2022-12-13 20:54:28'),
(282, 26, 'Sofa & Divan', '2022-12-13 20:54:28', '2022-12-13 20:54:28'),
(283, 26, 'Stool', '2022-12-13 20:54:28', '2022-12-13 20:54:28'),
(284, 26, 'Swing', '2022-12-13 20:54:28', '2022-12-13 20:54:28'),
(285, 26, 'Tables & Chairs', '2022-12-13 20:54:28', '2022-12-13 20:54:28'),
(286, 26, 'TV Stands', '2022-12-13 20:54:28', '2022-12-13 20:54:28'),
(287, 26, 'Others', '2022-12-13 20:54:28', '2022-12-13 20:54:28'),
(292, 27, 'Used', '2022-12-13 20:58:36', '2022-12-13 20:58:36'),
(293, 27, 'Reconditioned', '2022-12-13 20:58:36', '2022-12-13 20:58:36'),
(294, 27, 'New', '2022-12-13 20:58:36', '2022-12-13 20:58:36'),
(310, 28, 'Suits & Blazer', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(311, 28, 'Denim Jackets', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(312, 28, 'Leather Jackets', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(313, 28, 'Rain Coats & Trenches', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(314, 28, 'Hoodies & Sweatshirts', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(315, 28, 'Sweaters', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(316, 28, 'T-Shirts', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(317, 28, 'Polo Shirts', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(318, 28, 'Hair Care', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(319, 28, 'Skin & Body Care', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(320, 28, 'Trimmers, Razors & Blades', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(321, 28, 'Shaving Cream & Gel', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(322, 28, 'Panjabi & Sherwani', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(323, 28, 'Lungi & Fotua', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(324, 28, 'Jeans', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(325, 28, 'Cargo', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(326, 28, 'Joggers & Sweatpants', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(327, 28, 'Shorts & Bermudas', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(328, 28, 'Men Sunglasses', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(329, 28, 'Eye Glasses & Lens', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(330, 28, 'Clothing', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(331, 28, 'Shoes & Accessories', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(332, 28, 'Backpack', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(333, 28, 'Suitcases', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(334, 28, 'Messenger Bags', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(335, 28, 'Crossbody Bags', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(336, 28, 'Travel Bags', '2022-12-13 21:30:40', '2022-12-13 21:30:40'),
(339, 29, 'Sarees', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(340, 29, 'Shalwar Kameez & Kurtis', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(341, 29, 'Unstitched Fabric', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(342, 29, 'Hijab & Abaya', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(343, 29, 'Sweaters & Cardigans', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(344, 29, 'Jackets', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(345, 29, 'Coats', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(346, 29, 'Gown', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(347, 29, 'Tops & T-shirt', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(348, 29, 'Pant', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(349, 29, 'Skirt', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(350, 29, 'Cross Body & Shoulder Bags', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(351, 29, 'Coin Purses & Pouches', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(352, 29, 'Hand Bags', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(353, 29, 'Belts', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(354, 29, 'Umbrella', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(355, 29, 'Sandals & Heels', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(356, 29, 'Shoes', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(357, 29, 'Flip Flops', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(358, 29, 'Bra', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(359, 29, 'Briefs', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(360, 29, 'Shapewear', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(361, 29, 'Sleepwear & Loungewear', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(362, 29, 'Swimwear', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(363, 29, 'Camisoles & Thermals', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(364, 29, 'Women\'s Watches', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(365, 29, 'Rings', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(366, 29, 'Necklaces', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(367, 29, 'Pendants', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(368, 29, 'Earrings', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(369, 29, 'Nose Pin', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(370, 29, 'Jewellery Sets', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(371, 29, 'Bracelets', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(372, 29, 'Makeup', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(373, 29, 'Skincare', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(374, 29, 'Lipsticks', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(375, 29, 'Perfumes & Fragrances', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(376, 29, 'Bodycare', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(377, 29, 'Haircare', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(378, 29, 'Facecare', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(379, 29, 'Tools & Accessories', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(380, 29, 'Women Sunglasses', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(381, 29, 'Eye Glasses, Lens, Frames', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(382, 29, 'Kids Sunglasses', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(383, 29, 'Clothing', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(384, 29, 'Shoes & Accessories', '2022-12-13 21:47:51', '2022-12-13 21:47:51'),
(385, 30, 'Bird', '2022-12-13 21:56:47', '2022-12-13 21:56:47'),
(386, 30, 'Cat', '2022-12-13 21:56:47', '2022-12-13 21:56:47'),
(387, 30, 'Dog', '2022-12-13 21:56:47', '2022-12-13 21:56:47'),
(388, 30, 'Fish', '2022-12-13 21:56:47', '2022-12-13 21:56:47'),
(389, 30, 'Guinea pig / mouse', '2022-12-13 21:56:47', '2022-12-13 21:56:47'),
(390, 30, 'Rabbit', '2022-12-13 21:56:47', '2022-12-13 21:56:47'),
(391, 30, 'Reptile', '2022-12-13 21:56:47', '2022-12-13 21:56:47'),
(392, 30, 'Livestock', '2022-12-13 21:56:47', '2022-12-13 21:56:47'),
(393, 30, 'Poultry', '2022-12-13 21:56:47', '2022-12-13 21:56:47'),
(396, 31, 'Keyboard & Piano', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(397, 31, 'Percussion & Drums', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(398, 31, 'String Instruments & Amplifiers', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(399, 31, 'Studio & Live Music Equipment', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(400, 31, 'Vinyl', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(401, 31, 'Woodwind & Brass', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(402, 31, 'Boxing & Martial Arts', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(403, 31, 'Cricket', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(404, 31, 'Fishing & Camping', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(405, 31, 'Football', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(406, 31, 'Games & Board Games', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(407, 31, 'Hockey', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(408, 31, 'Indoor Sports', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(409, 31, 'Dumbbells', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(410, 31, 'Treadmills', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(411, 31, 'Exercise Bikes', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(412, 31, 'Weight Loss', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(413, 31, 'Books & Novels', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(414, 31, 'DVDs & CDs', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(415, 31, 'Magazines & Comics', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(416, 31, 'Baby Care', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(417, 31, 'Car Seats & Carriers', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(418, 31, 'Prams & Strollers', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(419, 31, 'Toys', '2022-12-14 00:58:32', '2022-12-14 00:58:32'),
(422, 32, 'Used', '2022-12-14 15:43:39', '2022-12-14 15:43:39'),
(423, 32, 'New', '2022-12-14 15:43:39', '2022-12-14 15:43:39'),
(424, 33, 'College / University', '2022-12-14 15:47:03', '2022-12-14 15:47:03'),
(425, 33, 'School', '2022-12-14 15:47:03', '2022-12-14 15:47:03'),
(426, 33, 'Other', '2022-12-14 15:47:03', '2022-12-14 15:47:03'),
(428, 18, 'Agricultural', '2022-12-14 15:58:00', '2022-12-14 15:58:00'),
(429, 18, 'Residential', '2022-12-14 15:58:00', '2022-12-14 15:58:00'),
(430, 18, 'Commercial', '2022-12-14 15:58:00', '2022-12-14 15:58:00'),
(431, 18, 'Other', '2022-12-14 15:58:00', '2022-12-14 15:58:00'),
(432, 34, 'Beverages', '2022-12-14 16:10:30', '2022-12-14 16:10:30'),
(433, 34, 'Frozen', '2022-12-14 16:10:30', '2022-12-14 16:10:30'),
(434, 34, 'Rice & Pulses', '2022-12-14 16:10:30', '2022-12-14 16:10:30'),
(435, 34, 'Canned, Dry & Packaged Foods', '2022-12-14 16:10:30', '2022-12-14 16:10:30'),
(436, 34, 'Dairy & Chilled', '2022-12-14 16:10:30', '2022-12-14 16:10:30'),
(437, 34, 'Biscuits, Snacks & Chocolates', '2022-12-14 16:10:30', '2022-12-14 16:10:30'),
(438, 34, 'Baking & Cooking', '2022-12-14 16:10:30', '2022-12-14 16:10:30'),
(439, 34, 'Bakery', '2022-12-14 16:10:30', '2022-12-14 16:10:30'),
(440, 34, 'Personal Care', '2022-12-14 16:10:30', '2022-12-14 16:10:30'),
(441, 34, 'Fruits', '2022-12-14 16:10:30', '2022-12-14 16:10:30'),
(442, 34, 'Vegetables', '2022-12-14 16:10:30', '2022-12-14 16:10:30'),
(443, 34, 'Fish', '2022-12-14 16:10:30', '2022-12-14 16:10:30'),
(444, 34, 'Beef', '2022-12-14 16:10:30', '2022-12-14 16:10:30'),
(445, 34, 'Mutton', '2022-12-14 16:10:30', '2022-12-14 16:10:30'),
(446, 34, 'Chicken', '2022-12-14 16:10:30', '2022-12-14 16:10:30'),
(447, 34, 'Baby food', '2022-12-14 16:10:30', '2022-12-14 16:10:30'),
(448, 34, 'Diapers & WipesDiapers & Wipes', '2022-12-14 16:10:30', '2022-12-14 16:10:30'),
(449, 34, 'Skin & Haircare', '2022-12-14 16:10:31', '2022-12-14 16:10:31'),
(450, 34, 'Baby accessories', '2022-12-14 16:10:31', '2022-12-14 16:10:31'),
(451, 34, 'For Mom', '2022-12-14 16:10:31', '2022-12-14 16:10:31'),
(452, 34, 'Handcare', '2022-12-14 16:10:31', '2022-12-14 16:10:31'),
(453, 34, 'Face Mask', '2022-12-14 16:10:31', '2022-12-14 16:10:31'),
(454, 34, 'Cleaning', '2022-12-14 16:10:31', '2022-12-14 16:10:31'),
(455, 34, 'Laundry', '2022-12-14 16:10:31', '2022-12-14 16:10:31'),
(456, 34, 'Dish Washing', '2022-12-14 16:10:31', '2022-12-14 16:10:31'),
(457, 34, 'Tissues & Disposables', '2022-12-14 16:10:31', '2022-12-14 16:10:31'),
(458, 34, 'Freshners', '2022-12-14 16:10:31', '2022-12-14 16:10:31'),
(459, 34, 'Repellents', '2022-12-14 16:10:31', '2022-12-14 16:10:31'),
(460, 34, 'Other', '2022-12-14 16:10:31', '2022-12-14 16:10:31'),
(461, 35, 'Construction services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(462, 35, 'Property documentation', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(463, 35, 'Packers & moveres', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(464, 35, 'Pest control & cleaning', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(465, 35, 'Utility services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(466, 35, 'Caregiving Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(467, 35, 'Daycare Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(468, 35, 'Drivers on Demand', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(469, 35, 'Gardening Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(470, 35, 'Maid Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(471, 35, 'Beauty Parlor Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(472, 35, 'Grooming Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(473, 35, 'Saloon Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(474, 35, 'Yoga & Gym Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(475, 35, 'IT Outsourcing Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(476, 35, 'Network Maintenance Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(477, 35, 'Server Management Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(478, 35, 'Software Development Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(479, 35, 'System Integration Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(480, 35, 'Other IT Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(481, 35, 'Corporate Event Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(482, 35, 'Exhibition Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(483, 35, 'Music & Dance Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(484, 35, 'Photography & Cinematography Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(485, 35, 'Wedding Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(486, 35, 'Accounting Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(487, 35, 'Consulting Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(488, 35, 'Counselling & Psychiatric Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(489, 35, 'Dental Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(490, 35, 'Diagnostic Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(491, 35, 'Law Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(492, 35, 'Physiotherapy Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(493, 35, 'Tax Services', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(494, 35, 'Cameras, Computers & Laptops Repair', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(495, 35, 'Furniture Repair', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(496, 35, 'Mobiles Repair', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(497, 35, 'Plumbing', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(498, 35, 'Other Electronics Repair', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(499, 35, 'Tickets', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(500, 35, 'Tour Packages', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(501, 35, 'Visa', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(502, 35, 'Others', '2022-12-14 16:42:20', '2022-12-14 16:42:20'),
(503, 36, 'Used', '2022-12-14 16:52:52', '2022-12-14 16:52:52'),
(504, 36, 'New', '2022-12-14 16:52:52', '2022-12-14 16:52:52'),
(902, 38, 'Full Time', '2022-12-14 19:53:19', '2022-12-14 19:53:19'),
(903, 38, 'Part Time', '2022-12-14 19:53:19', '2022-12-14 19:53:19'),
(904, 38, 'Contractual', '2022-12-14 19:53:19', '2022-12-14 19:53:19'),
(905, 38, 'Internship', '2022-12-14 19:53:19', '2022-12-14 19:53:19'),
(906, 39, 'Email and employer dashboard', '2022-12-14 19:58:59', '2022-12-14 19:58:59'),
(907, 39, 'Phones (up to 3)', '2022-12-14 19:58:59', '2022-12-14 19:58:59'),
(908, 41, 'Primary School', '2022-12-14 20:04:30', '2022-12-14 20:04:30'),
(909, 41, 'High School', '2022-12-14 20:04:30', '2022-12-14 20:04:30'),
(910, 41, 'SSC / O Level', '2022-12-14 20:04:30', '2022-12-14 20:04:30'),
(911, 41, 'HSC / A Level', '2022-12-14 20:04:30', '2022-12-14 20:04:30'),
(912, 41, 'Diploma', '2022-12-14 20:04:30', '2022-12-14 20:04:30'),
(913, 41, 'Honors / BBA', '2022-12-14 20:04:30', '2022-12-14 20:04:30'),
(914, 41, 'Masters / MBA', '2022-12-14 20:04:30', '2022-12-14 20:04:30'),
(915, 41, 'PhD / Doctorate', '2022-12-14 20:04:30', '2022-12-14 20:04:30'),
(953, 51, 'Accounting / Finance', '2022-12-14 21:35:23', '2022-12-14 21:35:23'),
(954, 51, 'Advertising / Media', '2022-12-14 21:35:23', '2022-12-14 21:35:23'),
(955, 51, 'Agriculture', '2022-12-14 21:35:23', '2022-12-14 21:35:23'),
(956, 51, 'Airline / Travel / Tourism', '2022-12-14 21:35:23', '2022-12-14 21:35:23'),
(957, 51, 'Bank / Non-Bank Financial Institution', '2022-12-14 21:35:23', '2022-12-14 21:35:23'),
(958, 51, 'Civil Engineering, Construction / Technician', '2022-12-14 21:35:23', '2022-12-14 21:35:23'),
(959, 51, 'Customer Service', '2022-12-14 21:35:23', '2022-12-14 21:35:23'),
(960, 51, 'Design, Art / Photography', '2022-12-14 21:35:23', '2022-12-14 21:35:23'),
(961, 51, 'Driver / Transportation', '2022-12-14 21:35:23', '2022-12-14 21:35:23'),
(962, 51, 'Education / Teaching', '2022-12-14 21:35:23', '2022-12-14 21:35:23'),
(963, 51, 'Engineering / Architecture', '2022-12-14 21:35:23', '2022-12-14 21:35:23'),
(964, 51, 'Entertainment / Recreation', '2022-12-14 21:35:23', '2022-12-14 21:35:23'),
(965, 51, 'Fashion / Beauty', '2022-12-14 21:35:23', '2022-12-14 21:35:23'),
(966, 51, 'Food / Beverage Industry', '2022-12-14 21:35:23', '2022-12-14 21:35:23'),
(967, 51, 'Garments / Textile', '2022-12-14 21:35:23', '2022-12-14 21:35:23'),
(968, 51, 'General Labour', '2022-12-14 21:35:23', '2022-12-14 21:35:23'),
(969, 51, 'Govt / Semi-Govt / Autonomous', '2022-12-14 21:35:23', '2022-12-14 21:35:23'),
(970, 51, 'Hotels / Restaurants', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(971, 51, 'Household Help', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(972, 51, 'Human Resources / Organisational Development', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(973, 51, 'IT / Telecom', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(974, 51, 'Legal', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(975, 51, 'Management Executive', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(976, 51, 'Manufacturing', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(977, 51, 'Marketing', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(978, 51, 'Media / Agency / Event Management', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(979, 51, 'Medical / Biotech / Pharmaceuticals', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(980, 51, 'NGO / Development', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(981, 51, 'Office Admin / Data Entry', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(982, 51, 'Online Marketing', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(983, 51, 'Real Estate', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(984, 51, 'Sales / Retail', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(985, 51, 'Secretary / Reception', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(986, 51, 'Security Service', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(987, 51, 'Telecommunication', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(988, 51, 'Wholesale / Retail / Export-Import', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(989, 51, 'Others', '2022-12-14 21:35:24', '2022-12-14 21:35:24'),
(990, 54, 'Full Time', '2022-12-14 21:38:31', '2022-12-14 21:38:31'),
(991, 54, 'Part Time', '2022-12-14 21:38:31', '2022-12-14 21:38:31'),
(992, 54, 'Contract', '2022-12-14 21:38:31', '2022-12-14 21:38:31'),
(993, 54, 'Temporary', '2022-12-14 21:38:31', '2022-12-14 21:38:31'),
(994, 54, 'Internship', '2022-12-14 21:38:31', '2022-12-14 21:38:31'),
(995, 54, 'Other', '2022-12-14 21:38:31', '2022-12-14 21:38:31'),
(996, 58, 'per year', '2022-12-14 21:43:44', '2022-12-14 21:43:44'),
(997, 58, 'per month', '2022-12-14 21:43:44', '2022-12-14 21:43:44'),
(998, 58, 'per week', '2022-12-14 21:43:44', '2022-12-14 21:43:44'),
(999, 58, 'per day', '2022-12-14 21:43:44', '2022-12-14 21:43:44'),
(1000, 58, 'per hour', '2022-12-14 21:43:44', '2022-12-14 21:43:44'),
(1001, 58, 'total salary', '2022-12-14 21:43:44', '2022-12-14 21:43:44'),
(1002, 59, 'Negotiable', '2022-12-14 21:45:14', '2022-12-14 21:45:14'),
(1003, 4, '1', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1004, 4, '2', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1005, 4, '3', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1006, 4, '4', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1007, 4, '5', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1008, 4, '5i', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1009, 4, '5Pro', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1010, 4, '6', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1011, 4, '6i', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1012, 4, '7', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1013, 4, '7i', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1014, 4, '7Pro', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1015, 4, '8', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1016, 4, '8i', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1017, 4, '8Pro', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1018, 4, '9i', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1019, 4, '9Pro', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1020, 4, '10', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1021, 4, '10i', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1022, 4, '10Pro', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1023, 4, '11', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1024, 4, '11i', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1025, 4, '11Pro', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1026, 4, '11ProMax', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1027, 4, '12', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1028, 4, '12Pro', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1029, 4, '12Pro max', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1030, 4, 'C1', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1031, 4, 'C2', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1032, 4, 'C3', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1033, 4, 'C4', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1034, 4, 'Nazro', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1035, 4, 'Nazro50', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1036, 4, 'J1', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1037, 4, 'J2', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1038, 4, 'J3', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1039, 4, 'J4', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1040, 4, 'J5', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1041, 4, 'J6', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1042, 4, 'A12', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1043, 4, 'A5 2020', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1044, 4, 'A9 2020', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1045, 4, 'A15', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1046, 4, 'A15s', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1047, 4, 'F1', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1048, 4, 'F1 Plus', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1049, 4, 'F1s', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1050, 4, 'F3 Plus', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1051, 4, 'F9 Pro', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1052, 4, 'F11', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1053, 4, 'F11 Pro', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1054, 4, 'F15', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1055, 4, 'F21', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1056, 4, 'F21 Pro', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1057, 4, 'Galaxy A10', '2022-12-15 16:35:34', '2022-12-15 16:35:34'),
(1058, 4, 'Galaxy A10s', '2022-12-15 16:35:35', '2022-12-15 16:35:35'),
(1059, 4, 'Galaxy A11', '2022-12-15 16:35:35', '2022-12-15 16:35:35'),
(1060, 4, 'Galaxy A12', '2022-12-15 16:35:35', '2022-12-15 16:35:35'),
(1061, 4, 'Galaxy A13', '2022-12-15 16:35:35', '2022-12-15 16:35:35'),
(1062, 4, 'Galaxy A20', '2022-12-15 16:35:35', '2022-12-15 16:35:35'),
(1063, 4, 'Galaxy A20s', '2022-12-15 16:35:35', '2022-12-15 16:35:35'),
(1064, 4, 'Galaxy A21', '2022-12-15 16:35:35', '2022-12-15 16:35:35'),
(1065, 4, 'Galaxy A21s', '2022-12-15 16:35:35', '2022-12-15 16:35:35'),
(1066, 4, 'Galaxy A22', '2022-12-15 16:35:35', '2022-12-15 16:35:35'),
(1067, 4, 'Galaxy A23', '2022-12-15 16:35:35', '2022-12-15 16:35:35'),
(1068, 4, 'Galaxy A30', '2022-12-15 16:35:35', '2022-12-15 16:35:35'),
(1071, 60, 'Used', '2022-12-15 17:57:12', '2022-12-15 17:57:12'),
(1072, 60, 'New', '2022-12-15 17:57:12', '2022-12-15 17:57:12'),
(1075, 61, 'Used', '2022-12-15 18:10:22', '2022-12-15 18:10:22'),
(1076, 61, 'New', '2022-12-15 18:10:22', '2022-12-15 18:10:22'),
(1079, 62, 'Used', '2022-12-15 18:19:03', '2022-12-15 18:19:03'),
(1080, 62, 'New', '2022-12-15 18:19:03', '2022-12-15 18:19:03'),
(1083, 63, 'Used', '2022-12-15 18:24:00', '2022-12-15 18:24:00'),
(1084, 63, 'New', '2022-12-15 18:24:00', '2022-12-15 18:24:00'),
(1087, 64, 'Used', '2022-12-15 18:33:24', '2022-12-15 18:33:24'),
(1088, 64, 'New', '2022-12-15 18:33:24', '2022-12-15 18:33:24'),
(1089, 2, 'Used', '2022-12-15 18:49:53', '2022-12-15 18:49:53'),
(1090, 2, 'New', '2022-12-15 18:49:53', '2022-12-15 18:49:53'),
(1091, 65, 'Used', '2022-12-15 18:50:37', '2022-12-15 18:50:37'),
(1092, 65, 'New', '2022-12-15 18:50:37', '2022-12-15 18:50:37'),
(1115, 10, 'A1', '2022-12-15 23:37:09', '2022-12-15 23:37:09'),
(1116, 10, 'A2', '2022-12-15 23:37:09', '2022-12-15 23:37:09'),
(1117, 10, 'A3', '2022-12-15 23:37:09', '2022-12-15 23:37:09'),
(1118, 10, 'A4', '2022-12-15 23:37:09', '2022-12-15 23:37:09'),
(1119, 10, 'A5', '2022-12-15 23:37:09', '2022-12-15 23:37:09'),
(1120, 10, 'A6', '2022-12-15 23:37:09', '2022-12-15 23:37:09'),
(1121, 10, 'A7', '2022-12-15 23:37:09', '2022-12-15 23:37:09'),
(1122, 10, 'Q3', '2022-12-15 23:37:09', '2022-12-15 23:37:09'),
(1123, 10, 'Q5', '2022-12-15 23:37:09', '2022-12-15 23:37:09'),
(1124, 10, 'Q7', '2022-12-15 23:37:09', '2022-12-15 23:37:09'),
(1125, 10, '1 Series', '2022-12-15 23:37:09', '2022-12-15 23:37:09'),
(1126, 10, '3 Series', '2022-12-15 23:37:09', '2022-12-15 23:37:09'),
(1127, 10, '320i', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1128, 10, '328i', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1129, 10, '5 Series', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1130, 10, '520d', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1131, 10, '523i', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1132, 10, '525i', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1133, 10, '528', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1134, 10, '528i', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1135, 10, '530E', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1136, 10, '530i', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1137, 10, '535d', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1138, 10, '535xi', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1139, 10, '540i', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1140, 10, '6 Series', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1141, 10, 'Pulsar', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1142, 10, 'Pulsar AS', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1143, 10, 'Pulsar NS', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1144, 10, 'Pulsar NS ABS', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1145, 10, 'CBZ Xtrem', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1146, 10, 'Glamour', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1147, 10, 'Hunk', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1148, 10, 'Splendor', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1149, 10, 'CBR', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1150, 10, 'Hornet', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1151, 10, 'CDI', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1152, 10, 'FZ', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1153, 10, 'FZ-X', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1154, 10, 'FZS', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1155, 10, 'Fazer', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1156, 10, 'Gladiator', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1157, 10, 'MT 15', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1158, 10, 'R15', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1159, 10, 'R15 M', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1160, 10, 'R15 Max', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1161, 10, 'Saluto', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1162, 10, 'Saluto 125', '2022-12-15 23:37:10', '2022-12-15 23:37:10'),
(1163, 5, 'Adapter Battery', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1164, 5, 'Casing', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1165, 5, 'Charger', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1166, 5, 'Cooling Fan', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1167, 5, 'Motherboards', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1168, 5, 'Keyboards', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1169, 5, 'Processors', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1170, 5, 'Monitors', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1171, 5, 'Hard Drives', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1172, 5, 'Graphics Cards', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1173, 5, 'Software', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1174, 5, 'Mouse', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1175, 5, 'Laptop table desk', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1176, 5, 'Memory Card', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1177, 5, 'Modems & Routers', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1178, 5, 'Power Supply', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1179, 5, 'Printers & Scanners', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1180, 5, 'Pendrive', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1181, 5, 'USB Cable', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1182, 5, 'Laptops', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1183, 5, 'Computer', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1184, 5, 'Desktop', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1185, 5, 'TV', '2022-12-18 20:31:39', '2022-12-18 20:31:39'),
(1186, 6, 'M20', '2022-12-18 20:35:59', '2022-12-18 20:35:59'),
(1187, 6, 'ASUS AiO', '2022-12-18 20:35:59', '2022-12-18 20:35:59'),
(1188, 6, 'IE', '2022-12-18 20:35:59', '2022-12-18 20:35:59'),
(1189, 6, 'ROG', '2022-12-18 20:35:59', '2022-12-18 20:35:59'),
(1190, 6, 'Vivo AiO', '2022-12-18 20:35:59', '2022-12-18 20:35:59'),
(1191, 6, 'ROG Premium', '2022-12-18 20:35:59', '2022-12-18 20:35:59'),
(1192, 6, 'Micro Tower', '2022-12-18 20:35:59', '2022-12-18 20:35:59'),
(1193, 6, 'Mini Tower', '2022-12-18 20:35:59', '2022-12-18 20:35:59'),
(1194, 6, 'Pavilion', '2022-12-18 20:35:59', '2022-12-18 20:35:59'),
(1195, 6, 'Slim Tower', '2022-12-18 20:35:59', '2022-12-18 20:35:59'),
(1196, 6, 'Other Model', '2022-12-18 20:35:59', '2022-12-18 20:35:59'),
(1197, 6, 'Vision', '2022-12-18 20:35:59', '2022-12-18 20:35:59'),
(1198, 6, 'Walton', '2022-12-18 20:35:59', '2022-12-18 20:35:59'),
(1199, 6, 'Samsung', '2022-12-18 20:35:59', '2022-12-18 20:35:59'),
(1200, 6, 'LG', '2022-12-18 20:35:59', '2022-12-18 20:35:59'),
(1201, 37, 'Accounts Trainee', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1202, 37, 'Accounts Assistant', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1203, 37, 'Audit Officer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1204, 37, 'Cashier', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1205, 37, 'Tax Officer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1206, 37, 'Book Keeper', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1207, 37, 'Financial Advisor', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1208, 37, 'Hairdresser', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1209, 37, 'Beauty Therapist', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1210, 37, 'Massage Therapist', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1211, 37, 'Spa Therapist', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1212, 37, 'Make-up Artist', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1213, 37, 'Nail Artist', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1214, 37, 'Trainee Beautician', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1215, 37, 'Baker', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1216, 37, 'Caterer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1217, 37, 'Executive Chef', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1218, 37, 'Head Chef', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1219, 37, 'Restaurant Cook', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1220, 37, 'Trainee Chef', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1221, 37, 'Cash Collector', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1222, 37, 'Recovery Manager', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1223, 37, 'Recovery Officer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1224, 37, 'Other Recovery', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1225, 37, 'Safety Officer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1226, 37, 'Quantity Surveyor', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1227, 37, 'Mason', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1228, 37, 'Helper', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1229, 37, 'Carpenter', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1230, 37, 'Welder', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1231, 37, 'Plumber', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1232, 37, 'Painter', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1233, 37, 'Career Counsellor', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1234, 37, 'Student Counsellor', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1235, 37, 'Legal Counsellor', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1236, 37, 'Banking & Finance Counsellor', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1237, 37, 'Support Executive', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1238, 37, 'Sales Support Executive', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1239, 37, 'Customer Support Executive', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1240, 37, 'Help Desk Executive', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1241, 37, 'Operations Assistant', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1242, 37, 'Operations Executive', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1243, 37, 'Operations Manager', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1244, 37, 'QA Executive', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1245, 37, 'Courier Delivery Rider', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1246, 37, 'Food Delivery Rider', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1247, 37, 'Grocery Delivery Rider', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1248, 37, 'Other Delivery Rider', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1249, 37, 'Graphics Designer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1250, 37, 'Fashion Designer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1251, 37, 'Jewellery Designer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1252, 37, 'Photo and Video Editor', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1253, 37, 'Other Designer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1254, 37, 'Ayurvedic Doctor', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1255, 37, 'Cardiologist', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1256, 37, 'Dermatologist', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1257, 37, 'General Physician', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1258, 37, 'Homeopathic', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1259, 37, 'Neurologist', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1260, 37, 'Nutritionist', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1261, 37, 'Pathologist', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1262, 37, 'Dentist', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1263, 37, 'Medicine Specialist', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1264, 37, 'Psychiatrist', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1265, 37, 'Ambulance Driver', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1266, 37, 'Commercial vehicle Driver', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1267, 37, 'Bus Driver', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1268, 37, 'Light vehicle Driver', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1269, 37, 'Heavy vehicle Driver', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1270, 37, 'School bus Driver', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1271, 37, 'Private Driver', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1272, 37, 'Architect Engineer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1273, 37, 'Assistant Engineer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1274, 37, 'Civil Engineer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1275, 37, 'Mechanical Engineer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1276, 37, 'Computer Hardware Engineer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1277, 37, 'Packing Officer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1278, 37, 'Dyeing Master', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1279, 37, 'Porter', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1280, 37, 'Tailor', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1281, 37, 'Warehouse Executive', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1282, 37, 'Fabricator', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1283, 37, 'Rigger', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1284, 37, 'Cleaner', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1285, 37, 'Peon', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1286, 37, 'Waiter', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1287, 37, 'HR Recruitment', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1288, 37, 'HR Training', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1289, 37, 'HR Learning and Development', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1290, 37, 'Recruitment Sourcing', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1291, 37, 'Care Giver', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1292, 37, 'House Maid', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1293, 37, 'Live in Maid', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1294, 37, 'Other Maid', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1295, 37, 'Admin Assistant', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1296, 37, 'Admin Manager', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1297, 37, 'Admin Operations', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1298, 37, 'Admin Officer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1299, 37, 'Admin Executive', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1300, 37, 'IT Executive', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1301, 37, 'IT Supervisor', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1302, 37, 'Personal Secretary', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1303, 37, 'Receptionist', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1304, 37, 'Network Engineer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1305, 37, 'CCTV Operator', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1306, 37, 'Computer Operator', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1307, 37, 'Machine Operator', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1308, 37, 'Fork Lift Operator', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1309, 37, 'Sewing Operator', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1310, 37, 'Other Operator', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1311, 37, 'Field Sales Executive', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1312, 37, 'After Sales Executive', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1313, 37, 'Territory Executive', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1314, 37, 'Brand Promoter', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1315, 37, 'Web Developer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1316, 37, 'Web Designer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1317, 37, 'Android Developer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1318, 37, 'Analyst Programmer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1319, 37, 'Product Manager', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1320, 37, 'Software Developer', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1321, 37, 'English Teacher', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1322, 37, 'Bangla Teacher', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1323, 37, 'Maths Teacher', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1324, 37, 'Science Teacher', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1325, 37, 'Commerce Teacher', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1326, 37, 'Humanities Teacher', '2022-12-19 21:08:32', '2022-12-19 21:08:32'),
(1327, 37, 'Music Teacher', '2022-12-19 21:08:32', '2022-12-19 21:08:32');

-- --------------------------------------------------------

--
-- Table structure for table `database_backups`
--

CREATE TABLE `database_backups` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint UNSIGNED NOT NULL,
  `faq_category_id` bigint UNSIGNED NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int UNSIGNED NOT NULL DEFAULT '0',
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
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
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
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int NOT NULL,
  `location` varchar(124) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `location`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bangladesh', 1, '2022-12-18 01:39:29', '2022-12-18 01:39:29');

-- --------------------------------------------------------

--
-- Table structure for table `messengers`
--

CREATE TABLE `messengers` (
  `id` bigint UNSIGNED NOT NULL,
  `from_id` bigint UNSIGNED NOT NULL,
  `to_id` bigint UNSIGNED NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messengers`
--

INSERT INTO `messengers` (`id`, `from_id`, `to_id`, `body`, `read`, `created_at`, `updated_at`) VALUES
(1, 6, 11, '.', 0, '2022-12-18 22:57:29', '2022-12-18 22:57:29'),
(2, 6, 11, 'hey this car is very nice. can i buy this', 1, '2022-12-18 22:58:39', '2022-12-18 23:00:06'),
(3, 11, 6, 'Yes you can buy this one.', 0, '2022-12-18 23:00:36', '2022-12-18 23:00:36');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
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
  `id` bigint UNSIGNED NOT NULL,
  `android_download_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ios_download_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms_and_condition_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mobile_app_configs`
--

INSERT INTO `mobile_app_configs` (`id`, `android_download_url`, `ios_download_url`, `privacy_url`, `support_url`, `terms_and_condition_url`, `created_at`, `updated_at`) VALUES
(1, 'https://play.google.com/store/apps/details?id=com.dukaletu.dukaletu', 'https://applestore.com', 'https://www.appname.com/privacy-policy', 'https://www.appname.com/support', 'https://www.appname.com/terms-and-conditions', '2022-08-19 23:31:12', '2022-12-10 21:37:04');

-- --------------------------------------------------------

--
-- Table structure for table `mobile_app_sliders`
--

CREATE TABLE `mobile_app_sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int UNSIGNED NOT NULL DEFAULT '0',
  `background` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mobile_validations`
--

CREATE TABLE `mobile_validations` (
  `id` int NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `otp_code` varchar(6) NOT NULL,
  `expired_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `attempt` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mobile_validations`
--

INSERT INTO `mobile_validations` (`id`, `phone_number`, `otp_code`, `expired_in`, `attempt`, `created_at`, `updated_at`) VALUES
(1, '+254 718 438984', '132570', '2022-11-09 00:40:59', 5, '2022-11-09 00:07:56', '2022-11-09 00:40:29'),
(2, '+254718438984', '786037', '2022-11-12 16:12:58', 3, '2022-11-09 00:30:24', '2022-11-12 16:12:28'),
(3, '+254 718 438985', '760902', '2022-11-23 23:51:55', 2, '2022-11-09 00:41:41', '2022-11-23 23:51:25'),
(4, '+254 718 438989', '291241', '2022-11-26 20:45:01', 3, '2022-11-09 00:42:44', '2022-11-26 20:44:31'),
(5, '+254718438981', '744417', '2022-11-13 15:15:23', 1, '2022-11-13 15:14:53', '2022-11-13 15:14:53'),
(6, '0718438984', '695025', '2022-12-01 21:38:51', 3, '2022-11-14 04:12:26', '2022-12-01 21:38:21'),
(7, '0791524903', '209837', '2022-11-14 16:40:01', 4, '2022-11-14 16:37:32', '2022-11-14 16:39:31'),
(8, '+254718438988', '864846', '2022-11-15 18:57:10', 1, '2022-11-15 18:56:40', '2022-11-15 18:56:40'),
(9, '+254718438989', '764022', '2022-11-15 19:03:35', 2, '2022-11-15 19:02:41', '2022-11-15 19:03:05'),
(10, '254 718 438984', '100249', '2022-11-23 18:56:55', 1, '2022-11-23 18:56:25', '2022-11-23 18:56:25'),
(11, '254718438987', '868147', '2022-11-23 23:46:36', 1, '2022-11-23 23:46:06', '2022-11-23 23:46:06'),
(12, '+254718438982', '404237', '2022-11-23 23:49:03', 1, '2022-11-23 23:48:33', '2022-11-23 23:48:33'),
(13, '+254718438920', '293612', '2022-11-23 23:50:53', 1, '2022-11-23 23:50:23', '2022-11-23 23:50:23'),
(14, '0724222888', '517350', '2022-11-24 17:04:12', 1, '2022-11-24 17:03:42', '2022-11-24 17:03:42'),
(15, '710 564569', '806769', '2022-11-24 17:11:09', 1, '2022-11-24 17:10:39', '2022-11-24 17:10:39'),
(16, '711564569', '372777', '2022-11-24 19:49:34', 1, '2022-11-24 19:49:04', '2022-11-24 19:49:04'),
(17, '123456789', '400136', '2022-12-17 20:47:02', 2, '2022-11-27 16:30:59', '2022-12-17 20:46:32'),
(18, '254123456789', '311873', '2022-11-27 17:24:12', 2, '2022-11-27 17:22:53', '2022-11-27 17:23:42'),
(19, '254101456978', '460441', '2022-11-27 21:32:59', 1, '2022-11-27 21:32:29', '2022-11-27 21:32:29'),
(20, '+254 718 438981', '544865', '2022-11-28 22:00:09', 1, '2022-11-28 21:59:39', '2022-11-28 21:59:39'),
(21, '+254 718 438983', '348148', '2022-11-30 19:14:46', 1, '2022-11-30 19:14:16', '2022-11-30 19:14:16'),
(22, '+254 785 254682', '229380', '2022-12-01 16:45:27', 2, '2022-12-01 16:44:14', '2022-12-01 16:44:57'),
(23, '+254 785 254323', '610018', '2022-12-01 20:26:56', 1, '2022-12-01 20:26:26', '2022-12-01 20:26:26'),
(24, '254767424156', '742378', '2022-12-03 23:15:13', 1, '2022-12-03 23:14:43', '2022-12-03 23:14:43'),
(25, '788094689', '195220', '2022-12-11 18:53:50', 1, '2022-12-11 18:53:20', '2022-12-11 18:53:20'),
(26, '710564569', '716237', '2022-12-13 17:19:35', 1, '2022-12-13 17:19:05', '2022-12-13 17:19:05'),
(27, '794798227', '474754', '2022-12-15 22:15:18', 1, '2022-12-15 22:14:48', '2022-12-15 22:14:48'),
(28, '710564566', '429636', '2022-12-18 20:09:51', 1, '2022-12-18 20:09:21', '2022-12-18 20:09:21'),
(29, '0715272708', '465712', '2022-12-20 08:08:30', 3, '2022-12-20 07:35:51', '2022-12-20 08:08:00');

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 1),
(1, 'App\\Models\\Admin', 3);

-- --------------------------------------------------------

--
-- Table structure for table `module_settings`
--

CREATE TABLE `module_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `blog` tinyint(1) NOT NULL DEFAULT '1',
  `newsletter` tinyint(1) NOT NULL DEFAULT '1',
  `language` tinyint(1) NOT NULL DEFAULT '1',
  `contact` tinyint(1) NOT NULL DEFAULT '1',
  `faq` tinyint(1) NOT NULL DEFAULT '1',
  `testimonial` tinyint(1) NOT NULL DEFAULT '1',
  `price_plan` tinyint(1) NOT NULL DEFAULT '1',
  `appearance` tinyint(1) NOT NULL DEFAULT '1'
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
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('07b078bb-194d-4d9a-8df9-76838f694dfa', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 11, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/public\\/ad\\/details\\/junior-accountant\"}', NULL, '2022-12-18 22:13:23', '2022-12-18 22:13:23'),
('09e83efc-26d8-4654-97f5-d3f51be9b627', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/test-23\"}', NULL, '2022-12-16 00:40:53', '2022-12-16 00:40:53'),
('100c0ae4-f2af-48c1-b5e5-89ac25b71729', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 6, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/yamaha-r15-fzs-v4\"}', NULL, '2022-12-15 23:24:10', '2022-12-15 23:24:10'),
('134d1291-5922-4a82-b08a-ed9b1eabea48', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 6, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/acer-laptop\"}', NULL, '2022-12-15 18:54:43', '2022-12-15 18:54:43'),
('2836ab92-34a0-43d6-b0af-ea59575a8007', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 11, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/dream-house\"}', NULL, '2022-12-18 20:55:19', '2022-12-18 20:55:19'),
('2edd681c-7b1b-4ff7-98ae-4ebec13d14ed', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 11, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/public\\/ad\\/details\\/premium-sunglass\"}', NULL, '2022-12-18 21:56:06', '2022-12-18 21:56:06'),
('425b875f-efaf-4078-8268-f861537709b2', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 11, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/public\\/ad\\/details\\/junior-accountant-33\"}', NULL, '2022-12-18 22:18:12', '2022-12-18 22:18:12'),
('461b7bf0-d9f8-47c4-a43d-ae171607a697', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 11, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/public\\/ad\\/details\\/accountant\"}', NULL, '2022-12-18 22:52:06', '2022-12-18 22:52:06'),
('4a507447-6959-41a2-ad43-ec7f8509638d', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 8, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/t-shirt\"}', NULL, '2022-12-15 15:22:11', '2022-12-15 15:22:11'),
('514b5ca4-3cf5-47e1-bdf1-c36040502eae', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 6, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/yamaha-r15-fzs-v4\"}', NULL, '2022-12-03 23:36:49', '2022-12-03 23:36:49'),
('59ecf0d0-dd11-4afa-b982-3b66ab0c0c6d', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 8, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/acer-laptop\"}', NULL, '2022-12-15 15:29:22', '2022-12-15 15:29:22'),
('5b9ce8a0-647b-40e9-a313-36459bb5b9ad', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 8, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/t-shirt\"}', NULL, '2022-12-15 18:04:13', '2022-12-15 18:04:13'),
('5d2af1ec-fe15-4ef7-961d-86a1c0b62c73', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 8, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/dumbell\"}', NULL, '2022-12-15 18:26:14', '2022-12-15 18:26:14'),
('688571e7-3c6f-4a7c-a742-1e92357a5ee3', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 8, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/tops\"}', NULL, '2022-12-15 18:14:23', '2022-12-15 18:14:23'),
('7382a3b9-ba6d-455c-9afd-0368d1738f34', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 10, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/dukaletu.co.ke\\/ad\\/details\\/test-title-3\"}', NULL, '2022-12-18 01:40:21', '2022-12-18 01:40:21'),
('8af8c05a-f467-4e62-a915-6dd37d7a7adf', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 6, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/accontant\"}', NULL, '2022-12-16 00:11:32', '2022-12-16 00:11:32'),
('9575ba55-c28d-44d8-a588-44321422d928', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 10, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/dukaletu.co.ke\\/ad\\/details\\/ember-demi-trail-mens-hiking-shoes\"}', NULL, '2022-12-17 20:48:36', '2022-12-17 20:48:36'),
('975ea4bd-e266-46c7-a7cb-9046f486881e', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 6, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/yamaha-r15-fzs-v4\"}', NULL, '2022-12-15 23:56:54', '2022-12-15 23:56:54'),
('994faa1e-57ac-4847-8673-f806a5da2f5e', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 6, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/bmw-coupe\"}', NULL, '2022-12-03 23:18:18', '2022-12-03 23:18:18'),
('99ad9b04-891a-4e90-a7c3-5bc264110d9f', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 11, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/bmw-blue-coupe\"}', NULL, '2022-12-18 20:18:09', '2022-12-18 20:18:09'),
('9cb7afb5-5e0e-40be-af38-5ba94bfb8d0a', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 6, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/acer-laptop\"}', NULL, '2022-12-03 23:45:41', '2022-12-03 23:45:41'),
('a0ed5149-2efd-429d-8cc7-eb19975352cb', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 10, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/dukaletu.co.ke\\/ad\\/details\\/ember-demi-trail-mens-hiking-shoes-26\"}', NULL, '2022-12-17 20:50:34', '2022-12-17 20:50:34'),
('ac3489ff-8752-4976-a75c-9ebcaca9eeaa', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 6, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/acer-laptop\"}', NULL, '2022-12-15 23:16:28', '2022-12-15 23:16:28'),
('aecde9cb-61b1-4de4-b805-5ae1237161f5', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/test\"}', NULL, '2022-12-16 00:21:02', '2022-12-16 00:21:02'),
('cb708500-13c8-4270-a9b5-e5c06d69ac78', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 11, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/samsung-led-tv\"}', NULL, '2022-12-18 20:34:06', '2022-12-18 20:34:06'),
('cc2f384e-f610-4512-9356-d502fc4138d9', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 4, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/dukaletu.co.ke\\/ad\\/details\\/the-lush-blunt-bob-wig-tall\"}', NULL, '2022-12-10 21:29:48', '2022-12-10 21:29:48'),
('cef1d201-3448-443c-b615-3d71eb2f5863', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/mercedes-benz-e240-2002-red\"}', NULL, '2022-11-30 19:24:29', '2022-11-30 19:24:29'),
('d3ede01e-63b3-4f79-9efe-9b3ca60bd7b9', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 8, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/industrail-materials\"}', NULL, '2022-12-15 18:21:18', '2022-12-15 18:21:18'),
('d695478a-993e-40e4-a0f0-70a96d3eb6e0', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 1, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/test-24\"}', NULL, '2022-12-16 00:49:22', '2022-12-16 00:49:22'),
('d69e0985-9ab4-4a4b-9f66-a3dcf00a9c6d', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 8, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/acer-laptop\"}', NULL, '2022-12-14 21:51:02', '2022-12-14 21:51:02'),
('dac302f4-8b7b-4fdb-a8a0-24ea81949990', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 2, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/best-ads\"}', NULL, '2022-12-01 21:09:00', '2022-12-01 21:09:00'),
('dade42e0-2a5d-4e01-9f9b-90f7a58fab52', 'App\\Notifications\\AdCreateNotification', 'App\\Models\\User', 8, '{\"msg\":\"You\'re just created a ad\",\"type\":\"adcreate\",\"url\":\"https:\\/\\/www.dukaletu.co.ke\\/ad\\/details\\/acer-laptop\"}', NULL, '2022-12-15 15:45:55', '2022-12-15 15:45:55');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `payment_status` enum('1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Waiting for payment, 2=Already paid, 3=Expired',
  `snap_token` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('ronymia.tech@gmail.com', '$2y$10$cCJ1/re7qis8EutnJrdm1.YPsEQzD8JW0wW3F5SoGr6npH9imuEsa', '2022-11-23 00:51:48'),
('arobil@gmail.com', '$2y$10$DiFkYo5c9vRQ4un/eSMc1eRTIsHGojzXnepsKCPxLaK22UIc2hFQS', '2022-11-23 00:57:21');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `id` bigint UNSIGNED NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `ad_limit` int NOT NULL,
  `featured_limit` int NOT NULL,
  `badge` tinyint(1) NOT NULL,
  `recommended` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interval` enum('monthly','yearly','custom_date') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_interval_days` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `label`, `price`, `ad_limit`, `featured_limit`, `badge`, `recommended`, `created_at`, `updated_at`, `interval`, `custom_interval_days`) VALUES
(1, 'Basic', 0.00, 5, 0, 0, 0, '2022-10-30 19:56:26', '2022-11-29 04:31:50', 'monthly', 15),
(2, 'Standard', 500.00, 10, 5, 1, 1, '2022-10-30 19:56:56', '2022-11-29 04:33:11', 'monthly', 15),
(3, 'Premium', 1000.00, 100, 50, 1, 0, '2022-10-30 19:57:21', '2022-11-29 04:33:39', 'monthly', 15);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `author_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_custom_fields`
--

CREATE TABLE `product_custom_fields` (
  `id` bigint UNSIGNED NOT NULL,
  `ad_id` bigint UNSIGNED NOT NULL,
  `custom_field_id` bigint UNSIGNED NOT NULL,
  `custom_field_group_id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_custom_fields`
--

INSERT INTO `product_custom_fields` (`id`, `ad_id`, `custom_field_id`, `custom_field_group_id`, `value`, `order`, `created_at`, `updated_at`) VALUES
(42, 18, 5, 2, 'Laptops', 0, '2022-12-15 23:16:28', '2022-12-15 23:16:28'),
(43, 18, 6, 2, 'M20', 0, '2022-12-15 23:16:28', '2022-12-15 23:16:28'),
(44, 18, 7, 2, '4 GB', 0, '2022-12-15 23:16:28', '2022-12-15 23:16:28'),
(45, 18, 8, 2, 'i5', 0, '2022-12-15 23:16:28', '2022-12-15 23:16:28'),
(46, 18, 9, 2, '2TB', 0, '2022-12-15 23:16:28', '2022-12-15 23:16:28'),
(47, 18, 65, 2, 'New', 0, '2022-12-15 23:16:28', '2022-12-15 23:16:28'),
(57, 20, 15, 4, '214, 218', 0, '2022-12-15 23:56:54', '2022-12-15 23:56:54'),
(59, 20, 10, 4, 'R15', 0, '2022-12-15 23:56:54', '2022-12-15 23:56:54'),
(60, 20, 11, 4, '2018', 0, '2022-12-15 23:56:54', '2022-12-15 23:56:54'),
(61, 20, 12, 4, '2018', 0, '2022-12-15 23:56:54', '2022-12-15 23:56:54'),
(62, 20, 13, 4, '3200', 0, '2022-12-15 23:56:54', '2022-12-15 23:56:54'),
(63, 20, 14, 4, '154', 0, '2022-12-15 23:56:54', '2022-12-15 23:56:54'),
(64, 20, 16, 4, 'Automatic', 0, '2022-12-15 23:56:54', '2022-12-15 23:56:54'),
(65, 20, 17, 4, '2018', 0, '2022-12-15 23:56:54', '2022-12-15 23:56:54'),
(66, 20, 27, 4, 'New', 0, '2022-12-15 23:56:54', '2022-12-15 23:56:54'),
(67, 21, 39, 15, '906', 0, '2022-12-16 00:11:32', '2022-12-16 00:11:32'),
(69, 21, 37, 15, 'Accounts Assistant', 0, '2022-12-16 00:11:32', '2022-12-16 00:11:32'),
(70, 21, 38, 15, 'Part Time', 0, '2022-12-16 00:11:32', '2022-12-16 00:11:32'),
(71, 21, 40, 15, '1', 0, '2022-12-16 00:11:32', '2022-12-16 00:11:32'),
(72, 21, 41, 15, 'Honors / BBA', 0, '2022-12-16 00:11:32', '2022-12-16 00:11:32'),
(73, 21, 42, 15, '15000', 0, '2022-12-16 00:11:32', '2022-12-16 00:11:32'),
(74, 21, 43, 15, '18000', 0, '2022-12-16 00:11:32', '2022-12-16 00:11:32'),
(75, 21, 44, 15, '2022-12-30', 0, '2022-12-16 00:11:32', '2022-12-16 00:11:32'),
(76, 21, 45, 15, 'Rajon Khan', 0, '2022-12-16 00:11:32', '2022-12-16 00:11:32'),
(77, 22, 15, 4, '213', 0, '2022-12-16 00:21:02', '2022-12-16 00:21:02'),
(79, 22, 10, 4, 'A1', 0, '2022-12-16 00:21:02', '2022-12-16 00:21:02'),
(80, 22, 11, 4, '10M', 0, '2022-12-16 00:21:02', '2022-12-16 00:21:02'),
(81, 22, 12, 4, '2022', 0, '2022-12-16 00:21:02', '2022-12-16 00:21:02'),
(82, 22, 13, 4, '12', 0, '2022-12-16 00:21:02', '2022-12-16 00:21:02'),
(83, 22, 14, 4, '1200', 0, '2022-12-16 00:21:02', '2022-12-16 00:21:02'),
(84, 22, 16, 4, 'Manual', 0, '2022-12-16 00:21:02', '2022-12-16 00:21:02'),
(85, 22, 17, 4, '2010', 0, '2022-12-16 00:21:03', '2022-12-16 00:21:03'),
(86, 22, 27, 4, 'Used', 0, '2022-12-16 00:21:03', '2022-12-16 00:21:03'),
(87, 23, 36, 14, 'Used', 0, '2022-12-16 00:40:53', '2022-12-16 00:40:53'),
(88, 24, 34, 12, 'Beverages', 0, '2022-12-16 00:49:22', '2022-12-16 00:49:22'),
(89, 25, 29, 8, 'Sarees', 0, '2022-12-17 20:48:36', '2022-12-17 20:48:36'),
(90, 25, 61, 8, 'Used', 0, '2022-12-17 20:48:36', '2022-12-17 20:48:36'),
(95, 27, 62, 17, 'Used', 0, '2022-12-18 01:40:21', '2022-12-18 01:40:21'),
(96, 26, 29, 8, 'Sarees', 0, '2022-12-18 01:41:34', '2022-12-18 01:41:34'),
(97, 26, 61, 8, 'Used', 0, '2022-12-18 01:41:34', '2022-12-18 01:41:34'),
(107, 28, 15, 4, '213, 214, 216, 218', 0, '2022-12-18 20:23:36', '2022-12-18 20:23:36'),
(108, 28, 10, 4, '3 Series', 0, '2022-12-18 20:23:36', '2022-12-18 20:23:36'),
(109, 28, 11, 4, '10M', 0, '2022-12-18 20:23:36', '2022-12-18 20:23:36'),
(110, 28, 12, 4, '2019', 0, '2022-12-18 20:23:36', '2022-12-18 20:23:36'),
(111, 28, 13, 4, '97', 0, '2022-12-18 20:23:36', '2022-12-18 20:23:36'),
(112, 28, 14, 4, '1200', 0, '2022-12-18 20:23:36', '2022-12-18 20:23:36'),
(113, 28, 16, 4, 'Manual', 0, '2022-12-18 20:23:36', '2022-12-18 20:23:36'),
(114, 28, 17, 4, '2019', 0, '2022-12-18 20:23:36', '2022-12-18 20:23:36'),
(115, 28, 27, 4, 'New', 0, '2022-12-18 20:23:36', '2022-12-18 20:23:36'),
(128, 29, 5, 2, 'TV', 0, '2022-12-18 20:40:01', '2022-12-18 20:40:01'),
(129, 29, 6, 2, 'Samsung', 0, '2022-12-18 20:40:01', '2022-12-18 20:40:01'),
(130, 29, 7, 2, 'None', 0, '2022-12-18 20:40:01', '2022-12-18 20:40:01'),
(131, 29, 8, 2, 'None', 0, '2022-12-18 20:40:01', '2022-12-18 20:40:01'),
(132, 29, 9, 2, 'None', 0, '2022-12-18 20:40:01', '2022-12-18 20:40:01'),
(133, 29, 65, 2, 'New', 0, '2022-12-18 20:40:01', '2022-12-18 20:40:01'),
(142, 30, 18, 5, '429', 0, '2022-12-18 21:30:59', '2022-12-18 21:30:59'),
(143, 30, 19, 5, '21', 0, '2022-12-18 21:30:59', '2022-12-18 21:30:59'),
(144, 30, 20, 5, 'decimal', 0, '2022-12-18 21:30:59', '2022-12-18 21:30:59'),
(145, 30, 21, 5, '6', 0, '2022-12-18 21:30:59', '2022-12-18 21:30:59'),
(146, 30, 22, 5, '4', 0, '2022-12-18 21:30:59', '2022-12-18 21:30:59'),
(147, 30, 23, 5, '1600', 0, '2022-12-18 21:30:59', '2022-12-18 21:30:59'),
(148, 30, 24, 5, 'South Facing', 0, '2022-12-18 21:30:59', '2022-12-18 21:30:59'),
(149, 30, 25, 5, 'Ready', 0, '2022-12-18 21:30:59', '2022-12-18 21:30:59'),
(150, 31, 28, 7, 'Eye Glasses & Lens', 0, '2022-12-18 21:56:06', '2022-12-18 21:56:06'),
(151, 31, 60, 7, 'Used', 0, '2022-12-18 21:56:06', '2022-12-18 21:56:06'),
(182, 34, 39, 15, '906', 0, '2022-12-18 22:52:06', '2022-12-18 22:52:06'),
(183, 34, 37, 15, 'Accounts Trainee', 0, '2022-12-18 22:52:06', '2022-12-18 22:52:06'),
(184, 34, 38, 15, 'Full Time', 0, '2022-12-18 22:52:06', '2022-12-18 22:52:06'),
(185, 34, 40, 15, '1', 0, '2022-12-18 22:52:06', '2022-12-18 22:52:06'),
(186, 34, 41, 15, 'Honors / BBA', 0, '2022-12-18 22:52:06', '2022-12-18 22:52:06'),
(187, 34, 42, 15, '12000', 0, '2022-12-18 22:52:06', '2022-12-18 22:52:06'),
(188, 34, 43, 15, '15000', 0, '2022-12-18 22:52:06', '2022-12-18 22:52:06'),
(189, 34, 44, 15, '2022-12-22', 0, '2022-12-18 22:52:06', '2022-12-18 22:52:06'),
(190, 34, 45, 15, 'Taskin Ahmed', 0, '2022-12-18 22:52:06', '2022-12-18 22:52:06'),
(191, 34, 47, 15, 'uploads//custom-field//1671364302_639efece10293.jpg', 0, '2022-12-18 22:52:06', '2022-12-18 22:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint UNSIGNED NOT NULL,
  `report_from_id` bigint UNSIGNED NOT NULL,
  `report_to_id` bigint UNSIGNED NOT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `seller_id` int DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `stars` int NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `seller_id`, `user_id`, `stars`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 11, 6, 5, 'Beautiful Car', 1, '2022-12-18 22:56:46', '2022-12-18 22:56:46');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
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
  `id` bigint UNSIGNED NOT NULL,
  `page_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `id` bigint UNSIGNED NOT NULL,
  `logo_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `white_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_css` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_script` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body_script` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free_featured_ad_limit` int NOT NULL DEFAULT '3',
  `regular_ads_homepage` tinyint(1) NOT NULL DEFAULT '0',
  `featured_ads_homepage` tinyint(1) NOT NULL DEFAULT '1',
  `customer_email_verification` tinyint(1) NOT NULL DEFAULT '0',
  `maximum_ad_image_limit` int UNSIGNED NOT NULL DEFAULT '5',
  `subscription_type` enum('one_time','recurring') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'one_time',
  `ads_admin_approval` tinyint(1) NOT NULL DEFAULT '0',
  `free_ad_limit` int NOT NULL DEFAULT '5',
  `sidebar_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nav_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sidebar_txt_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nav_txt_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accent_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frontend_primary_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frontend_secondary_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dark_mode` tinyint(1) NOT NULL DEFAULT '0',
  `facebook_pixel` tinyint(1) NOT NULL DEFAULT '0',
  `google_analytics` tinyint(1) NOT NULL DEFAULT '0',
  `search_engine_indexing` tinyint(1) NOT NULL DEFAULT '1',
  `default_layout` tinyint(1) NOT NULL DEFAULT '1',
  `website_loader` tinyint(1) NOT NULL DEFAULT '1',
  `loader_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_changing` tinyint(1) NOT NULL DEFAULT '1',
  `email_verification` tinyint(1) NOT NULL DEFAULT '0',
  `watermark_status` tinyint(1) NOT NULL DEFAULT '0',
  `watermark_type` enum('text','image') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `watermark_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Dukaletu',
  `watermark_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'frontend/images/logo.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `default_map` enum('google-map','map-box') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'google-map',
  `google_map_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_box_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_long` double NOT NULL DEFAULT '-100',
  `default_lat` double NOT NULL DEFAULT '40',
  `push_notification_status` tinyint(1) NOT NULL DEFAULT '1',
  `server_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_bucket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `messaging_sender_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `measurement_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkdin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_mode` enum('live','local') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo_image`, `white_logo`, `favicon_image`, `header_css`, `header_script`, `body_script`, `free_featured_ad_limit`, `regular_ads_homepage`, `featured_ads_homepage`, `customer_email_verification`, `maximum_ad_image_limit`, `subscription_type`, `ads_admin_approval`, `free_ad_limit`, `sidebar_color`, `nav_color`, `sidebar_txt_color`, `nav_txt_color`, `main_color`, `accent_color`, `frontend_primary_color`, `frontend_secondary_color`, `dark_mode`, `facebook_pixel`, `google_analytics`, `search_engine_indexing`, `default_layout`, `website_loader`, `loader_image`, `language_changing`, `email_verification`, `watermark_status`, `watermark_type`, `watermark_text`, `watermark_image`, `created_at`, `updated_at`, `default_map`, `google_map_key`, `map_box_key`, `default_long`, `default_lat`, `push_notification_status`, `server_key`, `api_key`, `auth_domain`, `project_id`, `storage_bucket`, `messaging_sender_id`, `app_id`, `measurement_id`, `facebook`, `twitter`, `instagram`, `youtube`, `linkdin`, `whatsapp`, `app_mode`) VALUES
(1, 'uploads/app/logo\\o5cLJ1S3qDEGpBVhK2dPjsG4y43JNUodisa1oSjM.png', 'uploads/app/logo\\wNUnMrh5vOJwPC4zdJux2C4gClD3089XGlZcnvs5.png', 'uploads/app/logo/6y8NdpAumtYadiWG5yNBW3V7CrALVLL8fqqmzSNA.png', NULL, NULL, NULL, 1, 1, 1, 0, 5, 'one_time', 0, 3, '#022446', '#0a243e', '#e0e9f2', '#e0e9f2', '#05c279', '#ffc107', '#05c279', '#ffc107', 0, 0, 0, 1, 1, 0, NULL, 0, 0, 1, 'text', 'Dukaletu', 'frontend/images/logo.png', '2022-08-19 23:31:12', '2022-12-15 15:41:10', 'google-map', 'AIzaSyA0gxkGb2UmHjxv9ftK8LjX9vQ-SnmJJ20', '', 36.817223, -1.286389, 1, 'your-server-key', 'your-api-key', 'your-auth-domain', 'your-project-id', 'your-storage-bucket', 'your-messaging-sender-id', 'your-app-id', 'your-measurement-id', 'https://facebook.com/', 'https://twitter.com/', 'https://instagram.com/', 'https://instagram.com/', 'https://www.linkedin.com', 'https://web.whatsapp.com/', 'live');

-- --------------------------------------------------------

--
-- Table structure for table `setup_guides`
--

CREATE TABLE `setup_guides` (
  `id` bigint UNSIGNED NOT NULL,
  `task_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setup_guides`
--

INSERT INTO `setup_guides` (`id`, `task_name`, `title`, `description`, `action_route`, `action_label`, `status`, `created_at`, `updated_at`) VALUES
(1, 'app_setting', 'App Information ', 'Add your app logo, name, description, owner and other information.', 'settings.general', 'Add App Information', 1, '2022-08-19 23:31:12', '2022-11-12 21:25:12'),
(2, 'smtp_setting', 'SMTP Configuration', 'Add your app logo, name, description, owner and other information.', 'settings.email', 'Add Mail Configuration', 1, '2022-08-19 23:31:12', '2022-11-23 03:12:26'),
(3, 'payment_setting', 'Enable Payment Method', 'Enable to payment methods to receive payments from your customer.', 'settings.payment', 'Add Payment', 1, '2022-08-19 23:31:12', '2022-11-12 15:58:16'),
(4, 'theme_setting', 'Customize Theme', 'Customize your theme to make your app look more attractive.', 'settings.theme', 'Customize Your App Now', 0, '2022-08-19 23:31:12', '2022-08-19 23:31:12'),
(5, 'map_setting', 'Map Configuration', 'Configure your map setting api to create ad in any location.', 'settings.system', 'Add Map API', 1, '2022-08-19 23:31:12', '2022-11-29 05:09:33'),
(6, 'pusher_setting', 'Pusher Configuration', 'Configure your pusher setting api for the chat application', 'settings.system', 'Add Pusher API', 0, '2022-08-19 23:31:12', '2022-08-19 23:31:12');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Table structure for table `sms_packages`
--

CREATE TABLE `sms_packages` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `amount_of_sms` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL DEFAULT '1',
  `validity` int NOT NULL DEFAULT '1' COMMENT 'number of days '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sms_packages`
--

INSERT INTO `sms_packages` (`id`, `name`, `price`, `amount_of_sms`, `created_at`, `updated_at`, `status`, `validity`) VALUES
(1, 'Gold', 10, 200, '2022-12-06 12:55:33', '2022-12-06 13:39:11', 1, 10),
(2, 'Sliver', 200, 2000, '2022-12-06 12:56:15', '2022-12-07 09:27:38', 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `social_media` enum('facebook','twitter','instagram','youtube','linkedin','pinterest','reddit','github','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_media`
--

INSERT INTO `social_media` (`id`, `user_id`, `social_media`, `url`, `created_at`, `updated_at`) VALUES
(1, 14, 'facebook', 'https://www.facebook.com/rabby', '2022-11-24 20:03:48', '2022-11-24 20:03:48'),
(3, 16, 'youtube', 'https://www.youtube.com/watch?v=8krHa0d_N0s', '2022-11-27 17:28:44', '2022-11-27 17:28:44'),
(4, 11, 'facebook', 'https://www.facebook.com', '2022-12-18 23:45:20', '2022-12-18 23:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(7, 1, 'Cars', 'cars', 1, '2022-10-26 14:56:02', '2022-12-01 21:25:06'),
(12, 1, 'Buses & MicroBuses', 'buses-microbuses', 1, '2022-10-26 14:56:56', '2022-12-01 21:26:44'),
(16, 1, 'Heavy Equipment', 'heavy-equipment', 1, '2022-12-01 21:27:53', '2022-12-01 21:27:53'),
(17, 1, 'Motor Cycles', 'motor-cycles', 1, '2022-12-01 21:28:31', '2022-12-01 21:28:31'),
(18, 1, 'Trucks & Trailers', 'trucks-trailers', 1, '2022-12-01 21:28:54', '2022-12-01 21:28:54'),
(19, 1, 'Spares & Accessories', 'spares-accessories', 1, '2022-12-01 21:29:22', '2022-12-01 21:29:22'),
(20, 7, 'Hair Beauty', 'hair-beauty', 1, '2022-12-01 21:32:41', '2022-12-01 21:32:41'),
(21, 7, 'Skin Care', 'skin-care', 1, '2022-12-01 21:33:12', '2022-12-01 21:33:12'),
(22, 7, 'Sexual Wellness', 'sexual-wellness', 1, '2022-12-01 21:33:43', '2022-12-01 21:33:43'),
(23, 7, 'Make Up', 'make-up', 1, '2022-12-01 21:34:19', '2022-12-01 21:34:19'),
(24, 4, 'Laptops', 'laptops', 1, '2022-12-03 23:42:56', '2022-12-03 23:42:56'),
(25, 16, 'Smart Phone', 'smart-phone', 1, '2022-12-04 00:36:43', '2022-12-04 00:36:43'),
(26, 17, 'Mobile Phones', 'mobile-phones', 1, '2022-12-13 15:52:10', '2022-12-13 15:52:10'),
(27, 17, 'Mobile Phone Accessories', 'mobile-phone-accessories', 1, '2022-12-13 15:52:39', '2022-12-13 15:52:39'),
(28, 17, 'Wearables', 'wearables', 1, '2022-12-13 15:53:09', '2022-12-13 15:53:09'),
(29, 17, 'SIM Cards', 'sim-cards', 1, '2022-12-13 15:53:39', '2022-12-13 15:53:39'),
(30, 17, 'Mobile Phone Services', 'mobile-phone-services', 1, '2022-12-13 15:53:56', '2022-12-13 15:53:56'),
(31, 4, 'Desktop Computers', 'desktop-computers', 1, '2022-12-13 15:55:59', '2022-12-13 15:55:59'),
(32, 4, 'Laptop & Computer Accessories', 'laptop-computer-accessories', 1, '2022-12-13 15:56:19', '2022-12-13 15:56:19'),
(33, 4, 'TVs', 'tvs', 1, '2022-12-13 15:56:43', '2022-12-13 15:56:43'),
(34, 4, 'Audio & Sound Systems', 'audio-sound-systems', 1, '2022-12-13 15:57:02', '2022-12-13 15:57:02'),
(35, 4, 'Home Appliances', 'home-appliances', 1, '2022-12-13 15:57:24', '2022-12-13 15:57:24'),
(36, 4, 'ACs & Home Electronics', 'acs-home-electronics', 1, '2022-12-13 15:57:44', '2022-12-13 15:57:44'),
(37, 4, 'Cameras, Camcorders & Accessories', 'cameras-camcorders-accessories', 1, '2022-12-13 15:58:01', '2022-12-13 15:58:01'),
(38, 4, 'TV & Video Accessories', 'tv-video-accessories', 1, '2022-12-13 15:58:15', '2022-12-13 15:58:15'),
(39, 4, 'Tablets & Accessories', 'tablets-accessories', 1, '2022-12-13 15:58:30', '2022-12-13 15:58:30'),
(40, 4, 'Other Electronics', 'other-electronics', 1, '2022-12-13 16:00:13', '2022-12-13 16:00:13'),
(41, 4, 'Video Game Consoles & Accessories', 'video-game-consoles-accessories', 1, '2022-12-13 16:00:28', '2022-12-13 16:00:28'),
(42, 4, 'Photocopiers', 'photocopiers', 1, '2022-12-13 16:00:42', '2022-12-13 16:00:42'),
(44, 1, 'Bicycles', 'bicycles', 1, '2022-12-13 16:01:44', '2022-12-13 16:01:44'),
(45, 1, 'Auto Parts & Accessories', 'auto-parts-accessories', 1, '2022-12-13 16:01:59', '2022-12-13 16:01:59'),
(46, 1, 'Rentals', 'rentals', 1, '2022-12-13 16:02:12', '2022-12-13 16:02:12'),
(47, 1, 'Trucks', 'trucks', 1, '2022-12-13 16:02:26', '2022-12-13 16:02:26'),
(48, 1, 'Three Wheelers', 'three-wheelers', 1, '2022-12-13 16:02:40', '2022-12-13 16:02:40'),
(49, 1, 'Vans', 'vans', 1, '2022-12-13 16:02:58', '2022-12-13 16:02:58'),
(50, 1, 'Water Transport', 'water-transport', 1, '2022-12-13 16:03:12', '2022-12-13 16:03:12'),
(51, 1, 'Heavy Duty', 'heavy-duty', 1, '2022-12-13 16:03:27', '2022-12-13 16:03:27'),
(52, 1, 'Buses', 'buses', 1, '2022-12-13 16:03:39', '2022-12-13 16:03:39'),
(53, 1, 'Auto Services', 'auto-services', 1, '2022-12-13 16:03:52', '2022-12-13 16:03:52'),
(54, 2, 'Land For Sale', 'land-for-sale', 1, '2022-12-13 16:05:41', '2022-12-13 16:05:41'),
(55, 2, 'Apartments For Sale', 'apartments-for-sale', 1, '2022-12-13 16:05:54', '2022-12-13 16:05:54'),
(56, 2, 'Apartment Rentals', 'apartment-rentals', 1, '2022-12-13 16:06:06', '2022-12-13 16:06:06'),
(57, 2, 'Commercial Property Rentals', 'commercial-property-rentals', 1, '2022-12-13 16:06:19', '2022-12-13 16:06:19'),
(58, 2, 'Houses For Sale', 'houses-for-sale', 1, '2022-12-13 16:06:33', '2022-12-13 16:06:33'),
(59, 2, 'Room Rentals', 'room-rentals', 1, '2022-12-13 16:06:48', '2022-12-13 16:06:48'),
(60, 2, 'Commercial Properties For Sale', 'commercial-properties-for-sale', 1, '2022-12-13 16:07:02', '2022-12-13 16:07:02'),
(61, 2, 'House Rentals', 'house-rentals', 1, '2022-12-13 16:07:15', '2022-12-13 16:07:15'),
(62, 2, 'Land Rentals', 'land-rentals', 1, '2022-12-13 16:07:27', '2022-12-13 16:07:27'),
(63, 2, 'New Projects', 'new-projects', 1, '2022-12-13 16:07:40', '2022-12-13 16:07:40'),
(64, 18, 'Living Room Furniture', 'living-room-furniture', 1, '2022-12-13 16:09:27', '2022-12-13 16:09:27'),
(65, 18, 'Bedroom Furniture', 'bedroom-furniture', 1, '2022-12-13 16:09:48', '2022-12-13 16:09:48'),
(66, 18, 'Office & Shop Furniture', 'office-shop-furniture', 1, '2022-12-13 16:10:05', '2022-12-13 16:10:05'),
(67, 18, 'Household Items', 'household-items', 1, '2022-12-13 16:10:22', '2022-12-13 16:10:22'),
(68, 18, 'Kitchen & Dining Furniture', 'kitchen-dining-furniture', 1, '2022-12-13 16:10:39', '2022-12-13 16:10:39'),
(69, 18, 'Home Textiles & Decoration', 'home-textiles-decoration', 1, '2022-12-13 16:10:54', '2022-12-13 16:10:54'),
(70, 18, 'Bathroom Products', 'bathroom-products', 1, '2022-12-13 16:11:10', '2022-12-13 16:11:10'),
(71, 18, 'Doors', 'doors', 1, '2022-12-13 16:11:26', '2022-12-13 16:11:26'),
(72, 18, 'Children\'s Furniture', 'childrens-furniture', 1, '2022-12-13 16:11:41', '2022-12-13 16:11:41'),
(73, 19, 'Pets', 'pets', 1, '2022-12-13 16:13:12', '2022-12-13 16:13:12'),
(74, 19, 'Farm Animals', 'farm-animals', 1, '2022-12-13 16:13:32', '2022-12-13 16:13:32'),
(75, 19, 'Pet & Animal Accessories', 'pet-animal-accessories', 1, '2022-12-13 16:13:48', '2022-12-13 16:13:48'),
(76, 19, 'Pet & Animal food', 'pet-animal-food', 1, '2022-12-13 16:14:03', '2022-12-13 16:14:03'),
(77, 20, 'Musical Instruments', 'musical-instruments', 1, '2022-12-13 16:14:39', '2022-12-13 16:14:39'),
(78, 20, 'Sports', 'sports', 1, '2022-12-13 16:14:55', '2022-12-13 16:14:55'),
(79, 20, 'Fitness & Gym', 'fitness-gym', 1, '2022-12-13 16:15:09', '2022-12-13 16:15:09'),
(80, 20, 'Children\'s Items', 'childrens-items', 1, '2022-12-13 16:15:22', '2022-12-13 16:15:22'),
(81, 20, 'Other Hobby, Sport & Kids items', 'other-hobby-sport-kids-items', 1, '2022-12-13 16:15:41', '2022-12-13 16:15:41'),
(82, 20, 'Music, Books & Movies', 'music-books-movies', 1, '2022-12-13 16:15:59', '2022-12-13 16:15:59'),
(83, 21, 'Watches', 'watches', 1, '2022-12-13 16:18:16', '2022-12-13 16:18:16'),
(84, 21, 'Jacket & Coat', 'jacket-coat', 1, '2022-12-13 16:18:33', '2022-12-13 16:18:33'),
(85, 21, 'Footwear', 'footwear', 1, '2022-12-13 16:19:07', '2022-12-13 16:19:07'),
(86, 21, 'Shirts & T-Shirts', 'shirts-t-shirts', 1, '2022-12-13 16:19:26', '2022-12-13 16:19:26'),
(87, 21, 'Bags & Accessories', 'bags-accessories', 1, '2022-12-13 16:19:40', '2022-12-13 16:19:40'),
(88, 21, 'Grooming & Bodycare', 'grooming-bodycare', 1, '2022-12-13 16:19:57', '2022-12-13 16:19:57'),
(89, 21, 'Traditional Clothing', 'traditional-clothing', 1, '2022-12-13 16:20:12', '2022-12-13 16:20:12'),
(90, 21, 'Pants', 'pants', 1, '2022-12-13 16:20:25', '2022-12-13 16:20:25'),
(91, 21, 'Optical & Sunglasses', 'optical-sunglasses', 1, '2022-12-13 16:20:40', '2022-12-13 16:20:40'),
(92, 21, 'Wholesale - Bulk', 'wholesale-bulk', 1, '2022-12-13 16:20:54', '2022-12-13 16:20:54'),
(93, 21, 'Baby Boy\'s Fashion', 'baby-boys-fashion', 1, '2022-12-13 16:21:15', '2022-12-13 16:21:15'),
(94, 22, 'Traditional Wear', 'traditional-wear', 1, '2022-12-13 16:23:13', '2022-12-13 16:23:13'),
(95, 22, 'Jewellery & Watches', 'jewellery-watches', 1, '2022-12-13 16:23:27', '2022-12-13 16:23:27'),
(96, 22, 'Beauty & Personal Care', 'beauty-personal-care', 1, '2022-12-13 16:23:40', '2022-12-13 16:23:40'),
(97, 22, 'Western Wear', 'western-wear', 1, '2022-12-13 16:23:54', '2022-12-13 16:23:54'),
(98, 22, 'Winter Wear', 'winter-wear', 1, '2022-12-13 16:24:09', '2022-12-13 16:24:09'),
(99, 22, 'Baby Girl\'s Fashion', 'baby-girls-fashion', 1, '2022-12-13 16:24:49', '2022-12-13 16:24:49'),
(100, 22, 'Lingerie & Sleepwear', 'lingerie-sleepwear', 1, '2022-12-13 16:25:18', '2022-12-13 16:25:18'),
(101, 23, 'Industry Machinery & Tools', 'industry-machinery-tools', 1, '2022-12-13 16:26:12', '2022-12-13 16:26:12'),
(102, 23, 'Other Business & Industry Items', 'other-business-industry-items', 1, '2022-12-13 16:26:28', '2022-12-13 16:26:28'),
(103, 23, 'Medical Equipment & Supplies', 'medical-equipment-supplies', 1, '2022-12-13 16:26:44', '2022-12-13 16:26:44'),
(104, 23, 'Office Supplies & Stationary', 'office-supplies-stationary', 1, '2022-12-13 16:26:58', '2022-12-13 16:26:58'),
(105, 23, 'Licences, Titles & Tenders', 'licences-titles-tenders', 1, '2022-12-13 16:27:13', '2022-12-13 16:27:13'),
(106, 23, 'Raw Materials & Industrial Supplies', 'raw-materials-industrial-supplies', 1, '2022-12-13 16:27:29', '2022-12-13 16:27:29'),
(107, 23, 'Safety & Security', 'safety-security', 1, '2022-12-13 16:27:44', '2022-12-13 16:27:44'),
(108, 24, 'Grocery', 'grocery', 1, '2022-12-13 16:28:15', '2022-12-13 16:28:15'),
(109, 24, 'Healthcare', 'healthcare', 1, '2022-12-13 16:28:29', '2022-12-13 16:28:29'),
(110, 24, 'Household', 'household', 1, '2022-12-13 16:28:42', '2022-12-13 16:28:42'),
(111, 24, 'Other Essentials', 'other-essentials', 1, '2022-12-13 16:29:04', '2022-12-13 16:29:04'),
(112, 24, 'Fruits & Vegetables', 'fruits-vegetables', 1, '2022-12-13 16:29:21', '2022-12-13 16:29:21'),
(113, 24, 'Baby Products', 'baby-products', 1, '2022-12-13 16:29:35', '2022-12-13 16:29:35'),
(114, 24, 'Meat & Seafood', 'meat-seafood', 1, '2022-12-13 16:29:47', '2022-12-13 16:29:47'),
(115, 25, 'Tuition', 'tuition', 1, '2022-12-13 16:31:52', '2022-12-13 16:31:52'),
(116, 25, 'Textbooks', 'textbooks', 1, '2022-12-13 16:32:07', '2022-12-13 16:32:07'),
(117, 25, 'Courses', 'courses', 1, '2022-12-13 16:32:21', '2022-12-13 16:32:21'),
(118, 25, 'Study Abroad', 'study-abroad', 1, '2022-12-13 16:32:36', '2022-12-13 16:32:36'),
(119, 25, 'Other Education', 'other-education', 1, '2022-12-13 16:32:48', '2022-12-13 16:32:48'),
(120, 10, 'Government Jobs', 'government-jobs', 1, '2022-12-13 16:34:57', '2022-12-13 16:34:57'),
(121, 10, 'Office Admin', 'office-admin', 1, '2022-12-13 16:35:46', '2022-12-13 16:35:46'),
(122, 10, 'Maid', 'maid', 1, '2022-12-13 16:36:01', '2022-12-13 16:36:01'),
(123, 10, 'Security Guard', 'security-guard', 1, '2022-12-13 16:36:15', '2022-12-13 16:36:15'),
(124, 10, 'Driver', 'driver', 1, '2022-12-13 16:36:26', '2022-12-13 16:36:26'),
(125, 10, 'Chef', 'chef', 1, '2022-12-13 16:36:40', '2022-12-13 16:36:40'),
(126, 10, 'Counsellor', 'counsellor', 1, '2022-12-13 16:36:54', '2022-12-13 16:36:54'),
(127, 10, 'Teacher', 'teacher', 1, '2022-12-13 16:37:12', '2022-12-13 16:37:12'),
(128, 10, 'Software Engineer', 'software-engineer', 1, '2022-12-13 16:37:27', '2022-12-13 16:37:27'),
(129, 10, 'Hospitality Executive', 'hospitality-executive', 1, '2022-12-13 16:37:41', '2022-12-13 16:37:41'),
(130, 10, 'Customer Support Manager', 'customer-support-manager', 1, '2022-12-13 16:37:54', '2022-12-13 16:37:54'),
(131, 10, 'Nurse', 'nurse', 1, '2022-12-13 16:38:06', '2022-12-13 16:38:06'),
(132, 10, 'Other', 'other', 1, '2022-12-13 16:38:17', '2022-12-13 16:38:17'),
(133, 10, 'Digital Marketing Manager', 'digital-marketing-manager', 1, '2022-12-13 16:38:30', '2022-12-13 16:38:30'),
(134, 10, 'Collection & Recovery Agents', 'collection-recovery-agents', 1, '2022-12-13 16:38:44', '2022-12-13 16:38:44'),
(135, 10, 'Quality Controller', 'quality-controller', 1, '2022-12-13 16:38:57', '2022-12-13 16:38:57'),
(136, 10, 'Doctor', 'doctor', 1, '2022-12-13 16:39:09', '2022-12-13 16:39:09'),
(137, 10, 'Management Trainee', 'management-trainee', 1, '2022-12-13 16:39:20', '2022-12-13 16:39:20'),
(138, 10, 'HR Manager', 'hr-manager', 1, '2022-12-13 16:39:33', '2022-12-13 16:39:33'),
(139, 10, 'Sales Executive', 'sales-executive', 1, '2022-12-13 16:39:50', '2022-12-13 16:39:50'),
(140, 10, 'Operator', 'operator', 1, '2022-12-13 16:40:03', '2022-12-13 16:40:03'),
(141, 10, 'Delivery Rider', 'delivery-rider', 1, '2022-12-13 16:40:15', '2022-12-13 16:40:15'),
(142, 10, 'Supervisor', 'supervisor', 1, '2022-12-13 16:40:25', '2022-12-13 16:40:25'),
(143, 10, 'Digital Marketing Executive', 'digital-marketing-executive', 1, '2022-12-13 16:40:39', '2022-12-13 16:40:39'),
(144, 10, 'Social Media Presenter', 'social-media-presenter', 1, '2022-12-13 16:40:50', '2022-12-13 16:40:50'),
(145, 10, 'Marketing Manager', 'marketing-manager', 1, '2022-12-13 16:41:05', '2022-12-13 16:41:05'),
(146, 10, 'Engineer', 'engineer', 1, '2022-12-13 16:41:19', '2022-12-13 16:41:19'),
(147, 10, 'Quality Checker', 'quality-checker', 1, '2022-12-13 16:41:32', '2022-12-13 16:41:32'),
(148, 10, 'Beautician', 'beautician', 1, '2022-12-13 16:41:43', '2022-12-13 16:41:43'),
(149, 10, 'Journalist', 'journalist', 1, '2022-12-13 16:41:57', '2022-12-13 16:41:57'),
(150, 10, 'Pharmacist', 'pharmacist', 1, '2022-12-13 16:42:09', '2022-12-13 16:42:09'),
(151, 10, 'Videographer', 'videographer', 1, '2022-12-13 16:42:24', '2022-12-13 16:42:24'),
(152, 10, 'SEO specialist', 'seo-specialist', 1, '2022-12-13 16:42:35', '2022-12-13 16:42:35'),
(153, 10, 'Gardener', 'gardener', 1, '2022-12-13 16:42:48', '2022-12-13 16:42:48'),
(154, 10, 'Photographer', 'photographer', 1, '2022-12-13 16:43:00', '2022-12-13 16:43:00'),
(155, 10, 'Event Planner', 'event-planner', 1, '2022-12-13 16:43:12', '2022-12-13 16:43:12'),
(156, 10, 'Merchandiser', 'merchandiser', 1, '2022-12-13 16:43:25', '2022-12-13 16:43:25'),
(157, 10, 'Interior Designer', 'interior-designer', 1, '2022-12-13 16:43:49', '2022-12-13 16:43:49'),
(158, 10, 'Customer Service Executive', 'customer-service-executive', 1, '2022-12-13 16:44:09', '2022-12-13 16:44:09'),
(159, 10, 'Marketing Executive', 'marketing-executive', 1, '2022-12-13 16:44:31', '2022-12-13 16:44:31'),
(160, 10, 'House Keeper', 'house-keeper', 1, '2022-12-13 16:44:43', '2022-12-13 16:44:43'),
(161, 10, 'Garments Worker', 'garments-worker', 1, '2022-12-13 16:44:57', '2022-12-13 16:44:57'),
(162, 10, 'Accountant', 'accountant', 1, '2022-12-13 16:45:12', '2022-12-13 16:45:12'),
(163, 10, 'Designer', 'designer', 1, '2022-12-13 16:45:24', '2022-12-13 16:45:24'),
(164, 10, 'Mechanic', 'mechanic', 1, '2022-12-13 16:45:36', '2022-12-13 16:45:36'),
(165, 10, 'Electrician', 'electrician', 1, '2022-12-13 16:45:48', '2022-12-13 16:45:48'),
(166, 10, 'Sales Manager Field', 'sales-manager-field', 1, '2022-12-13 16:45:59', '2022-12-13 16:45:59'),
(167, 10, 'Construction Worker', 'construction-worker', 1, '2022-12-13 16:46:18', '2022-12-13 16:46:18'),
(168, 10, 'Content Writer', 'content-writer', 1, '2022-12-13 16:46:41', '2022-12-13 16:46:41'),
(169, 10, 'HR Executive', 'hr-executive', 1, '2022-12-13 16:46:52', '2022-12-13 16:46:52'),
(170, 10, 'Production Executive', 'production-executive', 1, '2022-12-13 16:47:05', '2022-12-13 16:47:05'),
(171, 10, 'Business Analyst', 'business-analyst', 1, '2022-12-13 16:47:16', '2022-12-13 16:47:16'),
(172, 10, 'Medical Representative', 'medical-representative', 1, '2022-12-13 16:47:29', '2022-12-13 16:47:29'),
(173, 10, 'Public Relations Officer', 'public-relations-officer', 1, '2022-12-13 16:47:40', '2022-12-13 16:47:40'),
(174, 10, 'Florist', 'florist', 1, '2022-12-13 16:47:52', '2022-12-13 16:47:52'),
(175, 10, 'Flight Attendant', 'flight-attendant', 1, '2022-12-13 16:48:04', '2022-12-13 16:48:04'),
(176, 9, 'Servicing & Repair', 'servicing-repair', 1, '2022-12-13 16:49:04', '2022-12-13 16:49:04'),
(177, 9, 'IT Services', 'it-services', 1, '2022-12-13 16:49:18', '2022-12-13 16:49:18'),
(178, 9, 'Tours & Travels', 'tours-travels', 1, '2022-12-13 16:49:30', '2022-12-13 16:49:30'),
(179, 9, 'Media & Event Management Services', 'media-event-management-services', 1, '2022-12-13 16:49:45', '2022-12-13 16:49:45'),
(180, 9, 'Professional Services', 'professional-services', 1, '2022-12-13 16:49:57', '2022-12-13 16:49:57'),
(181, 9, 'Matrimonials', 'matrimonials', 1, '2022-12-13 16:50:12', '2022-12-13 16:50:12'),
(182, 9, 'Fitness & Beauty Services', 'fitness-beauty-services', 1, '2022-12-13 16:50:26', '2022-12-13 16:50:26'),
(183, 9, 'Building maintenance', 'building-maintenance', 1, '2022-12-13 16:50:38', '2022-12-13 16:50:38'),
(184, 9, 'Domestic & Daycare Services', 'domestic-daycare-services', 1, '2022-12-13 16:50:51', '2022-12-13 16:50:51'),
(185, 26, 'Crops, Seeds & Plants', 'crops-seeds-plants', 1, '2022-12-13 16:53:42', '2022-12-13 16:53:42'),
(186, 26, 'Farming Tools & Machinery', 'farming-tools-machinery', 1, '2022-12-13 16:53:56', '2022-12-13 16:53:56'),
(187, 26, 'Other Agriculture', 'other-agriculture', 1, '2022-12-13 16:54:09', '2022-12-13 16:54:09');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stars` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` bigint UNSIGNED NOT NULL,
  `home_page` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
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
  `id` bigint UNSIGNED NOT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trackingid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_provider` enum('flutterwave','mollie','midtrans','paypal','paystack','razorpay','sslcommerz','stripe','instamojo','offline','pesapal') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` bigint UNSIGNED DEFAULT NULL,
  `sms_plan_id` int DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usd_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('paid','unpaid','failed','success') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `order_id`, `transaction_id`, `trackingid`, `payment_provider`, `plan_id`, `sms_plan_id`, `user_id`, `amount`, `currency_symbol`, `usd_amount`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 'PESAPALSW6YI9KSAWY8E1Z', 'PESAPALJUUI5JQV28LE8T9', NULL, 'pesapal', 2, NULL, 6, '500', NULL, NULL, 'unpaid', '2022-12-13 17:14:12', '2022-12-13 17:14:12'),
(2, 'PESAPALF0BOJAFFA8I09O6', 'PESAPALA3WBS0ORAP6TBMR', NULL, 'pesapal', NULL, 2, 1, '200', NULL, NULL, 'unpaid', '2022-12-15 23:01:30', '2022-12-15 23:01:30'),
(3, 'PESAPALGFNAY50ZPQV57UA', 'PESAPALLXMYQ2RR0KETJ6O', 'be55f612-f146-474d-abed-df3e8d15b80e', 'pesapal', NULL, 1, 10, '10', NULL, NULL, 'failed', '2022-12-17 21:35:48', '2022-12-17 21:36:44'),
(4, 'PESAPAL8HDMFAIQR1UOMOX', 'PESAPALYAGP46COFLU6WKA', NULL, 'pesapal', 2, NULL, 11, '500', NULL, NULL, 'unpaid', '2022-12-18 21:31:36', '2022-12-18 21:31:36'),
(5, 'PESAPALNKD4V3C8YE649BE', 'PESAPALI69XQ28EAK8Z70A', NULL, 'pesapal', 2, NULL, 11, '500', NULL, NULL, 'unpaid', '2022-12-18 21:48:52', '2022-12-18 21:48:52'),
(6, 'PESAPALHSOMQMW1MD56VWL', 'PESAPALTR0OWQNMHQ6MSQ2', '6863650b-3902-4f9d-b6ac-df3dceb33d5d', 'pesapal', 2, NULL, 11, '500', NULL, NULL, 'failed', '2022-12-18 21:49:52', '2022-12-18 21:51:16'),
(7, 'PESAPAL6BI3GPV22OC16NM', 'PESAPALLILXBZZEA7FNROD', '9e683c34-62e3-47c9-bb7c-df3daa4bdcbe', 'pesapal', NULL, 1, 11, '10', NULL, NULL, 'failed', '2022-12-18 23:02:44', '2022-12-18 23:05:00'),
(8, 'PESAPALXF33DKZ8P9PTF5E', 'PESAPALU8XIO0AFRVCCCQ5', '999f2c9d-9ceb-4d47-b346-df3dde69ff40', 'pesapal', NULL, 2, 11, '200', NULL, NULL, 'failed', '2022-12-18 23:10:42', '2022-12-18 23:12:00'),
(9, 'PESAPALHNRS5R84AEBED9Q', 'PESAPAL1XV7N7PGCPE3B8X', '7aba7b91-fd65-4296-960b-df3d321ea3ad', 'pesapal', NULL, 2, 11, '200', NULL, NULL, 'failed', '2022-12-18 23:15:05', '2022-12-18 23:16:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'backend/image/default-user.png',
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_seen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'email',
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_sms_stock` int NOT NULL DEFAULT '0' COMMENT 'unused sms',
  `sms_plan_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `phone`, `email_verified_at`, `password`, `web`, `image`, `token`, `last_seen`, `remember_token`, `created_at`, `updated_at`, `auth_type`, `provider`, `provider_id`, `fcm_token`, `user_sms_stock`, `sms_plan_id`) VALUES
(1, 'Rony', 'ronymia', 'ronymia.tech@gmail.com', '+254 718 438983', NULL, '$2y$10$MSBBrrtzIuVocVhedzGYi.DNxn..qDVDQiiOOMN.6dww3XeTC2HIa', NULL, 'backend/image/default-user.png', NULL, '2022-12-16 00:49:21', NULL, '2022-11-30 19:14:35', '2022-12-16 00:49:21', 'email', NULL, NULL, NULL, 0, NULL),
(2, 'Masud', 'masud', 'masud@gmail.com', '+254 785 254682', NULL, '$2y$10$2oDl8HJfyj.OIKv/TCV9XezS4HOPj1bvK9UvpAMKi4LcIFA/ZlRES', NULL, 'backend/image/default-user.png', NULL, '2022-12-01 21:14:01', NULL, '2022-12-01 16:45:21', '2022-12-01 21:14:01', 'email', NULL, NULL, NULL, 0, NULL),
(3, 'Tapu', 'tapu', 'tapu@gmail.com', '+254 785 254323', NULL, '$2y$10$eXqtX0W1C.tWc1EItN.OmOmHXzbvifQMcm8aH0jArYqt81spQ1UsK', NULL, 'backend/image/default-user.png', NULL, '2022-12-01 20:40:39', NULL, '2022-12-01 20:27:02', '2022-12-01 20:40:39', 'email', NULL, NULL, NULL, 0, NULL),
(4, 'George Mwenda', 'george-mwenda_1669891239', 'jojimwesh@gmail.com', '0718438984', NULL, '$2y$10$IrxiGNLjSuZzxOeVF/h63u2PJI8PB./7cssOUDZjoJGnbP.OBN.Oe', NULL, 'uploads/customer/nwiFjLury3THKdxTJpTf9U36joZd8DGtMzHlchVi.jpg', NULL, '2022-12-16 22:42:03', NULL, '2022-12-01 21:38:59', '2022-12-16 22:42:03', 'email', NULL, NULL, NULL, 0, NULL),
(5, 'Dukaletu', 'Dukaletu', 'dukaletustores@gmail.com', NULL, NULL, '$2y$10$VkxECKjSpoiTbTFe9RGk5uuzvmJnl5EDnZ5p3UKsda5la0bAKKxJK', NULL, 'backend/image/default-user.png', NULL, NULL, NULL, '2022-12-01 22:09:26', '2022-12-01 22:09:26', 'email', NULL, NULL, NULL, 0, NULL),
(6, 'Mubarak Hossain', 'Mubarak', 'mubaraktech355@gmail.com', '254767424156', NULL, '$2y$10$oAJW8CbREbWEMNg4Lj7CiOEZrBu1vyen23fJP/PwiNGZpfgzontGe', NULL, 'backend/image/default-user.png', NULL, '2022-12-19 21:03:44', NULL, '2022-12-03 23:15:10', '2022-12-19 21:03:44', 'email', NULL, NULL, NULL, 0, NULL),
(7, 'JIA', 'ZIAUR', 'ZIAUR@GMAIL.COM', '788094689', NULL, '$2y$10$7JdTkxCekpyW3N6rHD..WeFgWGR2P3zRD0yqkbFW6nHcZBzJ7onBG', NULL, 'backend/image/default-user.png', NULL, '2022-12-11 18:55:02', NULL, '2022-12-11 18:53:46', '2022-12-11 18:55:02', 'email', NULL, NULL, NULL, 0, NULL),
(8, 'Md.Mubarak Hossain', 'Mubarak_Hossain', 'mubarakkha355@gmail.com', '710564569', NULL, '$2y$10$c.qgQLCkPmHF8wjlVS.1S.GMZ2m.jRpGNTbdCBnYbeFXEikjuvWUi', NULL, 'backend/image/default-user.png', NULL, '2022-12-18 20:06:14', NULL, '2022-12-13 17:19:39', '2022-12-18 20:06:14', 'email', NULL, NULL, NULL, 0, NULL),
(9, 'Mridul', 'mdmridul608', 'mdmridul6088@gmail.com', '794798227', NULL, '$2y$10$oxMCjeUQzNWqeHkxVqhyleaspmGz9H7AHrpUFHJaj2tnGPbZba0PC', NULL, 'backend/image/default-user.png', NULL, '2022-12-15 22:15:59', NULL, '2022-12-15 22:15:12', '2022-12-15 22:15:59', 'email', NULL, NULL, NULL, 0, NULL),
(10, 'Md Mridul', 'arobil@gmail.com', 'mdmridul608@gmail.com', '123456789', NULL, '$2y$10$iRyK1IQy5U8Dol/xuQJbI.cRtGX1Ys1sHl5z/rXXAWgSbU5lmPEUy', NULL, 'backend/image/default-user.png', NULL, '2022-12-18 01:43:44', NULL, '2022-12-17 20:46:54', '2022-12-18 01:43:44', 'email', NULL, NULL, NULL, 0, 1),
(11, 'Khilji', 'khilji_1671367459', 'khilji@gmail.com', '710564566', NULL, '$2y$10$HpzJcPM/bVuJ4FI0/dSVCuCuOjZSbH.r/ncSPWwBLKZJ7eLKn7nJq', NULL, 'uploads/customer/RubdkfB1ieTg1WPDfKn8xfJoRO7bhqpsvXywOmLB.jpg', NULL, '2022-12-19 21:04:32', NULL, '2022-12-18 20:10:00', '2022-12-19 21:04:32', 'email', NULL, NULL, NULL, 0, 2),
(12, 'Magdalene Muthoni', 'Magde', 'magdalene.soni@gmail.com', '0715272708', NULL, '$2y$10$RFNzfGl/oj3pPDACkc9eK.Yk4p3d1fZ9QV4/lnsbgc96HBS8iYyXO', NULL, 'backend/image/default-user.png', NULL, '2022-12-20 08:09:49', NULL, '2022-12-20 08:08:54', '2022-12-20 08:09:49', 'email', NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_device_tokens`
--

CREATE TABLE `user_device_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `device_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_phone_books`
--

CREATE TABLE `user_phone_books` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `phone_number` varchar(15) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_phone_books`
--

INSERT INTO `user_phone_books` (`id`, `user_id`, `phone_number`, `created_at`, `updated_at`) VALUES
(1, 11, '213654897', '2022-12-18 23:09:38', '2022-12-18 23:09:38');

-- --------------------------------------------------------

--
-- Table structure for table `user_plans`
--

CREATE TABLE `user_plans` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `ad_limit` bigint UNSIGNED NOT NULL DEFAULT '3',
  `featured_limit` bigint UNSIGNED NOT NULL DEFAULT '0',
  `badge` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subscription_type` enum('one_time','recurring') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'one_time',
  `expired_date` date DEFAULT NULL,
  `current_plan_id` bigint UNSIGNED DEFAULT NULL,
  `is_restored_plan_benefits` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_plans`
--

INSERT INTO `user_plans` (`id`, `user_id`, `ad_limit`, `featured_limit`, `badge`, `created_at`, `updated_at`, `subscription_type`, `expired_date`, `current_plan_id`, `is_restored_plan_benefits`) VALUES
(1, 1, 4, 1, 0, '2022-11-30 19:14:35', '2022-12-16 00:49:22', 'one_time', NULL, NULL, 0),
(2, 2, 17, 0, 0, '2022-12-01 16:45:21', '2022-12-01 21:11:04', 'one_time', NULL, NULL, 0),
(3, 3, 3, 1, 0, '2022-12-01 20:27:02', '2022-12-01 20:27:02', 'one_time', NULL, NULL, 0),
(4, 4, 2, 0, 0, '2022-12-01 21:38:59', '2022-12-10 21:29:48', 'one_time', NULL, NULL, 0),
(5, 5, 2, 0, 0, '2022-12-01 22:09:26', '2022-12-01 22:16:38', 'one_time', NULL, NULL, 0),
(6, 6, 0, 0, 0, '2022-12-03 23:15:10', '2022-12-16 00:11:32', 'one_time', NULL, NULL, 0),
(7, 7, 3, 1, 0, '2022-12-11 18:53:46', '2022-12-11 18:53:46', 'one_time', NULL, NULL, 0),
(8, 8, 0, 0, 0, '2022-12-13 17:19:39', '2022-12-15 18:26:14', 'one_time', NULL, NULL, 0),
(9, 9, 3, 1, 0, '2022-12-15 22:15:12', '2022-12-15 22:15:12', 'one_time', NULL, NULL, 0),
(10, 10, 0, 1, 0, '2022-12-17 20:46:54', '2022-12-18 01:40:21', 'one_time', NULL, NULL, 0),
(11, 11, 6, 1, 1, '2022-12-18 20:10:00', '2022-12-18 22:52:06', 'one_time', NULL, NULL, 0),
(12, 12, 3, 1, 0, '2022-12-20 08:08:54', '2022-12-20 08:08:54', 'one_time', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_sms_stocks`
--

CREATE TABLE `user_sms_stocks` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `stock` int NOT NULL,
  `status` enum('IN','OUT') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_sms_stocks`
--

INSERT INTO `user_sms_stocks` (`id`, `user_id`, `stock`, `status`, `created_at`, `updated_at`, `expire_date`) VALUES
(1, 10, 200, 'IN', '2022-12-17 21:36:44', '2022-12-17 21:36:44', '1970-01-01'),
(2, 10, -200, 'OUT', '2022-12-17 21:36:51', '2022-12-17 10:36:51', NULL),
(3, 10, 0, 'OUT', '2022-12-18 01:29:59', '2022-12-17 14:29:59', NULL),
(4, 10, 0, 'OUT', '2022-12-18 01:43:11', '2022-12-17 14:43:11', NULL),
(5, 11, 200, 'IN', '2022-12-18 23:05:00', '2022-12-18 23:05:00', '1970-01-01'),
(6, 11, -200, 'OUT', '2022-12-18 23:05:36', '2022-12-18 12:05:36', NULL),
(7, 11, 0, 'OUT', '2022-12-18 23:06:09', '2022-12-18 12:06:09', NULL),
(8, 11, 0, 'OUT', '2022-12-18 23:07:24', '2022-12-18 12:07:24', NULL),
(9, 11, 0, 'OUT', '2022-12-18 23:09:58', '2022-12-18 12:09:58', NULL),
(10, 11, 0, 'OUT', '2022-12-18 23:10:15', '2022-12-18 12:10:15', NULL),
(11, 11, 2000, 'IN', '2022-12-18 23:12:00', '2022-12-18 23:12:00', '1970-01-01'),
(12, 11, -2000, 'OUT', '2022-12-18 23:12:14', '2022-12-18 12:12:14', NULL),
(13, 11, 0, 'OUT', '2022-12-18 23:12:42', '2022-12-18 12:12:42', NULL),
(14, 11, 0, 'OUT', '2022-12-18 23:13:24', '2022-12-18 12:13:24', NULL),
(15, 11, 0, 'OUT', '2022-12-18 23:13:41', '2022-12-18 12:13:41', NULL),
(16, 11, 0, 'OUT', '2022-12-18 23:13:51', '2022-12-18 12:13:51', NULL),
(17, 11, 0, 'OUT', '2022-12-18 23:14:08', '2022-12-18 12:14:08', NULL),
(18, 11, 0, 'OUT', '2022-12-18 23:14:32', '2022-12-18 12:14:32', NULL),
(19, 11, 2000, 'IN', '2022-12-18 23:16:08', '2022-12-18 23:16:08', '1970-01-01'),
(20, 11, -2000, 'OUT', '2022-12-18 23:16:19', '2022-12-18 12:16:19', NULL),
(21, 11, 0, 'OUT', '2022-12-18 23:16:30', '2022-12-18 12:16:30', NULL),
(22, 11, 0, 'OUT', '2022-12-18 23:17:21', '2022-12-18 12:17:21', NULL),
(23, 11, 0, 'OUT', '2022-12-18 23:22:54', '2022-12-18 12:22:54', NULL),
(24, 11, 0, 'OUT', '2022-12-18 23:51:24', '2022-12-18 12:51:24', NULL);

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
  `id` bigint UNSIGNED NOT NULL,
  `ad_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `ad_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 27, 6, '2022-12-18 22:59:17', '2022-12-18 22:59:17'),
(3, 18, 11, '2022-12-18 23:01:09', '2022-12-18 23:01:09');

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
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_searches`
--
ALTER TABLE `admin_searches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `ad_features`
--
ALTER TABLE `ad_features`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `ad_galleries`
--
ALTER TABLE `ad_galleries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `category_custom_field`
--
ALTER TABLE `category_custom_field`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `cms`
--
ALTER TABLE `cms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cookies`
--
ALTER TABLE `cookies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `custom_field_groups`
--
ALTER TABLE `custom_field_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1328;

--
-- AUTO_INCREMENT for table `database_backups`
--
ALTER TABLE `database_backups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messengers`
--
ALTER TABLE `messengers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `mobile_app_configs`
--
ALTER TABLE `mobile_app_configs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mobile_app_sliders`
--
ALTER TABLE `mobile_app_sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mobile_validations`
--
ALTER TABLE `mobile_validations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `module_settings`
--
ALTER TABLE `module_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_custom_fields`
--
ALTER TABLE `product_custom_fields`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seos`
--
ALTER TABLE `seos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `setup_guides`
--
ALTER TABLE `setup_guides`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sms_packages`
--
ALTER TABLE `sms_packages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=851;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_device_tokens`
--
ALTER TABLE `user_device_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_phone_books`
--
ALTER TABLE `user_phone_books`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_plans`
--
ALTER TABLE `user_plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_sms_stocks`
--
ALTER TABLE `user_sms_stocks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
