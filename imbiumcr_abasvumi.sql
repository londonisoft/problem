-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 11, 2021 at 11:59 AM
-- Server version: 10.3.27-MariaDB-log-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imbiumcr_abasvumi`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `name`, `email`, `password`, `phone`, `image`, `created_at`, `updated_at`) VALUES
(1, 'suman ahmed', 'sumanahmed@gmail.com', '$2y$10$vg4tSwsKX5gsHYuZiXDzduomAv/fu.UyABo27BaVsrNsmKi2QOSYe', '01321121212', 'abasvumi/uploads/images/agent/1612453782.png', '2021-01-15 10:31:52', '2021-02-04 20:49:42'),
(9, 'Md Mamunur Rashid', 'mamunur6286@gmail.com', '$2y$10$fQiTEkIUeusrSgbU5SVEmOzL4dR8qnor0fOXmvooBI8A0lZRSbXVS', '01730233032', 'abasvumi/uploads/images/agent/1612931917.jpg', '2021-02-05 22:53:32', '2021-02-10 09:38:37'),
(10, 'Mamunur Rashid', 'mamun@gmail.com', '$2y$10$8U/mEvjHcPPI3zJ5yiF./Ojq.J87ffyLQkluYgTteUzLqX9FKkvB6', '01990181993', 'abasvumi/uploads/images/agent/1612967333.jpg', '2021-02-10 19:27:45', '2021-02-10 19:28:53');

-- --------------------------------------------------------

--
-- Table structure for table `amenitis`
--

CREATE TABLE `amenitis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amenitis`
--

INSERT INTO `amenitis` (`id`, `name`, `icon`, `created_at`, `updated_at`, `bn_name`) VALUES
(4, 'The amenite', 'fa-facebook', '2021-01-17 12:02:45', '2021-01-17 12:02:45', 'The amenite'),
(5, 'The amenite two', 'fa-twitter', '2021-01-17 12:03:05', '2021-01-17 12:03:05', 'The amenite two');

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name`, `bn_name`, `image`, `created_at`, `updated_at`) VALUES
(3, 'Area one', 'Area one', 'abasvumi/uploads/images/area/education_16109067321431754915.png', '2021-01-17 12:05:32', '2021-01-17 12:05:59'),
(4, 'Area two', 'Area two', 'abasvumi/uploads/images/area/education_16109067451627665413.png', '2021-01-17 12:05:45', '2021-01-17 12:05:45');

-- --------------------------------------------------------

--
-- Table structure for table `area_guides`
--

CREATE TABLE `area_guides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `area_guides`
--

INSERT INTO `area_guides` (`id`, `area_id`, `title`, `bn_title`, `description`, `bn_description`, `image`, `video_link`, `type`, `created_at`, `updated_at`) VALUES
(4, 3, 'The title of area guide one', 'The title of area guide one', 'The description about area guide one.', 'The description about area guide one.', 'abasvumi/uploads/images/areaguide/education_1610906849829412162.png', 'https://abasvumidynamic.swadhinbarta.com/admin', '2', '2021-01-17 12:07:29', '2021-01-17 12:08:43'),
(5, 4, 'The title about area guide one.', 'The title about area guide one.', 'The description about area guide two.', 'The description about area guide two.', 'abasvumi/uploads/images/areaguide/education_1610906887848552.png', 'https://abasvumidynamic.swadhinbarta.com/', '3', '2021-01-17 12:08:07', '2021-01-17 12:08:07');

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`id`, `name`, `bn_name`, `created_at`, `updated_at`) VALUES
(5, 'Block one', 'Block one', '2021-01-17 12:03:52', '2021-01-17 12:03:52'),
(6, 'Block two', 'Block two', '2021-01-17 12:04:03', '2021-01-17 12:04:03');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `md_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ceo_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pinterest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy_policy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms_condition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `developers`
--

CREATE TABLE `developers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `developers`
--

INSERT INTO `developers` (`id`, `name`, `email`, `password`, `phone`, `image`, `created_at`, `updated_at`) VALUES
(4, 'Bidhan', 'bidhanvk@gmail.com', '$2y$10$Be7e6U6.WDjcohbz.bbd3.2lGVHjdQwMOJC81Oxu78jqXmSAHnu3.', '01829600496', NULL, '2021-02-01 22:11:57', '2021-02-01 22:51:04'),
(5, 'Apoun', 'apounmix@gmail.com', '$2y$10$v7bmu8Vimu/Hc9V4xgHYE.FiarCYVJZOtlphKxUPYvqBnNMiWtIAa', '01632697963', NULL, '2021-02-01 22:49:04', '2021-02-01 22:49:04');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `division_id`, `name`, `bn_name`, `url`, `lat`, `lon`, `created_at`, `updated_at`) VALUES
(1, 1, 'Comilla', 'কুমিল্লা', 'www.comilla.gov.bd', '23.4682747', '91.1788135', NULL, NULL),
(2, 1, 'Feni', 'ফেনী', 'www.feni.gov.bd', '23.023231', '91.3840844', NULL, NULL),
(3, 1, 'Brahmanbaria', 'ব্রাহ্মণবাড়িয়া', 'www.brahmanbaria.gov.bd', '23.9570904', '91.1119286', NULL, NULL),
(4, 1, 'Rangamati', 'রাঙ্গামাটি', 'www.rangamati.gov.bd', NULL, NULL, NULL, NULL),
(5, 1, 'Noakhali', 'নোয়াখালী', 'www.noakhali.gov.bd', '22.869563', '91.099398', NULL, NULL),
(6, 1, 'Chandpur', 'চাঁদপুর', 'www.chandpur.gov.bd', '23.2332585', '90.6712912', NULL, NULL),
(7, 1, 'Lakshmipur', 'লক্ষ্মীপুর', 'www.lakshmipur.gov.bd', '22.942477', '90.841184', NULL, NULL),
(8, 1, 'Chattogram', 'চট্টগ্রাম', 'www.chittagong.gov.bd', '22.335109', '91.834073', NULL, NULL),
(9, 1, 'Coxsbazar', 'কক্সবাজার', 'www.coxsbazar.gov.bd', NULL, NULL, NULL, NULL),
(10, 1, 'Khagrachhari', 'খাগড়াছড়ি', 'www.khagrachhari.gov.bd', '23.119285', '91.984663', NULL, NULL),
(11, 1, 'Bandarban', 'বান্দরবান', 'www.bandarban.gov.bd', '22.1953275', '92.2183773', NULL, NULL),
(12, 2, 'Sirajganj', 'সিরাজগঞ্জ', 'www.sirajganj.gov.bd', '24.4533978', '89.7006815', NULL, NULL),
(13, 2, 'Pabna', 'পাবনা', 'www.pabna.gov.bd', '23.998524', '89.233645', NULL, NULL),
(14, 2, 'Bogura', 'বগুড়া', 'www.bogra.gov.bd', '24.8465228', '89.377755', NULL, NULL),
(15, 2, 'Rajshahi', 'রাজশাহী', 'www.rajshahi.gov.bd', NULL, NULL, NULL, NULL),
(16, 2, 'Natore', 'নাটোর', 'www.natore.gov.bd', '24.420556', '89.000282', NULL, NULL),
(17, 2, 'Joypurhat', 'জয়পুরহাট', 'www.joypurhat.gov.bd', NULL, NULL, NULL, NULL),
(18, 2, 'Chapainawabganj', 'চাঁপাইনবাবগঞ্জ', 'www.chapainawabganj.gov.bd', '24.5965034', '88.2775122', NULL, NULL),
(19, 2, 'Naogaon', 'নওগাঁ', 'www.naogaon.gov.bd', NULL, NULL, NULL, NULL),
(20, 3, 'Jashore', 'যশোর', 'www.jessore.gov.bd', '23.16643', '89.2081126', NULL, NULL),
(21, 3, 'Satkhira', 'সাতক্ষীরা', 'www.satkhira.gov.bd', NULL, NULL, NULL, NULL),
(22, 3, 'Meherpur', 'মেহেরপুর', 'www.meherpur.gov.bd', '23.762213', '88.631821', NULL, NULL),
(23, 3, 'Narail', 'নড়াইল', 'www.narail.gov.bd', '23.172534', '89.512672', NULL, NULL),
(24, 3, 'Chuadanga', 'চুয়াডাঙ্গা', 'www.chuadanga.gov.bd', '23.6401961', '88.841841', NULL, NULL),
(25, 3, 'Kushtia', 'কুষ্টিয়া', 'www.kushtia.gov.bd', '23.901258', '89.120482', NULL, NULL),
(26, 3, 'Magura', 'মাগুরা', 'www.magura.gov.bd', '23.487337', '89.419956', NULL, NULL),
(27, 3, 'Khulna', 'খুলনা', 'www.khulna.gov.bd', '22.815774', '89.568679', NULL, NULL),
(28, 3, 'Bagerhat', 'বাগেরহাট', 'www.bagerhat.gov.bd', '22.651568', '89.785938', NULL, NULL),
(29, 3, 'Jhenaidah', 'ঝিনাইদহ', 'www.jhenaidah.gov.bd', '23.5448176', '89.1539213', NULL, NULL),
(30, 4, 'Jhalakathi', 'ঝালকাঠি', 'www.jhalakathi.gov.bd', NULL, NULL, NULL, NULL),
(31, 4, 'Patuakhali', 'পটুয়াখালী', 'www.patuakhali.gov.bd', '22.3596316', '90.3298712', NULL, NULL),
(32, 4, 'Pirojpur', 'পিরোজপুর', 'www.pirojpur.gov.bd', NULL, NULL, NULL, NULL),
(33, 4, 'Barisal', 'বরিশাল', 'www.barisal.gov.bd', NULL, NULL, NULL, NULL),
(34, 4, 'Bhola', 'ভোলা', 'www.bhola.gov.bd', '22.685923', '90.648179', NULL, NULL),
(35, 4, 'Barguna', 'বরগুনা', 'www.barguna.gov.bd', NULL, NULL, NULL, NULL),
(36, 5, 'Sylhet', 'সিলেট', 'www.sylhet.gov.bd', '24.8897956', '91.8697894', NULL, NULL),
(37, 5, 'Moulvibazar', 'মৌলভীবাজার', 'www.moulvibazar.gov.bd', '24.482934', '91.777417', NULL, NULL),
(38, 5, 'Habiganj', 'হবিগঞ্জ', 'www.habiganj.gov.bd', '24.374945', '91.41553', NULL, NULL),
(39, 5, 'Sunamganj', 'সুনামগঞ্জ', 'www.sunamganj.gov.bd', '25.0658042', '91.3950115', NULL, NULL),
(40, 6, 'Narsingdi', 'নরসিংদী', 'www.narsingdi.gov.bd', '23.932233', '90.71541', NULL, NULL),
(41, 6, 'Gazipur', 'গাজীপুর', 'www.gazipur.gov.bd', '24.0022858', '90.4264283', NULL, NULL),
(42, 6, 'Shariatpur', 'শরীয়তপুর', 'www.shariatpur.gov.bd', NULL, NULL, NULL, NULL),
(43, 6, 'Narayanganj', 'নারায়ণগঞ্জ', 'www.narayanganj.gov.bd', '23.63366', '90.496482', NULL, NULL),
(44, 6, 'Tangail', 'টাঙ্গাইল', 'www.tangail.gov.bd', NULL, NULL, NULL, NULL),
(45, 6, 'Kishoreganj', 'কিশোরগঞ্জ', 'www.kishoreganj.gov.bd', '24.444937', '90.776575', NULL, NULL),
(46, 6, 'Manikganj', 'মানিকগঞ্জ', 'www.manikganj.gov.bd', NULL, NULL, NULL, NULL),
(47, 6, 'Dhaka', 'ঢাকা', 'www.dhaka.gov.bd', '23.7115253', '90.4111451', NULL, NULL),
(48, 6, 'Munshiganj', 'মুন্সিগঞ্জ', 'www.munshiganj.gov.bd', NULL, NULL, NULL, NULL),
(49, 6, 'Rajbari', 'রাজবাড়ী', 'www.rajbari.gov.bd', '23.7574305', '89.6444665', NULL, NULL),
(50, 6, 'Madaripur', 'মাদারীপুর', 'www.madaripur.gov.bd', '23.164102', '90.1896805', NULL, NULL),
(51, 6, 'Gopalganj', 'গোপালগঞ্জ', 'www.gopalganj.gov.bd', '23.0050857', '89.8266059', NULL, NULL),
(52, 6, 'Faridpur', 'ফরিদপুর', 'www.faridpur.gov.bd', '23.6070822', '89.8429406', NULL, NULL),
(53, 7, 'Panchagarh', 'পঞ্চগড়', 'www.panchagarh.gov.bd', '26.3411', '88.5541606', NULL, NULL),
(54, 7, 'Dinajpur', 'দিনাজপুর', 'www.dinajpur.gov.bd', '25.6217061', '88.6354504', NULL, NULL),
(55, 7, 'Lalmonirhat', 'লালমনিরহাট', 'www.lalmonirhat.gov.bd', NULL, NULL, NULL, NULL),
(56, 7, 'Nilphamari', 'নীলফামারী', 'www.nilphamari.gov.bd', '25.931794', '88.856006', NULL, NULL),
(57, 7, 'Gaibandha', 'গাইবান্ধা', 'www.gaibandha.gov.bd', '25.328751', '89.528088', NULL, NULL),
(58, 7, 'Thakurgaon', 'ঠাকুরগাঁও', 'www.thakurgaon.gov.bd', '26.0336945', '88.4616834', NULL, NULL),
(59, 7, 'Rangpur', 'রংপুর', 'www.rangpur.gov.bd', '25.7558096', '89.244462', NULL, NULL),
(60, 7, 'Kurigram', 'কুড়িগ্রাম', 'www.kurigram.gov.bd', '25.805445', '89.636174', NULL, NULL),
(61, 8, 'Sherpur', 'শেরপুর', 'www.sherpur.gov.bd', '25.0204933', '90.0152966', NULL, NULL),
(62, 8, 'Mymensingh', 'ময়মনসিংহ', 'www.mymensingh.gov.bd', NULL, NULL, NULL, NULL),
(63, 8, 'Jamalpur', 'জামালপুর', 'www.jamalpur.gov.bd', '24.937533', '89.937775', NULL, NULL),
(64, 8, 'Netrokona', 'নেত্রকোণা', 'www.netrokona.gov.bd', '24.870955', '90.727887', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `name`, `bn_name`, `url`, `created_at`, `updated_at`) VALUES
(1, 'Chattagram', 'চট্টগ্রাম', 'www.chittagongdiv.gov.bd', NULL, NULL),
(2, 'Rajshahi', 'রাজশাহী', 'www.rajshahidiv.gov.bd', NULL, NULL),
(3, 'Khulna', 'খুলনা', 'www.khulnadiv.gov.bd', NULL, NULL),
(4, 'Barisal', 'বরিশাল', 'www.barisaldiv.gov.bd', NULL, NULL),
(5, 'Sylhet', 'সিলেট', 'www.sylhetdiv.gov.bd', NULL, NULL),
(6, 'Dhaka', 'ঢাকা', 'www.dhakadiv.gov.bd', NULL, NULL),
(7, 'Rangpur', 'রংপুর', 'www.rangpurdiv.gov.bd', NULL, NULL),
(8, 'Mymensingh', 'ময়মনসিংহ', 'www.mymensinghdiv.gov.bd', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `educational_institutes`
--

CREATE TABLE `educational_institutes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `thana_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `educational_institutes`
--

INSERT INTO `educational_institutes` (`id`, `division_id`, `district_id`, `thana_id`, `name`, `bn_name`, `description`, `bn_description`, `lat`, `lon`, `type`, `image`, `created_at`, `updated_at`) VALUES
(13, 1, 6, 59, 'Kanchanpur High school', 'Kanchanpur High school', 'The description about kanchanpur high school.', 'The description about kanchanpur high school.', '100.365', '200.365', '1', 'abasvumi/uploads/images/education/education_1610905472569194545.png', '2021-01-17 11:44:32', '2021-01-17 11:44:32'),
(14, 1, 6, 59, 'Gallak Nowab Ali High School', 'Gallak Nowab Ali High School', 'The description about gallak nowab ali high school', 'The description about gallak nowab ali high school', '123.3654', '321.2563', '1', 'abasvumi/uploads/images/education/education_16109055541423501698.png', '2021-01-17 11:45:54', '2021-01-17 11:45:54'),
(15, 1, 6, 59, 'Gupti high school', 'Gupti high school', 'The description about Gupti high school', 'The description about Gupti high school', '633.123', '369.125', '1', 'abasvumi/uploads/images/education/education_1610905609183801411.png', '2021-01-17 11:46:49', '2021-01-17 11:46:49');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `thana_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `division_id`, `district_id`, `thana_id`, `name`, `bn_name`, `description`, `bn_description`, `lat`, `lon`, `type`, `image`, `created_at`, `updated_at`) VALUES
(5, 1, 6, 59, 'Ma o shu hospital', 'Ma o shu hospital', 'The description Ma o shu hospital .', 'The description Ma o shu hospital .', '200.300', '100.250', '3', 'abasvumi/uploads/images/hospital/hospital_1610905796173735169.png', '2021-01-17 11:49:56', '2021-01-17 11:49:56'),
(6, 1, 6, 59, 'General hospital', 'General hospital', 'The description General hospital', 'The description General hospital', '100.022', '100.322', '3', 'abasvumi/uploads/images/hospital/hospital_16109058411585821854.png', '2021-01-17 11:50:41', '2021-01-17 12:22:46');

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
(136, '2014_10_12_000000_create_users_table', 1),
(137, '2014_10_12_100000_create_password_resets_table', 1),
(138, '2019_08_19_000000_create_failed_jobs_table', 1),
(139, '2020_12_12_011948_create_roles_table', 1),
(140, '2020_12_13_044332_create_agents_table', 1),
(141, '2020_12_13_045137_create_developers_table', 1),
(142, '2020_12_13_045248_create_divisions_table', 1),
(143, '2020_12_13_045403_create_districts_table', 1),
(144, '2020_12_13_045601_create_thanas_table', 1),
(145, '2020_12_13_045910_create_educational_institutes_table', 1),
(146, '2020_12_13_050043_create_restaurants_table', 1),
(147, '2020_12_13_050113_create_hospitals_table', 1),
(148, '2020_12_13_050134_create_parks_table', 1),
(149, '2020_12_13_050147_create_videos_table', 1),
(150, '2020_12_13_050745_create_areas_table', 1),
(151, '2020_12_13_050819_create_area_guides_table', 1),
(152, '2020_12_13_050841_create_blocks_table', 1),
(153, '2020_12_13_051014_create_amenitis_table', 1),
(154, '2020_12_13_051156_create_services_table', 1),
(155, '2020_12_13_051216_create_categories_table', 1),
(156, '2020_12_13_051240_create_blogs_table', 1),
(157, '2020_12_13_051342_create_testimonials_table', 1),
(158, '2020_12_13_051402_create_companies_table', 1),
(159, '2020_12_13_051500_create_real_estate_solutions_table', 1),
(160, '2020_12_15_072544_create_religious_institutions_table', 1),
(161, '2021_01_02_091425_add_bn_name_to_amenitis_table', 1),
(162, '2021_01_08_152553_create_service_types_table', 1),
(163, '2021_01_08_153614_add_service_type_id_services_table', 1),
(164, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(165, '2021_01_22_172650_create_suppliers_table', 3),
(167, '2021_02_03_121825_create_serviceimages_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `parks`
--

CREATE TABLE `parks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `thana_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parks`
--

INSERT INTO `parks` (`id`, `division_id`, `district_id`, `thana_id`, `name`, `bn_name`, `description`, `bn_description`, `lat`, `lon`, `image`, `created_at`, `updated_at`) VALUES
(6, 1, 6, 59, 'Shisu park', 'Shisu park', 'The description Shisu park', 'The description Shisu park', '100.200', '200.300', 'abasvumi/uploads/images/park/park_16109058791292769993.png', '2021-01-17 11:51:19', '2021-01-17 11:51:19'),
(7, 1, 6, 59, 'Sapari park', 'Sapari park', 'The description Sapari park', 'The description Sapari park', '200.366', '400.366', 'abasvumi/uploads/images/park/park_16109059151850194724.png', '2021-01-17 11:51:55', '2021-01-17 11:51:55');

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Agent', 1, 'suman', 'ee4a0b002ec9c045450e9f556bf8503d44e387f35e3f6dc77fce859126d522e8', '[\"*\"]', NULL, '2021-01-15 10:31:52', '2021-01-15 10:31:52'),
(2, 'App\\Models\\Agent', 1, 'admin', 'e91211d4164dd69be70f0177b1c9ca16b0334fe9a71c6b442ce6788569aabdc0', '[\"*\"]', NULL, '2021-01-15 10:36:34', '2021-01-15 10:36:34'),
(3, 'App\\Models\\Agent', 2, 'suman2', 'f6415a9ddee348d863964c4dd572446e8061fd51d6e3f50de986eb2bcb4a65c2', '[\"*\"]', NULL, '2021-01-15 21:20:57', '2021-01-15 21:20:57'),
(4, 'App\\Models\\Agent', 2, 'admin', 'd8ce8062223f6cb1054b40c1b369a40d2746a1c35b80c281773e62aa648c8daa', '[\"*\"]', NULL, '2021-01-15 21:23:02', '2021-01-15 21:23:02'),
(5, 'App\\Models\\Developers', 1, 'Bidhan', '7d56fb21d411e613b4520f546e5e5e592bdef6be3327259986a0e4b1414d174e', '[\"*\"]', NULL, '2021-01-15 21:33:44', '2021-01-15 21:33:44'),
(6, 'App\\Models\\Developers', 1, 'admin', '20912b03d606f1cbd07c9dfcab676027f49ef9fdb000700d5d783f491a1fb9cb', '[\"*\"]', NULL, '2021-01-15 21:40:48', '2021-01-15 21:40:48'),
(7, 'App\\Models\\Developers', 1, 'admin', '4b449bf77b35e9d8f979a98d149e7a4ce94e251c173a001fbf4bead8c9d34644', '[\"*\"]', NULL, '2021-01-15 22:29:18', '2021-01-15 22:29:18'),
(8, 'App\\Models\\Developers', 1, 'admin', '6e95ec750b08cb56592c6271e145eb720895f77a4b72b9a2b53a57d62a10aa1b', '[\"*\"]', NULL, '2021-01-16 09:06:34', '2021-01-16 09:06:34'),
(9, 'App\\Models\\Agent', 1, 'admin', 'c3455e2897c251035f800da5d7702aa7ca92b873a302e7e3eec60fcbd57b5a12', '[\"*\"]', '2021-01-28 07:49:44', '2021-01-23 10:52:29', '2021-01-28 07:49:44'),
(10, 'App\\Models\\Agent', 1, 'admin', '97b6fba903ffad6afbc601cdbe405d8024d6c8438b28b72682202661459be503', '[\"*\"]', '2021-01-28 07:58:35', '2021-01-28 07:57:07', '2021-01-28 07:58:35'),
(11, 'App\\Models\\Agent', 1, 'admin', 'b8c8d1fb139246cf145f70b8255c63b89a9704bf05fe62fae16c63318184fdf5', '[\"*\"]', '2021-01-28 08:29:20', '2021-01-28 08:02:37', '2021-01-28 08:29:20'),
(12, 'App\\Models\\Agent', 1, 'admin', '922435ac038bd57230da1eabe4c91fd16d83e5f1864a04fbb7b450beb83e849d', '[\"*\"]', '2021-02-05 23:36:59', '2021-02-01 21:25:00', '2021-02-05 23:36:59'),
(13, 'App\\Models\\Agent', 1, 'admin', '9a5a99bf62c683f3147c0fe01d7a3357fed51848c8b756025fea73326fb798ad', '[\"*\"]', NULL, '2021-02-01 21:48:54', '2021-02-01 21:48:54'),
(14, 'App\\Models\\Developers', 4, 'Bidhan', 'ca393b29318b6f78667ebcc8c3984ac4908dc0dcb1ae581eb1fc1bbe5862b237', '[\"*\"]', NULL, '2021-02-01 22:11:57', '2021-02-01 22:11:57'),
(15, 'App\\Models\\Developers', 4, 'admin', '5898de9d0d7fb09eb7746735c97457a53841db5c583a0c6da5282f24f12fc426', '[\"*\"]', NULL, '2021-02-01 22:12:17', '2021-02-01 22:12:17'),
(16, 'App\\Models\\Developers', 4, 'admin', '4994b1fd4c4e4e8e3d73742e6edb79cee16e748b5e44244cc72a850b68c45398', '[\"*\"]', NULL, '2021-02-01 22:39:00', '2021-02-01 22:39:00'),
(17, 'App\\Models\\Developers', 4, 'admin', '999e2eb1d27a63c5e688a83bad7ffe76888f5d618cb4ebd783c206d49e4b2fc8', '[\"*\"]', NULL, '2021-02-01 22:39:38', '2021-02-01 22:39:38'),
(18, 'App\\Models\\Agent', 8, 'suman2', '3629dc8defae7b70b281a388fa939d62525d77e2e0e9987c7008d5566820807a', '[\"*\"]', NULL, '2021-02-01 22:44:59', '2021-02-01 22:44:59'),
(19, 'App\\Models\\Agent', 1, 'admin', 'e1b4da6e47131bdeca1139c3ec44561acd39cef9870e99a2c5c1f76328350a02', '[\"*\"]', NULL, '2021-02-01 22:46:11', '2021-02-01 22:46:11'),
(20, 'App\\Models\\Agent', 1, 'admin', 'd8f50dd55ec99970d8dea70972f1f6db5d2d66a27f0b2a7c28c9a844f4334869', '[\"*\"]', NULL, '2021-02-01 22:46:47', '2021-02-01 22:46:47'),
(21, 'App\\Models\\Agent', 1, 'admin', 'ea388be5a10724c242d43b124a56aad3bdea39ae8283568179979f308ad85596', '[\"*\"]', NULL, '2021-02-01 22:47:41', '2021-02-01 22:47:41'),
(22, 'App\\Models\\Developers', 5, 'Apoun', '39b505247d00996c4e30693efc32acc9403a1b5b9af954ce7b683b52eb64f438', '[\"*\"]', NULL, '2021-02-01 22:49:04', '2021-02-01 22:49:04'),
(23, 'App\\Models\\Developers', 4, 'admin', '873547133ad00654fe74eeaa5c0f8609897f3d6dc4faf7c2188e882375c46421', '[\"*\"]', NULL, '2021-02-01 22:50:16', '2021-02-01 22:50:16'),
(24, 'App\\Models\\Developers', 4, 'admin', 'a82023165ebd99465b0ec65e2189fe2cf4e6f7875fb160d8982e379fb2df01f2', '[\"*\"]', NULL, '2021-02-01 22:51:13', '2021-02-01 22:51:13'),
(25, 'App\\Models\\Agent', 1, 'admin', '897d19861b9831b06a2d3b01f9737d79e2bae9fa19c78882daa375d8b18c2388', '[\"*\"]', '2021-02-05 23:36:37', '2021-02-04 20:08:16', '2021-02-05 23:36:37'),
(26, 'App\\Models\\Agent', 1, 'admin', 'f283c1e36e1ee3e4cecdda94a1922f273bcea67a8228386928a5c9591d9d61fb', '[\"*\"]', NULL, '2021-02-04 20:16:29', '2021-02-04 20:16:29'),
(27, 'App\\Models\\Agent', 1, 'admin', 'e69c96d3564d673f38700d665cba53f8f597a0dcb4642a0dc8f2fcc6d0819293', '[\"*\"]', NULL, '2021-02-04 20:22:51', '2021-02-04 20:22:51'),
(28, 'App\\Models\\Agent', 1, 'admin', 'ee5b7a4b3a85e07950a26a33e17833ec291cbea6f93467563a79cf3e029d5a45', '[\"*\"]', NULL, '2021-02-04 20:26:29', '2021-02-04 20:26:29'),
(29, 'App\\Models\\Agent', 1, 'admin', '3e112d9889a670fca58cc8c36ce44cc4e82bc32c4b353bbb581894673476daa7', '[\"*\"]', NULL, '2021-02-04 20:26:32', '2021-02-04 20:26:32'),
(30, 'App\\Models\\Agent', 1, 'admin', 'd12884f8fbcb3eeb6a91e8067510020985eef712e80917c56038c169c13bb923', '[\"*\"]', NULL, '2021-02-04 20:31:43', '2021-02-04 20:31:43'),
(31, 'App\\Models\\Agent', 1, 'admin', 'bb3451a91f9654b7ea181c3ff682d29fe1bdaf5b0673196d5a96f2e7e5c42c3d', '[\"*\"]', '2021-02-04 20:36:39', '2021-02-04 20:33:44', '2021-02-04 20:36:39'),
(32, 'App\\Models\\Agent', 1, 'admin', 'f5cf66f6faa2337f28152573718cfad781c3140289ffbd83a1f8eb23eff1d0a9', '[\"*\"]', '2021-02-04 21:41:11', '2021-02-04 20:38:51', '2021-02-04 21:41:11'),
(33, 'App\\Models\\Agent', 1, 'admin', 'e28713e4a300ef46eb75f22ec8105a375db0676f06224b5d575215a480414b2f', '[\"*\"]', '2021-02-04 23:13:11', '2021-02-04 21:56:15', '2021-02-04 23:13:11'),
(34, 'App\\Models\\Agent', 9, 'Md Mamunur Rashid', 'a30c9176ba2cb5305a63d29b0fcd01d8bcebb5012b25372fa4e20d4c09da0cb8', '[\"*\"]', NULL, '2021-02-05 22:53:32', '2021-02-05 22:53:32'),
(35, 'App\\Models\\Agent', 9, 'admin', 'dd263973f5c27e09c32b50013997e37b95cf240057042470374d409c73701ed6', '[\"*\"]', '2021-02-05 22:55:07', '2021-02-05 22:55:06', '2021-02-05 22:55:07'),
(36, 'App\\Models\\Agent', 9, 'admin', '21e698d6cca4cedd0f80507847cba772c0c9cd47823de1e4ca99f9e0c77b9a03', '[\"*\"]', '2021-02-05 22:55:46', '2021-02-05 22:55:45', '2021-02-05 22:55:46'),
(37, 'App\\Models\\Agent', 9, 'admin', '14158ed0b384dfe4c1b29ad2d447308d579a23cb3c92da0363c88f0244ed08d0', '[\"*\"]', '2021-02-05 23:01:10', '2021-02-05 23:00:51', '2021-02-05 23:01:10'),
(38, 'App\\Models\\Agent', 1, 'admin', '0aa334f00bee9f54de37c2818cd79c59bb0b7b1476cbb01e4615bc475b7baa59', '[\"*\"]', NULL, '2021-02-05 23:01:32', '2021-02-05 23:01:32'),
(39, 'App\\Models\\Agent', 9, 'admin', '8a1bdc7ffed73bb570fea22d349d507519d8626b32b799c7d8d69f4f9a91da3f', '[\"*\"]', NULL, '2021-02-05 23:01:45', '2021-02-05 23:01:45'),
(40, 'App\\Models\\Agent', 1, 'admin', 'fbe9fae78182c4f4ad191bf18982b295f40a042a375194ea13263c077c84959d', '[\"*\"]', NULL, '2021-02-05 23:07:29', '2021-02-05 23:07:29'),
(41, 'App\\Models\\Agent', 9, 'admin', '44d3585aac03bc30f23549aed8afcc9c474bbb3f4b16d033b5df6196dee9d47d', '[\"*\"]', NULL, '2021-02-05 23:31:08', '2021-02-05 23:31:08'),
(42, 'App\\Models\\Agent', 9, 'admin', '98d9ed3857d5f90bf2f2f721c8920b0dd627a0a9391984056219c0a3cd617e24', '[\"*\"]', NULL, '2021-02-05 23:31:21', '2021-02-05 23:31:21'),
(43, 'App\\Models\\Agent', 1, 'admin', 'c6e8076b047ec7644b495d0eb6d325f391586170e8c04ade8faf32374232b142', '[\"*\"]', NULL, '2021-02-05 23:32:18', '2021-02-05 23:32:18'),
(44, 'App\\Models\\Agent', 1, 'admin', 'e7b234356af5089a09dcef3c6c3df641c7cbf0693a19c4f8a7d0407609ab4bd5', '[\"*\"]', NULL, '2021-02-05 23:32:30', '2021-02-05 23:32:30'),
(45, 'App\\Models\\Agent', 1, 'admin', 'a149df359f6ed0f0962a52220f3d2083842183876d00a4ad69ebcdbd17a239f4', '[\"*\"]', NULL, '2021-02-05 23:39:24', '2021-02-05 23:39:24'),
(46, 'App\\Models\\Agent', 9, 'admin', 'b9c26e10dea84178b3a45f1bdd8fe03aae30b772190750b65ac6e3a23703fcf7', '[\"*\"]', NULL, '2021-02-06 00:07:51', '2021-02-06 00:07:51'),
(47, 'App\\Models\\Agent', 9, 'admin', 'c31b326a50d40811e66a53d215f538f3a2f37b5f49edf6b2436301b5e98ce776', '[\"*\"]', NULL, '2021-02-06 00:09:35', '2021-02-06 00:09:35'),
(48, 'App\\Models\\Agent', 9, 'admin', '01870a613d060484fd0215dcee02353eac4e22d20e6bca8e32d59ddebce47af4', '[\"*\"]', NULL, '2021-02-06 00:09:59', '2021-02-06 00:09:59'),
(49, 'App\\Models\\Agent', 9, 'admin', '928523c92eda989458a2186e87c27dfb30546d8f16e9357b10aef9efe5459f9c', '[\"*\"]', NULL, '2021-02-06 00:17:12', '2021-02-06 00:17:12'),
(50, 'App\\Models\\Agent', 9, 'admin', '4b1c0cb7663e08c16a35bb0462c0e3c3b70c6b248cc050e929f2f43cc776a740', '[\"*\"]', NULL, '2021-02-06 00:17:45', '2021-02-06 00:17:45'),
(51, 'App\\Models\\Agent', 9, 'admin', '36567be94a693891ffda0611bd23d2f1d304428125dcbb03c2730f5d79b9ec3d', '[\"*\"]', NULL, '2021-02-06 00:18:45', '2021-02-06 00:18:45'),
(52, 'App\\Models\\Agent', 9, 'admin', '4b2aaefeffe6adf9f9627cebd653c14e73001c2555a80afcb24369245ea873ba', '[\"*\"]', NULL, '2021-02-06 00:20:29', '2021-02-06 00:20:29'),
(53, 'App\\Models\\Agent', 9, 'admin', 'd8dbc6c71aa86367c2f6b802618f76a6ce06504e0391f02d5cac3a835252980f', '[\"*\"]', NULL, '2021-02-06 00:21:48', '2021-02-06 00:21:48'),
(54, 'App\\Models\\Agent', 9, 'admin', '53639ae8726280bfca1d563aa0eccbdf67c5320ecdecaf964c358b1c968e87ea', '[\"*\"]', '2021-02-06 00:24:51', '2021-02-06 00:24:50', '2021-02-06 00:24:51'),
(55, 'App\\Models\\Agent', 9, 'admin', '95b1e458a7105efb23c505661e13eccb47da5eda08880df53603b48e124ae2bd', '[\"*\"]', '2021-02-06 00:25:22', '2021-02-06 00:25:21', '2021-02-06 00:25:22'),
(56, 'App\\Models\\Agent', 1, 'admin', 'e6df3419d3f4b50857af6bd72b2ae3c22b13e983c41df116a47c593da701ac66', '[\"*\"]', '2021-02-06 00:29:36', '2021-02-06 00:29:35', '2021-02-06 00:29:36'),
(57, 'App\\Models\\Agent', 1, 'admin', 'e138cced12e314db3e701f3d53bc6c5e9a1aed4934632127158ae7237ca1ddf9', '[\"*\"]', '2021-02-06 00:30:10', '2021-02-06 00:30:09', '2021-02-06 00:30:10'),
(58, 'App\\Models\\Agent', 1, 'admin', '8449d9e7705608799a243896cac3f53ab832aa839f8eb7001707b8898fdefd98', '[\"*\"]', NULL, '2021-02-06 00:34:24', '2021-02-06 00:34:24'),
(59, 'App\\Models\\Agent', 1, 'admin', '3d03a15903df75a946c748043b9beef86b5115bf60263c2d28612444546ced00', '[\"*\"]', NULL, '2021-02-06 00:34:34', '2021-02-06 00:34:34'),
(60, 'App\\Models\\Agent', 1, 'admin', 'dd1d165c53e07e8d03f69ecfa590254f3d0e86a0fd995522592c3ba11ec35d61', '[\"*\"]', NULL, '2021-02-06 00:34:45', '2021-02-06 00:34:45'),
(61, 'App\\Models\\Agent', 1, 'admin', '92ff27c5877b192cb3d5a2e5bd8248d9f8774698c6d61c5658a32166bea79e01', '[\"*\"]', NULL, '2021-02-06 00:34:56', '2021-02-06 00:34:56'),
(62, 'App\\Models\\Agent', 1, 'admin', '51c86478fb13b92860e07ce7a3018e3b8bdbf51d87f5556ccce355e27c392443', '[\"*\"]', '2021-02-06 00:37:39', '2021-02-06 00:37:38', '2021-02-06 00:37:39'),
(63, 'App\\Models\\Agent', 1, 'admin', '9b3d2c514faa2f128a10b1f8fe6bae839b7a2639177ff813cd87a1842cd6f80f', '[\"*\"]', '2021-02-06 00:47:15', '2021-02-06 00:38:31', '2021-02-06 00:47:15'),
(64, 'App\\Models\\Agent', 9, 'admin', '7a6c2966ddea1cd0d67d43a2b0a28bcf07e4e9506411cbacf3d23f4b0906f342', '[\"*\"]', NULL, '2021-02-06 00:54:47', '2021-02-06 00:54:47'),
(65, 'App\\Models\\Agent', 9, 'admin', '7147660e933213afb6844959c5f283d39ad5cada695d7c6f27eb1dc306a9a308', '[\"*\"]', '2021-02-06 00:57:09', '2021-02-06 00:57:09', '2021-02-06 00:57:09'),
(66, 'App\\Models\\Agent', 9, 'admin', 'e071d9250587ad7bd45eada2d02e6ff81b933ff2850daed22b6c48952c9b8eac', '[\"*\"]', NULL, '2021-02-06 01:04:31', '2021-02-06 01:04:31'),
(67, 'App\\Models\\Agent', 9, 'admin', 'f0d834b50188c627560430d7477214a95ef9ff304d00ff2e594b2f57045e8b76', '[\"*\"]', NULL, '2021-02-06 01:04:42', '2021-02-06 01:04:42'),
(68, 'App\\Models\\Agent', 9, 'admin', 'a326fe5c323a8fe2c2630e1ccba59ebbcd039fac78ff9340a7b7abee4aa9579d', '[\"*\"]', NULL, '2021-02-06 01:04:58', '2021-02-06 01:04:58'),
(69, 'App\\Models\\Agent', 9, 'admin', '86c745f535d7e14d2406ccd0d261db767bac70fa2b83ccecaf11df22e7192fd2', '[\"*\"]', NULL, '2021-02-06 01:12:15', '2021-02-06 01:12:15'),
(70, 'App\\Models\\Agent', 9, 'admin', '96a5bbc89667760eb1293ff2e3414d3758040a8f298925592f3e169e0a89e603', '[\"*\"]', '2021-02-06 01:12:50', '2021-02-06 01:12:49', '2021-02-06 01:12:50'),
(71, 'App\\Models\\Agent', 9, 'admin', 'c35d0c48d67a4bff92fbdc6c1eaea9c6ab3e57bf4215c6a968f7d2abc7ab15d3', '[\"*\"]', '2021-02-10 09:31:26', '2021-02-06 09:20:50', '2021-02-10 09:31:26'),
(72, 'App\\Models\\Agent', 9, 'admin', '441645b404d96cfa75c00911baa74d245404bd1f7f19e5afa72a7a1b3f461a5f', '[\"*\"]', '2021-02-06 21:47:12', '2021-02-06 21:47:11', '2021-02-06 21:47:12'),
(73, 'App\\Models\\Agent', 9, 'admin', '9e0f27aa8937111b82979c6d6c7217046569595bf78a0c4c4db94f24032cf8d0', '[\"*\"]', '2021-02-06 22:00:58', '2021-02-06 22:00:57', '2021-02-06 22:00:58'),
(74, 'App\\Models\\Agent', 9, 'admin', 'ca41ec7087c5d70fc13f8aa8969b648a109375d3e455a4f59d820799991f0d95', '[\"*\"]', '2021-02-06 22:01:15', '2021-02-06 22:01:14', '2021-02-06 22:01:15'),
(75, 'App\\Models\\Agent', 9, 'admin', '6eeffdcfbdc75e978d5e1b8eac9cbc3cc4bd7a57027d2e2a99a1127f114df9ad', '[\"*\"]', '2021-02-06 22:08:55', '2021-02-06 22:08:54', '2021-02-06 22:08:55'),
(76, 'App\\Models\\Agent', 9, 'admin', '3db5152a0283fd0849f7246142a9fb84799ee2ff56ed0b205f0f8513821dbb3e', '[\"*\"]', '2021-02-08 20:09:04', '2021-02-08 20:09:03', '2021-02-08 20:09:04'),
(77, 'App\\Models\\Agent', 9, 'admin', 'b5be9b19168aadad5bd1782f95a89ea06b5fd9376a3a6308ca0073cd29f66445', '[\"*\"]', '2021-02-08 20:10:13', '2021-02-08 20:10:12', '2021-02-08 20:10:13'),
(78, 'App\\Models\\Agent', 9, 'admin', 'ff25d34d6a261bc64ff5ce8e19f593dcec327facff66d0ba64fdaf9f27266021', '[\"*\"]', '2021-02-08 20:15:37', '2021-02-08 20:15:36', '2021-02-08 20:15:37'),
(79, 'App\\Models\\Agent', 9, 'admin', '3b71c997ba20ef38ea74296d647b4950d4eb93555310df291e3f71352beaa092', '[\"*\"]', '2021-02-08 22:58:32', '2021-02-08 22:58:31', '2021-02-08 22:58:32'),
(80, 'App\\Models\\Agent', 9, 'admin', 'a03a6294c434f5080096096c189ef91c3e2c5c8f3664f0b9960301a080c6c0ae', '[\"*\"]', '2021-02-08 22:59:55', '2021-02-08 22:59:54', '2021-02-08 22:59:55'),
(81, 'App\\Models\\Agent', 9, 'admin', '34783cb4677a55a2389dd0ab5f94e19a9df70a06dc63d95529a398ee1da942e9', '[\"*\"]', '2021-02-08 23:02:09', '2021-02-08 23:02:08', '2021-02-08 23:02:09'),
(82, 'App\\Models\\Agent', 9, 'admin', 'a35cd973dec5c455f6564d67698fb051420905ea7325fcf9172babb0bba46f96', '[\"*\"]', '2021-02-08 23:03:51', '2021-02-08 23:03:49', '2021-02-08 23:03:51'),
(83, 'App\\Models\\Agent', 9, 'admin', '21362cd1ee43be97e7a367055fff5aa9b7b9a3580a0cb133fb90b8c7b8d1f2fd', '[\"*\"]', '2021-02-08 23:05:40', '2021-02-08 23:05:39', '2021-02-08 23:05:40'),
(84, 'App\\Models\\Agent', 9, 'admin', 'e59e220f85084d652ac76d1f8149580cc9f1d267871f5046aca8440e50183584', '[\"*\"]', '2021-02-08 23:06:54', '2021-02-08 23:06:53', '2021-02-08 23:06:54'),
(85, 'App\\Models\\Agent', 9, 'admin', '2cc17e762aaf7240cd5e0e1542d882a395cba17bebf9fa0d02d36c63b70ca89f', '[\"*\"]', '2021-02-08 23:07:30', '2021-02-08 23:07:29', '2021-02-08 23:07:30'),
(86, 'App\\Models\\Agent', 9, 'admin', '6aef3e954d66d0e80e92a43f7cd99f5a55c666fd94585554c9db2260d4f201f6', '[\"*\"]', '2021-02-08 23:11:33', '2021-02-08 23:11:32', '2021-02-08 23:11:33'),
(87, 'App\\Models\\Agent', 9, 'admin', '9d3cde085bbf5c4121edf5e49a89732caccb5ec632c6bb869184bdae47c3063c', '[\"*\"]', '2021-02-08 23:15:08', '2021-02-08 23:15:07', '2021-02-08 23:15:08'),
(88, 'App\\Models\\Agent', 9, 'admin', '8a3c689d37efc0815ec9174366f1040e356662871cf664ebd6f7e86834dae3de', '[\"*\"]', '2021-02-08 23:22:27', '2021-02-08 23:22:26', '2021-02-08 23:22:27'),
(89, 'App\\Models\\Agent', 9, 'admin', '1abd18e8c0633a36a64af974fd6cd241c1287126bbc301ac6d6e20de9a2883d8', '[\"*\"]', '2021-02-08 23:23:32', '2021-02-08 23:23:31', '2021-02-08 23:23:32'),
(90, 'App\\Models\\Agent', 9, 'admin', 'd75a9cbfcf1f7eb80b7686586b1f15de892f8e153d30400eeac22c8d8af3dd86', '[\"*\"]', '2021-02-08 23:23:33', '2021-02-08 23:23:32', '2021-02-08 23:23:33'),
(91, 'App\\Models\\Agent', 9, 'admin', '27aa8278efefc31bfe65165de7ebd5dc7756a985c729c5f26d2edc664dbb81f7', '[\"*\"]', '2021-02-09 20:11:16', '2021-02-08 23:37:52', '2021-02-09 20:11:16'),
(92, 'App\\Models\\Agent', 9, 'admin', 'd520af354d0938c737f58045a64a783a027511e2bae86dec2f3a9340684d33d8', '[\"*\"]', '2021-02-09 20:39:52', '2021-02-09 20:39:51', '2021-02-09 20:39:52'),
(93, 'App\\Models\\Agent', 9, 'admin', '279d1b95c1e420924f38fe55abbb8af01a73ec9e828ad022871446f460237d08', '[\"*\"]', '2021-02-09 20:39:57', '2021-02-09 20:39:56', '2021-02-09 20:39:57'),
(94, 'App\\Models\\Agent', 9, 'admin', '1a02752a0ff2bf20b1c3be5261b582c42620c16247d12b85ac159799d9531ca6', '[\"*\"]', '2021-02-09 20:40:08', '2021-02-09 20:40:07', '2021-02-09 20:40:08'),
(95, 'App\\Models\\Agent', 9, 'admin', '9a2a411e6e9ba3b8947472b395e16d8d20dc135ab4ef6713906a307d8a6a9035', '[\"*\"]', '2021-02-09 20:40:16', '2021-02-09 20:40:15', '2021-02-09 20:40:16'),
(96, 'App\\Models\\Agent', 9, 'admin', '168c790798d6126b6096afc32d1d79aa02d159bc509d9a71dc342ef5c411c964', '[\"*\"]', '2021-02-09 20:41:12', '2021-02-09 20:41:11', '2021-02-09 20:41:12'),
(97, 'App\\Models\\Agent', 9, 'admin', 'bc394a10d76028246fadc0c15a22a19ffa1ce287675c4cf48bf929fa43c57ebe', '[\"*\"]', '2021-02-09 20:42:00', '2021-02-09 20:41:59', '2021-02-09 20:42:00'),
(98, 'App\\Models\\Agent', 9, 'admin', 'b95739bfba2a1c6b31bd91605d3aeb0a716c8168b5edd40720b329afa08d1d25', '[\"*\"]', '2021-02-09 20:42:05', '2021-02-09 20:42:04', '2021-02-09 20:42:05'),
(99, 'App\\Models\\Agent', 9, 'admin', 'e2876589ef63e67440010122eac14fb926646df2a7afe806c9c1d7f21a790435', '[\"*\"]', '2021-02-09 20:42:21', '2021-02-09 20:42:21', '2021-02-09 20:42:21'),
(100, 'App\\Models\\Agent', 9, 'admin', '9235f2aa2e21eeaf9fa1db3dddde22d75f4071ec08d6388cb67d4bfd03a63c0a', '[\"*\"]', '2021-02-09 20:42:46', '2021-02-09 20:42:45', '2021-02-09 20:42:46'),
(101, 'App\\Models\\Agent', 9, 'admin', '09a1da86193a9eca5717db561b7ea2e0bd02a4782f12747f43658278acb11f4d', '[\"*\"]', '2021-02-09 20:43:08', '2021-02-09 20:43:07', '2021-02-09 20:43:08'),
(102, 'App\\Models\\Agent', 9, 'admin', '810f0a6eb66262d8dc8584862b5e8cfab6b57b616e88a19484951d3e3f599dd3', '[\"*\"]', '2021-02-09 20:44:22', '2021-02-09 20:43:19', '2021-02-09 20:44:22'),
(103, 'App\\Models\\Agent', 9, 'admin', '442642b5d3bb410fec6a06c327b9845316d4d677b0b1da59074a84e848d81048', '[\"*\"]', '2021-02-09 20:44:38', '2021-02-09 20:44:37', '2021-02-09 20:44:38'),
(104, 'App\\Models\\Agent', 9, 'admin', '13cbc68a354905e3eb90bae54ff4906624fcf9a2f567af7db75de1eb7cdc0c31', '[\"*\"]', '2021-02-09 20:45:36', '2021-02-09 20:45:35', '2021-02-09 20:45:36'),
(105, 'App\\Models\\Agent', 9, 'admin', 'efc16d7eba748d0fc95b64a0f26ab6e8d89ffce1b5c14381532d1db149d48416', '[\"*\"]', '2021-02-09 20:45:43', '2021-02-09 20:45:43', '2021-02-09 20:45:43'),
(106, 'App\\Models\\Agent', 9, 'admin', '2b6b5e62f7d30da8cdf58523586ddcf7156743d886b36e25baea6cba563e628f', '[\"*\"]', '2021-02-09 20:46:32', '2021-02-09 20:46:12', '2021-02-09 20:46:32'),
(107, 'App\\Models\\Agent', 9, 'admin', '2ae93423903e165620798ef376feef342157688de37a3887b4cb1324e3f6283d', '[\"*\"]', '2021-02-09 20:47:03', '2021-02-09 20:47:02', '2021-02-09 20:47:03'),
(108, 'App\\Models\\Agent', 9, 'admin', '6a4eeb595374f0711086f8894f7cf191b15349af8f99e2bd5ce82a4d519e3e03', '[\"*\"]', '2021-02-09 20:47:17', '2021-02-09 20:47:17', '2021-02-09 20:47:17'),
(109, 'App\\Models\\Agent', 9, 'admin', '0038136f09014380e5419e4a52e7152f4d0799a4c4fa6fb280726cde001ca983', '[\"*\"]', '2021-02-09 20:47:55', '2021-02-09 20:47:55', '2021-02-09 20:47:55'),
(110, 'App\\Models\\Agent', 9, 'admin', 'd5c7772d22e5a7eb63c37306027f9a3435bbffffc5b17efad20286c99b7a60aa', '[\"*\"]', '2021-02-09 20:48:31', '2021-02-09 20:48:30', '2021-02-09 20:48:31'),
(111, 'App\\Models\\Agent', 9, 'admin', '69cadd484bc59e641d914c75541808e821fdd74551654e455c7887ed105007db', '[\"*\"]', '2021-02-09 20:48:46', '2021-02-09 20:48:44', '2021-02-09 20:48:46'),
(112, 'App\\Models\\Agent', 9, 'admin', '1bc46371873d4a773604fe0c250d4efa4c820966d752fbeb5dc92f1b548757d8', '[\"*\"]', '2021-02-09 20:48:53', '2021-02-09 20:48:52', '2021-02-09 20:48:53'),
(113, 'App\\Models\\Agent', 9, 'admin', 'd59e5e002d215c923ae4e26a31114081646d1f3f118bfbab4d6d0ae5623629cf', '[\"*\"]', '2021-02-09 20:49:06', '2021-02-09 20:49:05', '2021-02-09 20:49:06'),
(114, 'App\\Models\\Agent', 9, 'admin', 'f8f469f569bc4711053dfbb69449dd5a0347c54df44c8a2ed0e67c25d994ef14', '[\"*\"]', '2021-02-09 20:49:14', '2021-02-09 20:49:13', '2021-02-09 20:49:14'),
(115, 'App\\Models\\Agent', 9, 'admin', '6e716128a971b45f213722ab9583c9564aedf74f0a7136bfb4467bfeaf7a4a6b', '[\"*\"]', '2021-02-09 20:49:42', '2021-02-09 20:49:41', '2021-02-09 20:49:42'),
(116, 'App\\Models\\Agent', 9, 'admin', '730913591e78eab55102c3162a37c68695d6a3cd348541661ae10beed249181d', '[\"*\"]', '2021-02-09 20:58:29', '2021-02-09 20:49:44', '2021-02-09 20:58:29'),
(117, 'App\\Models\\Agent', 9, 'admin', 'df091002ea35e1b38a7a23e007d82205ba8a4e50e7a8a0d86122cf1b01930900', '[\"*\"]', '2021-02-09 20:58:42', '2021-02-09 20:58:42', '2021-02-09 20:58:42'),
(118, 'App\\Models\\Agent', 9, 'admin', '395dcd8c7dc97bb214065e361cb8a6b3ec4509d2b12aa75eaf31376ba9bc6794', '[\"*\"]', '2021-02-09 20:58:48', '2021-02-09 20:58:47', '2021-02-09 20:58:48'),
(119, 'App\\Models\\Agent', 9, 'admin', '8d075bf3d45a2b957f5e4e7a9118af73f0c1ab8c6c1afa3d30eeb0a6c0acf09f', '[\"*\"]', '2021-02-09 20:58:57', '2021-02-09 20:58:56', '2021-02-09 20:58:57'),
(120, 'App\\Models\\Agent', 9, 'admin', 'eb671591eb1ea5e622e76c460f78e6ff1f0bdfa77f08ec0821a1699f7e54bf85', '[\"*\"]', '2021-02-09 20:59:47', '2021-02-09 20:59:46', '2021-02-09 20:59:47'),
(121, 'App\\Models\\Agent', 9, 'admin', 'fe7140edc04b519f3d0b4a9dbd0ef50911c463bf56e5ea0179ee92ad5b1edb7e', '[\"*\"]', '2021-02-10 00:07:34', '2021-02-09 20:59:46', '2021-02-10 00:07:34'),
(122, 'App\\Models\\Agent', 9, 'admin', '27f4d485e42bbbec01b1b0f43d77d2558bdf00516b97e03953720888b68deccb', '[\"*\"]', '2021-02-10 00:22:58', '2021-02-10 00:21:56', '2021-02-10 00:22:58'),
(123, 'App\\Models\\Agent', 9, 'admin', 'bd61ec17f20c0165d5329f32579ed1f9aad366d530c1871a233c13289bd03448', '[\"*\"]', '2021-02-10 00:24:18', '2021-02-10 00:24:17', '2021-02-10 00:24:18'),
(124, 'App\\Models\\Agent', 9, 'admin', 'ba9a0df774c0c849a0635c64a4a4d8d3b140cb4cc3cb5ea5c40ed27448570915', '[\"*\"]', '2021-02-10 00:24:49', '2021-02-10 00:24:41', '2021-02-10 00:24:49'),
(125, 'App\\Models\\Agent', 9, 'admin', 'e9360fd2b6c9e9073cea5852e7c27b486c6966929d425cca82a32ec15a087a32', '[\"*\"]', '2021-02-10 00:25:08', '2021-02-10 00:24:56', '2021-02-10 00:25:08'),
(126, 'App\\Models\\Agent', 9, 'admin', 'bbe7134b5e3f5dd8a5048e8e65f980d7aa7dc08ba9fa2c3ff41e7bcc8378623e', '[\"*\"]', '2021-02-10 00:25:37', '2021-02-10 00:25:37', '2021-02-10 00:25:37'),
(127, 'App\\Models\\Agent', 9, 'admin', 'ba88de4f598b16e138484421cda05cb58eb943d105927feed4ebd8575dcd3a47', '[\"*\"]', '2021-02-10 00:26:00', '2021-02-10 00:25:59', '2021-02-10 00:26:00'),
(128, 'App\\Models\\Agent', 9, 'admin', '933fb69d8eadfc6818d744d0e71e1e0402b9aa9ae2ea59db5387669c8835fa2f', '[\"*\"]', NULL, '2021-02-10 00:26:21', '2021-02-10 00:26:21'),
(129, 'App\\Models\\Agent', 9, 'admin', '55ae8eb0ae3631d0784fd93e4a0a0417a49df50f9cbc6e48fc7fd56a937c1457', '[\"*\"]', NULL, '2021-02-10 00:26:59', '2021-02-10 00:26:59'),
(130, 'App\\Models\\Agent', 9, 'admin', '8e197c700bfbd1676b1402c2fa4be781dada2be3da5d589e0e38d6c182d216c7', '[\"*\"]', '2021-02-10 00:27:18', '2021-02-10 00:27:17', '2021-02-10 00:27:18'),
(131, 'App\\Models\\Agent', 9, 'admin', '1cd0a2c9388646b20e5a2896b82d13646e9ef9b4b040454f64f67e3867181bf7', '[\"*\"]', '2021-02-10 00:27:27', '2021-02-10 00:27:21', '2021-02-10 00:27:27'),
(132, 'App\\Models\\Agent', 9, 'admin', '7588976806fa1220665c550523367af5418c628345caa6eacdf19d08ad93b27f', '[\"*\"]', '2021-02-10 00:27:41', '2021-02-10 00:27:40', '2021-02-10 00:27:41'),
(133, 'App\\Models\\Agent', 9, 'admin', '144be83c42ece9339a2d8d9d35ef3a8693ebdf8df5ed8224fc17b3cc55ba2989', '[\"*\"]', '2021-02-10 00:27:48', '2021-02-10 00:27:48', '2021-02-10 00:27:48'),
(134, 'App\\Models\\Agent', 9, 'admin', 'f630f1bdcee7c87d4d1fe310ca7cb012264707d2a070674986ef80f57b1e2d41', '[\"*\"]', '2021-02-10 00:28:12', '2021-02-10 00:27:54', '2021-02-10 00:28:12'),
(135, 'App\\Models\\Agent', 9, 'admin', 'e81738764c73420dacb8a9392fba86d974fb42510c831772d5c92b8770ad586c', '[\"*\"]', '2021-02-10 00:28:31', '2021-02-10 00:28:30', '2021-02-10 00:28:31'),
(136, 'App\\Models\\Agent', 9, 'admin', 'e99261fcc014572ceba0603028dd8888f7715d868cf049578402f17f560400b8', '[\"*\"]', '2021-02-10 00:33:34', '2021-02-10 00:33:20', '2021-02-10 00:33:34'),
(137, 'App\\Models\\Agent', 9, 'admin', 'b58da21912a545eb2eb8d9e6af799dfedf714cc2f475f710c5ede8e3037f396e', '[\"*\"]', '2021-02-10 00:33:48', '2021-02-10 00:33:47', '2021-02-10 00:33:48'),
(138, 'App\\Models\\Agent', 9, 'admin', 'ee0301fb0585a940f9e1d7bd2131cee7f839d306371f577325853b4dc12e7cba', '[\"*\"]', '2021-02-10 07:16:08', '2021-02-10 00:34:44', '2021-02-10 07:16:08'),
(139, 'App\\Models\\Agent', 9, 'admin', '4b7472c6b3e4923d88187ace4b48e8f21a20a54f451175074969a56e39437349', '[\"*\"]', '2021-02-10 07:30:50', '2021-02-10 07:30:39', '2021-02-10 07:30:50'),
(140, 'App\\Models\\Agent', 9, 'admin', '9fef11d9e6a77cedf4011531c64e66f94532537a7ca2ee1178f1f7e8173157c9', '[\"*\"]', '2021-02-10 07:32:37', '2021-02-10 07:32:18', '2021-02-10 07:32:37'),
(141, 'App\\Models\\Agent', 9, 'admin', '327f2de7e99e249b914b73e346a9ac114d415286b20a8a2ecf4ff91f45ab0075', '[\"*\"]', '2021-02-10 07:32:47', '2021-02-10 07:32:46', '2021-02-10 07:32:47'),
(142, 'App\\Models\\Agent', 9, 'admin', 'ddaac1d06eecc4733f933dc99aa23b7462217fb151c54007cc713bcdebcf514f', '[\"*\"]', '2021-02-10 07:35:02', '2021-02-10 07:35:01', '2021-02-10 07:35:02'),
(143, 'App\\Models\\Agent', 9, 'admin', '553b2e73e4d45ad5f4009b8bebda0e8e8edbf65d95bc6807586c41c65c191661', '[\"*\"]', '2021-02-10 07:35:21', '2021-02-10 07:35:20', '2021-02-10 07:35:21'),
(144, 'App\\Models\\Agent', 9, 'admin', '50761f0ccd9750f72ef844c9711671e532f27c4042a0505176eae4481df15a7a', '[\"*\"]', '2021-02-10 07:35:44', '2021-02-10 07:35:42', '2021-02-10 07:35:44'),
(145, 'App\\Models\\Agent', 9, 'admin', 'd56f0e2fafe565dbd5efea2af93d1253b602e4b4d2bbc2f4e4535b25d2b9cb35', '[\"*\"]', '2021-02-10 07:36:13', '2021-02-10 07:36:02', '2021-02-10 07:36:13'),
(146, 'App\\Models\\Agent', 9, 'admin', '58e49a1f85791e1a792e64ef851b7cb993421c50449e576a9e6ff81bc3124c35', '[\"*\"]', '2021-02-10 07:37:07', '2021-02-10 07:37:06', '2021-02-10 07:37:07'),
(147, 'App\\Models\\Agent', 9, 'admin', 'bbb3bf8a37d52015d21b0b582a9deb9d829e73f5ca6355602033344d4cd90445', '[\"*\"]', '2021-02-10 07:37:10', '2021-02-10 07:37:10', '2021-02-10 07:37:10'),
(148, 'App\\Models\\Agent', 9, 'admin', 'd7be989100a7bb28ec9d105db0876a361d8351e4a16c923efe5d2c0fcba5d80b', '[\"*\"]', '2021-02-10 07:37:23', '2021-02-10 07:37:22', '2021-02-10 07:37:23'),
(149, 'App\\Models\\Agent', 9, 'admin', '072ab4b875bcb0424347be5df3fbee09e26d7d681da052ebc60bbdecc1816420', '[\"*\"]', '2021-02-10 07:37:26', '2021-02-10 07:37:25', '2021-02-10 07:37:26'),
(150, 'App\\Models\\Agent', 9, 'admin', 'a00668eaffde5640da3d0e77bd113a3b032fed916dcc6fa91d532cfbaf481f95', '[\"*\"]', '2021-02-10 07:37:28', '2021-02-10 07:37:27', '2021-02-10 07:37:28'),
(151, 'App\\Models\\Agent', 9, 'admin', '27ac0d3e8f96c8dc4c5d26f2c4d157f5ed054f814cf3eceba969d482ed9d902b', '[\"*\"]', '2021-02-10 07:37:35', '2021-02-10 07:37:34', '2021-02-10 07:37:35'),
(152, 'App\\Models\\Agent', 9, 'admin', '31ed832ef9e67e19003f33352154d7304d28f9ec8ef8c1343e19eb416667c8cf', '[\"*\"]', '2021-02-10 07:37:38', '2021-02-10 07:37:37', '2021-02-10 07:37:38'),
(153, 'App\\Models\\Agent', 9, 'admin', '6c44b0460a58d8f776e7691e8bf9c68f9b128f60dada37fd8188b0eea37cd7ed', '[\"*\"]', '2021-02-10 07:38:01', '2021-02-10 07:37:53', '2021-02-10 07:38:01'),
(154, 'App\\Models\\Agent', 9, 'admin', '052fa5bc1110f2c0b6ed0f6fc4d3c89f931f52d4488c281a755b0ce07152e0f7', '[\"*\"]', '2021-02-10 07:39:54', '2021-02-10 07:39:53', '2021-02-10 07:39:54'),
(155, 'App\\Models\\Agent', 9, 'admin', 'c0857c0f66b0c27d0d6f0227b67b46edfc53806c5b7f2a259b0ae171b2d06ea2', '[\"*\"]', '2021-02-10 07:40:14', '2021-02-10 07:40:13', '2021-02-10 07:40:14'),
(156, 'App\\Models\\Agent', 9, 'admin', '13888d85180a270ba62f3e6fc415e3a7abb8fc17d616008cb16941ea9bcd090f', '[\"*\"]', '2021-02-10 07:40:21', '2021-02-10 07:40:16', '2021-02-10 07:40:21'),
(157, 'App\\Models\\Agent', 9, 'admin', 'b409541e205f48b030b2eaf91279c637d789c8bf8a53f166054d6ba829cc2105', '[\"*\"]', '2021-02-10 07:41:03', '2021-02-10 07:41:03', '2021-02-10 07:41:03'),
(158, 'App\\Models\\Agent', 9, 'admin', '4f9a95a84c5a40b4bd50ab5cbfa6527c175ef60d883716797a9883e470e7dddb', '[\"*\"]', '2021-02-10 07:41:07', '2021-02-10 07:41:06', '2021-02-10 07:41:07'),
(159, 'App\\Models\\Agent', 9, 'admin', 'a09ac453b31bddd60a91e2a93767e86eef022e0faceb77ae0b000ef9704cf90a', '[\"*\"]', '2021-02-10 07:41:23', '2021-02-10 07:41:22', '2021-02-10 07:41:23'),
(160, 'App\\Models\\Agent', 9, 'admin', 'd53e46f4f6b4b996ce0746b6d2df586ffe4dbd3e3de55bafa1391733206404c0', '[\"*\"]', '2021-02-10 07:41:32', '2021-02-10 07:41:25', '2021-02-10 07:41:32'),
(161, 'App\\Models\\Agent', 9, 'admin', '9d85b590d643c161a5c48d66673bea8d56d5d48d15a6fb8f493418c4ad1ed66d', '[\"*\"]', '2021-02-10 07:41:37', '2021-02-10 07:41:37', '2021-02-10 07:41:37'),
(162, 'App\\Models\\Agent', 9, 'admin', '1306c87f985366cd399587059f56e4e8b80df9fb4236db61375411fdba41732e', '[\"*\"]', '2021-02-10 07:41:40', '2021-02-10 07:41:39', '2021-02-10 07:41:40'),
(163, 'App\\Models\\Agent', 9, 'admin', '897bd7dd0f13c465f17a8b8239e660377f7a0fb6c96f8fdff681eea71026f960', '[\"*\"]', '2021-02-10 07:56:54', '2021-02-10 07:41:51', '2021-02-10 07:56:54'),
(164, 'App\\Models\\Agent', 1, 'admin', '00fc3cebd6d9d1b6f35f7785befa6e8ab04f6673bf6d490c79a4cc20109d08ca', '[\"*\"]', '2021-02-10 07:57:59', '2021-02-10 07:57:50', '2021-02-10 07:57:59'),
(165, 'App\\Models\\Agent', 9, 'admin', 'ad0e5a89a5cb24f1c6ed977d887a3fc5f71a70a990bb8ad77fac9098994a5eef', '[\"*\"]', '2021-02-10 09:30:01', '2021-02-10 09:29:39', '2021-02-10 09:30:01'),
(166, 'App\\Models\\Agent', 9, 'admin', '3fadaa407d5ebf8fa139f1910da62e6634937e43ab506e07aa6c003cb65edbc5', '[\"*\"]', '2021-02-10 09:30:30', '2021-02-10 09:30:15', '2021-02-10 09:30:30'),
(167, 'App\\Models\\Agent', 9, 'admin', 'b343912df8d87f461cb6ed0bcd5680a6209836179e1cf7edba66424161334aec', '[\"*\"]', '2021-02-10 09:32:19', '2021-02-10 09:31:44', '2021-02-10 09:32:19'),
(168, 'App\\Models\\Agent', 9, 'admin', '7bc617c3c577c5627aa2beb53feb85e6f7429399c451fbe2ffe58dcf873471c4', '[\"*\"]', '2021-02-10 09:39:01', '2021-02-10 09:38:52', '2021-02-10 09:39:01'),
(169, 'App\\Models\\Agent', 9, 'admin', 'a81e4d1cbb0fb9b2d2d3086df3901acf1c99aea01800ab96a5347c4ff4b80f0b', '[\"*\"]', '2021-02-10 09:39:19', '2021-02-10 09:39:18', '2021-02-10 09:39:19'),
(170, 'App\\Models\\Agent', 9, 'admin', '6ffba1b7b8d5b081a565032d50c7a1bdc16bf7ab10eafdf2d6dfae363bfed3ac', '[\"*\"]', '2021-02-10 09:40:17', '2021-02-10 09:39:42', '2021-02-10 09:40:17'),
(171, 'App\\Models\\Agent', 9, 'admin', '05d6abb9c68e0e060db86f9faacdd620d90e619029a1a7acd98b88ff819524c4', '[\"*\"]', '2021-02-10 09:40:55', '2021-02-10 09:40:42', '2021-02-10 09:40:55'),
(172, 'App\\Models\\Agent', 9, 'admin', '8614dd18c16450c51bd5a5403ebead75a64a78c1f152eb955d8e28526639d815', '[\"*\"]', '2021-02-10 09:41:36', '2021-02-10 09:41:07', '2021-02-10 09:41:36'),
(173, 'App\\Models\\Agent', 1, 'admin', '8df2bb6fd041c73ff6e0f7349fb7d040a18ac1eb25df6bedc5b2b8e548330f03', '[\"*\"]', '2021-02-10 09:43:54', '2021-02-10 09:41:50', '2021-02-10 09:43:54'),
(174, 'App\\Models\\Agent', 1, 'admin', '9d402ee37926fc85727ba1a439e55a96496f9d652e23c99d7a4c83778e4fa488', '[\"*\"]', '2021-02-10 09:44:19', '2021-02-10 09:44:17', '2021-02-10 09:44:19'),
(175, 'App\\Models\\Agent', 1, 'admin', '4cf3405d2d567229704ea0ffaf9296d5e9bb1ce968f9e3952dc0d707bfcac325', '[\"*\"]', '2021-02-10 09:45:05', '2021-02-10 09:44:18', '2021-02-10 09:45:05'),
(176, 'App\\Models\\Agent', 1, 'admin', '80bf8827a50ba9a4185d193cfe090741e712ac58001a533141e807665fdfa374', '[\"*\"]', '2021-02-10 09:54:54', '2021-02-10 09:45:13', '2021-02-10 09:54:54'),
(177, 'App\\Models\\Agent', 1, 'admin', 'a904e4e8bc34092115c42ed8b78026150ea25a95b7c28ff72fb2a16f19c08aa8', '[\"*\"]', '2021-02-11 15:50:10', '2021-02-10 09:55:12', '2021-02-11 15:50:10'),
(178, 'App\\Models\\Agent', 9, 'admin', '524480e22cd9ad3cce6a76a3b7f5ddf067be1f2abfcba67e240d2507b34eba18', '[\"*\"]', '2021-02-10 19:00:49', '2021-02-10 19:00:09', '2021-02-10 19:00:49'),
(179, 'App\\Models\\Agent', 9, 'admin', '3b2bf1aa23d34c803b34c818596681fc33d0ae09edb728885feb29c0ef3eee44', '[\"*\"]', '2021-02-10 19:20:51', '2021-02-10 19:02:15', '2021-02-10 19:20:51'),
(180, 'App\\Models\\Agent', 10, 'Mamunur Rashid', 'd7ed226aa0ba643aef1c27570ad87e390ae0d1c273aa52cf979bb29c2d5431b3', '[\"*\"]', NULL, '2021-02-10 19:27:45', '2021-02-10 19:27:45'),
(181, 'App\\Models\\Agent', 10, 'admin', '017d239050723ff7f330e63ed45fc4d7c14df1ac1a4843aba863eaa42e3f2f8a', '[\"*\"]', '2021-02-10 20:05:12', '2021-02-10 19:28:03', '2021-02-10 20:05:12');

-- --------------------------------------------------------

--
-- Table structure for table `real_estate_solutions`
--

CREATE TABLE `real_estate_solutions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `religious_institutions`
--

CREATE TABLE `religious_institutions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `thana_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `religious_institutions`
--

INSERT INTO `religious_institutions` (`id`, `division_id`, `district_id`, `thana_id`, `name`, `bn_name`, `description`, `bn_description`, `lat`, `lon`, `type`, `image`, `created_at`, `updated_at`) VALUES
(6, 1, 6, 59, 'Mondir', 'Mondir', 'The description about Mondir', 'The description about Mondir', '122.3336', '322.3551', '2', 'abasvumi/uploads/images/religious/education_16109056711345361273.png', '2021-01-17 11:47:51', '2021-01-17 11:47:51'),
(7, 1, 6, 59, 'Mosque', 'Mosque', 'The description about mosque', 'The description about mosque', '100.200', '120.320', '1', 'abasvumi/uploads/images/religious/education_1610905736488128728.png', '2021-01-17 11:48:56', '2021-01-17 11:48:56');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `thana_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `division_id`, `district_id`, `thana_id`, `name`, `bn_name`, `description`, `bn_description`, `lat`, `lon`, `type`, `image`, `created_at`, `updated_at`) VALUES
(4, 1, 6, 59, 'Five star hotel', 'Five star hotel', 'The description Five star hotel', 'The description Five star hotel', '400.366', '500.355', '3', 'abasvumi/uploads/images/restaurant/restaurant_1610905963835137695.png', '2021-01-17 11:52:43', '2021-01-17 11:52:43'),
(5, 1, 6, 59, 'Four star hotal', 'Four star hotal', 'The description Four star hotal', 'The description Four star hotal', '500.211', '600.233', '2', 'abasvumi/uploads/images/restaurant/restaurant_1610906000959202552.png', '2021-01-17 11:53:20', '2021-01-17 11:53:20');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'Super Admin', '2021-01-15 10:48:44', '2021-01-15 10:48:44'),
(2, 'Admin', 'This admin', '2021-01-21 10:00:18', '2021-01-21 10:02:21'),
(3, 'Editor', 'This is editor', '2021-01-21 10:01:13', '2021-01-21 10:02:13'),
(4, 'System user', 'This is system user', '2021-01-21 10:01:32', '2021-01-21 10:02:07');

-- --------------------------------------------------------

--
-- Table structure for table `serviceimages`
--

CREATE TABLE `serviceimages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_three` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_four` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_five` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_six` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_seven` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_eight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_nine` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `serviceimages`
--

INSERT INTO `serviceimages` (`id`, `service_id`, `image_one`, `image_two`, `image_three`, `image_four`, `image_five`, `image_six`, `image_seven`, `image_eight`, `image_nine`, `created_at`, `updated_at`) VALUES
(1, 5, 'abasvumi/uploads/images/services/service_16123614741903592534.png', 'abasvumi/uploads/images/services/service_16123614741474245503.png', 'abasvumi/uploads/images/services/service_16123614742062834008.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 08:11:14'),
(2, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 9, 'abasvumi/uploads/images/services/service_1612361391830515962.png', 'abasvumi/uploads/images/services/service_1612361391752895356.png', 'abasvumi/uploads/images/services/service_16123613911699151643.png', 'abasvumi/uploads/images/services/service_16123614122122290213.png', 'abasvumi/uploads/images/services/service_161236141244011734.png', 'abasvumi/uploads/images/services/service_16123614121817331754.png', 'abasvumi/uploads/images/services/service_1612361412632369742.png', 'abasvumi/uploads/images/services/service_16123614121229002037.png', 'abasvumi/uploads/images/services/service_16123614121615492957.png', NULL, '2021-02-03 08:10:12'),
(6, 10, 'abasvumi/uploads/images/services/service_16123585041444749634.png', 'abasvumi/uploads/images/services/service_16123585042044856727.png', 'abasvumi/uploads/images/services/service_161235850431138447.png', 'abasvumi/uploads/images/services/service_1612358504228893566.png', 'abasvumi/uploads/images/services/service_1612358504619924127.png', 'abasvumi/uploads/images/services/service_1612358504919941815.png', 'abasvumi/uploads/images/services/service_1612358504126339405.jpg', 'abasvumi/uploads/images/services/service_16123585041247774232.jpg', 'abasvumi/uploads/images/services/service_16123585041624665341.jpg', '2021-02-03 07:21:44', '2021-02-03 07:21:44'),
(7, 11, 'abasvumi/uploads/images/services/service_16123586471053813556.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 07:24:07', '2021-02-03 07:24:07'),
(8, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 09:42:18', '2021-02-03 09:42:18'),
(9, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 10:34:20', '2021-02-03 10:34:20'),
(10, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 10:47:20', '2021-02-03 10:47:20'),
(11, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 10:51:37', '2021-02-03 10:51:37'),
(12, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 10:54:27', '2021-02-03 10:54:27'),
(13, 17, 'abasvumi/uploads/images/services/service_16123772111557858634.png', NULL, NULL, NULL, NULL, 'abasvumi/uploads/images/services/service_16123772111227118464.jpg', 'abasvumi/uploads/images/services/service_16123772111316719617.jpg', 'abasvumi/uploads/images/services/service_16123772111430938695.jpg', 'abasvumi/uploads/images/services/service_161237721177096405.jpg', '2021-02-03 10:57:39', '2021-02-03 23:33:31'),
(14, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 12:08:22', '2021-02-03 12:08:22'),
(15, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 12:09:16', '2021-02-03 12:09:16'),
(16, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 12:10:46', '2021-02-03 12:10:46'),
(17, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 12:12:45', '2021-02-03 12:12:45'),
(18, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-02-03 12:13:31', '2021-02-03 12:13:31'),
(19, 23, 'abasvumi/uploads/images/services/service_16123761911862039112.png', NULL, NULL, NULL, NULL, NULL, NULL, 'abasvumi/uploads/images/services/service_16123761911664390058.jpg', 'abasvumi/uploads/images/services/service_1612376191340971452.jpg', '2021-02-03 12:14:44', '2021-02-03 12:16:31');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_type_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `developer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `thana_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `block_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `interest_rate` decimal(8,2) DEFAULT NULL,
  `sqft` decimal(8,2) DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `baths` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `garage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balcony` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amenities` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `educational_institutes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hospitals` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurants` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religious` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties_thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_contact_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent_contact_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `developer_contact_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no_show` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approval_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_type_id`, `user_id`, `agent_id`, `developer_id`, `division_id`, `district_id`, `thana_id`, `area_id`, `block_id`, `title`, `bn_title`, `description`, `bn_description`, `address`, `type`, `purpose`, `status`, `price`, `interest_rate`, `sqft`, `lat`, `lon`, `baths`, `garage`, `balcony`, `amenities`, `educational_institutes`, `hospitals`, `restaurants`, `parks`, `religious`, `properties_thumbnail`, `video_link`, `admin_contact_no`, `agent_contact_no`, `developer_contact_no`, `contact_no_show`, `contact_email`, `approval_status`, `created_at`, `updated_at`) VALUES
(5, 7, NULL, 1, NULL, 1, 6, 59, 4, 6, 'This is service title', 'This is service title', '<p>Myanmar\'s military seized power in a bloodless coup yesterday,  detaining democratically elected leader Aung San Suu Kyi and imposing a  one-year state of emergency -- moves that sparked global outrage and  calls for the generals to immediately backtrack. \r\n\r\nThe army  intervention ended a decade of transition from outright military rule  in Myanmar, with the generals justifying the power grab by alleging  fraud in the November elections that Suu Kyi\'s National League for  Democracy (NLD) party won in a landslide.\r\n\r\nUS President Joe Biden  led the chorus of world condemnation, calling for a quick restoration of  democracy and warning that Washington could reimpose sanctions.\r\n\r\n\"The  international community should come together in one voice to press the  Burmese military to immediately relinquish the power they have seized,\"  Biden said.</p>', '<p>মিয়ানমারে সামরিক অভ্যুত্থানের ঘটনায় দেশটির ওপর নিষেধাজ্ঞা আরোপের হুমকি দিয়েছে যুক্তরাষ্ট্র। আজ মঙ্গলবার বিবিসি অনলাইনের প্রতিবেদনে এই তথ্য জানানো হয়।\r\n\r\nমার্কিন প্রেসিডেন্ট জো বাইডেন মিয়ানমারকে এই হুমকি দিয়েছেন। মিয়ানমারের ওপর যুক্তরাষ্ট্র নিষেধাজ্ঞা পুনর্বহাল করবে বলে হুমকিতে উল্লেখ করেছেন তিনি।\r\n\r\nমিয়ানমারের স্টেট কাউন্সেলর অং সান সু চি ও তাঁর দল ন্যাশনাল লিগ ফর ডেমোক্রেসির (এনএলডি) শীর্ষ নেতাদের আটকের মধ্য দিয়ে গতকাল সোমবার দেশটিতে সামরিক অভ্যুত্থান করেছে সেনাবাহিনী।\r\n\r\nজনগণের ভোটে নির্বাচিত সু চির সরকার উৎখাত করে ক্ষমতা দখলের পর সেনাবাহিনী দেশটিতে এক বছরের জরুরি অবস্থা জারি করেছে।\r\n\r\nগতকাল সকালেই মিয়ানমারের নেতাদের আটকের পর হুঁশিয়ারি উচ্চারণ করে যুক্তরাষ্ট্র। যুক্তরাষ্ট্র সতর্ক করে বলে, সু চিসহ অন্যদের ছেড়ে না দিলে মিয়ানমারের দায়ী কর্তৃপক্ষের বিরুদ্ধে তাঁরা ব্যবস্থা নেবেন। হোয়াইট হাউসের প্রেস সেক্রেটারি জেন সাকি এ বিষয়ে গতকাল বিবৃতি দেন। বিবৃতিতে তিনি বলেন, মিয়ানমারের গণতান্ত্রিক উত্তরণ বাধাগ্রস্ত করার চেষ্টার বিরোধিতা করে যুক্তরাষ্ট্র। এই পদক্ষেপগুলোর ব্যত্যয় ঘটলে মিয়ানমারের দায়ী ব্যক্তিদের বিরুদ্ধে ব্যবস্থা নেবে যুক্তরাষ্ট্র।\r\n\r\nএরপর যুক্তরাষ্ট্রের প্রেসিডেন্ট জো বাইডেন বিবৃতি দিলেন। বিবৃতিতে বাইডেন বলেছেন, জনগণের ইচ্ছার ওপর কখনো শক্তি প্রয়োগ করা উচিত নয়। বিশ্বাসযোগ্য নির্বাচনের ফলাফল নিশ্চিহ্নের চেষ্টাও করা উচিত নয়।\r\n\r\nগণতান্ত্রিক উত্তরণের পরিপ্রেক্ষিতে গত এক দশকে মিয়ানমারের ওপর থেকে নিষেধাজ্ঞা প্রত্যাহার করে যুক্তরাষ্ট্র। কিন্তু মিয়ানমার ফের সামরিক শাসনে ফেরায় দেশটির ওপর নিষেধাজ্ঞা আরোপের হুমকি দিল যুক্তরাষ্ট্র।\r\n\r\nএ প্রসঙ্গে জো বাইডেন বলেছেন, নিষেধাজ্ঞার সিদ্ধান্ত জরুরি ভিত্তিতে পর্যালোচনা করা হবে।\r\n\r\nএকই সঙ্গে বাইডেন সতর্ক করে বলেছেন, বিশ্বে যেখানেই গণতন্ত্র আক্রমণের শিকার হবে, সেখানেই তার (গণতন্ত্র) পক্ষে দাঁড়াবে যুক্তরাষ্ট্র।\r\n\r\nমিয়ানমারে সামরিক অভ্যুত্থানের ঘটনায় উদ্বেগ প্রকাশ করেছেন বিশ্বনেতারা। তীব্র নিন্দা জানিয়েছেন জাতিসংঘের মহাসচিব আন্তোনিও গুতেরেস। বিভিন্ন দেশ ও আন্তর্জাতিক সংগঠন সু চিসহ অন্য রাজনৈতিক নেতাদের মুক্তির আহ্বান জানিয়েছে।\r\n\r\nমিয়ানমারে গত নভেম্বরের সাধারণ নির্বাচনে সু চির দল এনএলডি বিপুল জয় পায়। এরপর থেকেই মূলত সংকট ঘনীভূত হতে থাকে। সেনাবাহিনী ও সেনাসমর্থিত দল ইউনিয়ন সলিডারিটি অ্যান্ড ডেভেলপমেন্ট পার্টি নির্বাচনের পর থেকেই ভোটে কারচুপির অভিযোগ করে আসছিল। গত বৃহস্পতিবার দেশটির নির্বাচন কমিশন এ অভিযোগ প্রত্যাখ্যান করে। গতকালই মিয়ানমারের নবনির্বাচিত পার্লামেন্টের প্রথম অধিবেশন বসার কথা ছিল। এর কয়েক ঘণ্টা আগে দেশটিতে সামরিক অভ্যুত্থান ঘটে।\r\n\r\nপ্রায় অর্ধশতাব্দী ধরে সামরিক শাসন চলা মিয়ানমার ২০১৫ সালের নির্বাচনের মাধ্যমে গণতন্ত্রের সুবাস পেতে শুরু করে। গত নভেম্বরের নির্বাচনে সেটা কিছুটা ভিত্তি পায়। কিন্তু গতকাল আবার সামরিক জান্তার কবলে চলে গেল দেশটি।\r\n\r\nগণতন্ত্র</p>', 'This is service address', '3', '1', '1', 10.00, 100.00, 12.00, '123.321', '369.258', '23', '5', '3', '[\"5\"]', '[\"13\",\"14\"]', '[\"5\"]', '[\"4\"]', '[\"6\",\"7\"]', '[\"6\",\"7\"]', 'abasvumi/uploads/images/services/service_1612361474521021108.png', 'https://abasvumidynamic.swadhinbarta.com/admin', '01829600496', NULL, NULL, '1', 'bidhanvk@gmail.com', 0, '2021-01-17 12:30:57', '2021-02-03 08:11:14'),
(6, 6, NULL, NULL, 4, 1, 7, 64, 3, 5, 'This is service title one', 'This is service title one', '<p>TRohingya repatriation will not be affected by the military coup in Myanmar, said Foreign Minister AK Abdul Momen yesterday.\r\n\r\n\"The agreement on Rohingya repatriation was signed with the Myanmar state, and it doesn\'t matter who is in power, the agreement must be followed,\" he told The Daily Star, hours after Myanmar military took control of the Southeast Asian country following the detention of de facto leader Aung San Suu Kyi and other politicians.\r\n\r\nThe move follows a landslide win by Suu Kyi\'s National League of Democracy (NLD) party in November election, which the army claims was marred by fraud.\r\n\r\nThe military coup raised concerns if Rohingya repatriation process would be hampered with the military in power, as repeated attempts of Rohingya repatriation failed, with the Rohingyas saying that the conditions in Rakhine state were not conducive for return as there was no guarantee of citizenship, safety, and basic rights.\r\n\r\nBangladesh has been trying in various ways to start the Rohingya repatriation, even by involving China and the international community.\r\n\r\nNearly a million Rohingyas fled a military crackdown in Myanmar\'s Rakhine state in 2017. Myanmar also faces genocide case at the International Court of Justice. Despite global pressure, the repatriation did not start and there was expectation that it would start in the second half of this year.</p>', '<p>১৯৭১ সালে ইরানের রামসার শহরে বিভিন্ন দেশ জলাভূমি রক্ষা ও টেকসই ব্যবহারের লক্ষ্যে ‘কনভেনশন অন ওয়েটল্যান্ডস’ আন্তর্জাতিক চুক্তিতে স্বাক্ষর করে। সুন্দরবন ১৯৯২ সালে রামসার অঞ্চল হিসেবে স্বীকৃতি লাভ করে। যদিও মানবসৃষ্ট মারাত্মক হুমকিতে সুন্দরবন ও তার জীববৈচিত্র্য।\r\n\r\nসুনামগঞ্জের টাঙ্গুয়ার হাওর ২০০০ সালে রামসার অঞ্চল হিসেবে অন্তর্ভুক্ত হয়। টাঙ্গুয়ার হাওরে বিরল প্রজাতির ২ শতাধিক পাখির অভয়াশ্রম এবং বিপন্ন ১৫০ প্রজাতির মাছের সমাগম। সরকার টাঙ্গুয়ার হাওর সংরক্ষণ ও ব্যবস্থাপনায় স্থানীয় জনগণ ও বিভিন্ন অংশীজনের অংশগ্রহণের ব্যবস্থা নিয়ে সুফল পেলেও বিভিন্ন মানবসৃষ্ট নেতিবাচক প্রভাব ঠেকানো যাচ্ছে না।\r\n\r\nজীববৈচিত্র্যে ভরপুর হাকালুকি হাওরকে তৃতীয় রামসার অঞ্চল হিসেবে অন্তর্ভুক্ত করার প্রস্তাব করা হয়েছে। ২৩৮টি স্বতন্ত্র বিলসহ এর আয়তন ১৮ হাজার ৩৮৩ হেক্টর। হাকালুকি হাওরে ১৫০ প্রজাতির মিঠাপানির মাছ, ৫২৬ প্রজাতির জলজ উদ্ভিদ, ২০ প্রজাতির সরীসৃপ রয়েছে। শীতকালে প্রায় ২০০ বিরল প্রজাতির অতিথি পাখির সমাগম ঘটে।\r\n\r\nবায়েরের ভূতিহাঁস গোটা পৃথিবীতে মহাবিপন্ন প্রজাতি। বার্ডলাইফ ইন্টারন্যাশনালের মতে, পৃথিবীতে মাত্র ২০০ জোড়া বায়েরের ভূতিহাঁস টিকে আছে। শীতকালের পরিযায়ন মৌসুমে এ হাঁসটি হাকালুকি ও টাঙ্গুয়ার হাওরে আসে। বায়েরের হাঁসের মতো আরও প্রায় ২০ জাতের বিভিন্ন প্রজাতির ২-৩ লাখ হাঁস হাওর এলাকার জলাশয়গুলোতে আসে। পাখিশুমারির বিভিন্ন তথ্য বলছে, প্রতিবছরই পরিযায়ী পাখিদের বিচরণ কমছে। অবৈধভাবে বুনো হাঁস শিকারে ফাঁদের ব্যবহার তুলনামূলক কমলেও ধানের সঙ্গে বিষ মিশিয়ে জমিতে রাখায় পরিযায়ী হাঁস মারা পড়ে। গত ১০ বছরে সবচেয়ে বেশি হাঁস মারা পড়েছে হাকালুকি হাওরে। বিষে মরা হাঁসগুলো বাজারে বিক্রি হওয়ায় জনস্বাস্থ্যও হুমকির সম্মুখীন।</p>', 'This is service address one', '5', '1', '1', 100.20, 100.20, 100.20, '100.100', '200.200', '100.200', '10.20', '10.20', '[\"4\"]', '[\"13\"]', '[\"5\"]', '[\"4\"]', '[\"6\"]', '[\"6\",\"7\"]', NULL, 'https://abasvumidynamic.swadhinbarta.com/', '01829600496', NULL, NULL, '2', 'bidhanvk@gmail.com', 0, '2021-01-17 12:54:00', '2021-01-17 12:55:50'),
(7, 7, NULL, 1, NULL, 1, 6, 59, 4, 6, 'Service test', 'Service test', '<p>A DB (Gulshan Division) team led by Deputy Commissioner Mashiur Rahman conducted the drive at the factory in Khilbarir Tek area under Bhatara Police Station from around 10:00pm on Monday night till around 12:00am today.\r\n\r\nFollowing news of several deaths in Dhaka from alcohol poisoning in the last two days, the detectives began investigation to this end and tracked down the delivery person first and then the supplier and wholesaler, and in this way finally traced the factory location, Mashiur Rahman told The Daily Star.\r\n\r\nThe owner of the factory, Md Nasir, used to sell foreign alcohol after taking those from warehouses, while the \"chief chemist\" Md Jahangir used to sell old bottles of foreign liquor.</p>', '<p>শেয়ারবাজারে আজ মঙ্গলবার থেকে লেনদেন শুরু হচ্ছে মীর আকতার হোসেন লিমিটেডের। প্রথম দিনই লেনদেনের অল্প সময়ের মধ্যে কোম্পানিটির শেয়ারের সর্বোচ্চ মূল্যবৃদ্ধি হয়েছে। ফলে বিক্রেতাশূন্য হয়ে পড়েছে।\r\n\r\nঅবকাঠামো নির্মাণকাজের সঙ্গে সম্পৃক্ত এ কোম্পানি বুক বিল্ডিং পদ্ধতিতে শেয়ারবাজারে এসেছে। বুক বিল্ডিং পদ্ধতির দর প্রস্তাবে এটির শেয়ারের দাম নির্ধারিত হয়েছে ৬০ টাকা। নিয়ম অনুযায়ী, নিলাম মূল্যের চেয়ে ১০ শতাংশ কমে অর্থাৎ ৫৪ টাকায় কোম্পানিটির প্রাথমিক গণপ্রস্তাব বা আইপিও শেয়ারের দাম নির্ধারিত হয়। আজ লেনদেনের শেয়ারটির লেনদেন শুরু হয় ৮১ টাকা দরে। সকাল ১০টা ৩০ মিনিটে শেয়ারটির দর ২৭ টাকা বা ৫০ শতাংশ বেড়েছে। এ সময়ে কোম্পানিটি মাত্র ৪ বারে ৩২০টি শেয়ার লেনদেন করেছে। পরে সর্বোচ্চ মূল্যবৃদ্ধি হয়ে বিক্রেতা শূন্য হয়ে পড়ে।\r\n\r\nপুঁজিবাজারে মীর আকতার ২ কোটির বেশি শেয়ার ছেড়ে বাজার থেকে ১২৫ কোটি টাকার মূলধন সংগ্রহ করেছে। গত ডিসেম্বরে কোম্পানিটির আইপিওর চাঁদা গ্রহণ সম্পন্ন হয়। তালিকাভুক্তির আগে গতকাল কোম্পানিটি গত ডিসেম্বর শেষের অর্ধবার্ষিক আর্থিক প্রতিবেদন প্রকাশ করে। সেখানে গত জুলাই-ডিসেম্বর সময়ে কোম্পানিটির শেয়ারপ্রতি আয় বা ইপিএস দাঁড়িয়েছে ২ টাকা ১৫ পয়সা, আগের বছর যার পরিমাণ ছিল ২ টাকা ৭ পয়সা। আইপিও শেয়ারকে বিবেচনায় নিলে গত ডিসেম্বর শেষে ৬ মাসে ইপিএস দাঁড়িয়েছে ১ টাকা ৭৮ পয়সা।</p>', 'Service test', '2', '2', '2', 100.20, 100.20, 111.00, '12', '12', '111', '111', '111', '[\"5\"]', '[\"14\"]', '[\"6\"]', '[\"5\"]', '[\"7\"]', 'null', NULL, 'https://abasvumidynamic.swadhinbarta.com/', '01829600496', NULL, NULL, '2', 'bidhanvk@gmail.com', 0, '2021-01-22 14:05:12', '2021-01-22 14:05:12'),
(8, 7, NULL, NULL, 4, 1, 6, 59, 4, 6, 'This is service title', 'This is service title', '<p>The coup d\'état staged by military in Myanmar that prevented Aung San Suu Kyi\'s democratically elected  party from taking power yesterday baffled many political analysts. \r\n\r\nThe coup returns the country to full military rule after a short experiment in quasi-democracy that began in 2011, when the military, which had been in power since 1962, implemented parliamentary elections and other reforms.\r\n\r\nFor the past five years, Suu Kyi and her once-banned National League for Democracy (NLD) party led the country after being elected in 2015 in the freest and fairest vote seen in 25 years. Yesterday morning, the party should have begun its second term in office after winning 83 percent of available seats in the 2020 election.\r\n\r\nBut behind the scenes, the military has kept a relatively tight grip on Myanmar, thanks to a constitution which guarantees it a quarter of all seats in parliament and control of the country\'s most powerful ministries.\r\n\r\nWhich raises the question why did it seize power now - and more to the point, what happens next?\r\n\r\nThe military yesterday took power alleging widespread fraud in the election. It claimed to have uncovered more than 10 million instances of voter fraud. It had demanded that the United Elections Commission (UEC) of Myanmar which oversees elections, or the government, or outgoing parliamentarians prove at a special session before the new parliament convenes on February 1, that the elections were free and fair. The demand had been rejected.</p>', '<p>গণস্বাস্থ্য কেন্দ্রের প্রতিষ্ঠাতা জাফরুল্লাহ চৌধুরী সরকারকে শুধু ব্যবসায়ীদের দিকে নজর না দিয়ে গবেষণার দিকে নজর দিতে অনুরোধ জানিয়েছেন। এতে করোনাভাইরাস বিষয়ে ব্যাপক আকারে গবেষণা করা যাবে উল্লেখ করে তিনি বলেন, বাংলাদেশের তরুণ গবেষকেরা যতগুলো ভ্যাকসিনের নাম শুনেছেন, তাঁরা ছয় মাসের মধ্যে তা তৈরি করতে পারবেন।\r\n\r\nআজ সোমবার রাজধানীর ধানমন্ডিতে গণস্বাস্থ্য নগর হাসপাতালে ‘গণস্বাস্থ্য কেন্দ্র কর্তৃক বাংলাদেশে নতুন সার্স কোভ-২ ভেরিয়েন্ট শনাক্ত’ বিষয়ে এক মতবিনিময় সভায় তিনি এসব কথা বলেন।\r\n\r\nজাফরুল্লাহ চৌধুরী বলেন, সরকারি বিশ্ববিদ্যালয়কে গবেষণার সুযোগ করে দিতে হবে। প্রয়োজনে বিদেশ থেকেও গবেষক আনা যেতে পারে। বর্তমান সময়ে বাজারে যতগুলো ভ্যাকসিন রয়েছে, তার সব কটিই ছয় মাসে তৈরি করা সম্ভব। তিনি জনপ্রতি মাত্র ৩ ডলার গবেষণার জন্য বিনিয়োগ করতে সরকারের প্রতি আহ্বান জানান।\r\n\r\nগণস্বাস্থ্য-আরএনএ মলিকুলার ডায়াগনস্টিক অ্যান্ড রিসার্চ সেন্টার, জাহাঙ্গীরনগর বিশ্ববিদ্যালয়ের মাইক্রোবায়োলজি বিভাগ এবং ব্র্যাক বিশ্ববিদ্যালয়ের ফার্মেসি বিভাগের গবেষকেরা প্রাপ্ত ক্লিনিক্যাল নমুনা থেকে সার্স কোভ-২ ভেরিয়েন্টের সম্পূর্ণ জিনোম সিকোয়েন্স করেছেন।</p>', 'This is service title', '5', '2', '2', 100.20, 100.20, 100.20, '12', '12', '100.200', '1111', '111', '[\"5\"]', '[\"14\"]', '[\"6\"]', '[\"5\"]', '[\"7\"]', '[\"7\"]', NULL, 'https://abasvumidynamic.swadhinbarta.com/admin', '01829600496', NULL, NULL, '2', 'bidhanvk@gmail.com', 0, '2021-01-22 14:10:15', '2021-01-22 14:12:58'),
(9, 7, NULL, NULL, NULL, 1, 6, 59, 4, 6, 'This is service title', 'This is service title', '<p>This is service titleThis is service titleThis is service titleThis is service titleThis is service titleThis is service titleThis is service titleThis is service title<br></p>', '<p>This is service titleThis is service titleThis is service titleThis is service titleThis is service titleThis is service titleThis is service titleThis is service title<br></p>', 'This is service titleThis is service titleThis is service titleThis is service titleThis is service titleThis is service titleThis is service titleThis is service title', '2', '1', '1', 100.20, 111.00, 111.00, '12', '12', '111', '111', '111', '[\"5\"]', '[\"14\"]', '[\"5\"]', '[\"5\"]', '[\"7\"]', '[\"7\"]', 'abasvumi/uploads/images/services/service_1612361391454649988.png', 'https://abasvumidynamic.swadhinbarta.com/admin', '01829600496', NULL, NULL, '1', NULL, 0, '2021-02-03 06:54:11', '2021-02-03 08:09:51'),
(10, 7, NULL, NULL, NULL, 1, 6, 59, 4, 6, 'This is service title one', 'This is service title one', '<p>This is service title oneThis is service title oneThis is service title oneThis is service title one<br></p>', '<p>This is service title oneThis is service title oneThis is service title oneThis is service title one<br></p>', 'West Kazipara, krishibid Rd, house No : 295 , Police Station : Mirpur , Dhaka', '2', '1', '1', 111.00, 111.00, 111.00, '12', '12', '111', '111', '111', '[\"5\"]', '[\"14\"]', '[\"6\"]', '[\"5\"]', '[\"7\"]', '[\"7\"]', 'abasvumi/uploads/images/services/service_16123585041233124121.png', 'https://abasvumidynamic.swadhinbarta.com/admin', '01829600496', NULL, NULL, '1', 'bidhanvk@gmail.com', 0, '2021-02-03 07:21:44', '2021-02-03 07:21:44'),
(11, 7, NULL, NULL, NULL, 1, 6, 59, 3, 6, 'This is service title one', 'This is service title', '<p>This is service title oneThis is service title oneThis is service title oneThis is service title one<br></p>', '<p>This is service title oneThis is service title oneThis is service title oneThis is service title one<br></p>', 'Gupti , gupti bazar , faridganj, chandpur.', '1', '1', '1', 100.20, 100.20, 111.00, '12', '12', '111', '111', '111', '[\"4\"]', '[\"13\"]', '[\"5\"]', '[\"4\"]', '[\"6\"]', '[\"6\"]', 'abasvumi/uploads/images/services/service_1612358647501217622.jpg', 'asdf', '01829600496', NULL, NULL, '2', 'bidhanvk@gmail.com', 0, '2021-02-03 07:24:07', '2021-02-03 07:24:07'),
(12, 7, NULL, NULL, NULL, 1, 5, 59, 4, 6, 'This is agent title', 'This is agent bangla title', 'This is agent description', 'This is agent bangla description', 'This is address', '3', '1', '1', 100.10, 15.50, 12.00, '100.1', '100.100', '5', '5', '5', 'null', 'null', 'null', 'null', 'null', 'null', NULL, 'https://www.youtube.com/watch?v=74_2yKr7Ll8&ab_channel=MathisGame', NULL, NULL, NULL, '1', 'agent@gmail.com', 0, '2021-02-03 09:42:18', '2021-02-03 09:42:18'),
(13, 7, NULL, 1, NULL, 1, 5, 59, 4, 6, '\"This is agent title\"', '\"This is agent bangla title\"', '\"This is description\"', '\"This is bangla description\"', '\"This is addres\"', '3', '1', '1', 100.10, 100.10, 12.00, '1254', '3214', '5', '5', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '\"https://www.youtube.com/watch?v=74_2yKr7Ll8&ab_channel=MathisGame\",', NULL, NULL, NULL, '1', 'agent@gmail.com', 0, '2021-02-03 10:34:20', '2021-02-03 10:34:20'),
(14, 7, NULL, 1, NULL, 1, 5, 59, 4, 6, '\"This is agent title\"', '\"This is agent bangla title\"', '\"This is description\"', '\"This is bangla description\"', '\"This is addres\"', '3', '1', '1', 100.10, 100.10, 12.00, '1254', '3214', '5', '5', '5', '[\"5\",\"4\"]', '[\"13\",\"14\"]', '[\"5\"]', '[\"4\"]', '[\"6\",\"7\"]', '[\"6\",\"7\"]', NULL, '\"https://www.youtube.com/watch?v=74_2yKr7Ll8&ab_channel=MathisGame\",', NULL, '01829600496', NULL, '1', 'agent@gmail.com', 0, '2021-02-03 10:47:20', '2021-02-03 10:47:20'),
(15, 7, NULL, 1, NULL, 1, 5, 59, 4, 6, '\"This is agent title\"', '\"This is agent bangla title\"', '\"This is description\"', '\"This is bangla description\"', '\"This is addres\"', '3', '1', '1', 100.10, 100.10, 12.00, '1254', '3214', '5', '5', '5', '[\"5\",\"4\"]', '[\"13\",\"14\"]', '[\"5\"]', '[\"4\"]', '[\"6\",\"7\"]', '[\"6\",\"7\"]', NULL, '\"https://www.youtube.com/watch?v=74_2yKr7Ll8&ab_channel=MathisGame\",', NULL, '01829600496', NULL, '1', 'agent@gmail.com', 0, '2021-02-03 10:51:37', '2021-02-03 10:51:37'),
(16, 7, NULL, 1, NULL, 1, 5, 59, 4, 6, '\"This is agent title\"', '\"This is agent bangla title\"', '\"This is description\"', '\"This is bangla description\"', '\"This is addres\"', '3', '1', '1', 100.10, 100.10, 12.00, '1254', '3214', '5', '5', '5', '[\"5\",\"4\"]', '[\"13\",\"14\"]', '[\"5\"]', '[\"4\"]', '[\"6\",\"7\"]', '[\"6\",\"7\"]', 'abasvumi/uploads/images/services/service_16123712672134705541.png', '\"https://www.youtube.com/watch?v=74_2yKr7Ll8&ab_channel=MathisGame\",', NULL, '01829600496', NULL, '1', 'agent@gmail.com', 0, '2021-02-03 10:54:27', '2021-02-03 10:54:27'),
(17, 7, NULL, 1, NULL, 1, 5, 59, 4, 6, '\"This is agent title update\"', '\"This is agent bangla title update\"', '\"This is description update\"', '\"This is bangla description update\"', '\"This is addres update\"', '3', '1', '1', 100.10, 100.10, 12.00, '100.1000', '100.1000', '5', '6', '6', '[\"6\",\"4\"]', '[\"13\",\"14\"]', '[\"5\"]', '[\"4\"]', '[\"6\",\"7\"]', '[\"6\",\"7\"]', 'abasvumi/uploads/images/services/service_1612377211704233049.png', '\"https://www.imbidhan.me', NULL, '01632697963', NULL, '1', 'agent1@gmail.com', 0, '2021-02-03 10:57:39', '2021-02-03 23:33:31'),
(18, 7, NULL, NULL, NULL, 1, 5, 59, 4, 6, '\"This is agent title\"', '\"This is agent bangla title\"', '\"This is description\"', '\"This is bangla description\"', '\"This is addres\"', '3', '1', '0', 100.10, 100.10, 12.00, '1254', '3214', '5', '5', '5', '[\"5\",\"4\"]', '[\"13\",\"14\"]', '[\"5\"]', '[\"4\"]', '[\"6\",\"7\"]', '[\"6\",\"7\"]', 'abasvumi/uploads/images/services/service_1612375702121472551.png', '\"https://www.youtube.com/watch?v=74_2yKr7Ll8&ab_channel=MathisGame\",', NULL, '01829600496', NULL, '1', 'developer@gmail.com', 0, '2021-02-03 12:08:22', '2021-02-03 12:08:22'),
(19, 7, NULL, NULL, NULL, 1, 5, 59, 4, 6, '\"This is agent title\"', '\"This is agent bangla title\"', '\"This is description\"', '\"This is bangla description\"', '\"This is addres\"', '3', '1', '0', 100.10, 100.10, 12.00, '1254', '3214', '5', '5', '5', '[\"5\",\"4\"]', '[\"13\",\"14\"]', '[\"5\"]', '[\"4\"]', '[\"6\",\"7\"]', '[\"6\",\"7\"]', 'abasvumi/uploads/images/services/service_16123757561703395502.png', '\"https://www.youtube.com/watch?v=74_2yKr7Ll8&ab_channel=MathisGame\",', NULL, NULL, NULL, '1', 'developer@gmail.com', 0, '2021-02-03 12:09:16', '2021-02-03 12:09:16'),
(20, 7, NULL, NULL, NULL, 1, 5, 59, 4, 6, '\"This is agent title\"', '\"This is agent bangla title\"', '\"This is description\"', '\"This is bangla description\"', '\"This is addres\"', '3', '1', '0', 100.10, 100.10, 12.00, '1254', '3214', '5', '5', '5', '[\"5\",\"4\"]', '[\"13\",\"14\"]', '[\"5\"]', '[\"4\"]', '[\"6\",\"7\"]', '[\"6\",\"7\"]', 'abasvumi/uploads/images/services/service_16123758461627716899.png', '\"https://www.youtube.com/watch?v=74_2yKr7Ll8&ab_channel=MathisGame\",', NULL, NULL, NULL, '1', 'developer@gmail.com', 0, '2021-02-03 12:10:46', '2021-02-03 12:10:46'),
(21, 7, NULL, NULL, NULL, 1, 5, 59, 4, 6, '\"This is agent title\"', '\"This is agent bangla title\"', '\"This is description\"', '\"This is bangla description\"', '\"This is addres\"', '3', '1', '0', 100.10, 100.10, 12.00, '1254', '3214', '5', '5', '5', '[\"5\",\"4\"]', '[\"13\",\"14\"]', '[\"5\"]', '[\"4\"]', '[\"6\",\"7\"]', '[\"6\",\"7\"]', 'abasvumi/uploads/images/services/service_1612375965885744188.png', '\"https://www.youtube.com/watch?v=74_2yKr7Ll8&ab_channel=MathisGame\",', NULL, NULL, NULL, '1', 'developer@gmail.com', 0, '2021-02-03 12:12:45', '2021-02-03 12:12:45'),
(22, 7, NULL, NULL, NULL, 1, 5, 59, 4, 6, '\"This is agent title\"', '\"This is agent bangla title\"', '\"This is description\"', '\"This is bangla description\"', '\"This is addres\"', '3', '1', '0', 100.10, 100.10, 12.00, '1254', '3214', '5', '5', '5', '[\"5\",\"4\"]', '[\"13\",\"14\"]', '[\"5\"]', '[\"4\"]', '[\"6\",\"7\"]', '[\"6\",\"7\"]', 'abasvumi/uploads/images/services/service_1612376011859352356.png', '\"https://www.youtube.com/watch?v=74_2yKr7Ll8&ab_channel=MathisGame\",', NULL, NULL, NULL, '1', 'developer@gmail.com', 0, '2021-02-03 12:13:31', '2021-02-03 12:13:31'),
(23, 7, NULL, NULL, 4, 1, 5, 59, 4, 6, '\"This is agent title update\"', '\"This is agent bangla title update\"', '\"This is description update\"', '\"This is bangla description update\"', '\"This is addres update\"', '3', '1', '1', 100.10, 100.10, 12.00, '100.1000', '100.1000', '5', '6', '6', '[\"6\",\"4\"]', '[\"13\",\"14\"]', '[\"5\"]', '[\"4\"]', '[\"6\",\"7\"]', '[\"6\",\"7\"]', 'abasvumi/uploads/images/services/service_16123761911492090210.png', '\"https://www.imbidhan.me', NULL, NULL, NULL, '1', 'agent1@gmail.com', 0, '2021-02-03 12:14:43', '2021-02-03 12:16:31');

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

CREATE TABLE `service_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_types`
--

INSERT INTO `service_types` (`id`, `name`, `bn_name`, `created_at`, `updated_at`) VALUES
(6, 'service type one', 'service type one', '2021-01-17 12:04:35', '2021-01-17 12:04:35'),
(7, 'service type two', 'service type two', '2021-01-17 12:04:51', '2021-01-17 12:04:51');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experiance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `email`, `phone`, `address`, `experiance`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Apoun khan', 'apounmix@gmail.com', '01829600496', 'Agargoan,dhaka', '1 year experience', '2', '2021-01-23 07:58:33', '2021-01-23 08:09:25');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thanas`
--

CREATE TABLE `thanas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `thanas`
--

INSERT INTO `thanas` (`id`, `district_id`, `name`, `bn_name`, `url`, `created_at`, `updated_at`) VALUES
(1, 1, 'Debidwar', 'দেবিদ্বার', 'debidwar.comilla.gov.bd', NULL, NULL),
(2, 1, 'Barura', 'বরুড়া', 'barura.comilla.gov.bd', NULL, NULL),
(3, 1, 'Brahmanpara', 'ব্রাহ্মণপাড়া', 'brahmanpara.comilla.gov.bd', NULL, NULL),
(4, 1, 'Chandina', 'চান্দিনা', 'chandina.comilla.gov.bd', NULL, NULL),
(5, 1, 'Chauddagram', 'চৌদ্দগ্রাম', 'chauddagram.comilla.gov.bd', NULL, NULL),
(6, 1, 'Daudkandi', 'দাউদকান্দি', 'daudkandi.comilla.gov.bd', NULL, NULL),
(7, 1, 'Homna', 'হোমনা', 'homna.comilla.gov.bd', NULL, NULL),
(8, 1, 'Laksam', 'লাকসাম', 'laksam.comilla.gov.bd', NULL, NULL),
(9, 1, 'Muradnagar', 'মুরাদনগর', 'muradnagar.comilla.gov.bd', NULL, NULL),
(10, 1, 'Nangalkot', 'নাঙ্গলকোট', 'nangalkot.comilla.gov.bd', NULL, NULL),
(11, 1, 'Comilla Sadar', 'কুমিল্লা সদর', 'comillasadar.comilla.gov.bd', NULL, NULL),
(12, 1, 'Meghna', 'মেঘনা', 'meghna.comilla.gov.bd', NULL, NULL),
(13, 1, 'Monohargonj', 'মনোহরগঞ্জ', 'monohargonj.comilla.gov.bd', NULL, NULL),
(14, 1, 'Sadarsouth', 'সদর দক্ষিণ', 'sadarsouth.comilla.gov.bd', NULL, NULL),
(15, 1, 'Titas', 'তিতাস', 'titas.comilla.gov.bd', NULL, NULL),
(16, 1, 'Burichang', 'বুড়িচং', 'burichang.comilla.gov.bd', NULL, NULL),
(17, 1, 'Lalmai', 'লালমাই', 'lalmai.comilla.gov.bd', NULL, NULL),
(18, 2, 'Chhagalnaiya', 'ছাগলনাইয়া', 'chhagalnaiya.feni.gov.bd', NULL, NULL),
(19, 2, 'Feni Sadar', 'ফেনী সদর', 'sadar.feni.gov.bd', NULL, NULL),
(20, 2, 'Sonagazi', 'সোনাগাজী', 'sonagazi.feni.gov.bd', NULL, NULL),
(21, 2, 'Fulgazi', 'ফুলগাজী', 'fulgazi.feni.gov.bd', NULL, NULL),
(22, 2, 'Parshuram', 'পরশুরাম', 'parshuram.feni.gov.bd', NULL, NULL),
(23, 2, 'Daganbhuiyan', 'দাগনভূঞা', 'daganbhuiyan.feni.gov.bd', NULL, NULL),
(24, 3, 'Brahmanbaria Sadar', 'ব্রাহ্মণবাড়িয়া সদর', 'sadar.brahmanbaria.gov.bd', NULL, NULL),
(25, 3, 'Kasba', 'কসবা', 'kasba.brahmanbaria.gov.bd', NULL, NULL),
(26, 3, 'Nasirnagar', 'নাসিরনগর', 'nasirnagar.brahmanbaria.gov.bd', NULL, NULL),
(27, 3, 'Sarail', 'সরাইল', 'sarail.brahmanbaria.gov.bd', NULL, NULL),
(28, 3, 'Ashuganj', 'আশুগঞ্জ', 'ashuganj.brahmanbaria.gov.bd', NULL, NULL),
(29, 3, 'Akhaura', 'আখাউড়া', 'akhaura.brahmanbaria.gov.bd', NULL, NULL),
(30, 3, 'Nabinagar', 'নবীনগর', 'nabinagar.brahmanbaria.gov.bd', NULL, NULL),
(31, 3, 'Bancharampur', 'বাঞ্ছারামপুর', 'bancharampur.brahmanbaria.gov.bd', NULL, NULL),
(32, 3, 'Bijoynagar', 'বিজয়নগর', 'bijoynagar.brahmanbaria.gov.bd    ', NULL, NULL),
(33, 4, 'Rangamati Sadar', 'রাঙ্গামাটি সদর', 'sadar.rangamati.gov.bd', NULL, NULL),
(34, 4, 'Kaptai', 'কাপ্তাই', 'kaptai.rangamati.gov.bd', NULL, NULL),
(35, 4, 'Kawkhali', 'কাউখালী', 'kawkhali.rangamati.gov.bd', NULL, NULL),
(36, 4, 'Baghaichari', 'বাঘাইছড়ি', 'baghaichari.rangamati.gov.bd', NULL, NULL),
(37, 4, 'Barkal', 'বরকল', 'barkal.rangamati.gov.bd', NULL, NULL),
(38, 4, 'Langadu', 'লংগদু', 'langadu.rangamati.gov.bd', NULL, NULL),
(39, 4, 'Rajasthali', 'রাজস্থলী', 'rajasthali.rangamati.gov.bd', NULL, NULL),
(40, 4, 'Belaichari', 'বিলাইছড়ি', 'belaichari.rangamati.gov.bd', NULL, NULL),
(41, 4, 'Juraichari', 'জুরাছড়ি', 'juraichari.rangamati.gov.bd', NULL, NULL),
(42, 4, 'Naniarchar', 'নানিয়ারচর', 'naniarchar.rangamati.gov.bd', NULL, NULL),
(43, 5, 'Noakhali Sadar', 'নোয়াখালী সদর', 'sadar.noakhali.gov.bd', NULL, NULL),
(44, 5, 'Companiganj', 'কোম্পানীগঞ্জ', 'companiganj.noakhali.gov.bd', NULL, NULL),
(45, 5, 'Begumganj', 'বেগমগঞ্জ', 'begumganj.noakhali.gov.bd', NULL, NULL),
(46, 5, 'Hatia', 'হাতিয়া', 'hatia.noakhali.gov.bd', NULL, NULL),
(47, 5, 'Subarnachar', 'সুবর্ণচর', 'subarnachar.noakhali.gov.bd', NULL, NULL),
(48, 5, 'Kabirhat', 'কবিরহাট', 'kabirhat.noakhali.gov.bd', NULL, NULL),
(49, 5, 'Senbug', 'সেনবাগ', 'senbug.noakhali.gov.bd', NULL, NULL),
(50, 5, 'Chatkhil', 'চাটখিল', 'chatkhil.noakhali.gov.bd', NULL, NULL),
(51, 5, 'Sonaimori', 'সোনাইমুড়ী', 'sonaimori.noakhali.gov.bd', NULL, NULL),
(52, 6, 'Haimchar', 'হাইমচর', 'haimchar.chandpur.gov.bd', NULL, NULL),
(53, 6, 'Kachua', 'কচুয়া', 'kachua.chandpur.gov.bd', NULL, NULL),
(54, 6, 'Shahrasti', 'শাহরাস্তি	', 'shahrasti.chandpur.gov.bd', NULL, NULL),
(55, 6, 'Chandpur Sadar', 'চাঁদপুর সদর', 'sadar.chandpur.gov.bd', NULL, NULL),
(56, 6, 'Matlab South', 'মতলব দক্ষিণ', 'matlabsouth.chandpur.gov.bd', NULL, NULL),
(57, 6, 'Hajiganj', 'হাজীগঞ্জ', 'hajiganj.chandpur.gov.bd', NULL, NULL),
(58, 6, 'Matlab North', 'মতলব উত্তর', 'matlabnorth.chandpur.gov.bd', NULL, NULL),
(59, 6, 'Faridgonj', 'ফরিদগঞ্জ', 'faridgonj.chandpur.gov.bd', NULL, NULL),
(60, 7, 'Lakshmipur Sadar', 'লক্ষ্মীপুর সদর', 'sadar.lakshmipur.gov.bd', NULL, NULL),
(61, 7, 'Kamalnagar', 'কমলনগর', 'kamalnagar.lakshmipur.gov.bd', NULL, NULL),
(62, 7, 'Raipur', 'রায়পুর', 'raipur.lakshmipur.gov.bd', NULL, NULL),
(63, 7, 'Ramgati', 'রামগতি', 'ramgati.lakshmipur.gov.bd', NULL, NULL),
(64, 7, 'Ramganj', 'রামগঞ্জ', 'ramganj.lakshmipur.gov.bd', NULL, NULL),
(65, 8, 'Rangunia', 'রাঙ্গুনিয়া', 'rangunia.chittagong.gov.bd', NULL, NULL),
(66, 8, 'Sitakunda', 'সীতাকুন্ড', 'sitakunda.chittagong.gov.bd', NULL, NULL),
(67, 8, 'Mirsharai', 'মীরসরাই', 'mirsharai.chittagong.gov.bd', NULL, NULL),
(68, 8, 'Patiya', 'পটিয়া', 'patiya.chittagong.gov.bd', NULL, NULL),
(69, 8, 'Sandwip', 'সন্দ্বীপ', 'sandwip.chittagong.gov.bd', NULL, NULL),
(70, 8, 'Banshkhali', 'বাঁশখালী', 'banshkhali.chittagong.gov.bd', NULL, NULL),
(71, 8, 'Boalkhali', 'বোয়ালখালী', 'boalkhali.chittagong.gov.bd', NULL, NULL),
(72, 8, 'Anwara', 'আনোয়ারা', 'anwara.chittagong.gov.bd', NULL, NULL),
(73, 8, 'Chandanaish', 'চন্দনাইশ', 'chandanaish.chittagong.gov.bd', NULL, NULL),
(74, 8, 'Satkania', 'সাতকানিয়া', 'satkania.chittagong.gov.bd', NULL, NULL),
(75, 8, 'Lohagara', 'লোহাগাড়া', 'lohagara.chittagong.gov.bd', NULL, NULL),
(76, 8, 'Hathazari', 'হাটহাজারী', 'hathazari.chittagong.gov.bd', NULL, NULL),
(77, 8, 'Fatikchhari', 'ফটিকছড়ি', 'fatikchhari.chittagong.gov.bd', NULL, NULL),
(78, 8, 'Raozan', 'রাউজান', 'raozan.chittagong.gov.bd', NULL, NULL),
(79, 8, 'Karnafuli', 'কর্ণফুলী', 'karnafuli.chittagong.gov.bd', NULL, NULL),
(80, 9, 'Coxsbazar Sadar', 'কক্সবাজার সদর', 'sadar.coxsbazar.gov.bd', NULL, NULL),
(81, 9, 'Chakaria', 'চকরিয়া', 'chakaria.coxsbazar.gov.bd', NULL, NULL),
(82, 9, 'Kutubdia', 'কুতুবদিয়া', 'kutubdia.coxsbazar.gov.bd', NULL, NULL),
(83, 9, 'Ukhiya', 'উখিয়া', 'ukhiya.coxsbazar.gov.bd', NULL, NULL),
(84, 9, 'Moheshkhali', 'মহেশখালী', 'moheshkhali.coxsbazar.gov.bd', NULL, NULL),
(85, 9, 'Pekua', 'পেকুয়া', 'pekua.coxsbazar.gov.bd', NULL, NULL),
(86, 9, 'Ramu', 'রামু', 'ramu.coxsbazar.gov.bd', NULL, NULL),
(87, 9, 'Teknaf', 'টেকনাফ', 'teknaf.coxsbazar.gov.bd', NULL, NULL),
(88, 10, 'Khagrachhari Sadar', 'খাগড়াছড়ি সদর', 'sadar.khagrachhari.gov.bd', NULL, NULL),
(89, 10, 'Dighinala', 'দিঘীনালা', 'dighinala.khagrachhari.gov.bd', NULL, NULL),
(90, 10, 'Panchari', 'পানছড়ি', 'panchari.khagrachhari.gov.bd', NULL, NULL),
(91, 10, 'Laxmichhari', 'লক্ষীছড়ি', 'laxmichhari.khagrachhari.gov.bd', NULL, NULL),
(92, 10, 'Mohalchari', 'মহালছড়ি', 'mohalchari.khagrachhari.gov.bd', NULL, NULL),
(93, 10, 'Manikchari', 'মানিকছড়ি', 'manikchari.khagrachhari.gov.bd', NULL, NULL),
(94, 10, 'Ramgarh', 'রামগড়', 'ramgarh.khagrachhari.gov.bd', NULL, NULL),
(95, 10, 'Matiranga', 'মাটিরাঙ্গা', 'matiranga.khagrachhari.gov.bd', NULL, NULL),
(96, 10, 'Guimara', 'গুইমারা', 'guimara.khagrachhari.gov.bd', NULL, NULL),
(97, 11, 'Bandarban Sadar', 'বান্দরবান সদর', 'sadar.bandarban.gov.bd', NULL, NULL),
(98, 11, 'Alikadam', 'আলীকদম', 'alikadam.bandarban.gov.bd', NULL, NULL),
(99, 11, 'Naikhongchhari', 'নাইক্ষ্যংছড়ি', 'naikhongchhari.bandarban.gov.bd', NULL, NULL),
(100, 11, 'Rowangchhari', 'রোয়াংছড়ি', 'rowangchhari.bandarban.gov.bd', NULL, NULL),
(101, 11, 'Lama', 'লামা', 'lama.bandarban.gov.bd', NULL, NULL),
(102, 11, 'Ruma', 'রুমা', 'ruma.bandarban.gov.bd', NULL, NULL),
(103, 11, 'Thanchi', 'থানচি', 'thanchi.bandarban.gov.bd', NULL, NULL),
(104, 12, 'Belkuchi', 'বেলকুচি', 'belkuchi.sirajganj.gov.bd', NULL, NULL),
(105, 12, 'Chauhali', 'চৌহালি', 'chauhali.sirajganj.gov.bd', NULL, NULL),
(106, 12, 'Kamarkhand', 'কামারখন্দ', 'kamarkhand.sirajganj.gov.bd', NULL, NULL),
(107, 12, 'Kazipur', 'কাজীপুর', 'kazipur.sirajganj.gov.bd', NULL, NULL),
(108, 12, 'Raigonj', 'রায়গঞ্জ', 'raigonj.sirajganj.gov.bd', NULL, NULL),
(109, 12, 'Shahjadpur', 'শাহজাদপুর', 'shahjadpur.sirajganj.gov.bd', NULL, NULL),
(110, 12, 'Sirajganj Sadar', 'সিরাজগঞ্জ সদর', 'sirajganjsadar.sirajganj.gov.bd', NULL, NULL),
(111, 12, 'Tarash', 'তাড়াশ', 'tarash.sirajganj.gov.bd', NULL, NULL),
(112, 12, 'Ullapara', 'উল্লাপাড়া', 'ullapara.sirajganj.gov.bd', NULL, NULL),
(113, 13, 'Sujanagar', 'সুজানগর', 'sujanagar.pabna.gov.bd', NULL, NULL),
(114, 13, 'Ishurdi', 'ঈশ্বরদী', 'ishurdi.pabna.gov.bd', NULL, NULL),
(115, 13, 'Bhangura', 'ভাঙ্গুড়া', 'bhangura.pabna.gov.bd', NULL, NULL),
(116, 13, 'Pabna Sadar', 'পাবনা সদর', 'pabnasadar.pabna.gov.bd', NULL, NULL),
(117, 13, 'Bera', 'বেড়া', 'bera.pabna.gov.bd', NULL, NULL),
(118, 13, 'Atghoria', 'আটঘরিয়া', 'atghoria.pabna.gov.bd', NULL, NULL),
(119, 13, 'Chatmohar', 'চাটমোহর', 'chatmohar.pabna.gov.bd', NULL, NULL),
(120, 13, 'Santhia', 'সাঁথিয়া', 'santhia.pabna.gov.bd', NULL, NULL),
(121, 13, 'Faridpur', 'ফরিদপুর', 'faridpur.pabna.gov.bd', NULL, NULL),
(122, 14, 'Kahaloo', 'কাহালু', 'kahaloo.bogra.gov.bd', NULL, NULL),
(123, 14, 'Bogra Sadar', 'বগুড়া সদর', 'sadar.bogra.gov.bd', NULL, NULL),
(124, 14, 'Shariakandi', 'সারিয়াকান্দি', 'shariakandi.bogra.gov.bd', NULL, NULL),
(125, 14, 'Shajahanpur', 'শাজাহানপুর', 'shajahanpur.bogra.gov.bd', NULL, NULL),
(126, 14, 'Dupchanchia', 'দুপচাচিঁয়া', 'dupchanchia.bogra.gov.bd', NULL, NULL),
(127, 14, 'Adamdighi', 'আদমদিঘি', 'adamdighi.bogra.gov.bd', NULL, NULL),
(128, 14, 'Nondigram', 'নন্দিগ্রাম', 'nondigram.bogra.gov.bd', NULL, NULL),
(129, 14, 'Sonatala', 'সোনাতলা', 'sonatala.bogra.gov.bd', NULL, NULL),
(130, 14, 'Dhunot', 'ধুনট', 'dhunot.bogra.gov.bd', NULL, NULL),
(131, 14, 'Gabtali', 'গাবতলী', 'gabtali.bogra.gov.bd', NULL, NULL),
(132, 14, 'Sherpur', 'শেরপুর', 'sherpur.bogra.gov.bd', NULL, NULL),
(133, 14, 'Shibganj', 'শিবগঞ্জ', 'shibganj.bogra.gov.bd', NULL, NULL),
(134, 15, 'Paba', 'পবা', 'paba.rajshahi.gov.bd', NULL, NULL),
(135, 15, 'Durgapur', 'দুর্গাপুর', 'durgapur.rajshahi.gov.bd', NULL, NULL),
(136, 15, 'Mohonpur', 'মোহনপুর', 'mohonpur.rajshahi.gov.bd', NULL, NULL),
(137, 15, 'Charghat', 'চারঘাট', 'charghat.rajshahi.gov.bd', NULL, NULL),
(138, 15, 'Puthia', 'পুঠিয়া', 'puthia.rajshahi.gov.bd', NULL, NULL),
(139, 15, 'Bagha', 'বাঘা', 'bagha.rajshahi.gov.bd', NULL, NULL),
(140, 15, 'Godagari', 'গোদাগাড়ী', 'godagari.rajshahi.gov.bd', NULL, NULL),
(141, 15, 'Tanore', 'তানোর', 'tanore.rajshahi.gov.bd', NULL, NULL),
(142, 15, 'Bagmara', 'বাগমারা', 'bagmara.rajshahi.gov.bd', NULL, NULL),
(143, 16, 'Natore Sadar', 'নাটোর সদর', 'natoresadar.natore.gov.bd', NULL, NULL),
(144, 16, 'Singra', 'সিংড়া', 'singra.natore.gov.bd', NULL, NULL),
(145, 16, 'Baraigram', 'বড়াইগ্রাম', 'baraigram.natore.gov.bd', NULL, NULL),
(146, 16, 'Bagatipara', 'বাগাতিপাড়া', 'bagatipara.natore.gov.bd', NULL, NULL),
(147, 16, 'Lalpur', 'লালপুর', 'lalpur.natore.gov.bd', NULL, NULL),
(148, 16, 'Gurudaspur', 'গুরুদাসপুর', 'gurudaspur.natore.gov.bd', NULL, NULL),
(149, 16, 'Naldanga', 'নলডাঙ্গা', 'naldanga.natore.gov.bd', NULL, NULL),
(150, 17, 'Akkelpur', 'আক্কেলপুর', 'akkelpur.joypurhat.gov.bd', NULL, NULL),
(151, 17, 'Kalai', 'কালাই', 'kalai.joypurhat.gov.bd', NULL, NULL),
(152, 17, 'Khetlal', 'ক্ষেতলাল', 'khetlal.joypurhat.gov.bd', NULL, NULL),
(153, 17, 'Panchbibi', 'পাঁচবিবি', 'panchbibi.joypurhat.gov.bd', NULL, NULL),
(154, 17, 'Joypurhat Sadar', 'জয়পুরহাট সদর', 'joypurhatsadar.joypurhat.gov.bd', NULL, NULL),
(155, 18, 'Chapainawabganj Sadar', 'চাঁপাইনবাবগঞ্জ সদর', 'chapainawabganjsadar.chapainawabganj.gov.bd', NULL, NULL),
(156, 18, 'Gomostapur', 'গোমস্তাপুর', 'gomostapur.chapainawabganj.gov.bd', NULL, NULL),
(157, 18, 'Nachol', 'নাচোল', 'nachol.chapainawabganj.gov.bd', NULL, NULL),
(158, 18, 'Bholahat', 'ভোলাহাট', 'bholahat.chapainawabganj.gov.bd', NULL, NULL),
(159, 18, 'Shibganj', 'শিবগঞ্জ', 'shibganj.chapainawabganj.gov.bd', NULL, NULL),
(160, 19, 'Mohadevpur', 'মহাদেবপুর', 'mohadevpur.naogaon.gov.bd', NULL, NULL),
(161, 19, 'Badalgachi', 'বদলগাছী', 'badalgachi.naogaon.gov.bd', NULL, NULL),
(162, 19, 'Patnitala', 'পত্নিতলা', 'patnitala.naogaon.gov.bd', NULL, NULL),
(163, 19, 'Dhamoirhat', 'ধামইরহাট', 'dhamoirhat.naogaon.gov.bd', NULL, NULL),
(164, 19, 'Niamatpur', 'নিয়ামতপুর', 'niamatpur.naogaon.gov.bd', NULL, NULL),
(165, 19, 'Manda', 'মান্দা', 'manda.naogaon.gov.bd', NULL, NULL),
(166, 19, 'Atrai', 'আত্রাই', 'atrai.naogaon.gov.bd', NULL, NULL),
(167, 19, 'Raninagar', 'রাণীনগর', 'raninagar.naogaon.gov.bd', NULL, NULL),
(168, 19, 'Naogaon Sadar', 'নওগাঁ সদর', 'naogaonsadar.naogaon.gov.bd', NULL, NULL),
(169, 19, 'Porsha', 'পোরশা', 'porsha.naogaon.gov.bd', NULL, NULL),
(170, 19, 'Sapahar', 'সাপাহার', 'sapahar.naogaon.gov.bd', NULL, NULL),
(171, 20, 'Manirampur', 'মণিরামপুর', 'manirampur.jessore.gov.bd', NULL, NULL),
(172, 20, 'Abhaynagar', 'অভয়নগর', 'abhaynagar.jessore.gov.bd', NULL, NULL),
(173, 20, 'Bagherpara', 'বাঘারপাড়া', 'bagherpara.jessore.gov.bd', NULL, NULL),
(174, 20, 'Chougachha', 'চৌগাছা', 'chougachha.jessore.gov.bd', NULL, NULL),
(175, 20, 'Jhikargacha', 'ঝিকরগাছা', 'jhikargacha.jessore.gov.bd', NULL, NULL),
(176, 20, 'Keshabpur', 'কেশবপুর', 'keshabpur.jessore.gov.bd', NULL, NULL),
(177, 20, 'Jessore Sadar', 'যশোর সদর', 'sadar.jessore.gov.bd', NULL, NULL),
(178, 20, 'Sharsha', 'শার্শা', 'sharsha.jessore.gov.bd', NULL, NULL),
(179, 21, 'Assasuni', 'আশাশুনি', 'assasuni.satkhira.gov.bd', NULL, NULL),
(180, 21, 'Debhata', 'দেবহাটা', 'debhata.satkhira.gov.bd', NULL, NULL),
(181, 21, 'Kalaroa', 'কলারোয়া', 'kalaroa.satkhira.gov.bd', NULL, NULL),
(182, 21, 'Satkhira Sadar', 'সাতক্ষীরা সদর', 'satkhirasadar.satkhira.gov.bd', NULL, NULL),
(183, 21, 'Shyamnagar', 'শ্যামনগর', 'shyamnagar.satkhira.gov.bd', NULL, NULL),
(184, 21, 'Tala', 'তালা', 'tala.satkhira.gov.bd', NULL, NULL),
(185, 21, 'Kaliganj', 'কালিগঞ্জ', 'kaliganj.satkhira.gov.bd', NULL, NULL),
(186, 22, 'Mujibnagar', 'মুজিবনগর', 'mujibnagar.meherpur.gov.bd', NULL, NULL),
(187, 22, 'Meherpur Sadar', 'মেহেরপুর সদর', 'meherpursadar.meherpur.gov.bd', NULL, NULL),
(188, 22, 'Gangni', 'গাংনী', 'gangni.meherpur.gov.bd', NULL, NULL),
(189, 23, 'Narail Sadar', 'নড়াইল সদর', 'narailsadar.narail.gov.bd', NULL, NULL),
(190, 23, 'Lohagara', 'লোহাগড়া', 'lohagara.narail.gov.bd', NULL, NULL),
(191, 23, 'Kalia', 'কালিয়া', 'kalia.narail.gov.bd', NULL, NULL),
(192, 24, 'Chuadanga Sadar', 'চুয়াডাঙ্গা সদর', 'chuadangasadar.chuadanga.gov.bd', NULL, NULL),
(193, 24, 'Alamdanga', 'আলমডাঙ্গা', 'alamdanga.chuadanga.gov.bd', NULL, NULL),
(194, 24, 'Damurhuda', 'দামুড়হুদা', 'damurhuda.chuadanga.gov.bd', NULL, NULL),
(195, 24, 'Jibannagar', 'জীবননগর', 'jibannagar.chuadanga.gov.bd', NULL, NULL),
(196, 25, 'Kushtia Sadar', 'কুষ্টিয়া সদর', 'kushtiasadar.kushtia.gov.bd', NULL, NULL),
(197, 25, 'Kumarkhali', 'কুমারখালী', 'kumarkhali.kushtia.gov.bd', NULL, NULL),
(198, 25, 'Khoksa', 'খোকসা', 'khoksa.kushtia.gov.bd', NULL, NULL),
(199, 25, 'Mirpur', 'মিরপুর', 'mirpurkushtia.kushtia.gov.bd', NULL, NULL),
(200, 25, 'Daulatpur', 'দৌলতপুর', 'daulatpur.kushtia.gov.bd', NULL, NULL),
(201, 25, 'Bheramara', 'ভেড়ামারা', 'bheramara.kushtia.gov.bd', NULL, NULL),
(202, 26, 'Shalikha', 'শালিখা', 'shalikha.magura.gov.bd', NULL, NULL),
(203, 26, 'Sreepur', 'শ্রীপুর', 'sreepur.magura.gov.bd', NULL, NULL),
(204, 26, 'Magura Sadar', 'মাগুরা সদর', 'magurasadar.magura.gov.bd', NULL, NULL),
(205, 26, 'Mohammadpur', 'মহম্মদপুর', 'mohammadpur.magura.gov.bd', NULL, NULL),
(206, 27, 'Paikgasa', 'পাইকগাছা', 'paikgasa.khulna.gov.bd', NULL, NULL),
(207, 27, 'Fultola', 'ফুলতলা', 'fultola.khulna.gov.bd', NULL, NULL),
(208, 27, 'Digholia', 'দিঘলিয়া', 'digholia.khulna.gov.bd', NULL, NULL),
(209, 27, 'Rupsha', 'রূপসা', 'rupsha.khulna.gov.bd', NULL, NULL),
(210, 27, 'Terokhada', 'তেরখাদা', 'terokhada.khulna.gov.bd', NULL, NULL),
(211, 27, 'Dumuria', 'ডুমুরিয়া', 'dumuria.khulna.gov.bd', NULL, NULL),
(212, 27, 'Botiaghata', 'বটিয়াঘাটা', 'botiaghata.khulna.gov.bd', NULL, NULL),
(213, 27, 'Dakop', 'দাকোপ', 'dakop.khulna.gov.bd', NULL, NULL),
(214, 27, 'Koyra', 'কয়রা', 'koyra.khulna.gov.bd', NULL, NULL),
(215, 28, 'Fakirhat', 'ফকিরহাট', 'fakirhat.bagerhat.gov.bd', NULL, NULL),
(216, 28, 'Bagerhat Sadar', 'বাগেরহাট সদর', 'sadar.bagerhat.gov.bd', NULL, NULL),
(217, 28, 'Mollahat', 'মোল্লাহাট', 'mollahat.bagerhat.gov.bd', NULL, NULL),
(218, 28, 'Sarankhola', 'শরণখোলা', 'sarankhola.bagerhat.gov.bd', NULL, NULL),
(219, 28, 'Rampal', 'রামপাল', 'rampal.bagerhat.gov.bd', NULL, NULL),
(220, 28, 'Morrelganj', 'মোড়েলগঞ্জ', 'morrelganj.bagerhat.gov.bd', NULL, NULL),
(221, 28, 'Kachua', 'কচুয়া', 'kachua.bagerhat.gov.bd', NULL, NULL),
(222, 28, 'Mongla', 'মোংলা', 'mongla.bagerhat.gov.bd', NULL, NULL),
(223, 28, 'Chitalmari', 'চিতলমারী', 'chitalmari.bagerhat.gov.bd', NULL, NULL),
(224, 29, 'Jhenaidah Sadar', 'ঝিনাইদহ সদর', 'sadar.jhenaidah.gov.bd', NULL, NULL),
(225, 29, 'Shailkupa', 'শৈলকুপা', 'shailkupa.jhenaidah.gov.bd', NULL, NULL),
(226, 29, 'Harinakundu', 'হরিণাকুন্ডু', 'harinakundu.jhenaidah.gov.bd', NULL, NULL),
(227, 29, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.jhenaidah.gov.bd', NULL, NULL),
(228, 29, 'Kotchandpur', 'কোটচাঁদপুর', 'kotchandpur.jhenaidah.gov.bd', NULL, NULL),
(229, 29, 'Moheshpur', 'মহেশপুর', 'moheshpur.jhenaidah.gov.bd', NULL, NULL),
(230, 30, 'Jhalakathi Sadar', 'ঝালকাঠি সদর', 'sadar.jhalakathi.gov.bd', NULL, NULL),
(231, 30, 'Kathalia', 'কাঠালিয়া', 'kathalia.jhalakathi.gov.bd', NULL, NULL),
(232, 30, 'Nalchity', 'নলছিটি', 'nalchity.jhalakathi.gov.bd', NULL, NULL),
(233, 30, 'Rajapur', 'রাজাপুর', 'rajapur.jhalakathi.gov.bd', NULL, NULL),
(234, 31, 'Bauphal', 'বাউফল', 'bauphal.patuakhali.gov.bd', NULL, NULL),
(235, 31, 'Patuakhali Sadar', 'পটুয়াখালী সদর', 'sadar.patuakhali.gov.bd', NULL, NULL),
(236, 31, 'Dumki', 'দুমকি', 'dumki.patuakhali.gov.bd', NULL, NULL),
(237, 31, 'Dashmina', 'দশমিনা', 'dashmina.patuakhali.gov.bd', NULL, NULL),
(238, 31, 'Kalapara', 'কলাপাড়া', 'kalapara.patuakhali.gov.bd', NULL, NULL),
(239, 31, 'Mirzaganj', 'মির্জাগঞ্জ', 'mirzaganj.patuakhali.gov.bd', NULL, NULL),
(240, 31, 'Galachipa', 'গলাচিপা', 'galachipa.patuakhali.gov.bd', NULL, NULL),
(241, 31, 'Rangabali', 'রাঙ্গাবালী', 'rangabali.patuakhali.gov.bd', NULL, NULL),
(242, 32, 'Pirojpur Sadar', 'পিরোজপুর সদর', 'sadar.pirojpur.gov.bd', NULL, NULL),
(243, 32, 'Nazirpur', 'নাজিরপুর', 'nazirpur.pirojpur.gov.bd', NULL, NULL),
(244, 32, 'Kawkhali', 'কাউখালী', 'kawkhali.pirojpur.gov.bd', NULL, NULL),
(245, 32, 'Zianagar', 'জিয়ানগর', 'zianagar.pirojpur.gov.bd', NULL, NULL),
(246, 32, 'Bhandaria', 'ভান্ডারিয়া', 'bhandaria.pirojpur.gov.bd', NULL, NULL),
(247, 32, 'Mathbaria', 'মঠবাড়ীয়া', 'mathbaria.pirojpur.gov.bd', NULL, NULL),
(248, 32, 'Nesarabad', 'নেছারাবাদ', 'nesarabad.pirojpur.gov.bd', NULL, NULL),
(249, 33, 'Barisal Sadar', 'বরিশাল সদর', 'barisalsadar.barisal.gov.bd', NULL, NULL),
(250, 33, 'Bakerganj', 'বাকেরগঞ্জ', 'bakerganj.barisal.gov.bd', NULL, NULL),
(251, 33, 'Babuganj', 'বাবুগঞ্জ', 'babuganj.barisal.gov.bd', NULL, NULL),
(252, 33, 'Wazirpur', 'উজিরপুর', 'wazirpur.barisal.gov.bd', NULL, NULL),
(253, 33, 'Banaripara', 'বানারীপাড়া', 'banaripara.barisal.gov.bd', NULL, NULL),
(254, 33, 'Gournadi', 'গৌরনদী', 'gournadi.barisal.gov.bd', NULL, NULL),
(255, 33, 'Agailjhara', 'আগৈলঝাড়া', 'agailjhara.barisal.gov.bd', NULL, NULL),
(256, 33, 'Mehendiganj', 'মেহেন্দিগঞ্জ', 'mehendiganj.barisal.gov.bd', NULL, NULL),
(257, 33, 'Muladi', 'মুলাদী', 'muladi.barisal.gov.bd', NULL, NULL),
(258, 33, 'Hizla', 'হিজলা', 'hizla.barisal.gov.bd', NULL, NULL),
(259, 34, 'Bhola Sadar', 'ভোলা সদর', 'sadar.bhola.gov.bd', NULL, NULL),
(260, 34, 'Borhan Sddin', 'বোরহান উদ্দিন', 'borhanuddin.bhola.gov.bd', NULL, NULL),
(261, 34, 'Charfesson', 'চরফ্যাশন', 'charfesson.bhola.gov.bd', NULL, NULL),
(262, 34, 'Doulatkhan', 'দৌলতখান', 'doulatkhan.bhola.gov.bd', NULL, NULL),
(263, 34, 'Monpura', 'মনপুরা', 'monpura.bhola.gov.bd', NULL, NULL),
(264, 34, 'Tazumuddin', 'তজুমদ্দিন', 'tazumuddin.bhola.gov.bd', NULL, NULL),
(265, 34, 'Lalmohan', 'লালমোহন', 'lalmohan.bhola.gov.bd', NULL, NULL),
(266, 35, 'Amtali', 'আমতলী', 'amtali.barguna.gov.bd', NULL, NULL),
(267, 35, 'Barguna Sadar', 'বরগুনা সদর', 'sadar.barguna.gov.bd', NULL, NULL),
(268, 35, 'Betagi', 'বেতাগী', 'betagi.barguna.gov.bd', NULL, NULL),
(269, 35, 'Bamna', 'বামনা', 'bamna.barguna.gov.bd', NULL, NULL),
(270, 35, 'Pathorghata', 'পাথরঘাটা', 'pathorghata.barguna.gov.bd', NULL, NULL),
(271, 35, 'Taltali', 'তালতলি', 'taltali.barguna.gov.bd', NULL, NULL),
(272, 36, 'Balaganj', 'বালাগঞ্জ', 'balaganj.sylhet.gov.bd', NULL, NULL),
(273, 36, 'Beanibazar', 'বিয়ানীবাজার', 'beanibazar.sylhet.gov.bd', NULL, NULL),
(274, 36, 'Bishwanath', 'বিশ্বনাথ', 'bishwanath.sylhet.gov.bd', NULL, NULL),
(275, 36, 'Companiganj', 'কোম্পানীগঞ্জ', 'companiganj.sylhet.gov.bd', NULL, NULL),
(276, 36, 'Fenchuganj', 'ফেঞ্চুগঞ্জ', 'fenchuganj.sylhet.gov.bd', NULL, NULL),
(277, 36, 'Golapganj', 'গোলাপগঞ্জ', 'golapganj.sylhet.gov.bd', NULL, NULL),
(278, 36, 'Gowainghat', 'গোয়াইনঘাট', 'gowainghat.sylhet.gov.bd', NULL, NULL),
(279, 36, 'Jaintiapur', 'জৈন্তাপুর', 'jaintiapur.sylhet.gov.bd', NULL, NULL),
(280, 36, 'Kanaighat', 'কানাইঘাট', 'kanaighat.sylhet.gov.bd', NULL, NULL),
(281, 36, 'Sylhet Sadar', 'সিলেট সদর', 'sylhetsadar.sylhet.gov.bd', NULL, NULL),
(282, 36, 'Zakiganj', 'জকিগঞ্জ', 'zakiganj.sylhet.gov.bd', NULL, NULL),
(283, 36, 'Dakshinsurma', 'দক্ষিণ সুরমা', 'dakshinsurma.sylhet.gov.bd', NULL, NULL),
(284, 36, 'Osmaninagar', 'ওসমানী নগর', 'osmaninagar.sylhet.gov.bd', NULL, NULL),
(285, 37, 'Barlekha', 'বড়লেখা', 'barlekha.moulvibazar.gov.bd', NULL, NULL),
(286, 37, 'Kamolganj', 'কমলগঞ্জ', 'kamolganj.moulvibazar.gov.bd', NULL, NULL),
(287, 37, 'Kulaura', 'কুলাউড়া', 'kulaura.moulvibazar.gov.bd', NULL, NULL),
(288, 37, 'Moulvibazar Sadar', 'মৌলভীবাজার সদর', 'moulvibazarsadar.moulvibazar.gov.bd', NULL, NULL),
(289, 37, 'Rajnagar', 'রাজনগর', 'rajnagar.moulvibazar.gov.bd', NULL, NULL),
(290, 37, 'Sreemangal', 'শ্রীমঙ্গল', 'sreemangal.moulvibazar.gov.bd', NULL, NULL),
(291, 37, 'Juri', 'জুড়ী', 'juri.moulvibazar.gov.bd', NULL, NULL),
(292, 38, 'Nabiganj', 'নবীগঞ্জ', 'nabiganj.habiganj.gov.bd', NULL, NULL),
(293, 38, 'Bahubal', 'বাহুবল', 'bahubal.habiganj.gov.bd', NULL, NULL),
(294, 38, 'Ajmiriganj', 'আজমিরীগঞ্জ', 'ajmiriganj.habiganj.gov.bd', NULL, NULL),
(295, 38, 'Baniachong', 'বানিয়াচং', 'baniachong.habiganj.gov.bd', NULL, NULL),
(296, 38, 'Lakhai', 'লাখাই', 'lakhai.habiganj.gov.bd', NULL, NULL),
(297, 38, 'Chunarughat', 'চুনারুঘাট', 'chunarughat.habiganj.gov.bd', NULL, NULL),
(298, 38, 'Habiganj Sadar', 'হবিগঞ্জ সদর', 'habiganjsadar.habiganj.gov.bd', NULL, NULL),
(299, 38, 'Madhabpur', 'মাধবপুর', 'madhabpur.habiganj.gov.bd', NULL, NULL),
(300, 39, 'Sunamganj Sadar', 'সুনামগঞ্জ সদর', 'sadar.sunamganj.gov.bd', NULL, NULL),
(301, 39, 'South Sunamganj', 'দক্ষিণ সুনামগঞ্জ', 'southsunamganj.sunamganj.gov.bd', NULL, NULL),
(302, 39, 'Bishwambarpur', 'বিশ্বম্ভরপুর', 'bishwambarpur.sunamganj.gov.bd', NULL, NULL),
(303, 39, 'Chhatak', 'ছাতক', 'chhatak.sunamganj.gov.bd', NULL, NULL),
(304, 39, 'Jagannathpur', 'জগন্নাথপুর', 'jagannathpur.sunamganj.gov.bd', NULL, NULL),
(305, 39, 'Dowarabazar', 'দোয়ারাবাজার', 'dowarabazar.sunamganj.gov.bd', NULL, NULL),
(306, 39, 'Tahirpur', 'তাহিরপুর', 'tahirpur.sunamganj.gov.bd', NULL, NULL),
(307, 39, 'Dharmapasha', 'ধর্মপাশা', 'dharmapasha.sunamganj.gov.bd', NULL, NULL),
(308, 39, 'Jamalganj', 'জামালগঞ্জ', 'jamalganj.sunamganj.gov.bd', NULL, NULL),
(309, 39, 'Shalla', 'শাল্লা', 'shalla.sunamganj.gov.bd', NULL, NULL),
(310, 39, 'Derai', 'দিরাই', 'derai.sunamganj.gov.bd', NULL, NULL),
(311, 40, 'Belabo', 'বেলাবো', 'belabo.narsingdi.gov.bd', NULL, NULL),
(312, 40, 'Monohardi', 'মনোহরদী', 'monohardi.narsingdi.gov.bd', NULL, NULL),
(313, 40, 'Narsingdi Sadar', 'নরসিংদী সদর', 'narsingdisadar.narsingdi.gov.bd', NULL, NULL),
(314, 40, 'Palash', 'পলাশ', 'palash.narsingdi.gov.bd', NULL, NULL),
(315, 40, 'Raipura', 'রায়পুরা', 'raipura.narsingdi.gov.bd', NULL, NULL),
(316, 40, 'Shibpur', 'শিবপুর', 'shibpur.narsingdi.gov.bd', NULL, NULL),
(317, 41, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.gazipur.gov.bd', NULL, NULL),
(318, 41, 'Kaliakair', 'কালিয়াকৈর', 'kaliakair.gazipur.gov.bd', NULL, NULL),
(319, 41, 'Kapasia', 'কাপাসিয়া', 'kapasia.gazipur.gov.bd', NULL, NULL),
(320, 41, 'Gazipur Sadar', 'গাজীপুর সদর', 'sadar.gazipur.gov.bd', NULL, NULL),
(321, 41, 'Sreepur', 'শ্রীপুর', 'sreepur.gazipur.gov.bd', NULL, NULL),
(322, 42, 'Shariatpur Sadar', 'শরিয়তপুর সদর', 'sadar.shariatpur.gov.bd', NULL, NULL),
(323, 42, 'Naria', 'নড়িয়া', 'naria.shariatpur.gov.bd', NULL, NULL),
(324, 42, 'Zajira', 'জাজিরা', 'zajira.shariatpur.gov.bd', NULL, NULL),
(325, 42, 'Gosairhat', 'গোসাইরহাট', 'gosairhat.shariatpur.gov.bd', NULL, NULL),
(326, 42, 'Bhedarganj', 'ভেদরগঞ্জ', 'bhedarganj.shariatpur.gov.bd', NULL, NULL),
(327, 42, 'Damudya', 'ডামুড্যা', 'damudya.shariatpur.gov.bd', NULL, NULL),
(328, 43, 'Araihazar', 'আড়াইহাজার', 'araihazar.narayanganj.gov.bd', NULL, NULL),
(329, 43, 'Bandar', 'বন্দর', 'bandar.narayanganj.gov.bd', NULL, NULL),
(330, 43, 'Narayanganj Sadar', 'নারায়নগঞ্জ সদর', 'narayanganjsadar.narayanganj.gov.bd', NULL, NULL),
(331, 43, 'Rupganj', 'রূপগঞ্জ', 'rupganj.narayanganj.gov.bd', NULL, NULL),
(332, 43, 'Sonargaon', 'সোনারগাঁ', 'sonargaon.narayanganj.gov.bd', NULL, NULL),
(333, 44, 'Basail', 'বাসাইল', 'basail.tangail.gov.bd', NULL, NULL),
(334, 44, 'Bhuapur', 'ভুয়াপুর', 'bhuapur.tangail.gov.bd', NULL, NULL),
(335, 44, 'Delduar', 'দেলদুয়ার', 'delduar.tangail.gov.bd', NULL, NULL),
(336, 44, 'Ghatail', 'ঘাটাইল', 'ghatail.tangail.gov.bd', NULL, NULL),
(337, 44, 'Gopalpur', 'গোপালপুর', 'gopalpur.tangail.gov.bd', NULL, NULL),
(338, 44, 'Madhupur', 'মধুপুর', 'madhupur.tangail.gov.bd', NULL, NULL),
(339, 44, 'Mirzapur', 'মির্জাপুর', 'mirzapur.tangail.gov.bd', NULL, NULL),
(340, 44, 'Nagarpur', 'নাগরপুর', 'nagarpur.tangail.gov.bd', NULL, NULL),
(341, 44, 'Sakhipur', 'সখিপুর', 'sakhipur.tangail.gov.bd', NULL, NULL),
(342, 44, 'Tangail Sadar', 'টাঙ্গাইল সদর', 'tangailsadar.tangail.gov.bd', NULL, NULL),
(343, 44, 'Kalihati', 'কালিহাতী', 'kalihati.tangail.gov.bd', NULL, NULL),
(344, 44, 'Dhanbari', 'ধনবাড়ী', 'dhanbari.tangail.gov.bd', NULL, NULL),
(345, 45, 'Itna', 'ইটনা', 'itna.kishoreganj.gov.bd', NULL, NULL),
(346, 45, 'Katiadi', 'কটিয়াদী', 'katiadi.kishoreganj.gov.bd', NULL, NULL),
(347, 45, 'Bhairab', 'ভৈরব', 'bhairab.kishoreganj.gov.bd', NULL, NULL),
(348, 45, 'Tarail', 'তাড়াইল', 'tarail.kishoreganj.gov.bd', NULL, NULL),
(349, 45, 'Hossainpur', 'হোসেনপুর', 'hossainpur.kishoreganj.gov.bd', NULL, NULL),
(350, 45, 'Pakundia', 'পাকুন্দিয়া', 'pakundia.kishoreganj.gov.bd', NULL, NULL),
(351, 45, 'Kuliarchar', 'কুলিয়ারচর', 'kuliarchar.kishoreganj.gov.bd', NULL, NULL),
(352, 45, 'Kishoreganj Sadar', 'কিশোরগঞ্জ সদর', 'kishoreganjsadar.kishoreganj.gov.bd', NULL, NULL),
(353, 45, 'Karimgonj', 'করিমগঞ্জ', 'karimgonj.kishoreganj.gov.bd', NULL, NULL),
(354, 45, 'Bajitpur', 'বাজিতপুর', 'bajitpur.kishoreganj.gov.bd', NULL, NULL),
(355, 45, 'Austagram', 'অষ্টগ্রাম', 'austagram.kishoreganj.gov.bd', NULL, NULL),
(356, 45, 'Mithamoin', 'মিঠামইন', 'mithamoin.kishoreganj.gov.bd', NULL, NULL),
(357, 45, 'Nikli', 'নিকলী', 'nikli.kishoreganj.gov.bd', NULL, NULL),
(358, 46, 'Harirampur', 'হরিরামপুর', 'harirampur.manikganj.gov.bd', NULL, NULL),
(359, 46, 'Saturia', 'সাটুরিয়া', 'saturia.manikganj.gov.bd', NULL, NULL),
(360, 46, 'Manikganj Sadar', 'মানিকগঞ্জ সদর', 'sadar.manikganj.gov.bd', NULL, NULL),
(361, 46, 'Gior', 'ঘিওর', 'gior.manikganj.gov.bd', NULL, NULL),
(362, 46, 'Shibaloy', 'শিবালয়', 'shibaloy.manikganj.gov.bd', NULL, NULL),
(363, 46, 'Doulatpur', 'দৌলতপুর', 'doulatpur.manikganj.gov.bd', NULL, NULL),
(364, 46, 'Singiar', 'সিংগাইর', 'singiar.manikganj.gov.bd', NULL, NULL),
(365, 47, 'Savar', 'সাভার', 'savar.dhaka.gov.bd', NULL, NULL),
(366, 47, 'Dhamrai', 'ধামরাই', 'dhamrai.dhaka.gov.bd', NULL, NULL),
(367, 47, 'Keraniganj', 'কেরাণীগঞ্জ', 'keraniganj.dhaka.gov.bd', NULL, NULL),
(368, 47, 'Nawabganj', 'নবাবগঞ্জ', 'nawabganj.dhaka.gov.bd', NULL, NULL),
(369, 47, 'Dohar', 'দোহার', 'dohar.dhaka.gov.bd', NULL, NULL),
(370, 48, 'Munshiganj Sadar', 'মুন্সিগঞ্জ সদর', 'sadar.munshiganj.gov.bd', NULL, NULL),
(371, 48, 'Sreenagar', 'শ্রীনগর', 'sreenagar.munshiganj.gov.bd', NULL, NULL),
(372, 48, 'Sirajdikhan', 'সিরাজদিখান', 'sirajdikhan.munshiganj.gov.bd', NULL, NULL),
(373, 48, 'Louhajanj', 'লৌহজং', 'louhajanj.munshiganj.gov.bd', NULL, NULL),
(374, 48, 'Gajaria', 'গজারিয়া', 'gajaria.munshiganj.gov.bd', NULL, NULL),
(375, 48, 'Tongibari', 'টংগীবাড়ি', 'tongibari.munshiganj.gov.bd', NULL, NULL),
(376, 49, 'Rajbari Sadar', 'রাজবাড়ী সদর', 'sadar.rajbari.gov.bd', NULL, NULL),
(377, 49, 'Goalanda', 'গোয়ালন্দ', 'goalanda.rajbari.gov.bd', NULL, NULL),
(378, 49, 'Pangsa', 'পাংশা', 'pangsa.rajbari.gov.bd', NULL, NULL),
(379, 49, 'Baliakandi', 'বালিয়াকান্দি', 'baliakandi.rajbari.gov.bd', NULL, NULL),
(380, 49, 'Kalukhali', 'কালুখালী', 'kalukhali.rajbari.gov.bd', NULL, NULL),
(381, 50, 'Madaripur Sadar', 'মাদারীপুর সদর', 'sadar.madaripur.gov.bd', NULL, NULL),
(382, 50, 'Shibchar', 'শিবচর', 'shibchar.madaripur.gov.bd', NULL, NULL),
(383, 50, 'Kalkini', 'কালকিনি', 'kalkini.madaripur.gov.bd', NULL, NULL),
(384, 50, 'Rajoir', 'রাজৈর', 'rajoir.madaripur.gov.bd', NULL, NULL),
(385, 51, 'Gopalganj Sadar', 'গোপালগঞ্জ সদর', 'sadar.gopalganj.gov.bd', NULL, NULL),
(386, 51, 'Kashiani', 'কাশিয়ানী', 'kashiani.gopalganj.gov.bd', NULL, NULL),
(387, 51, 'Tungipara', 'টুংগীপাড়া', 'tungipara.gopalganj.gov.bd', NULL, NULL),
(388, 51, 'Kotalipara', 'কোটালীপাড়া', 'kotalipara.gopalganj.gov.bd', NULL, NULL),
(389, 51, 'Muksudpur', 'মুকসুদপুর', 'muksudpur.gopalganj.gov.bd', NULL, NULL),
(390, 52, 'Faridpur Sadar', 'ফরিদপুর সদর', 'sadar.faridpur.gov.bd', NULL, NULL),
(391, 52, 'Alfadanga', 'আলফাডাঙ্গা', 'alfadanga.faridpur.gov.bd', NULL, NULL),
(392, 52, 'Boalmari', 'বোয়ালমারী', 'boalmari.faridpur.gov.bd', NULL, NULL),
(393, 52, 'Sadarpur', 'সদরপুর', 'sadarpur.faridpur.gov.bd', NULL, NULL),
(394, 52, 'Nagarkanda', 'নগরকান্দা', 'nagarkanda.faridpur.gov.bd', NULL, NULL),
(395, 52, 'Bhanga', 'ভাঙ্গা', 'bhanga.faridpur.gov.bd', NULL, NULL),
(396, 52, 'Charbhadrasan', 'চরভদ্রাসন', 'charbhadrasan.faridpur.gov.bd', NULL, NULL),
(397, 52, 'Madhukhali', 'মধুখালী', 'madhukhali.faridpur.gov.bd', NULL, NULL),
(398, 52, 'Saltha', 'সালথা', 'saltha.faridpur.gov.bd', NULL, NULL),
(399, 53, 'Panchagarh Sadar', 'পঞ্চগড় সদর', 'panchagarhsadar.panchagarh.gov.bd', NULL, NULL),
(400, 53, 'Debiganj', 'দেবীগঞ্জ', 'debiganj.panchagarh.gov.bd', NULL, NULL),
(401, 53, 'Boda', 'বোদা', 'boda.panchagarh.gov.bd', NULL, NULL),
(402, 53, 'Atwari', 'আটোয়ারী', 'atwari.panchagarh.gov.bd', NULL, NULL),
(403, 53, 'Tetulia', 'তেতুলিয়া', 'tetulia.panchagarh.gov.bd', NULL, NULL),
(404, 54, 'Nawabganj', 'নবাবগঞ্জ', 'nawabganj.dinajpur.gov.bd', NULL, NULL),
(405, 54, 'Birganj', 'বীরগঞ্জ', 'birganj.dinajpur.gov.bd', NULL, NULL),
(406, 54, 'Ghoraghat', 'ঘোড়াঘাট', 'ghoraghat.dinajpur.gov.bd', NULL, NULL),
(407, 54, 'Birampur', 'বিরামপুর', 'birampur.dinajpur.gov.bd', NULL, NULL),
(408, 54, 'Parbatipur', 'পার্বতীপুর', 'parbatipur.dinajpur.gov.bd', NULL, NULL),
(409, 54, 'Bochaganj', 'বোচাগঞ্জ', 'bochaganj.dinajpur.gov.bd', NULL, NULL),
(410, 54, 'Kaharol', 'কাহারোল', 'kaharol.dinajpur.gov.bd', NULL, NULL),
(411, 54, 'Fulbari', 'ফুলবাড়ী', 'fulbari.dinajpur.gov.bd', NULL, NULL),
(412, 54, 'Dinajpur Sadar', 'দিনাজপুর সদর', 'dinajpursadar.dinajpur.gov.bd', NULL, NULL),
(413, 54, 'Hakimpur', 'হাকিমপুর', 'hakimpur.dinajpur.gov.bd', NULL, NULL),
(414, 54, 'Khansama', 'খানসামা', 'khansama.dinajpur.gov.bd', NULL, NULL),
(415, 54, 'Birol', 'বিরল', 'birol.dinajpur.gov.bd', NULL, NULL),
(416, 54, 'Chirirbandar', 'চিরিরবন্দর', 'chirirbandar.dinajpur.gov.bd', NULL, NULL),
(417, 55, 'Lalmonirhat Sadar', 'লালমনিরহাট সদর', 'sadar.lalmonirhat.gov.bd', NULL, NULL),
(418, 55, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.lalmonirhat.gov.bd', NULL, NULL),
(419, 55, 'Hatibandha', 'হাতীবান্ধা', 'hatibandha.lalmonirhat.gov.bd', NULL, NULL),
(420, 55, 'Patgram', 'পাটগ্রাম', 'patgram.lalmonirhat.gov.bd', NULL, NULL),
(421, 55, 'Aditmari', 'আদিতমারী', 'aditmari.lalmonirhat.gov.bd', NULL, NULL),
(422, 56, 'Syedpur', 'সৈয়দপুর', 'syedpur.nilphamari.gov.bd', NULL, NULL),
(423, 56, 'Domar', 'ডোমার', 'domar.nilphamari.gov.bd', NULL, NULL),
(424, 56, 'Dimla', 'ডিমলা', 'dimla.nilphamari.gov.bd', NULL, NULL),
(425, 56, 'Jaldhaka', 'জলঢাকা', 'jaldhaka.nilphamari.gov.bd', NULL, NULL),
(426, 56, 'Kishorganj', 'কিশোরগঞ্জ', 'kishorganj.nilphamari.gov.bd', NULL, NULL),
(427, 56, 'Nilphamari Sadar', 'নীলফামারী সদর', 'nilphamarisadar.nilphamari.gov.bd', NULL, NULL),
(428, 57, 'Sadullapur', 'সাদুল্লাপুর', 'sadullapur.gaibandha.gov.bd', NULL, NULL),
(429, 57, 'Gaibandha Sadar', 'গাইবান্ধা সদর', 'gaibandhasadar.gaibandha.gov.bd', NULL, NULL),
(430, 57, 'Palashbari', 'পলাশবাড়ী', 'palashbari.gaibandha.gov.bd', NULL, NULL),
(431, 57, 'Saghata', 'সাঘাটা', 'saghata.gaibandha.gov.bd', NULL, NULL),
(432, 57, 'Gobindaganj', 'গোবিন্দগঞ্জ', 'gobindaganj.gaibandha.gov.bd', NULL, NULL),
(433, 57, 'Sundarganj', 'সুন্দরগঞ্জ', 'sundarganj.gaibandha.gov.bd', NULL, NULL),
(434, 57, 'Phulchari', 'ফুলছড়ি', 'phulchari.gaibandha.gov.bd', NULL, NULL),
(435, 58, 'Thakurgaon Sadar', 'ঠাকুরগাঁও সদর', 'thakurgaonsadar.thakurgaon.gov.bd', NULL, NULL),
(436, 58, 'Pirganj', 'পীরগঞ্জ', 'pirganj.thakurgaon.gov.bd', NULL, NULL),
(437, 58, 'Ranisankail', 'রাণীশংকৈল', 'ranisankail.thakurgaon.gov.bd', NULL, NULL),
(438, 58, 'Haripur', 'হরিপুর', 'haripur.thakurgaon.gov.bd', NULL, NULL),
(439, 58, 'Baliadangi', 'বালিয়াডাঙ্গী', 'baliadangi.thakurgaon.gov.bd', NULL, NULL),
(440, 59, 'Rangpur Sadar', 'রংপুর সদর', 'rangpursadar.rangpur.gov.bd', NULL, NULL),
(441, 59, 'Gangachara', 'গংগাচড়া', 'gangachara.rangpur.gov.bd', NULL, NULL),
(442, 59, 'Taragonj', 'তারাগঞ্জ', 'taragonj.rangpur.gov.bd', NULL, NULL),
(443, 59, 'Badargonj', 'বদরগঞ্জ', 'badargonj.rangpur.gov.bd', NULL, NULL),
(444, 59, 'Mithapukur', 'মিঠাপুকুর', 'mithapukur.rangpur.gov.bd', NULL, NULL),
(445, 59, 'Pirgonj', 'পীরগঞ্জ', 'pirgonj.rangpur.gov.bd', NULL, NULL),
(446, 59, 'Kaunia', 'কাউনিয়া', 'kaunia.rangpur.gov.bd', NULL, NULL),
(447, 59, 'Pirgacha', 'পীরগাছা', 'pirgacha.rangpur.gov.bd', NULL, NULL),
(448, 60, 'Kurigram Sadar', 'কুড়িগ্রাম সদর', 'kurigramsadar.kurigram.gov.bd', NULL, NULL),
(449, 60, 'Nageshwari', 'নাগেশ্বরী', 'nageshwari.kurigram.gov.bd', NULL, NULL),
(450, 60, 'Bhurungamari', 'ভুরুঙ্গামারী', 'bhurungamari.kurigram.gov.bd', NULL, NULL),
(451, 60, 'Phulbari', 'ফুলবাড়ী', 'phulbari.kurigram.gov.bd', NULL, NULL),
(452, 60, 'Rajarhat', 'রাজারহাট', 'rajarhat.kurigram.gov.bd', NULL, NULL),
(453, 60, 'Ulipur', 'উলিপুর', 'ulipur.kurigram.gov.bd', NULL, NULL),
(454, 60, 'Chilmari', 'চিলমারী', 'chilmari.kurigram.gov.bd', NULL, NULL),
(455, 60, 'Rowmari', 'রৌমারী', 'rowmari.kurigram.gov.bd', NULL, NULL),
(456, 60, 'Charrajibpur', 'চর রাজিবপুর', 'charrajibpur.kurigram.gov.bd', NULL, NULL),
(457, 61, 'Sherpur Sadar', 'শেরপুর সদর', 'sherpursadar.sherpur.gov.bd', NULL, NULL),
(458, 61, 'Nalitabari', 'নালিতাবাড়ী', 'nalitabari.sherpur.gov.bd', NULL, NULL),
(459, 61, 'Sreebordi', 'শ্রীবরদী', 'sreebordi.sherpur.gov.bd', NULL, NULL),
(460, 61, 'Nokla', 'নকলা', 'nokla.sherpur.gov.bd', NULL, NULL),
(461, 61, 'Jhenaigati', 'ঝিনাইগাতী', 'jhenaigati.sherpur.gov.bd', NULL, NULL),
(462, 62, 'Fulbaria', 'ফুলবাড়ীয়া', 'fulbaria.mymensingh.gov.bd', NULL, NULL),
(463, 62, 'Trishal', 'ত্রিশাল', 'trishal.mymensingh.gov.bd', NULL, NULL),
(464, 62, 'Bhaluka', 'ভালুকা', 'bhaluka.mymensingh.gov.bd', NULL, NULL),
(465, 62, 'Muktagacha', 'মুক্তাগাছা', 'muktagacha.mymensingh.gov.bd', NULL, NULL),
(466, 62, 'Mymensingh Sadar', 'ময়মনসিংহ সদর', 'mymensinghsadar.mymensingh.gov.bd', NULL, NULL),
(467, 62, 'Dhobaura', 'ধোবাউড়া', 'dhobaura.mymensingh.gov.bd', NULL, NULL),
(468, 62, 'Phulpur', 'ফুলপুর', 'phulpur.mymensingh.gov.bd', NULL, NULL),
(469, 62, 'Haluaghat', 'হালুয়াঘাট', 'haluaghat.mymensingh.gov.bd', NULL, NULL),
(470, 62, 'Gouripur', 'গৌরীপুর', 'gouripur.mymensingh.gov.bd', NULL, NULL),
(471, 62, 'Gafargaon', 'গফরগাঁও', 'gafargaon.mymensingh.gov.bd', NULL, NULL),
(472, 62, 'Iswarganj', 'ঈশ্বরগঞ্জ', 'iswarganj.mymensingh.gov.bd', NULL, NULL),
(473, 62, 'Nandail', 'নান্দাইল', 'nandail.mymensingh.gov.bd', NULL, NULL),
(474, 62, 'Tarakanda', 'তারাকান্দা', 'tarakanda.mymensingh.gov.bd', NULL, NULL),
(475, 63, 'Jamalpur Sadar', 'জামালপুর সদর', 'jamalpursadar.jamalpur.gov.bd', NULL, NULL),
(476, 63, 'Melandah', 'মেলান্দহ', 'melandah.jamalpur.gov.bd', NULL, NULL),
(477, 63, 'Islampur', 'ইসলামপুর', 'islampur.jamalpur.gov.bd', NULL, NULL),
(478, 63, 'Dewangonj', 'দেওয়ানগঞ্জ', 'dewangonj.jamalpur.gov.bd', NULL, NULL),
(479, 63, 'Sarishabari', 'সরিষাবাড়ী', 'sarishabari.jamalpur.gov.bd', NULL, NULL),
(480, 63, 'Madarganj', 'মাদারগঞ্জ', 'madarganj.jamalpur.gov.bd', NULL, NULL),
(481, 63, 'Bokshiganj', 'বকশীগঞ্জ', 'bokshiganj.jamalpur.gov.bd', NULL, NULL),
(482, 64, 'Barhatta', 'বারহাট্টা', 'barhatta.netrokona.gov.bd', NULL, NULL),
(483, 64, 'Durgapur', 'দুর্গাপুর', 'durgapur.netrokona.gov.bd', NULL, NULL),
(484, 64, 'Kendua', 'কেন্দুয়া', 'kendua.netrokona.gov.bd', NULL, NULL),
(485, 64, 'Atpara', 'আটপাড়া', 'atpara.netrokona.gov.bd', NULL, NULL),
(486, 64, 'Madan', 'মদন', 'madan.netrokona.gov.bd', NULL, NULL),
(487, 64, 'Khaliajuri', 'খালিয়াজুরী', 'khaliajuri.netrokona.gov.bd', NULL, NULL),
(488, 64, 'Kalmakanda', 'কলমাকান্দা', 'kalmakanda.netrokona.gov.bd', NULL, NULL),
(489, 64, 'Mohongonj', 'মোহনগঞ্জ', 'mohongonj.netrokona.gov.bd', NULL, NULL),
(490, 64, 'Purbadhala', 'পূর্বধলা', 'purbadhala.netrokona.gov.bd', NULL, NULL),
(491, 64, 'Netrokona Sadar', 'নেত্রকোণা সদর', 'netrokonasadar.netrokona.gov.bd', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `phone`, `image`, `role_id`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '01767772333', 'abasvumi/uploads/images/user/1611306791.png', NULL, '$2y$10$bf5.1.hOzCV.0nrzowYd6eP72J0HjaDNUiSJ1z1iwveVVa8GkMsv.', 'PKaNGxQwanP42gaxNgFDgn9qpUbVHv6KywHtpC7PNDXSvt1TdWEsDsW9afhX', NULL, '2021-01-22 03:46:32'),
(2, 'Suman Ahmed', 'suman@gmail.com', NULL, '01767778333', 'abasvumi/uploads/images/user/1610729370.jpg', 1, '$2y$10$WMjx0F/y2tCBMbN1uTSv5ukHH8hSzNe5VVGKz0Ewie..NPx5RoLQi', NULL, '2021-01-15 10:49:30', '2021-01-15 10:49:30'),
(4, 'Apoun Sutadhar', 'apounmix@gmail.com', NULL, '01632697963', 'abasvumi/uploads/images/user/1611245156.png', 3, '$2y$10$y6lwIUtLfxP1gV5SDhaj4.zKNEZzmkVUT.PXqgEUJaikHQbwY7GDO', NULL, '2021-01-21 10:05:56', '2021-01-21 10:05:56'),
(5, 'Hridoy sutradhar', 'hridoyvk@gmail.com', NULL, '01814454512', 'abasvumi/uploads/images/user/1611245321.png', 4, '$2y$10$zwSiw0PbfdXCynant/3EFedaePgKyzVB9WwxZ3Oos1n0JsmGUb2EK', NULL, '2021-01-21 10:08:41', '2021-01-21 10:08:41'),
(6, 'Pinto Khan', 'pintovk@gmail.com', NULL, '01714565896', 'abasvumi/uploads/images/user/1611245363.png', 2, '$2y$10$L43cJnKvjwGeXI8G6fJl1.onghjeN8fIeMkpE2Oz/alS6NR39wc8.', NULL, '2021-01-21 10:09:23', '2021-01-21 10:09:23');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `title`, `bn_title`, `image`, `video_link`, `created_at`, `updated_at`) VALUES
(1, 'The video title', 'The video title', 'abasvumi/uploads/images/video/video_16109060191427139554.png', 'https://abasvumidynamic.swadhinbarta.com/admin', '2021-01-17 11:53:39', '2021-01-17 11:53:39'),
(2, 'The video title two', 'The video title two', 'abasvumi/uploads/images/video/video_16109060851314510152.png', 'https://abasvumidynamic.swadhinbarta.com/', '2021-01-17 11:54:45', '2021-01-17 11:54:45'),
(3, 'The video three', 'The video three', 'abasvumi/uploads/images/video/video_16109064151711337423.png', 'https://abasvumidynamic.swadhinbarta.com/', '2021-01-17 12:00:15', '2021-01-17 12:00:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `agents_email_unique` (`email`),
  ADD UNIQUE KEY `agents_phone_unique` (`phone`);

--
-- Indexes for table `amenitis`
--
ALTER TABLE `amenitis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `area_guides`
--
ALTER TABLE `area_guides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_guides_area_id_foreign` (`area_id`);

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_category_id_foreign` (`category_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `developers`
--
ALTER TABLE `developers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `developers_email_unique` (`email`),
  ADD UNIQUE KEY `developers_phone_unique` (`phone`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `districts_division_id_foreign` (`division_id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `educational_institutes`
--
ALTER TABLE `educational_institutes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `educational_institutes_division_id_foreign` (`division_id`),
  ADD KEY `educational_institutes_district_id_foreign` (`district_id`),
  ADD KEY `educational_institutes_thana_id_foreign` (`thana_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospitals_division_id_foreign` (`division_id`),
  ADD KEY `hospitals_district_id_foreign` (`district_id`),
  ADD KEY `hospitals_thana_id_foreign` (`thana_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parks`
--
ALTER TABLE `parks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parks_division_id_foreign` (`division_id`),
  ADD KEY `parks_district_id_foreign` (`district_id`),
  ADD KEY `parks_thana_id_foreign` (`thana_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `real_estate_solutions`
--
ALTER TABLE `real_estate_solutions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `religious_institutions`
--
ALTER TABLE `religious_institutions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `religious_institutions_division_id_foreign` (`division_id`),
  ADD KEY `religious_institutions_district_id_foreign` (`district_id`),
  ADD KEY `religious_institutions_thana_id_foreign` (`thana_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurants_division_id_foreign` (`division_id`),
  ADD KEY `restaurants_district_id_foreign` (`district_id`),
  ADD KEY `restaurants_thana_id_foreign` (`thana_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serviceimages`
--
ALTER TABLE `serviceimages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `serviceimages_service_id_foreign` (`service_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_user_id_foreign` (`user_id`),
  ADD KEY `services_agent_id_foreign` (`agent_id`),
  ADD KEY `services_developer_id_foreign` (`developer_id`),
  ADD KEY `services_division_id_foreign` (`division_id`),
  ADD KEY `services_district_id_foreign` (`district_id`),
  ADD KEY `services_thana_id_foreign` (`thana_id`),
  ADD KEY `services_area_id_foreign` (`area_id`),
  ADD KEY `services_block_id_foreign` (`block_id`);

--
-- Indexes for table `service_types`
--
ALTER TABLE `service_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thanas`
--
ALTER TABLE `thanas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thanas_district_id_foreign` (`district_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `amenitis`
--
ALTER TABLE `amenitis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `area_guides`
--
ALTER TABLE `area_guides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `developers`
--
ALTER TABLE `developers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `educational_institutes`
--
ALTER TABLE `educational_institutes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `parks`
--
ALTER TABLE `parks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `real_estate_solutions`
--
ALTER TABLE `real_estate_solutions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `religious_institutions`
--
ALTER TABLE `religious_institutions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `serviceimages`
--
ALTER TABLE `serviceimages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `thanas`
--
ALTER TABLE `thanas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=492;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `area_guides`
--
ALTER TABLE `area_guides`
  ADD CONSTRAINT `area_guides_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`);

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`);

--
-- Constraints for table `educational_institutes`
--
ALTER TABLE `educational_institutes`
  ADD CONSTRAINT `educational_institutes_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `educational_institutes_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`),
  ADD CONSTRAINT `educational_institutes_thana_id_foreign` FOREIGN KEY (`thana_id`) REFERENCES `thanas` (`id`);

--
-- Constraints for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD CONSTRAINT `hospitals_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `hospitals_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`),
  ADD CONSTRAINT `hospitals_thana_id_foreign` FOREIGN KEY (`thana_id`) REFERENCES `thanas` (`id`);

--
-- Constraints for table `parks`
--
ALTER TABLE `parks`
  ADD CONSTRAINT `parks_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `parks_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`),
  ADD CONSTRAINT `parks_thana_id_foreign` FOREIGN KEY (`thana_id`) REFERENCES `thanas` (`id`);

--
-- Constraints for table `religious_institutions`
--
ALTER TABLE `religious_institutions`
  ADD CONSTRAINT `religious_institutions_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `religious_institutions_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`),
  ADD CONSTRAINT `religious_institutions_thana_id_foreign` FOREIGN KEY (`thana_id`) REFERENCES `thanas` (`id`);

--
-- Constraints for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD CONSTRAINT `restaurants_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `restaurants_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`),
  ADD CONSTRAINT `restaurants_thana_id_foreign` FOREIGN KEY (`thana_id`) REFERENCES `thanas` (`id`);

--
-- Constraints for table `serviceimages`
--
ALTER TABLE `serviceimages`
  ADD CONSTRAINT `serviceimages_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`),
  ADD CONSTRAINT `services_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`),
  ADD CONSTRAINT `services_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`),
  ADD CONSTRAINT `services_developer_id_foreign` FOREIGN KEY (`developer_id`) REFERENCES `developers` (`id`),
  ADD CONSTRAINT `services_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `services_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`),
  ADD CONSTRAINT `services_thana_id_foreign` FOREIGN KEY (`thana_id`) REFERENCES `thanas` (`id`),
  ADD CONSTRAINT `services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `thanas`
--
ALTER TABLE `thanas`
  ADD CONSTRAINT `thanas_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
