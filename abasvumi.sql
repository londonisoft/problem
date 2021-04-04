-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2021 at 11:53 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abasvumi`
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
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=agents, 2=developers, 3=supplers  ',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `all_services`
--

CREATE TABLE `all_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_user_id` bigint(20) UNSIGNED NOT NULL,
  `service_category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_bn` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `is_featured` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `all_services`
--

INSERT INTO `all_services` (`id`, `external_user_id`, `service_category_id`, `name`, `name_bn`, `description`, `description_bn`, `image`, `status`, `is_featured`, `created_at`, `updated_at`) VALUES
(11, 9, 4, 'Mobile', 'Mobile bn', ', lkhjnlkjk', 'jkhgbjkgkg', 'abasvumi/uploads/images/all_services/service_1616242554754361970.jpg', 1, 0, '2021-03-20 06:15:54', '2021-03-20 06:15:54'),
(12, 9, 1, 'Mobile template', 'Mobile bn', 'uyuiy', 'ouoy', 'abasvumi/uploads/images/all_services/service_1616242881455488391.jpg', 1, 0, '2021-03-20 06:17:53', '2021-03-20 06:21:21'),
(15, 9, 8, 'game_already_palyed_api.php', 'Mobile bn', 'jhjhg', 'hhhj', 'abasvumi/uploads/images/all_services/service_1616242835890337827.jpg', 1, 0, '2021-03-20 06:20:35', '2021-03-20 06:20:35');

-- --------------------------------------------------------

--
-- Table structure for table `amenitis`
--

CREATE TABLE `amenitis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amenitis`
--

INSERT INTO `amenitis` (`id`, `name`, `bn_name`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Mobile', 'Mobile Bn', 'gfgf', '2021-03-12 03:40:13', '2021-03-12 03:40:13'),
(2, 'erere', 'rerere', 'rerere', '2021-03-19 00:35:58', '2021-03-19 00:35:58');

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `address_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `name`, `bn_name`, `image`, `created_at`, `updated_at`, `address_bn`, `address`) VALUES
(1, 'Dhaka Apartments', 'ঢাকা এপার্টমেন্টস', 'img/fake/4a8bba70c17a7e28968382657de170c2.png', '2021-03-10 10:45:37', '2021-03-14 12:38:00', 'মিরপুর, ঢাকা', 'Mirpur, Dhaka'),
(2, 'Chattogram Apartments', 'চট্টগ্রাম এপার্টমেন্টস', 'abasvumi/uploads/images/area/education_161574591679272132.png', '2021-03-10 10:45:37', '2021-03-14 12:37:41', 'মিরপুর, ঢাকা', 'Mirpur, Dhaka'),
(3, 'Dhaka Popular Locations', 'ঢাকা পপুলার লোকেশন্স', 'img/fake/2ca4cc6db9304c80d9adeee11d0af068.png', '2021-03-10 10:45:37', '2021-03-14 12:32:18', 'fdfd', 'fdfdfdfdffffffffff'),
(4, 'Dhaka office', 'ঢাকা অফিস', 'img/fake/601900f2375c524489f4fa0d3d0fd16d.png', '2021-03-10 10:45:37', '2021-03-14 12:32:14', 'fdfd', 'fdf'),
(5, 'Dhaka Commercial', 'ঢাকা কমার্শিয়াল', 'img/fake/52096271f3eca0b8dddd65260eb00a88.png', '2021-03-10 10:45:37', '2021-03-14 12:38:12', 'মিরপুর, ঢাকা', 'Mirpur, Dhaka'),
(6, 'Mobile', 'fdf', 'abasvumi/uploads/images/area/education_16157469871559506474.png', '2021-03-14 12:36:27', '2021-03-14 12:36:27', 'fdfd', 'dfdfd');

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
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `area_guides`
--

INSERT INTO `area_guides` (`id`, `area_id`, `title`, `bn_title`, `description`, `bn_description`, `image`, `video_link`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 'Reprehenderit qui harum sed perferendis tenetur. Et repellat ab adipisci et excepturi non.', 'Ipsam qui accusantium similique. Ex qui id autem cupiditate qui eius.', 'Qui dicta ut quo. Quos et veniam ad itaque non. Explicabo doloribus voluptate molestiae earum et earum molestiae. Sit error cum voluptate sit quo odio. Excepturi ut minima quia vel impedit. Ut similique itaque explicabo. Quos rem perspiciatis dolore reiciendis. Ut earum sit odio aperiam dolorem. Sunt ea placeat omnis ea dolore. Excepturi officiis modi cupiditate molestiae culpa quia voluptatem. Sit illum rem rem voluptatum deserunt quae. Hic eos veniam quia laudantium vel pariatur.', 'Expedita dolore quibusdam et autem. Voluptatem et quos nisi minus fuga ut. Quis itaque voluptas incidunt ut natus sed expedita. Et voluptas placeat ut enim quo. Aut architecto omnis fuga possimus. Totam voluptatem qui fuga sit atque. Similique nihil amet et incidunt quis omnis. Beatae molestiae eos delectus mollitia error ea. Cupiditate doloribus ea quod illum tenetur dolores. Non quidem asperiores vero odit qui ullam.', 'img/fake/b91bbb6b4677e15ff9dbcbf9e79609fc.png', 'https://www.youtube.com/watch?v=errT-_IvDVg', '1', 1, '2021-03-10 10:45:44', '2021-03-10 10:45:44'),
(2, 4, 'Exercitationem dolores aut deserunt eius maiores ipsa distinctio. Nemo deserunt sequi ducimus.', 'Soluta dolor nihil et distinctio iusto. Ipsum officiis et est animi dolorem rerum tenetur.', 'Quas cum commodi sed aut consequatur commodi. Totam ut fugit est eaque. Quia sint dolores corrupti veritatis dicta. Ut qui blanditiis ut officiis assumenda velit ullam. Et provident cupiditate voluptatem. Voluptas consequatur molestiae et id quis voluptate atque. Amet vel velit quia est commodi laborum. Commodi et cumque et fuga. Enim id et laudantium autem. Non nostrum nobis optio et. Vel voluptatum dolore quaerat dignissimos aspernatur rerum iusto in. Sed cumque itaque cum ad et ipsa.', 'Aspernatur rerum nobis facere ut fugit atque voluptas. Porro illum ipsam expedita quam vel. Laborum ut autem expedita reiciendis eos. Fuga dignissimos animi ad perferendis atque alias repellendus. Saepe suscipit beatae dolor nobis. Ipsam sed quo a quia ex natus et. Ab necessitatibus unde enim nostrum qui et quidem consequatur. Tempora laboriosam dolorem commodi ipsum maiores.', 'img/fake/13ceb9f5e34c716990f5e65210c60f11.png', 'https://www.youtube.com/watch?v=errT-_IvDVg', '1', 1, '2021-03-10 10:45:44', '2021-03-10 10:45:44'),
(3, 4, 'Fugiat hic aliquid commodi maxime ut possimus eligendi. Id ea consequatur reiciendis non.', 'Ad quisquam natus sint et. Et odio autem sunt id. Voluptate et aliquam eveniet.', 'Magnam veniam eius est. Voluptas molestiae soluta dolorum odit. Nemo labore harum repellendus iure. Aut omnis quam aut nulla facilis. Fugit quis sed amet perferendis. Et porro voluptatem voluptate non quas. Nihil quia dicta non ut consectetur aliquid accusamus. Et est soluta excepturi perferendis iure accusantium. Dicta sed fuga id rerum quae quia enim. Repellat autem fugiat fugit autem. Neque architecto exercitationem et delectus magnam. Qui omnis doloremque dignissimos in neque ipsam.', 'Doloremque iste rerum placeat exercitationem. Voluptatem optio saepe alias. Minima nemo ipsa et adipisci hic maxime. Et omnis ex perferendis repellat. A molestias sed consequatur omnis error sed. Facere qui distinctio deleniti sed facilis. At sunt rem rerum. Sint minima molestiae autem et assumenda rerum qui. Repellendus cum consequatur iste quis culpa.', 'img/fake/04f46f177e6adb6af9e901e06040e0af.png', 'https://www.youtube.com/watch?v=errT-_IvDVg', '3', 1, '2021-03-10 10:45:44', '2021-03-10 10:45:44'),
(4, 1, 'Veritatis non possimus dignissimos aliquid. Aut aut fugit temporibus est incidunt.', 'Ullam ut aut distinctio iure. Sint iste aut et. Est ratione saepe nemo voluptas natus.', 'Pariatur natus numquam enim incidunt eum sit ab. Et neque dolores rerum esse corporis quae. Quam nesciunt quia ipsa sunt quis enim quia. Dignissimos vel quia dignissimos laudantium mollitia. Dignissimos quae ea expedita quia quos sapiente. Temporibus est explicabo tempore rerum. Molestias enim omnis ut recusandae tempora. Animi maiores et numquam recusandae velit. Unde velit qui enim pariatur in temporibus placeat.', 'Est illo voluptas eligendi perferendis non quia dolores. Consequuntur sed est vel et. Laudantium similique autem et vero. Officia in sunt amet sint reprehenderit nihil. Mollitia voluptas molestiae illo molestias. Ipsum quidem et est sunt et accusantium temporibus. Hic tempore harum quis quos aspernatur. Quia corrupti commodi voluptates consequatur molestiae est consequatur. Perspiciatis sunt quo reiciendis asperiores nam qui. Earum quo ex in.', 'img/fake/76cd093c238dab052685f12046a8251f.png', 'https://www.youtube.com/watch?v=errT-_IvDVg', '2', 1, '2021-03-10 10:45:44', '2021-03-10 10:45:44'),
(5, 5, 'Vel consequatur voluptatem quo sed. Non magni et possimus. Vel magnam dolorem ut quaerat.', 'Culpa omnis delectus repudiandae aut et. Quia et iste tempora hic dolores ut reiciendis.', 'Minima nihil reprehenderit ratione in. Facilis ullam nisi saepe et unde ipsa sint. Autem vel eum occaecati vel quo omnis ad. Minima ut quam id nesciunt voluptatem repellat voluptatem. Eligendi expedita quod aut esse. Dicta qui molestiae quaerat dolores. Ad impedit voluptas et in dolor explicabo officiis. Voluptate molestiae assumenda neque. Qui qui aliquam id qui sunt reiciendis eveniet. A saepe ullam praesentium mollitia quae sapiente. Quia non ut illum ipsa ex aut placeat.', 'Aut nihil explicabo eaque enim cum ipsum necessitatibus. Aut sint excepturi quo tempora qui quae. Quos qui quo animi sapiente ad. Non ab ipsam veniam tenetur. Iste magni tempora et culpa sed minus. Quibusdam possimus magnam incidunt autem blanditiis placeat. Quisquam in quas enim consectetur laboriosam. Iusto voluptas praesentium aut non voluptates quibusdam. Ipsam omnis provident quia voluptatem voluptas esse.', 'img/fake/f82c0fade4b4d97c3998aa0970cf9d35.png', 'https://www.youtube.com/watch?v=errT-_IvDVg', '3', 1, '2021-03-10 10:45:45', '2021-03-10 10:45:45');

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
(1, 'B', 'B', '2021-03-10 10:46:20', '2021-03-12 03:44:26'),
(2, 'D', 'D', '2021-03-10 10:46:20', '2021-03-12 10:40:48'),
(4, 'C', 'C', '2021-03-10 10:46:20', '2021-03-12 03:44:34'),
(5, 'A', 'A', '2021-03-10 10:46:20', '2021-03-12 10:41:02');

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
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `title`, `bn_title`, `description`, `bn_description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Omnis illum ut a aut. Provident id doloribus architecto maxime commodi et.', 'Quia sed qui dolor quia quisquam aliquid ut. Explicabo vitae nihil nulla voluptatem.', 'Nulla asperiores vel iste atque esse. Perspiciatis et at autem sit ea rerum. Quia aperiam explicabo et sit quae occaecati. Et illo quaerat non hic. Optio in ea deserunt cumque. Rerum quidem cum adipisci dolorum. Magni molestiae et voluptas aliquid eos ducimus laboriosam. Sed impedit omnis aut assumenda nulla qui natus quo. Quae sit et facere enim. Omnis omnis et fugit. Similique iure repudiandae et ab rerum velit.', 'Ut amet excepturi ut deserunt qui numquam praesentium. Est quaerat repudiandae qui quibusdam pariatur. Dolorem maiores sit velit quo qui quos. Odio velit possimus iusto illo sunt maiores illo sunt. Voluptatem magnam necessitatibus repellat modi ratione. Occaecati aut eveniet tempore et odio iste adipisci. Quaerat ex vel molestiae perferendis dolor voluptatem harum. Quae similique atque quaerat eius explicabo. Excepturi vel officiis vitae sit rerum libero optio quibusdam. Nam et sint iste.', 'img/fake/8b5ef39833d4fafd1fc51e743f39e4b7.png', 1, '2021-03-10 10:46:19', '2021-03-10 10:46:19'),
(2, 5, 'Quo id aut fugit amet labore ut. Beatae a possimus laboriosam non sit. Quo earum et neque et.', 'Sint dolorem sint tenetur et nobis voluptatem deserunt. Porro sed numquam illum a harum.', 'Nulla dicta molestiae porro ex quia quia est ducimus. Voluptatibus quo dignissimos sed aut consectetur expedita dolores. Velit incidunt illum magnam ut. Provident ut et quo ut sunt. Est rerum et iste ut illo. Dolorem aspernatur quo nam harum id consectetur cupiditate. Molestiae omnis ipsum placeat repudiandae omnis voluptatem aliquid. Qui tempore distinctio molestias rerum est ab voluptatem. Nesciunt non eum doloremque voluptas vel. Et sed velit repellendus excepturi asperiores velit.', 'A dolor molestias commodi. Corrupti autem voluptatem ab quo. Nisi rerum odit perferendis nam voluptate facilis. A vel autem ipsam soluta harum distinctio. Voluptatem quasi voluptate officiis velit voluptatem quidem consequatur animi. Ab eos quo nulla itaque doloribus repellat voluptates. Aliquid incidunt sunt pariatur rerum et ut eveniet. Sed iusto et impedit eum officiis.', 'img/fake/5240e79aca9ff180a224578e029948a6.png', 1, '2021-03-10 10:46:19', '2021-03-10 10:46:19'),
(3, 3, 'Ut minus ut cupiditate odit. Dolorem harum et dolor architecto.', 'Praesentium ab sapiente aliquid. Impedit consequuntur earum repellat at natus expedita.', 'Enim et illo sit explicabo commodi facilis. Nobis laborum et porro ipsam nesciunt maxime. Est quia sapiente possimus aut nihil quibusdam. Corporis rerum excepturi eligendi consequatur. Exercitationem sit odio eos aliquid. Vitae nam dolores consequatur explicabo et consectetur. Debitis placeat rerum accusamus ea officia. Temporibus eos quidem repellendus totam expedita et ab. Quae corporis et fuga qui et est. Quaerat nihil ratione quo.', 'Molestiae pariatur ipsa aut iste totam provident. Et ea odio autem et quisquam libero aut. Quia facere dolorem possimus id molestiae ipsam. Inventore quae et aut totam quos debitis. Doloribus et eligendi doloremque explicabo eligendi. Est commodi excepturi rerum laudantium. Aspernatur aliquam et asperiores est reiciendis velit. Itaque dolorem sint aperiam et eligendi.', 'img/fake/b3f48a7fb59e9d65474d6d4b7c4cf62a.png', 1, '2021-03-10 10:46:20', '2021-03-13 03:16:19'),
(4, 3, 'vvv', 'bbb', 'Aspernatur quo qui qui deserunt inventore. Commodi et voluptas nobis tenetur incidunt. Nostrum vero in iste. Commodi necessitatibus deleniti delectus asperiores quas culpa. Optio ipsa magni neque quisquam id molestiae. Molestiae voluptatem et ad placeat fugit beatae. Sunt et voluptatem aut accusantium a consequuntur consequatur qui. Nostrum optio quod voluptas est ipsam.', 'Ducimus voluptatem laboriosam et quam et qui. Aliquam amet id quo nemo. Doloremque molestias minima minus. Quia ut saepe repudiandae ut est fugit qui. Suscipit voluptas quo dicta porro voluptas sit quisquam. Et sit veritatis hic velit. Dolor veritatis minus rerum quod. Rem dolorem et itaque. Esse est qui provident laborum. Perferendis ipsa quidem soluta ut modi ut vero ut.', 'abasvumi/uploads/images/blog/education_161562713956135729.jpg', 1, '2021-03-10 10:46:20', '2021-03-13 03:20:34'),
(5, 4, 'Natus illo incidunt consectetur et numquam omnis deserunt rem. Dolor ea magnam vitae quo.', 'Laborum omnis velit quis pariatur est. Ab enim perferendis fugit velit. Officiis harum sed nemo.', 'Recusandae sequi enim dicta sed est delectus perspiciatis culpa. Tenetur ipsa voluptate voluptates molestiae. Possimus alias omnis molestiae est praesentium voluptas minima. Velit rerum soluta dolores et. Non omnis iste voluptatem eum repellendus optio et. Quidem dolore illo sunt at quae unde. Incidunt ut et qui nesciunt occaecati ea cumque hic. Nisi omnis quo occaecati dicta molestiae. Occaecati quidem porro qui laborum dolorem. Nihil fuga est amet. Ducimus assumenda voluptatibus ut et.', 'At dicta et sit aut non adipisci maxime. Nostrum in expedita quibusdam error et similique. Natus officia accusantium mollitia odit velit est aut exercitationem. Animi repellat repellendus aut odit. Vel molestiae ea animi voluptatem consequatur nesciunt facilis. Nisi soluta reprehenderit ut officia qui saepe ut. Atque quasi aut eligendi doloribus dolore quis et. Id earum reprehenderit tempora tenetur repudiandae.', 'img/fake/f32dc82a6474ac30ea76e159cd2fa6bc.png', 1, '2021-03-10 10:46:20', '2021-03-10 10:46:20'),
(6, 2, 'sqqds', 'dsds', 'sds', 'dsdsds', 'abasvumi/uploads/images/blog/education_1615627253494077947.jpeg', 1, '2021-03-13 03:20:53', '2021-03-13 03:20:53');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `name_bn`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sit esse sint accusantium dolor non. Soluta et ipsam molestias placeat voluptatem accusantium.', 'Placeat illo et consequuntur ut adipisci consectetur cupiditate. Et harum quam expedita dolores.', 'img/fake/56395571954c264adcae32acfa15bac2.png', 1, '2021-03-10 10:45:54', '2021-03-10 10:45:54'),
(2, 'Et dolor vero illum laborum. Aliquam quia et ipsa. Accusantium rerum soluta odio nihil.', 'Ut est alias voluptatibus iusto nulla ea sint. Explicabo rem esse blanditiis.', 'img/fake/c3ebf46df94176de32ab5b3347ef24d7.png', 1, '2021-03-10 10:45:54', '2021-03-10 10:45:54'),
(3, 'Samsung', 'স্যামসাং', 'abasvumi/uploads/images/brand/video_1615622489785257341.jpeg', 1, '2021-03-10 10:45:54', '2021-03-13 02:01:29'),
(5, 'Sed aut earum impedit ullam repudiandae voluptas assumenda. Voluptas ipsam ipsa quo magni ut at.', 'Repellendus quia ad incidunt animi ea. Alias dicta non magnam nam asperiores quaerat nam minima.', 'img/fake/f23d0fecefe8923a37788c24cf8b5805.png', 1, '2021-03-10 10:45:55', '2021-03-10 10:45:55'),
(6, 'Mobile', 'dfdfd', 'abasvumi/uploads/images/brand/video_1615622510520673625.jpg', NULL, '2021-03-13 02:01:50', '2021-03-13 02:01:50');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `is_menu` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `name_bn`, `status`, `is_menu`, `created_at`, `updated_at`) VALUES
(1, 'Dicta ad.', 'Enim cum.', 1, 1, '2021-03-10 10:45:55', '2021-03-13 02:15:09'),
(2, 'Et atque.', 'Qui sint.', 1, 0, '2021-03-10 10:45:56', '2021-03-10 10:45:56'),
(3, 'Vitae.', 'Illum.', 1, 0, '2021-03-10 10:45:56', '2021-03-10 10:45:56'),
(4, 'Dicta est.', 'Nulla.', 1, 0, '2021-03-10 10:45:56', '2021-03-10 10:45:56'),
(5, 'Eos.', 'Qui sunt.', 1, 0, '2021-03-10 10:45:56', '2021-03-10 10:45:56');

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

-- --------------------------------------------------------

--
-- Table structure for table `dhaka_neigbors`
--

CREATE TABLE `dhaka_neigbors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dhaka_neigbors`
--

INSERT INTO `dhaka_neigbors` (`id`, `name`, `name_bn`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Id.', 'Aut quia.', 1, '2021-03-10 10:45:57', '2021-03-10 10:45:57'),
(2, 'Eligendi.', 'Vel nisi.', 1, '2021-03-10 10:45:57', '2021-03-10 10:45:57'),
(3, 'fgfgfg', 'gfgfgfgf', 1, '2021-03-10 10:45:57', '2021-03-13 04:51:27'),
(4, 'Quia ipsa.', 'Iste.', 1, '2021-03-10 10:45:58', '2021-03-10 10:45:58'),
(5, 'Numquam.', 'Qui.', 1, '2021-03-10 10:45:58', '2021-03-10 10:45:58'),
(6, 'dfdf', 'dfdfd', NULL, '2021-03-13 04:50:49', '2021-03-13 04:50:49'),
(7, 'dfdfd', 'fdfdfdfd', NULL, '2021-03-13 04:51:02', '2021-03-13 04:51:02');

-- --------------------------------------------------------

--
-- Table structure for table `dhaka_neigbor_areas`
--

CREATE TABLE `dhaka_neigbor_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dhaka_neigbor_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dhaka_neigbor_areas`
--

INSERT INTO `dhaka_neigbor_areas` (`id`, `dhaka_neigbor_id`, `area_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2021-03-13 05:35:09', '2021-03-13 05:35:09'),
(2, 2, 2, '2021-03-13 05:36:36', '2021-03-13 05:36:36');

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
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `division_id`, `name`, `bn_name`, `url`, `lat`, `lon`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Comilla', 'কুমিল্লা', 'www.comilla.gov.bd', '23.4682747', '91.1788135', 'comilla', 1, '2021-03-10 10:44:37', '2021-03-10 10:44:37'),
(2, 1, 'Feni', 'ফেনী', 'www.feni.gov.bd', '23.023231', '91.3840844', 'feni', 1, '2021-03-10 10:44:37', '2021-03-10 10:44:37'),
(3, 1, 'Brahmanbaria', 'ব্রাহ্মণবাড়িয়া', 'www.brahmanbaria.gov.bd', '23.9570904', '91.1119286', 'brahmanbaria', 1, '2021-03-10 10:44:37', '2021-03-10 10:44:37'),
(4, 1, 'Rangamati', 'রাঙ্গামাটি', 'www.rangamati.gov.bd', NULL, NULL, 'rangamati', 1, '2021-03-10 10:44:38', '2021-03-10 10:44:38'),
(5, 1, 'Noakhali', 'নোয়াখালী', 'www.noakhali.gov.bd', '22.869563', '91.099398', 'noakhali', 1, '2021-03-10 10:44:38', '2021-03-10 10:44:38'),
(6, 1, 'Chandpur', 'চাঁদপুর', 'www.chandpur.gov.bd', '23.2332585', '90.6712912', 'chandpur', 1, '2021-03-10 10:44:38', '2021-03-10 10:44:38'),
(7, 1, 'Lakshmipur', 'লক্ষ্মীপুর', 'www.lakshmipur.gov.bd', '22.942477', '90.841184', 'lakshmipur', 1, '2021-03-10 10:44:38', '2021-03-10 10:44:38'),
(8, 1, 'Chattogram', 'চট্টগ্রাম', 'www.chittagong.gov.bd', '22.335109', '91.834073', 'chattogram', 1, '2021-03-10 10:44:38', '2021-03-10 10:44:38'),
(9, 1, 'Coxsbazar', 'কক্সবাজার', 'www.coxsbazar.gov.bd', NULL, NULL, 'coxsbazar', 1, '2021-03-10 10:44:38', '2021-03-10 10:44:38'),
(10, 1, 'Khagrachhari', 'খাগড়াছড়ি', 'www.khagrachhari.gov.bd', '23.119285', '91.984663', 'khagrachhari', 1, '2021-03-10 10:44:38', '2021-03-10 10:44:38'),
(11, 1, 'Bandarban', 'বান্দরবান', 'www.bandarban.gov.bd', '22.1953275', '92.2183773', 'bandarban', 1, '2021-03-10 10:44:38', '2021-03-10 10:44:38'),
(12, 2, 'Sirajganj', 'সিরাজগঞ্জ', 'www.sirajganj.gov.bd', '24.4533978', '89.7006815', 'sirajganj', 1, '2021-03-10 10:44:38', '2021-03-10 10:44:38'),
(13, 2, 'Pabna', 'পাবনা', 'www.pabna.gov.bd', '23.998524', '89.233645', 'pabna', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(14, 2, 'Bogura', 'বগুড়া', 'www.bogra.gov.bd', '24.8465228', '89.377755', 'bogura', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(15, 2, 'Rajshahi', 'রাজশাহী', 'www.rajshahi.gov.bd', NULL, NULL, 'rajshahi', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(16, 2, 'Natore', 'নাটোর', 'www.natore.gov.bd', '24.420556', '89.000282', 'natore', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(17, 2, 'Joypurhat', 'জয়পুরহাট', 'www.joypurhat.gov.bd', NULL, NULL, 'joypurhat', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(18, 2, 'Chapainawabganj', 'চাঁপাইনবাবগঞ্জ', 'www.chapainawabganj.gov.bd', '24.5965034', '88.2775122', 'chapainawabganj', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(19, 2, 'Naogaon', 'নওগাঁ', 'www.naogaon.gov.bd', NULL, NULL, 'naogaon', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(20, 3, 'Jashore', 'যশোর', 'www.jessore.gov.bd', '23.16643', '89.2081126', 'jashore', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(21, 3, 'Satkhira', 'সাতক্ষীরা', 'www.satkhira.gov.bd', NULL, NULL, 'satkhira', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(22, 3, 'Meherpur', 'মেহেরপুর', 'www.meherpur.gov.bd', '23.762213', '88.631821', 'meherpur', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(23, 3, 'Narail', 'নড়াইল', 'www.narail.gov.bd', '23.172534', '89.512672', 'narail', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(24, 3, 'Chuadanga', 'চুয়াডাঙ্গা', 'www.chuadanga.gov.bd', '23.6401961', '88.841841', 'chuadanga', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(25, 3, 'Kushtia', 'কুষ্টিয়া', 'www.kushtia.gov.bd', '23.901258', '89.120482', 'kushtia', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(26, 3, 'Magura', 'মাগুরা', 'www.magura.gov.bd', '23.487337', '89.419956', 'magura', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(27, 3, 'Khulna', 'খুলনা', 'www.khulna.gov.bd', '22.815774', '89.568679', 'khulna', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(28, 3, 'Bagerhat', 'বাগেরহাট', 'www.bagerhat.gov.bd', '22.651568', '89.785938', 'bagerhat', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(29, 3, 'Jhenaidah', 'ঝিনাইদহ', 'www.jhenaidah.gov.bd', '23.5448176', '89.1539213', 'jhenaidah', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(30, 4, 'Jhalakathi', 'ঝালকাঠি', 'www.jhalakathi.gov.bd', NULL, NULL, 'jhalakathi', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(31, 4, 'Patuakhali', 'পটুয়াখালী', 'www.patuakhali.gov.bd', '22.3596316', '90.3298712', 'patuakhali', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(32, 4, 'Pirojpur', 'পিরোজপুর', 'www.pirojpur.gov.bd', NULL, NULL, 'pirojpur', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(33, 4, 'Barisal', 'বরিশাল', 'www.barisal.gov.bd', NULL, NULL, 'barisal', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(34, 4, 'Bhola', 'ভোলা', 'www.bhola.gov.bd', '22.685923', '90.648179', 'bhola', 1, '2021-03-10 10:44:39', '2021-03-10 10:44:39'),
(35, 4, 'Barguna', 'বরগুনা', 'www.barguna.gov.bd', NULL, NULL, 'barguna', 1, '2021-03-10 10:44:40', '2021-03-10 10:44:40'),
(36, 5, 'Sylhet', 'সিলেট', 'www.sylhet.gov.bd', '24.8897956', '91.8697894', 'sylhet', 1, '2021-03-10 10:44:40', '2021-03-10 10:44:40'),
(37, 5, 'Moulvibazar', 'মৌলভীবাজার', 'www.moulvibazar.gov.bd', '24.482934', '91.777417', 'moulvibazar', 1, '2021-03-10 10:44:40', '2021-03-10 10:44:40'),
(38, 5, 'Habiganj', 'হবিগঞ্জ', 'www.habiganj.gov.bd', '24.374945', '91.41553', 'habiganj', 1, '2021-03-10 10:44:40', '2021-03-10 10:44:40'),
(39, 5, 'Sunamganj', 'সুনামগঞ্জ', 'www.sunamganj.gov.bd', '25.0658042', '91.3950115', 'sunamganj', 1, '2021-03-10 10:44:40', '2021-03-10 10:44:40'),
(40, 6, 'Narsingdi', 'নরসিংদী', 'www.narsingdi.gov.bd', '23.932233', '90.71541', 'narsingdi', 1, '2021-03-10 10:44:40', '2021-03-10 10:44:40'),
(41, 6, 'Gazipur', 'গাজীপুর', 'www.gazipur.gov.bd', '24.0022858', '90.4264283', 'gazipur', 1, '2021-03-10 10:44:40', '2021-03-10 10:44:40'),
(42, 6, 'Shariatpur', 'শরীয়তপুর', 'www.shariatpur.gov.bd', NULL, NULL, 'shariatpur', 1, '2021-03-10 10:44:40', '2021-03-10 10:44:40'),
(43, 6, 'Narayanganj', 'নারায়ণগঞ্জ', 'www.narayanganj.gov.bd', '23.63366', '90.496482', 'narayanganj', 1, '2021-03-10 10:44:40', '2021-03-10 10:44:40'),
(44, 6, 'Tangail', 'টাঙ্গাইল', 'www.tangail.gov.bd', NULL, NULL, 'tangail', 1, '2021-03-10 10:44:40', '2021-03-10 10:44:40'),
(45, 6, 'Kishoreganj', 'কিশোরগঞ্জ', 'www.kishoreganj.gov.bd', '24.444937', '90.776575', 'kishoreganj', 1, '2021-03-10 10:44:40', '2021-03-10 10:44:40'),
(46, 6, 'Manikganj', 'মানিকগঞ্জ', 'www.manikganj.gov.bd', NULL, NULL, 'manikganj', 1, '2021-03-10 10:44:40', '2021-03-10 10:44:40'),
(47, 6, 'Dhaka', 'ঢাকা', 'www.dhaka.gov.bd', '23.7115253', '90.4111451', 'dhaka', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41'),
(48, 6, 'Munshiganj', 'মুন্সিগঞ্জ', 'www.munshiganj.gov.bd', NULL, NULL, 'munshiganj', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41'),
(49, 6, 'Rajbari', 'রাজবাড়ী', 'www.rajbari.gov.bd', '23.7574305', '89.6444665', 'rajbari', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41'),
(50, 6, 'Madaripur', 'মাদারীপুর', 'www.madaripur.gov.bd', '23.164102', '90.1896805', 'madaripur', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41'),
(51, 6, 'Gopalganj', 'গোপালগঞ্জ', 'www.gopalganj.gov.bd', '23.0050857', '89.8266059', 'gopalganj', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41'),
(52, 6, 'Faridpur', 'ফরিদপুর', 'www.faridpur.gov.bd', '23.6070822', '89.8429406', 'faridpur', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41'),
(53, 7, 'Panchagarh', 'পঞ্চগড়', 'www.panchagarh.gov.bd', '26.3411', '88.5541606', 'panchagarh', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41'),
(54, 7, 'Dinajpur', 'দিনাজপুর', 'www.dinajpur.gov.bd', '25.6217061', '88.6354504', 'dinajpur', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41'),
(55, 7, 'Lalmonirhat', 'লালমনিরহাট', 'www.lalmonirhat.gov.bd', NULL, NULL, 'lalmonirhat', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41'),
(56, 7, 'Nilphamari', 'নীলফামারী', 'www.nilphamari.gov.bd', '25.931794', '88.856006', 'nilphamari', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41'),
(57, 7, 'Gaibandha', 'গাইবান্ধা', 'www.gaibandha.gov.bd', '25.328751', '89.528088', 'gaibandha', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41'),
(58, 7, 'Thakurgaon', 'ঠাকুরগাঁও', 'www.thakurgaon.gov.bd', '26.0336945', '88.4616834', 'thakurgaon', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41'),
(59, 7, 'Rangpur', 'রংপুর', 'www.rangpur.gov.bd', '25.7558096', '89.244462', 'rangpur', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41'),
(60, 7, 'Kurigram', 'কুড়িগ্রাম', 'www.kurigram.gov.bd', '25.805445', '89.636174', 'kurigram', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41'),
(61, 8, 'Sherpur', 'শেরপুর', 'www.sherpur.gov.bd', '25.0204933', '90.0152966', 'sherpur', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41'),
(62, 8, 'Mymensingh', 'ময়মনসিংহ', 'www.mymensingh.gov.bd', NULL, NULL, 'mymensingh', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41'),
(63, 8, 'Jamalpur', 'জামালপুর', 'www.jamalpur.gov.bd', '24.937533', '89.937775', 'jamalpur', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41'),
(64, 8, 'Netrokona', 'নেত্রকোণা', 'www.netrokona.gov.bd', '24.870955', '90.727887', 'netrokona', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `name`, `bn_name`, `slug`, `url`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Chattagram', 'চট্টগ্রাম', 'chattagram', 'www.chittagongdiv.gov.bd', 1, '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(2, 'Rajshahi', 'রাজশাহী', 'rajshahi', 'www.rajshahidiv.gov.bd', 1, '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(3, 'Khulna', 'খুলনা', 'khulna', 'www.khulnadiv.gov.bd', 1, '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(4, 'Barisal', 'বরিশাল', 'barisal', 'www.barisaldiv.gov.bd', 1, '2021-03-10 10:44:37', '2021-03-10 10:44:37'),
(5, 'Sylhet', 'সিলেট', 'sylhet', 'www.sylhetdiv.gov.bd', 1, '2021-03-10 10:44:37', '2021-03-10 10:44:37'),
(6, 'Dhaka', 'ঢাকা', 'dhaka', 'www.dhakadiv.gov.bd', 1, '2021-03-10 10:44:37', '2021-03-10 10:44:37'),
(7, 'Rangpur', 'রংপুর', 'rangpur', 'www.rangpurdiv.gov.bd', 1, '2021-03-10 10:44:37', '2021-03-10 10:44:37'),
(8, 'Mymensingh', 'ময়মনসিংহ', 'mymensingh', 'www.mymensinghdiv.gov.bd', 1, '2021-03-10 10:44:37', '2021-03-10 10:44:37');

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
(1, 1, 1, 1, 'Mobile', 'dfdfdf', 'dfdfd', 'fdf', '4534343', '343434343', '1', 'abasvumi/uploads/images/education/education_1615660328394360255.png', '2021-03-13 12:32:08', '2021-03-13 12:32:08'),
(2, 1, 1, 1, 'Mobilefdf', 'fdfdfd', 'dfdfd', 'fdfdfd', '34454545', '4324234334', '1', 'abasvumi/uploads/images/education/education_1615660383626690179.png', '2021-03-13 12:33:03', '2021-03-13 12:33:03');

-- --------------------------------------------------------

--
-- Table structure for table `external_users`
--

CREATE TABLE `external_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL COMMENT '1=agents, 2=developers, 3=supplers',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_bn` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biography` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biography_bn` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `is_featured` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `external_users`
--

INSERT INTO `external_users` (`id`, `name`, `name_bn`, `email`, `password`, `phone`, `address`, `user_type`, `image`, `address_bn`, `biography`, `biography_bn`, `facebook_link`, `twitter_link`, `linkedin_link`, `status`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 'Ms. Belle Nolan', NULL, 'abshire.antoinette@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '01730233085', 'Et est minus tenetur quia. Fugiat enim nulla aut. Qui ratione expedita est hic aut.', 3, '', 'Consequuntur perspiciatis soluta est nesciunt. Laborum dolor alias quibusdam dicta non et.', 'Et est minus tenetur quia. Fugiat enim nulla aut. Qui ratione expedita est hic aut.Et est minus tenetur quia. Fugiat enim nulla aut. Qui ratione expedita est hic aut.\r\nEmma Connor\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiamrisus tortor, accumsan\r\n\r\navatar-2\r\nMartin Smith\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiamrisus tortor, accumsan', 'Et est minus tenetur quia. Fugiat enim nulla aut. Qui ratione expedita est hic aut.Et est minus tenetur quia. Fugiat enim nulla aut. Qui ratione expedita est hic aut.\r\nEmma Connor\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiamrisus tortor, accumsan\r\n\r\navatar-2\r\nMartin Smith\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiamrisus tortor, accumsan', 'https://facebook.com', 'https://twitter.com', 'https://linkedin.com', 0, 0, '2021-03-10 10:44:35', '2021-03-10 10:44:35'),
(2, 'Kara Stroman I', NULL, 'mossie70@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '01730233016', 'Aliquam sed maiores dolorem. Officia culpa repellendus eaque fugiat quia quia.', 3, '', 'Placeat consectetur aut optio in ut cum. Voluptatem eos tenetur aut reiciendis.', NULL, NULL, 'https://facebook.com', 'https://twitter.com', 'https://linkedin.com', 0, 0, '2021-03-10 10:44:35', '2021-03-10 10:44:35'),
(3, 'Lucas Yost I', NULL, 'amara43@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '01730233059', 'Ex ipsam eos placeat qui. Qui incidunt et ut qui et quas. Ut labore voluptatem ex.', 1, '', 'Blanditiis eum ea voluptatum autem rerum vel. Illum illo et facilis. Nulla qui illo ratione.', NULL, NULL, 'https://facebook.com', 'https://twitter.com', 'https://linkedin.com', 0, 0, '2021-03-10 10:44:35', '2021-03-10 10:44:35'),
(4, 'Brendan Hartmann Jr.', 'uyuyi', 'bartholome25@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '01730233073', 'Ut corrupti animi qui. Nisi in in et fuga veniam. Aut error rerum doloribus eos.', 2, 'abasvumi/uploads/images/ExternalUser/1616249711.jpg', 'Sit laborum sed provident voluptas velit voluptatem doloremque. Ex ut eius distinctio et nobis aut.', NULL, NULL, 'https://facebook.com', 'https://twitter.com', 'https://linkedin.com', 0, 1, '2021-03-10 10:44:36', '2021-03-20 08:15:11'),
(5, 'Lorenzo Wisoky V', 'fd', 'schaden.rogelio@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '01730233079', 'Illum quidem et dolores. Reprehenderit dolorum ut delectus ratione eligendi.', 1, 'abasvumi/uploads/images/ExternalUser/1615753397.png', 'Dolorem iste animi saepe aut. Quasi odio ex ab provident fuga.', NULL, NULL, 'https://facebook.com', 'https://twitter.com', 'https://linkedin.com', 0, 1, '2021-03-10 10:44:36', '2021-03-14 14:23:17'),
(6, 'Shyanne Wisoky', NULL, 'padberg.tatum@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '01730233091', 'Dolorem sint maiores culpa velit. Ratione voluptas et qui. Est suscipit aperiam tempore.', 2, '', 'Ipsam incidunt maiores deleniti est et est nihil dolorem. Recusandae corrupti quo fugit nihil.', NULL, NULL, 'https://facebook.com', 'https://twitter.com', 'https://linkedin.com', 0, 0, '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(7, 'Grant Braun', NULL, 'horacio.doyle@example.net', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '01730233092', 'Omnis nihil aspernatur eos eum. Quod temporibus dolorum eum eum perferendis. Ea omnis et neque est.', 3, '', 'Quo quis aut est laudantium quos laboriosam quas. Rem et unde qui enim.', NULL, NULL, 'https://facebook.com', 'https://twitter.com', 'https://linkedin.com', 0, 1, '2021-03-10 10:44:36', '2021-03-12 15:38:08'),
(8, 'Dr. Mariam Heathcote Sr.', NULL, 'soledad.huels@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '01730233021', 'Facere excepturi quia dolores. Repellat id eos omnis ullam. Nulla neque inventore harum voluptas.', 2, '', 'Veniam aut rerum et et. Provident perspiciatis quo officiis. Quam autem et vel voluptate.', NULL, NULL, 'https://facebook.com', 'https://twitter.com', 'https://linkedin.com', 0, 0, '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(9, 'Tyrel Bahringer', 'টায়ারেল বাহরিনগার', 'dbartoletti@example.org', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '01730233024', 'Natus odio debitis corporis et. Debitis id aut qui et illum dolores rerum. Ex itaque ut vero.', 1, 'abasvumi/uploads/images/ExternalUser/1615753252.png', 'Odio eligendi veritatis labore libero et. Occaecati corrupti sunt non nisi eaque.', NULL, NULL, 'https://facebook.com', 'https://twitter.com', 'https://linkedin.com', 1, 1, '2021-03-10 10:44:36', '2021-03-15 11:40:09'),
(10, 'Oswald O\'Connell', NULL, 'wcollier@example.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '01730233059', 'Ratione recusandae ipsa velit voluptate corrupti. Aut earum nihil fugiat doloribus qui a.', 3, '', 'Unde architecto sit aut eos. Omnis doloremque ad commodi ut.', NULL, NULL, 'https://facebook.com', 'https://twitter.com', 'https://linkedin.com', 0, 0, '2021-03-10 10:44:36', '2021-03-10 10:44:36');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_01_08_152553_create_service_types_table', 1),
(6, '2020_12_12_011948_create_roles_table', 1),
(7, '2020_12_13_044332_create_agents_table', 1),
(8, '2020_12_13_045137_create_developers_table', 1),
(9, '2020_12_13_045248_create_divisions_table', 1),
(10, '2020_12_13_045403_create_districts_table', 1),
(11, '2020_12_13_045601_create_thanas_table', 1),
(12, '2020_12_13_045910_create_educational_institutes_table', 1),
(13, '2020_12_13_050043_create_restaurants_table', 1),
(14, '2020_12_13_050113_create_hospitals_table', 1),
(15, '2020_12_13_050134_create_parks_table', 1),
(16, '2020_12_13_050147_create_videos_table', 1),
(17, '2020_12_13_050745_create_areas_table', 1),
(18, '2020_12_13_050819_create_area_guides_table', 1),
(19, '2020_12_13_050841_create_blocks_table', 1),
(20, '2020_12_13_051014_create_amenitis_table', 1),
(21, '2020_12_13_051156_create_services_table', 1),
(22, '2020_12_13_051216_create_categories_table', 1),
(23, '2020_12_13_051240_create_blogs_table', 1),
(24, '2020_12_13_051342_create_testimonials_table', 1),
(25, '2020_12_13_051402_create_companies_table', 1),
(26, '2020_12_13_051500_create_real_estate_solutions_table', 1),
(27, '2020_12_15_072544_create_religious_institutions_table', 1),
(28, '2021_01_02_091425_add_bn_name_to_amenitis_table', 1),
(29, '2021_01_22_172650_create_suppliers_table', 1),
(30, '2021_02_03_121825_create_serviceimages_table', 1),
(31, '2021_02_24_155034_create_external_users_table', 1),
(32, '2021_02_24_161020_create_properties_table', 1),
(33, '2021_02_24_161031_create_prosucts_table', 1),
(34, '2021_02_24_163940_create_product_categories_table', 1),
(35, '2021_02_24_164114_create_all_services_table', 1),
(36, '2021_02_24_164206_create_units_table', 1),
(37, '2021_02_24_164322_create_service_categories_table', 1),
(38, '2021_02_26_181622_create_property_images_table', 1),
(39, '2021_03_01_172114_create_products_table', 1),
(40, '2021_03_02_190202_create_upazilas_table', 1),
(41, '2021_03_02_192001_create_property_locations_table', 1),
(42, '2021_03_04_163438_create_settings_table', 1),
(43, '2021_03_04_163553_create_dhaka_neigbors_table', 1),
(44, '2021_03_04_163620_create_popular_places_table', 1),
(45, '2021_03_04_163935_create_subscribes_table', 1),
(46, '2021_03_05_065436_create_brands_table', 1),
(47, '2021_03_07_165020_create_dhaka_neigbor_areas_table', 1),
(48, '2021_03_12_100144_create_property_types_table', 2);

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
(1, 'App\\Models\\ExternalUser', 9, 'admin', '6c3d32e311dccceaf4f4c9beaee728aea3828c174023719c9ebe5b62b7a4fc51', '[\"*\"]', '2021-03-13 12:33:32', '2021-03-13 12:22:58', '2021-03-13 12:33:32'),
(2, 'App\\Models\\ExternalUser', 9, 'admin', '01489e1115b7415c5385fc3a38d9463cd9743bb1d3cc34839edeef21061357a0', '[\"*\"]', '2021-03-14 14:20:53', '2021-03-13 12:36:18', '2021-03-14 14:20:53'),
(3, 'App\\Models\\ExternalUser', 5, 'admin', '3d94153a49b6e07146d24d4c97aad604eff2efeb3791db130402a553e92a721f', '[\"*\"]', '2021-03-14 14:53:59', '2021-03-14 14:22:29', '2021-03-14 14:53:59'),
(4, 'App\\Models\\ExternalUser', 9, 'admin', '84fca243dab3e0e325a62174ee720108dfb9fd2634273b2c2c7170ea374b5118', '[\"*\"]', '2021-03-15 10:23:03', '2021-03-15 10:23:03', '2021-03-15 10:23:03'),
(5, 'App\\Models\\ExternalUser', 9, 'admin', '23d2537f6d583d9c9f20b0466b13276207e89a6d50428a8d9534746dbd3d49cf', '[\"*\"]', '2021-03-15 10:35:16', '2021-03-15 10:34:10', '2021-03-15 10:35:16'),
(6, 'App\\Models\\ExternalUser', 9, 'admin', 'b611911f75c74e1f8541fea811a08ee5592277ff9ec614728f9907924027b342', '[\"*\"]', '2021-03-15 10:35:49', '2021-03-15 10:35:48', '2021-03-15 10:35:49'),
(7, 'App\\Models\\ExternalUser', 9, 'admin', '8a24792e21bda0f1fb4a125f60a2057bd58d47976700b94fd01e56a83304ae36', '[\"*\"]', '2021-03-15 10:43:08', '2021-03-15 10:38:22', '2021-03-15 10:43:08'),
(8, 'App\\Models\\ExternalUser', 9, 'admin', 'a6cc8385464c9913fa70865c2b92c0190802973d8110493a29aa6562c8f2d59b', '[\"*\"]', '2021-03-15 10:45:49', '2021-03-15 10:45:48', '2021-03-15 10:45:49'),
(9, 'App\\Models\\ExternalUser', 9, 'admin', '6b97b222d76e0ebc65778b85696641afef9d10bd66fb0e4386a525c9dd6e899f', '[\"*\"]', '2021-03-15 10:47:24', '2021-03-15 10:47:23', '2021-03-15 10:47:24'),
(10, 'App\\Models\\ExternalUser', 9, 'admin', 'f342c6ad1e31008f5ba2778b69caff3c781d18496bbab010797c387e471051dc', '[\"*\"]', '2021-03-17 20:47:31', '2021-03-15 10:48:10', '2021-03-17 20:47:31'),
(11, 'App\\Models\\ExternalUser', 9, 'admin', 'c49abe8c6da962a04204c92337bbdf266b73a1794e054a52909198295fdb8bea', '[\"*\"]', '2021-03-19 07:13:00', '2021-03-19 00:30:58', '2021-03-19 07:13:00'),
(12, 'App\\Models\\ExternalUser', 9, 'admin', '749f0bcfb6d6582d20e7862284185007874c1e2d0c910b2346c2fcad273d80c9', '[\"*\"]', NULL, '2021-03-19 07:15:02', '2021-03-19 07:15:02'),
(13, 'App\\Models\\ExternalUser', 9, 'admin', '1839e5ff36b6faab945effb68a7e11fe1d3f4be80c2b3a6a1e17bb47960d78cd', '[\"*\"]', NULL, '2021-03-19 07:15:13', '2021-03-19 07:15:13'),
(14, 'App\\Models\\ExternalUser', 9, 'admin', 'c4c0b058839db9d2f91f7875155de1f5afea0044eaa0df98154027bd8d5a6dfc', '[\"*\"]', NULL, '2021-03-19 07:15:58', '2021-03-19 07:15:58'),
(15, 'App\\Models\\ExternalUser', 9, 'admin', '4b04d652fe1c7647200ffffc2ba4a5f17e564bb27f601c017212bf096942b853', '[\"*\"]', NULL, '2021-03-19 07:16:05', '2021-03-19 07:16:05'),
(16, 'App\\Models\\ExternalUser', 9, 'admin', '9d200fc59dbef00d837eef4ee7119b7f234ee605d3828166d15b07bf54fa14be', '[\"*\"]', NULL, '2021-03-19 07:16:14', '2021-03-19 07:16:14'),
(17, 'App\\Models\\ExternalUser', 9, 'admin', 'a011c3b0c7b99ade31ccb3fe7cc357f1e71f6f7d58dfeddd58db6bd562da1593', '[\"*\"]', '2021-03-19 11:17:37', '2021-03-19 07:16:31', '2021-03-19 11:17:37'),
(18, 'App\\Models\\ExternalUser', 9, 'admin', '029f7d4f0e8f7f596f63885ddb87caaf35ea740129013b4c8d77e6694d63ed6a', '[\"*\"]', '2021-03-19 11:30:06', '2021-03-19 11:17:49', '2021-03-19 11:30:06'),
(19, 'App\\Models\\ExternalUser', 9, 'admin', 'e28e178c6fb1f3fed9d96bc271eebacb26afe121b1615b7e0f062c8cb538a4eb', '[\"*\"]', NULL, '2021-03-19 11:31:35', '2021-03-19 11:31:35'),
(20, 'App\\Models\\ExternalUser', 9, 'admin', 'b7fad3043b6e80c14b5f1af240dbf8f04be5bd34d9282fab3017ce5fb623194e', '[\"*\"]', NULL, '2021-03-19 11:31:40', '2021-03-19 11:31:40'),
(21, 'App\\Models\\ExternalUser', 9, 'admin', 'b3eab04be8fc85246def58d16770fe004aab166b47b6c9a3702f452a8b4880d4', '[\"*\"]', NULL, '2021-03-19 11:32:45', '2021-03-19 11:32:45'),
(22, 'App\\Models\\ExternalUser', 9, 'admin', '58324825a91a6bdaf040f0f792a23bf0ab426f757f5010e8f4fb38e2d6451c5c', '[\"*\"]', '2021-03-20 08:11:08', '2021-03-19 11:33:03', '2021-03-20 08:11:08'),
(23, 'App\\Models\\ExternalUser', 4, 'admin', 'a63f4595b9d79421ce66b412c1bc8fdf1bacd17dfa34e07296f624a68ed410eb', '[\"*\"]', '2021-03-20 16:32:11', '2021-03-20 08:14:36', '2021-03-20 16:32:11');

-- --------------------------------------------------------

--
-- Table structure for table `popular_places`
--

CREATE TABLE `popular_places` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `popular_places`
--

INSERT INTO `popular_places` (`id`, `name`, `name_bn`, `property`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dhaka', 'Dhaka Bn', '735', 'abasvumi/uploads/img/pro_5.jpg', 1, '2021-03-10 10:46:07', '2021-03-10 10:46:07'),
(2, 'Rajshahi', 'Rajshahi', '829', 'abasvumi/uploads/img/pro_4.jpg', 1, '2021-03-10 10:46:07', '2021-03-10 10:46:07'),
(3, 'Chittagong', 'Chittagong Bn', '141', 'abasvumi/uploads/img/pro_3.jpg', 1, '2021-03-10 10:46:07', '2021-03-10 10:46:07'),
(4, 'Sylhet', 'Sylhet', '518', 'abasvumi/uploads/img/pro_2.jpeg', 1, '2021-03-10 10:46:08', '2021-03-10 10:46:08'),
(5, 'Id deserunt ex quam officiis dolorem. Facere unde laboriosam sapiente at repudiandae beatae aut.', 'Adipisci illum commodi modi. Autem veritatis exercitationem odit expedita. Et aut sit quia ut.', '380', 'abasvumi/uploads/img/pro_1.jpg', 1, '2021-03-10 10:46:08', '2021-03-10 10:46:08');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_user_id` bigint(20) UNSIGNED NOT NULL,
  `product_category_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_bn` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1 = pending, 2= approve',
  `is_featured` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `external_user_id`, `product_category_id`, `unit_id`, `name`, `name_bn`, `description`, `description_bn`, `image`, `price`, `status`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 2, 'Rerum expedita eum molestiae nihil.', 'Illo mollitia alias atque accusantium aspernatur ab consequatur.', 'Commodi et impedit neque numquam quam. Libero atque aut sunt et iure voluptas aperiam. Beatae perferendis ut ipsum est architecto inventore. Aliquid enim animi praesentium qui dolores. Accusamus voluptas placeat necessitatibus sit modi iusto ipsum. Commodi aut sed est minus cupiditate ducimus.', 'Ex et qui et error eum laboriosam enim. Eius id dolorem non ut excepturi magnam. Error perferendis aut fugit. Qui dolores rerum quam voluptas in inventore. Neque magnam est beatae corporis qui.', 'abasvumi/uploads/images/products/service_161624343185817415.jpg', '658758', 1, NULL, '2021-03-10 10:46:45', '2021-03-20 06:30:31'),
(2, 8, 3, 2, 'Officiis ipsum id et et culpa quisquam alias.', 'Odit et ullam at similique quia aspernatur. Deserunt quia neque quas tenetur.', 'In aut aut corporis quia eos. Error voluptatum odit molestiae. Non magni rerum nam quos iusto earum. Dolores aut et amet non et quibusdam. Voluptatum ratione deleniti nulla laborum incidunt assumenda. Occaecati qui quidem eum et et. Enim et iste consequatur dolorum enim rerum.', 'Fugit veniam nostrum reprehenderit nemo laboriosam ipsum voluptatem. Voluptate quae autem ea amet eligendi ad sit. Fugiat ab aut eaque et ullam. Exercitationem rerum et mollitia sit iure ratione in.', 'abasvumi/uploads/images/products/service_1616243824637446091.jpg', '45655688', 1, NULL, '2021-03-10 10:46:45', '2021-03-20 06:37:04');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `is_menu` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `name_bn`, `status`, `is_menu`, `created_at`, `updated_at`) VALUES
(1, 'Corporis.', 'Est et.', 1, 1, '2021-03-10 10:46:34', '2021-03-12 15:55:42'),
(2, 'Labore.', 'Ducimus.', 1, 0, '2021-03-10 10:46:35', '2021-03-10 10:46:35'),
(3, 'Fuga.', 'Quae.', 1, 0, '2021-03-10 10:46:35', '2021-03-10 10:46:35'),
(4, 'Et.', 'Vel esse.', 1, 0, '2021-03-10 10:46:35', '2021-03-10 10:46:35'),
(5, 'Veritatis.', 'Iste fuga.', 1, 0, '2021-03-10 10:46:35', '2021-03-10 10:46:35');

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_user_id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `thana_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `block_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description_bn` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bn_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_bn` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `interest_rate` double DEFAULT NULL,
  `sqft` double DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beds` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `baths` int(11) DEFAULT NULL,
  `purpose` tinyint(4) DEFAULT NULL COMMENT '1 = Sale, 2 = Rent',
  `advanced` tinyint(4) DEFAULT NULL COMMENT '0 = Any, 1 = Video Tour',
  `property_type` tinyint(4) DEFAULT NULL COMMENT '1 = Apartment, 2 = Penthouse, 3 = Plaza, 4 = Plot, 5 = Room, 6 = Duplex, 7 = Building',
  `garage` int(11) DEFAULT NULL,
  `balcony` int(11) DEFAULT NULL,
  `amenit_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hospital_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religious_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `park_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_no_show` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approval_status` tinyint(1) NOT NULL DEFAULT 0,
  `is_featured` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `property_id`, `external_user_id`, `division_id`, `district_id`, `thana_id`, `area_id`, `block_id`, `title`, `bn_title`, `short_description`, `short_description_bn`, `description`, `bn_description`, `address`, `address_bn`, `status`, `price`, `interest_rate`, `sqft`, `lat`, `lon`, `beds`, `baths`, `purpose`, `advanced`, `property_type`, `garage`, `balcony`, `amenit_ids`, `education_ids`, `hospital_ids`, `restaurant_ids`, `religious_ids`, `park_ids`, `video_link`, `contact_no`, `contact_no_show`, `contact_email`, `approval_status`, `is_featured`, `created_at`, `updated_at`) VALUES
(7, 'Abasvumi-ID754549', 4, 1, 1, 1, 3, 4, 'Duis nobis asperiore', 'Labore aute harum re', 'hg', 'rtr', 'This wonderful flat covers an area of 1550 Square Feet is situated in this notable building that you can see in our enlisted image. It can be a perfect home for your family which comes within your affordability. The flat has got 3 beds, 3 baths along with living room and a cozy kitchen. All the rooms are well spacious and lets you have the whole feel of solace and calmness with closed ones. This nice apartment is surely a reasonable deal for you comparing to the area the home is situated. The flat comes with an asking price of BDT 10,000,000. The locality has a wide variety of schools, colleges, Universities, hospitals and shops. An ample parking space comes with the offered flat for your vehicle accommodation. \r\n\r\nCome and see this apartment Contact us at your earliest to know more about this apartment.', 'এই দুর্দান্ত ফ্ল্যাটটি 1550 স্কয়ার ফিটের একটি অঞ্চল জুড়ে এই উল্লেখযোগ্য ভবনে অবস্থিত যা আপনি আমাদের তালিকাভুক্ত চিত্রটিতে দেখতে পারেন। এটি আপনার পরিবারের জন্য একটি নিখুঁত বাড়ি হতে পারে যা আপনার সাধ্যের মধ্যে আসে। ফ্ল্যাটে 3 টি শয্যা, 3 টি স্নানের পাশাপাশি লিভিং রুম এবং একটি আরামদায়ক রান্নাঘর রয়েছে। সমস্ত কক্ষগুলি বেশ প্রশস্ত এবং আপনাকে বন্ধ হওয়াগুলি দিয়ে স্বাচ্ছন্দ্য এবং শান্তির পুরো অনুভূতি পেতে দেয়। বাড়িটি যে জায়গার সাথে রয়েছে তার সাথে তুলনা করার জন্য এই দুর্দান্ত অ্যাপার্টমেন্টটি অবশ্যই আপনার পক্ষে যুক্তিসঙ্গত চুক্তি। ফ্ল্যাটটি 10,000,000 ডলারের জিজ্ঞাসা মূল্য নিয়ে আসে। লোকালয়ে বিভিন্ন স্কুল, কলেজ, বিশ্ববিদ্যালয়, হাসপাতাল এবং দোকান রয়েছে। আপনার যানবাহনের থাকার জন্য প্রস্তাবিত ফ্ল্যাট সহ একটি পর্যাপ্ত পার্কিং স্পেস আসে।\r\n\r\nআসুন এবং এই অ্যাপার্টমেন্টটি দেখুন এই অ্যাপার্টমেন্ট সম্পর্কে আরও জানতে আপনার তাড়াতাড়ি আমাদের সাথে যোগাযোগ করুন।', 'Mirput, Dhaka, Bangladesh', 'rtr', '0', 10000, 10000, 10, '34454545', '4324234334', NULL, 1, 1, NULL, 1, 1, 1, '[1,2]', '[1]', '[]', '[]', '[]', '[]', 'https://www.youtube.com/watch?v=yDmGQ_Wqb94', '343434', '2', 'mamunur@gmail.com', 0, 0, '2021-03-19 11:53:04', '2021-03-20 15:36:32');

-- --------------------------------------------------------

--
-- Table structure for table `property_images`
--

CREATE TABLE `property_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED DEFAULT NULL,
  `external_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_type_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=thumnail,2= details image',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_images`
--

INSERT INTO `property_images` (`id`, `property_id`, `external_user_id`, `image`, `image_type_id`, `created_at`, `updated_at`) VALUES
(21, 7, 9, 'abasvumi/uploads/properties/property_16161763641957133779.jpg', '2', '2021-03-19 11:52:44', '2021-03-19 11:53:04'),
(22, 7, 9, 'abasvumi/uploads/properties/property_1616176369334638433.jpg', '2', '2021-03-19 11:52:49', '2021-03-19 11:53:04'),
(23, 7, 9, 'abasvumi/uploads/properties/property_1616176373752386346.jpg', '2', '2021-03-19 11:52:53', '2021-03-19 11:53:04'),
(38, 0, 9, 'abasvumi/uploads/properties/property_1616181521953119840.jpg', '1', '2021-03-19 13:18:41', '2021-03-19 13:18:41'),
(40, 0, 9, 'abasvumi/uploads/properties/property_16161817761042335628.jpg', '1', '2021-03-19 13:22:56', '2021-03-19 13:22:56'),
(41, 0, 9, 'abasvumi/uploads/properties/property_1616181789706471384.jpg', '1', '2021-03-19 13:23:09', '2021-03-19 13:23:09'),
(42, 0, 9, 'abasvumi/uploads/properties/property_16161818691806805794.jpg', '1', '2021-03-19 13:24:29', '2021-03-19 13:24:29'),
(43, 0, 9, 'abasvumi/uploads/properties/property_16161818801307555564.jpg', '1', '2021-03-19 13:24:40', '2021-03-19 13:24:40'),
(44, 0, 9, 'abasvumi/uploads/properties/property_161618191759981936.jpg', '1', '2021-03-19 13:25:17', '2021-03-19 13:25:17'),
(46, 0, 9, 'abasvumi/uploads/properties/property_16161819341971054974.jpg', '2', '2021-03-19 13:25:34', '2021-03-19 13:25:34'),
(47, 0, 9, 'abasvumi/uploads/properties/property_161618194738712956.jpg', '2', '2021-03-19 13:25:47', '2021-03-19 13:25:47'),
(48, 0, 9, 'abasvumi/uploads/properties/property_16161821901538609637.jpg', '1', '2021-03-19 13:29:50', '2021-03-19 13:29:50'),
(50, 7, 9, 'abasvumi/uploads/properties/property_16161822751283892431.jpg', '1', '2021-03-19 13:31:15', '2021-03-19 13:31:20');

-- --------------------------------------------------------

--
-- Table structure for table `property_locations`
--

CREATE TABLE `property_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `upazila_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_types`
--

CREATE TABLE `property_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=recidential,2=commertial',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property_types`
--

INSERT INTO `property_types` (`id`, `category_id`, `name`, `bn_name`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', 'Office', 'অফিস', 1, '2021-03-12 04:53:21', '2021-03-12 10:43:02'),
(2, '1', 'Mobile', '656', 1, '2021-03-17 19:30:21', '2021-03-17 19:30:21'),
(3, '1', 'Mobile template', '65656', 1, '2021-03-17 19:30:27', '2021-03-17 19:30:27');

-- --------------------------------------------------------

--
-- Table structure for table `prosucts`
--

CREATE TABLE `prosucts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `external_user_id` bigint(20) UNSIGNED NOT NULL,
  `product_category_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_bn` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `serviceimages`
--

CREATE TABLE `serviceimages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_type_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=thumnail,2= details image',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `developer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `division_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `thana_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `block_id` bigint(20) UNSIGNED DEFAULT NULL,
  `service_type_id` bigint(20) UNSIGNED DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_menu` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`id`, `name`, `name_bn`, `status`, `created_at`, `updated_at`, `is_menu`) VALUES
(1, 'Corporis.', 'Est et.', 1, '2021-03-10 10:46:21', '2021-03-12 15:59:21', 1),
(2, 'Rem.', 'Veritatis.', 1, '2021-03-10 10:46:21', '2021-03-12 15:59:26', 1),
(3, 'Rerum.', 'Quaerat.', 0, '2021-03-10 10:46:21', '2021-03-13 04:46:25', NULL),
(4, 'Possimus.', 'Illo.', 1, '2021-03-10 10:46:21', '2021-03-10 10:46:21', 0),
(5, 'Nulla.', 'Aliquam.', 1, '2021-03-10 10:46:21', '2021-03-10 10:46:21', 0),
(7, 'trtr', 'rtrtrtr', NULL, '2021-03-13 04:47:36', '2021-03-13 04:47:36', 0),
(8, 'dfdfdf', 'dfdfdf', NULL, '2021-03-13 04:49:10', '2021-03-13 04:49:10', 0),
(9, 'fdfd', 'fdfdfd', NULL, '2021-03-13 04:49:21', '2021-03-13 04:49:21', 0),
(10, 'Mobile template', 'fdfd', NULL, '2021-03-13 04:50:20', '2021-03-13 04:50:20', 0);

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
(1, 'Mobile', 'erere', '2021-03-12 03:43:08', '2021-03-12 03:43:08');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_title_bn` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_description_bn` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_developer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_supplier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_sale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_rent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_bn` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `favicon`, `logo`, `home_title`, `home_title_bn`, `home_description`, `home_description_bn`, `total_agent`, `total_developer`, `total_supplier`, `total_sale`, `total_rent`, `footer_text`, `footer_text_bn`, `facebook_link`, `twitter_link`, `google_link`, `linkedin_link`, `email`, `mobile`, `address`, `address_bn`, `created_at`, `updated_at`) VALUES
(9, 'abasvumi/uploads/images/setting/setting_16155896201024787977.png', 'abasvumi/uploads/images/setting/setting_16155895911788254374.png', 'Welcome To Abasvumi', 'আপনাকে স্বাগতম', 'For sale or rent your property.', 'আপনার সম্পত্তি বিক্রয় বা ভাড়া দেওয়ার জন্য।', '434', '243', '434', '434', '4343', '2021 , Abasvumi.', '2021 , Abasvumi.', 'https://facebook.com', 'https://facebook.com', 'https://facebook.com', 'https://facebook.com', 'maymuna@gmail.com', '01730233032', 'dfdfdfd', 'Mirpur, Dhaka ,Bangladesh', '2021-03-12 16:51:18', '2021-03-12 16:54:39');

-- --------------------------------------------------------

--
-- Table structure for table `subscribes`
--

CREATE TABLE `subscribes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description_bn` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation_bn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `name_bn`, `description_bn`, `description`, `designation`, `designation_bn`, `image`, `created_at`, `updated_at`) VALUES
(1, 'xds', 'dfd', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in pulvinar neque. Nulla finibus lobortis pulvinar. Donec a consectetur nulla. Nulla posuere sapien vitae.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in pulvinar neque. Nulla finibus lobortis pulvinar. Donec a consectetur nulla. Nulla posuere sapien vitae.', 'Developers', 'Developers', 'abasvumi/uploads/img/test_img.jpg', NULL, NULL),
(2, 'ere', 'rere', 'rer', 'rer', 'rer', 'ere', 'abasvumi/uploads/img/test_img_2.jpg', NULL, NULL);

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
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `thanas`
--

INSERT INTO `thanas` (`id`, `district_id`, `name`, `bn_name`, `url`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Debidwar', 'দেবিদ্বার', 'debidwar.comilla.gov.bd', 'debidwar', 1, '2021-03-10 10:44:41', '2021-03-10 10:44:41'),
(2, 1, 'Barura', 'বরুড়া', 'barura.comilla.gov.bd', 'barura', 1, '2021-03-10 10:44:42', '2021-03-10 10:44:42'),
(3, 1, 'Brahmanpara', 'ব্রাহ্মণপাড়া', 'brahmanpara.comilla.gov.bd', 'brahmanpara', 1, '2021-03-10 10:44:42', '2021-03-10 10:44:42'),
(4, 1, 'Chandina', 'চান্দিনা', 'chandina.comilla.gov.bd', 'chandina', 1, '2021-03-10 10:44:42', '2021-03-10 10:44:42'),
(5, 1, 'Chauddagram', 'চৌদ্দগ্রাম', 'chauddagram.comilla.gov.bd', 'chauddagram', 1, '2021-03-10 10:44:42', '2021-03-10 10:44:42'),
(6, 1, 'Daudkandi', 'দাউদকান্দি', 'daudkandi.comilla.gov.bd', 'daudkandi', 1, '2021-03-10 10:44:42', '2021-03-10 10:44:42'),
(7, 1, 'Homna', 'হোমনা', 'homna.comilla.gov.bd', 'homna', 1, '2021-03-10 10:44:42', '2021-03-10 10:44:42'),
(8, 1, 'Laksam', 'লাকসাম', 'laksam.comilla.gov.bd', 'laksam', 1, '2021-03-10 10:44:42', '2021-03-10 10:44:42'),
(9, 1, 'Muradnagar', 'মুরাদনগর', 'muradnagar.comilla.gov.bd', 'muradnagar', 1, '2021-03-10 10:44:42', '2021-03-10 10:44:42'),
(10, 1, 'Nangalkot', 'নাঙ্গলকোট', 'nangalkot.comilla.gov.bd', 'nangalkot', 1, '2021-03-10 10:44:42', '2021-03-10 10:44:42'),
(11, 1, 'Comilla Sadar', 'কুমিল্লা সদর', 'comillasadar.comilla.gov.bd', 'comilla-sadar', 1, '2021-03-10 10:44:42', '2021-03-10 10:44:42'),
(12, 1, 'Meghna', 'মেঘনা', 'meghna.comilla.gov.bd', 'meghna', 1, '2021-03-10 10:44:42', '2021-03-10 10:44:42'),
(13, 1, 'Monohargonj', 'মনোহরগঞ্জ', 'monohargonj.comilla.gov.bd', 'monohargonj', 1, '2021-03-10 10:44:42', '2021-03-10 10:44:42'),
(14, 1, 'Sadarsouth', 'সদর দক্ষিণ', 'sadarsouth.comilla.gov.bd', 'sadarsouth', 1, '2021-03-10 10:44:42', '2021-03-10 10:44:42'),
(15, 1, 'Titas', 'তিতাস', 'titas.comilla.gov.bd', 'titas', 1, '2021-03-10 10:44:42', '2021-03-10 10:44:42'),
(16, 1, 'Burichang', 'বুড়িচং', 'burichang.comilla.gov.bd', 'burichang', 1, '2021-03-10 10:44:42', '2021-03-10 10:44:42'),
(17, 1, 'Lalmai', 'লালমাই', 'lalmai.comilla.gov.bd', 'lalmai', 1, '2021-03-10 10:44:42', '2021-03-10 10:44:42'),
(18, 2, 'Chhagalnaiya', 'ছাগলনাইয়া', 'chhagalnaiya.feni.gov.bd', 'chhagalnaiya', 1, '2021-03-10 10:44:42', '2021-03-10 10:44:42'),
(19, 2, 'Feni Sadar', 'ফেনী সদর', 'sadar.feni.gov.bd', 'feni-sadar', 1, '2021-03-10 10:44:42', '2021-03-10 10:44:42'),
(20, 2, 'Sonagazi', 'সোনাগাজী', 'sonagazi.feni.gov.bd', 'sonagazi', 1, '2021-03-10 10:44:43', '2021-03-10 10:44:43'),
(21, 2, 'Fulgazi', 'ফুলগাজী', 'fulgazi.feni.gov.bd', 'fulgazi', 1, '2021-03-10 10:44:43', '2021-03-10 10:44:43'),
(22, 2, 'Parshuram', 'পরশুরাম', 'parshuram.feni.gov.bd', 'parshuram', 1, '2021-03-10 10:44:43', '2021-03-10 10:44:43'),
(23, 2, 'Daganbhuiyan', 'দাগনভূঞা', 'daganbhuiyan.feni.gov.bd', 'daganbhuiyan', 1, '2021-03-10 10:44:43', '2021-03-10 10:44:43'),
(24, 3, 'Brahmanbaria Sadar', 'ব্রাহ্মণবাড়িয়া সদর', 'sadar.brahmanbaria.gov.bd', 'brahmanbaria-sadar', 1, '2021-03-10 10:44:43', '2021-03-10 10:44:43'),
(25, 3, 'Kasba', 'কসবা', 'kasba.brahmanbaria.gov.bd', 'kasba', 1, '2021-03-10 10:44:43', '2021-03-10 10:44:43'),
(26, 3, 'Nasirnagar', 'নাসিরনগর', 'nasirnagar.brahmanbaria.gov.bd', 'nasirnagar', 1, '2021-03-10 10:44:43', '2021-03-10 10:44:43'),
(27, 3, 'Sarail', 'সরাইল', 'sarail.brahmanbaria.gov.bd', 'sarail', 1, '2021-03-10 10:44:43', '2021-03-10 10:44:43'),
(28, 3, 'Ashuganj', 'আশুগঞ্জ', 'ashuganj.brahmanbaria.gov.bd', 'ashuganj', 1, '2021-03-10 10:44:43', '2021-03-10 10:44:43'),
(29, 3, 'Akhaura', 'আখাউড়া', 'akhaura.brahmanbaria.gov.bd', 'akhaura', 1, '2021-03-10 10:44:43', '2021-03-10 10:44:43'),
(30, 3, 'Nabinagar', 'নবীনগর', 'nabinagar.brahmanbaria.gov.bd', 'nabinagar', 1, '2021-03-10 10:44:43', '2021-03-10 10:44:43'),
(31, 3, 'Bancharampur', 'বাঞ্ছারামপুর', 'bancharampur.brahmanbaria.gov.bd', 'bancharampur', 1, '2021-03-10 10:44:43', '2021-03-10 10:44:43'),
(32, 3, 'Bijoynagar', 'বিজয়নগর', 'bijoynagar.brahmanbaria.gov.bd    ', 'bijoynagar', 1, '2021-03-10 10:44:43', '2021-03-10 10:44:43'),
(33, 4, 'Rangamati Sadar', 'রাঙ্গামাটি সদর', 'sadar.rangamati.gov.bd', 'rangamati-sadar', 1, '2021-03-10 10:44:43', '2021-03-10 10:44:43'),
(34, 4, 'Kaptai', 'কাপ্তাই', 'kaptai.rangamati.gov.bd', 'kaptai', 1, '2021-03-10 10:44:43', '2021-03-10 10:44:43'),
(35, 4, 'Kawkhali', 'কাউখালী', 'kawkhali.rangamati.gov.bd', 'kawkhali', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(36, 4, 'Baghaichari', 'বাঘাইছড়ি', 'baghaichari.rangamati.gov.bd', 'baghaichari', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(37, 4, 'Barkal', 'বরকল', 'barkal.rangamati.gov.bd', 'barkal', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(38, 4, 'Langadu', 'লংগদু', 'langadu.rangamati.gov.bd', 'langadu', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(39, 4, 'Rajasthali', 'রাজস্থলী', 'rajasthali.rangamati.gov.bd', 'rajasthali', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(40, 4, 'Belaichari', 'বিলাইছড়ি', 'belaichari.rangamati.gov.bd', 'belaichari', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(41, 4, 'Juraichari', 'জুরাছড়ি', 'juraichari.rangamati.gov.bd', 'juraichari', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(42, 4, 'Naniarchar', 'নানিয়ারচর', 'naniarchar.rangamati.gov.bd', 'naniarchar', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(43, 5, 'Noakhali Sadar', 'নোয়াখালী সদর', 'sadar.noakhali.gov.bd', 'noakhali-sadar', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(44, 5, 'Companiganj', 'কোম্পানীগঞ্জ', 'companiganj.noakhali.gov.bd', 'companiganj', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(45, 5, 'Begumganj', 'বেগমগঞ্জ', 'begumganj.noakhali.gov.bd', 'begumganj', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(46, 5, 'Hatia', 'হাতিয়া', 'hatia.noakhali.gov.bd', 'hatia', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(47, 5, 'Subarnachar', 'সুবর্ণচর', 'subarnachar.noakhali.gov.bd', 'subarnachar', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(48, 5, 'Kabirhat', 'কবিরহাট', 'kabirhat.noakhali.gov.bd', 'kabirhat', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(49, 5, 'Senbug', 'সেনবাগ', 'senbug.noakhali.gov.bd', 'senbug', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(50, 5, 'Chatkhil', 'চাটখিল', 'chatkhil.noakhali.gov.bd', 'chatkhil', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(51, 5, 'Sonaimori', 'সোনাইমুড়ী', 'sonaimori.noakhali.gov.bd', 'sonaimori', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(52, 6, 'Haimchar', 'হাইমচর', 'haimchar.chandpur.gov.bd', 'haimchar', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(53, 6, 'Kachua', 'কচুয়া', 'kachua.chandpur.gov.bd', 'kachua', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(54, 6, 'Shahrasti', 'শাহরাস্তি	', 'shahrasti.chandpur.gov.bd', 'shahrasti', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(55, 6, 'Chandpur Sadar', 'চাঁদপুর সদর', 'sadar.chandpur.gov.bd', 'chandpur-sadar', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(56, 6, 'Matlab South', 'মতলব দক্ষিণ', 'matlabsouth.chandpur.gov.bd', 'matlab-south', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(57, 6, 'Hajiganj', 'হাজীগঞ্জ', 'hajiganj.chandpur.gov.bd', 'hajiganj', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(58, 6, 'Matlab North', 'মতলব উত্তর', 'matlabnorth.chandpur.gov.bd', 'matlab-north', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(59, 6, 'Faridgonj', 'ফরিদগঞ্জ', 'faridgonj.chandpur.gov.bd', 'faridgonj', 1, '2021-03-10 10:44:44', '2021-03-10 10:44:44'),
(60, 7, 'Lakshmipur Sadar', 'লক্ষ্মীপুর সদর', 'sadar.lakshmipur.gov.bd', 'lakshmipur-sadar', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(61, 7, 'Kamalnagar', 'কমলনগর', 'kamalnagar.lakshmipur.gov.bd', 'kamalnagar', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(62, 7, 'Raipur', 'রায়পুর', 'raipur.lakshmipur.gov.bd', 'raipur', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(63, 7, 'Ramgati', 'রামগতি', 'ramgati.lakshmipur.gov.bd', 'ramgati', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(64, 7, 'Ramganj', 'রামগঞ্জ', 'ramganj.lakshmipur.gov.bd', 'ramganj', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(65, 8, 'Rangunia', 'রাঙ্গুনিয়া', 'rangunia.chittagong.gov.bd', 'rangunia', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(66, 8, 'Sitakunda', 'সীতাকুন্ড', 'sitakunda.chittagong.gov.bd', 'sitakunda', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(67, 8, 'Mirsharai', 'মীরসরাই', 'mirsharai.chittagong.gov.bd', 'mirsharai', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(68, 8, 'Patiya', 'পটিয়া', 'patiya.chittagong.gov.bd', 'patiya', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(69, 8, 'Sandwip', 'সন্দ্বীপ', 'sandwip.chittagong.gov.bd', 'sandwip', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(70, 8, 'Banshkhali', 'বাঁশখালী', 'banshkhali.chittagong.gov.bd', 'banshkhali', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(71, 8, 'Boalkhali', 'বোয়ালখালী', 'boalkhali.chittagong.gov.bd', 'boalkhali', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(72, 8, 'Anwara', 'আনোয়ারা', 'anwara.chittagong.gov.bd', 'anwara', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(73, 8, 'Chandanaish', 'চন্দনাইশ', 'chandanaish.chittagong.gov.bd', 'chandanaish', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(74, 8, 'Satkania', 'সাতকানিয়া', 'satkania.chittagong.gov.bd', 'satkania', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(75, 8, 'Lohagara', 'লোহাগাড়া', 'lohagara.chittagong.gov.bd', 'lohagara', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(76, 8, 'Hathazari', 'হাটহাজারী', 'hathazari.chittagong.gov.bd', 'hathazari', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(77, 8, 'Fatikchhari', 'ফটিকছড়ি', 'fatikchhari.chittagong.gov.bd', 'fatikchhari', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(78, 8, 'Raozan', 'রাউজান', 'raozan.chittagong.gov.bd', 'raozan', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(79, 8, 'Karnafuli', 'কর্ণফুলী', 'karnafuli.chittagong.gov.bd', 'karnafuli', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(80, 9, 'Coxsbazar Sadar', 'কক্সবাজার সদর', 'sadar.coxsbazar.gov.bd', 'coxsbazar-sadar', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(81, 9, 'Chakaria', 'চকরিয়া', 'chakaria.coxsbazar.gov.bd', 'chakaria', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(82, 9, 'Kutubdia', 'কুতুবদিয়া', 'kutubdia.coxsbazar.gov.bd', 'kutubdia', 1, '2021-03-10 10:44:45', '2021-03-10 10:44:45'),
(83, 9, 'Ukhiya', 'উখিয়া', 'ukhiya.coxsbazar.gov.bd', 'ukhiya', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(84, 9, 'Moheshkhali', 'মহেশখালী', 'moheshkhali.coxsbazar.gov.bd', 'moheshkhali', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(85, 9, 'Pekua', 'পেকুয়া', 'pekua.coxsbazar.gov.bd', 'pekua', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(86, 9, 'Ramu', 'রামু', 'ramu.coxsbazar.gov.bd', 'ramu', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(87, 9, 'Teknaf', 'টেকনাফ', 'teknaf.coxsbazar.gov.bd', 'teknaf', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(88, 10, 'Khagrachhari Sadar', 'খাগড়াছড়ি সদর', 'sadar.khagrachhari.gov.bd', 'khagrachhari-sadar', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(89, 10, 'Dighinala', 'দিঘীনালা', 'dighinala.khagrachhari.gov.bd', 'dighinala', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(90, 10, 'Panchari', 'পানছড়ি', 'panchari.khagrachhari.gov.bd', 'panchari', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(91, 10, 'Laxmichhari', 'লক্ষীছড়ি', 'laxmichhari.khagrachhari.gov.bd', 'laxmichhari', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(92, 10, 'Mohalchari', 'মহালছড়ি', 'mohalchari.khagrachhari.gov.bd', 'mohalchari', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(93, 10, 'Manikchari', 'মানিকছড়ি', 'manikchari.khagrachhari.gov.bd', 'manikchari', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(94, 10, 'Ramgarh', 'রামগড়', 'ramgarh.khagrachhari.gov.bd', 'ramgarh', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(95, 10, 'Matiranga', 'মাটিরাঙ্গা', 'matiranga.khagrachhari.gov.bd', 'matiranga', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(96, 10, 'Guimara', 'গুইমারা', 'guimara.khagrachhari.gov.bd', 'guimara', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(97, 11, 'Bandarban Sadar', 'বান্দরবান সদর', 'sadar.bandarban.gov.bd', 'bandarban-sadar', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(98, 11, 'Alikadam', 'আলীকদম', 'alikadam.bandarban.gov.bd', 'alikadam', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(99, 11, 'Naikhongchhari', 'নাইক্ষ্যংছড়ি', 'naikhongchhari.bandarban.gov.bd', 'naikhongchhari', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(100, 11, 'Rowangchhari', 'রোয়াংছড়ি', 'rowangchhari.bandarban.gov.bd', 'rowangchhari', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(101, 11, 'Lama', 'লামা', 'lama.bandarban.gov.bd', 'lama', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(102, 11, 'Ruma', 'রুমা', 'ruma.bandarban.gov.bd', 'ruma', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(103, 11, 'Thanchi', 'থানচি', 'thanchi.bandarban.gov.bd', 'thanchi', 1, '2021-03-10 10:44:46', '2021-03-10 10:44:46'),
(104, 12, 'Belkuchi', 'বেলকুচি', 'belkuchi.sirajganj.gov.bd', 'belkuchi', 1, '2021-03-10 10:44:47', '2021-03-10 10:44:47'),
(105, 12, 'Chauhali', 'চৌহালি', 'chauhali.sirajganj.gov.bd', 'chauhali', 1, '2021-03-10 10:44:47', '2021-03-10 10:44:47'),
(106, 12, 'Kamarkhand', 'কামারখন্দ', 'kamarkhand.sirajganj.gov.bd', 'kamarkhand', 1, '2021-03-10 10:44:47', '2021-03-10 10:44:47'),
(107, 12, 'Kazipur', 'কাজীপুর', 'kazipur.sirajganj.gov.bd', 'kazipur', 1, '2021-03-10 10:44:47', '2021-03-10 10:44:47'),
(108, 12, 'Raigonj', 'রায়গঞ্জ', 'raigonj.sirajganj.gov.bd', 'raigonj', 1, '2021-03-10 10:44:47', '2021-03-10 10:44:47'),
(109, 12, 'Shahjadpur', 'শাহজাদপুর', 'shahjadpur.sirajganj.gov.bd', 'shahjadpur', 1, '2021-03-10 10:44:47', '2021-03-10 10:44:47'),
(110, 12, 'Sirajganj Sadar', 'সিরাজগঞ্জ সদর', 'sirajganjsadar.sirajganj.gov.bd', 'sirajganj-sadar', 1, '2021-03-10 10:44:47', '2021-03-10 10:44:47'),
(111, 12, 'Tarash', 'তাড়াশ', 'tarash.sirajganj.gov.bd', 'tarash', 1, '2021-03-10 10:44:47', '2021-03-10 10:44:47'),
(112, 12, 'Ullapara', 'উল্লাপাড়া', 'ullapara.sirajganj.gov.bd', 'ullapara', 1, '2021-03-10 10:44:47', '2021-03-10 10:44:47'),
(113, 13, 'Sujanagar', 'সুজানগর', 'sujanagar.pabna.gov.bd', 'sujanagar', 1, '2021-03-10 10:44:48', '2021-03-10 10:44:48'),
(114, 13, 'Ishurdi', 'ঈশ্বরদী', 'ishurdi.pabna.gov.bd', 'ishurdi', 1, '2021-03-10 10:44:48', '2021-03-10 10:44:48'),
(115, 13, 'Bhangura', 'ভাঙ্গুড়া', 'bhangura.pabna.gov.bd', 'bhangura', 1, '2021-03-10 10:44:48', '2021-03-10 10:44:48'),
(116, 13, 'Pabna Sadar', 'পাবনা সদর', 'pabnasadar.pabna.gov.bd', 'pabna-sadar', 1, '2021-03-10 10:44:48', '2021-03-10 10:44:48'),
(117, 13, 'Bera', 'বেড়া', 'bera.pabna.gov.bd', 'bera', 1, '2021-03-10 10:44:48', '2021-03-10 10:44:48'),
(118, 13, 'Atghoria', 'আটঘরিয়া', 'atghoria.pabna.gov.bd', 'atghoria', 1, '2021-03-10 10:44:48', '2021-03-10 10:44:48'),
(119, 13, 'Chatmohar', 'চাটমোহর', 'chatmohar.pabna.gov.bd', 'chatmohar', 1, '2021-03-10 10:44:48', '2021-03-10 10:44:48'),
(120, 13, 'Santhia', 'সাঁথিয়া', 'santhia.pabna.gov.bd', 'santhia', 1, '2021-03-10 10:44:48', '2021-03-10 10:44:48'),
(121, 13, 'Faridpur', 'ফরিদপুর', 'faridpur.pabna.gov.bd', 'faridpur', 1, '2021-03-10 10:44:49', '2021-03-10 10:44:49'),
(122, 14, 'Kahaloo', 'কাহালু', 'kahaloo.bogra.gov.bd', 'kahaloo', 1, '2021-03-10 10:44:49', '2021-03-10 10:44:49'),
(123, 14, 'Bogra Sadar', 'বগুড়া সদর', 'sadar.bogra.gov.bd', 'bogra-sadar', 1, '2021-03-10 10:44:49', '2021-03-10 10:44:49'),
(124, 14, 'Shariakandi', 'সারিয়াকান্দি', 'shariakandi.bogra.gov.bd', 'shariakandi', 1, '2021-03-10 10:44:49', '2021-03-10 10:44:49'),
(125, 14, 'Shajahanpur', 'শাজাহানপুর', 'shajahanpur.bogra.gov.bd', 'shajahanpur', 1, '2021-03-10 10:44:49', '2021-03-10 10:44:49'),
(126, 14, 'Dupchanchia', 'দুপচাচিঁয়া', 'dupchanchia.bogra.gov.bd', 'dupchanchia', 1, '2021-03-10 10:44:49', '2021-03-10 10:44:49'),
(127, 14, 'Adamdighi', 'আদমদিঘি', 'adamdighi.bogra.gov.bd', 'adamdighi', 1, '2021-03-10 10:44:49', '2021-03-10 10:44:49'),
(128, 14, 'Nondigram', 'নন্দিগ্রাম', 'nondigram.bogra.gov.bd', 'nondigram', 1, '2021-03-10 10:44:49', '2021-03-10 10:44:49'),
(129, 14, 'Sonatala', 'সোনাতলা', 'sonatala.bogra.gov.bd', 'sonatala', 1, '2021-03-10 10:44:49', '2021-03-10 10:44:49'),
(130, 14, 'Dhunot', 'ধুনট', 'dhunot.bogra.gov.bd', 'dhunot', 1, '2021-03-10 10:44:50', '2021-03-10 10:44:50'),
(131, 14, 'Gabtali', 'গাবতলী', 'gabtali.bogra.gov.bd', 'gabtali', 1, '2021-03-10 10:44:50', '2021-03-10 10:44:50'),
(132, 14, 'Sherpur', 'শেরপুর', 'sherpur.bogra.gov.bd', 'sherpur', 1, '2021-03-10 10:44:50', '2021-03-10 10:44:50'),
(133, 14, 'Shibganj', 'শিবগঞ্জ', 'shibganj.bogra.gov.bd', 'shibganj', 1, '2021-03-10 10:44:50', '2021-03-10 10:44:50'),
(134, 15, 'Paba', 'পবা', 'paba.rajshahi.gov.bd', 'paba', 1, '2021-03-10 10:44:50', '2021-03-10 10:44:50'),
(135, 15, 'Durgapur', 'দুর্গাপুর', 'durgapur.rajshahi.gov.bd', 'durgapur', 1, '2021-03-10 10:44:50', '2021-03-10 10:44:50'),
(136, 15, 'Mohonpur', 'মোহনপুর', 'mohonpur.rajshahi.gov.bd', 'mohonpur', 1, '2021-03-10 10:44:50', '2021-03-10 10:44:50'),
(137, 15, 'Charghat', 'চারঘাট', 'charghat.rajshahi.gov.bd', 'charghat', 1, '2021-03-10 10:44:50', '2021-03-10 10:44:50'),
(138, 15, 'Puthia', 'পুঠিয়া', 'puthia.rajshahi.gov.bd', 'puthia', 1, '2021-03-10 10:44:50', '2021-03-10 10:44:50'),
(139, 15, 'Bagha', 'বাঘা', 'bagha.rajshahi.gov.bd', 'bagha', 1, '2021-03-10 10:44:50', '2021-03-10 10:44:50'),
(140, 15, 'Godagari', 'গোদাগাড়ী', 'godagari.rajshahi.gov.bd', 'godagari', 1, '2021-03-10 10:44:50', '2021-03-10 10:44:50'),
(141, 15, 'Tanore', 'তানোর', 'tanore.rajshahi.gov.bd', 'tanore', 1, '2021-03-10 10:44:50', '2021-03-10 10:44:50'),
(142, 15, 'Bagmara', 'বাগমারা', 'bagmara.rajshahi.gov.bd', 'bagmara', 1, '2021-03-10 10:44:50', '2021-03-10 10:44:50'),
(143, 16, 'Natore Sadar', 'নাটোর সদর', 'natoresadar.natore.gov.bd', 'natore-sadar', 1, '2021-03-10 10:44:50', '2021-03-10 10:44:50'),
(144, 16, 'Singra', 'সিংড়া', 'singra.natore.gov.bd', 'singra', 1, '2021-03-10 10:44:50', '2021-03-10 10:44:50'),
(145, 16, 'Baraigram', 'বড়াইগ্রাম', 'baraigram.natore.gov.bd', 'baraigram', 1, '2021-03-10 10:44:50', '2021-03-10 10:44:50'),
(146, 16, 'Bagatipara', 'বাগাতিপাড়া', 'bagatipara.natore.gov.bd', 'bagatipara', 1, '2021-03-10 10:44:50', '2021-03-10 10:44:50'),
(147, 16, 'Lalpur', 'লালপুর', 'lalpur.natore.gov.bd', 'lalpur', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(148, 16, 'Gurudaspur', 'গুরুদাসপুর', 'gurudaspur.natore.gov.bd', 'gurudaspur', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(149, 16, 'Naldanga', 'নলডাঙ্গা', 'naldanga.natore.gov.bd', 'naldanga', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(150, 17, 'Akkelpur', 'আক্কেলপুর', 'akkelpur.joypurhat.gov.bd', 'akkelpur', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(151, 17, 'Kalai', 'কালাই', 'kalai.joypurhat.gov.bd', 'kalai', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(152, 17, 'Khetlal', 'ক্ষেতলাল', 'khetlal.joypurhat.gov.bd', 'khetlal', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(153, 17, 'Panchbibi', 'পাঁচবিবি', 'panchbibi.joypurhat.gov.bd', 'panchbibi', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(154, 17, 'Joypurhat Sadar', 'জয়পুরহাট সদর', 'joypurhatsadar.joypurhat.gov.bd', 'joypurhat-sadar', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(155, 18, 'Chapainawabganj Sadar', 'চাঁপাইনবাবগঞ্জ সদর', 'chapainawabganjsadar.chapainawabganj.gov.bd', 'chapainawabganj-sadar', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(156, 18, 'Gomostapur', 'গোমস্তাপুর', 'gomostapur.chapainawabganj.gov.bd', 'gomostapur', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(157, 18, 'Nachol', 'নাচোল', 'nachol.chapainawabganj.gov.bd', 'nachol', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(158, 18, 'Bholahat', 'ভোলাহাট', 'bholahat.chapainawabganj.gov.bd', 'bholahat', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(159, 18, 'Shibganj', 'শিবগঞ্জ', 'shibganj.chapainawabganj.gov.bd', 'shibganj', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(160, 19, 'Mohadevpur', 'মহাদেবপুর', 'mohadevpur.naogaon.gov.bd', 'mohadevpur', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(161, 19, 'Badalgachi', 'বদলগাছী', 'badalgachi.naogaon.gov.bd', 'badalgachi', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(162, 19, 'Patnitala', 'পত্নিতলা', 'patnitala.naogaon.gov.bd', 'patnitala', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(163, 19, 'Dhamoirhat', 'ধামইরহাট', 'dhamoirhat.naogaon.gov.bd', 'dhamoirhat', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(164, 19, 'Niamatpur', 'নিয়ামতপুর', 'niamatpur.naogaon.gov.bd', 'niamatpur', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(165, 19, 'Manda', 'মান্দা', 'manda.naogaon.gov.bd', 'manda', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(166, 19, 'Atrai', 'আত্রাই', 'atrai.naogaon.gov.bd', 'atrai', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(167, 19, 'Raninagar', 'রাণীনগর', 'raninagar.naogaon.gov.bd', 'raninagar', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(168, 19, 'Naogaon Sadar', 'নওগাঁ সদর', 'naogaonsadar.naogaon.gov.bd', 'naogaon-sadar', 1, '2021-03-10 10:44:51', '2021-03-10 10:44:51'),
(169, 19, 'Porsha', 'পোরশা', 'porsha.naogaon.gov.bd', 'porsha', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(170, 19, 'Sapahar', 'সাপাহার', 'sapahar.naogaon.gov.bd', 'sapahar', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(171, 20, 'Manirampur', 'মণিরামপুর', 'manirampur.jessore.gov.bd', 'manirampur', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(172, 20, 'Abhaynagar', 'অভয়নগর', 'abhaynagar.jessore.gov.bd', 'abhaynagar', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(173, 20, 'Bagherpara', 'বাঘারপাড়া', 'bagherpara.jessore.gov.bd', 'bagherpara', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(174, 20, 'Chougachha', 'চৌগাছা', 'chougachha.jessore.gov.bd', 'chougachha', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(175, 20, 'Jhikargacha', 'ঝিকরগাছা', 'jhikargacha.jessore.gov.bd', 'jhikargacha', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(176, 20, 'Keshabpur', 'কেশবপুর', 'keshabpur.jessore.gov.bd', 'keshabpur', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(177, 20, 'Jessore Sadar', 'যশোর সদর', 'sadar.jessore.gov.bd', 'jessore-sadar', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(178, 20, 'Sharsha', 'শার্শা', 'sharsha.jessore.gov.bd', 'sharsha', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(179, 21, 'Assasuni', 'আশাশুনি', 'assasuni.satkhira.gov.bd', 'assasuni', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(180, 21, 'Debhata', 'দেবহাটা', 'debhata.satkhira.gov.bd', 'debhata', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(181, 21, 'Kalaroa', 'কলারোয়া', 'kalaroa.satkhira.gov.bd', 'kalaroa', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(182, 21, 'Satkhira Sadar', 'সাতক্ষীরা সদর', 'satkhirasadar.satkhira.gov.bd', 'satkhira-sadar', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(183, 21, 'Shyamnagar', 'শ্যামনগর', 'shyamnagar.satkhira.gov.bd', 'shyamnagar', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(184, 21, 'Tala', 'তালা', 'tala.satkhira.gov.bd', 'tala', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(185, 21, 'Kaliganj', 'কালিগঞ্জ', 'kaliganj.satkhira.gov.bd', 'kaliganj', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(186, 22, 'Mujibnagar', 'মুজিবনগর', 'mujibnagar.meherpur.gov.bd', 'mujibnagar', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(187, 22, 'Meherpur Sadar', 'মেহেরপুর সদর', 'meherpursadar.meherpur.gov.bd', 'meherpur-sadar', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(188, 22, 'Gangni', 'গাংনী', 'gangni.meherpur.gov.bd', 'gangni', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(189, 23, 'Narail Sadar', 'নড়াইল সদর', 'narailsadar.narail.gov.bd', 'narail-sadar', 1, '2021-03-10 10:44:52', '2021-03-10 10:44:52'),
(190, 23, 'Lohagara', 'লোহাগড়া', 'lohagara.narail.gov.bd', 'lohagara', 1, '2021-03-10 10:44:53', '2021-03-10 10:44:53'),
(191, 23, 'Kalia', 'কালিয়া', 'kalia.narail.gov.bd', 'kalia', 1, '2021-03-10 10:44:53', '2021-03-10 10:44:53'),
(192, 24, 'Chuadanga Sadar', 'চুয়াডাঙ্গা সদর', 'chuadangasadar.chuadanga.gov.bd', 'chuadanga-sadar', 1, '2021-03-10 10:44:53', '2021-03-10 10:44:53'),
(193, 24, 'Alamdanga', 'আলমডাঙ্গা', 'alamdanga.chuadanga.gov.bd', 'alamdanga', 1, '2021-03-10 10:44:53', '2021-03-10 10:44:53'),
(194, 24, 'Damurhuda', 'দামুড়হুদা', 'damurhuda.chuadanga.gov.bd', 'damurhuda', 1, '2021-03-10 10:44:53', '2021-03-10 10:44:53'),
(195, 24, 'Jibannagar', 'জীবননগর', 'jibannagar.chuadanga.gov.bd', 'jibannagar', 1, '2021-03-10 10:44:53', '2021-03-10 10:44:53'),
(196, 25, 'Kushtia Sadar', 'কুষ্টিয়া সদর', 'kushtiasadar.kushtia.gov.bd', 'kushtia-sadar', 1, '2021-03-10 10:44:53', '2021-03-10 10:44:53'),
(197, 25, 'Kumarkhali', 'কুমারখালী', 'kumarkhali.kushtia.gov.bd', 'kumarkhali', 1, '2021-03-10 10:44:53', '2021-03-10 10:44:53'),
(198, 25, 'Khoksa', 'খোকসা', 'khoksa.kushtia.gov.bd', 'khoksa', 1, '2021-03-10 10:44:53', '2021-03-10 10:44:53'),
(199, 25, 'Mirpur', 'মিরপুর', 'mirpurkushtia.kushtia.gov.bd', 'mirpur', 1, '2021-03-10 10:44:54', '2021-03-10 10:44:54'),
(200, 25, 'Daulatpur', 'দৌলতপুর', 'daulatpur.kushtia.gov.bd', 'daulatpur', 1, '2021-03-10 10:44:54', '2021-03-10 10:44:54'),
(201, 25, 'Bheramara', 'ভেড়ামারা', 'bheramara.kushtia.gov.bd', 'bheramara', 1, '2021-03-10 10:44:54', '2021-03-10 10:44:54'),
(202, 26, 'Shalikha', 'শালিখা', 'shalikha.magura.gov.bd', 'shalikha', 1, '2021-03-10 10:44:54', '2021-03-10 10:44:54'),
(203, 26, 'Sreepur', 'শ্রীপুর', 'sreepur.magura.gov.bd', 'sreepur', 1, '2021-03-10 10:44:55', '2021-03-10 10:44:55'),
(204, 26, 'Magura Sadar', 'মাগুরা সদর', 'magurasadar.magura.gov.bd', 'magura-sadar', 1, '2021-03-10 10:44:55', '2021-03-10 10:44:55'),
(205, 26, 'Mohammadpur', 'মহম্মদপুর', 'mohammadpur.magura.gov.bd', 'mohammadpur', 1, '2021-03-10 10:44:55', '2021-03-10 10:44:55'),
(206, 27, 'Paikgasa', 'পাইকগাছা', 'paikgasa.khulna.gov.bd', 'paikgasa', 1, '2021-03-10 10:44:55', '2021-03-10 10:44:55'),
(207, 27, 'Fultola', 'ফুলতলা', 'fultola.khulna.gov.bd', 'fultola', 1, '2021-03-10 10:44:55', '2021-03-10 10:44:55'),
(208, 27, 'Digholia', 'দিঘলিয়া', 'digholia.khulna.gov.bd', 'digholia', 1, '2021-03-10 10:44:55', '2021-03-10 10:44:55'),
(209, 27, 'Rupsha', 'রূপসা', 'rupsha.khulna.gov.bd', 'rupsha', 1, '2021-03-10 10:44:55', '2021-03-10 10:44:55'),
(210, 27, 'Terokhada', 'তেরখাদা', 'terokhada.khulna.gov.bd', 'terokhada', 1, '2021-03-10 10:44:55', '2021-03-10 10:44:55'),
(211, 27, 'Dumuria', 'ডুমুরিয়া', 'dumuria.khulna.gov.bd', 'dumuria', 1, '2021-03-10 10:44:55', '2021-03-10 10:44:55'),
(212, 27, 'Botiaghata', 'বটিয়াঘাটা', 'botiaghata.khulna.gov.bd', 'botiaghata', 1, '2021-03-10 10:44:55', '2021-03-10 10:44:55'),
(213, 27, 'Dakop', 'দাকোপ', 'dakop.khulna.gov.bd', 'dakop', 1, '2021-03-10 10:44:56', '2021-03-10 10:44:56'),
(214, 27, 'Koyra', 'কয়রা', 'koyra.khulna.gov.bd', 'koyra', 1, '2021-03-10 10:44:56', '2021-03-10 10:44:56'),
(215, 28, 'Fakirhat', 'ফকিরহাট', 'fakirhat.bagerhat.gov.bd', 'fakirhat', 1, '2021-03-10 10:44:56', '2021-03-10 10:44:56'),
(216, 28, 'Bagerhat Sadar', 'বাগেরহাট সদর', 'sadar.bagerhat.gov.bd', 'bagerhat-sadar', 1, '2021-03-10 10:44:56', '2021-03-10 10:44:56'),
(217, 28, 'Mollahat', 'মোল্লাহাট', 'mollahat.bagerhat.gov.bd', 'mollahat', 1, '2021-03-10 10:44:56', '2021-03-10 10:44:56'),
(218, 28, 'Sarankhola', 'শরণখোলা', 'sarankhola.bagerhat.gov.bd', 'sarankhola', 1, '2021-03-10 10:44:56', '2021-03-10 10:44:56'),
(219, 28, 'Rampal', 'রামপাল', 'rampal.bagerhat.gov.bd', 'rampal', 1, '2021-03-10 10:44:56', '2021-03-10 10:44:56'),
(220, 28, 'Morrelganj', 'মোড়েলগঞ্জ', 'morrelganj.bagerhat.gov.bd', 'morrelganj', 1, '2021-03-10 10:44:56', '2021-03-10 10:44:56'),
(221, 28, 'Kachua', 'কচুয়া', 'kachua.bagerhat.gov.bd', 'kachua', 1, '2021-03-10 10:44:56', '2021-03-10 10:44:56'),
(222, 28, 'Mongla', 'মোংলা', 'mongla.bagerhat.gov.bd', 'mongla', 1, '2021-03-10 10:44:57', '2021-03-10 10:44:57'),
(223, 28, 'Chitalmari', 'চিতলমারী', 'chitalmari.bagerhat.gov.bd', 'chitalmari', 1, '2021-03-10 10:44:57', '2021-03-10 10:44:57'),
(224, 29, 'Jhenaidah Sadar', 'ঝিনাইদহ সদর', 'sadar.jhenaidah.gov.bd', 'jhenaidah-sadar', 1, '2021-03-10 10:44:57', '2021-03-10 10:44:57'),
(225, 29, 'Shailkupa', 'শৈলকুপা', 'shailkupa.jhenaidah.gov.bd', 'shailkupa', 1, '2021-03-10 10:44:57', '2021-03-10 10:44:57'),
(226, 29, 'Harinakundu', 'হরিণাকুন্ডু', 'harinakundu.jhenaidah.gov.bd', 'harinakundu', 1, '2021-03-10 10:44:57', '2021-03-10 10:44:57'),
(227, 29, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.jhenaidah.gov.bd', 'kaliganj', 1, '2021-03-10 10:44:57', '2021-03-10 10:44:57'),
(228, 29, 'Kotchandpur', 'কোটচাঁদপুর', 'kotchandpur.jhenaidah.gov.bd', 'kotchandpur', 1, '2021-03-10 10:44:57', '2021-03-10 10:44:57'),
(229, 29, 'Moheshpur', 'মহেশপুর', 'moheshpur.jhenaidah.gov.bd', 'moheshpur', 1, '2021-03-10 10:44:57', '2021-03-10 10:44:57'),
(230, 30, 'Jhalakathi Sadar', 'ঝালকাঠি সদর', 'sadar.jhalakathi.gov.bd', 'jhalakathi-sadar', 1, '2021-03-10 10:44:57', '2021-03-10 10:44:57'),
(231, 30, 'Kathalia', 'কাঠালিয়া', 'kathalia.jhalakathi.gov.bd', 'kathalia', 1, '2021-03-10 10:44:57', '2021-03-10 10:44:57'),
(232, 30, 'Nalchity', 'নলছিটি', 'nalchity.jhalakathi.gov.bd', 'nalchity', 1, '2021-03-10 10:44:57', '2021-03-10 10:44:57'),
(233, 30, 'Rajapur', 'রাজাপুর', 'rajapur.jhalakathi.gov.bd', 'rajapur', 1, '2021-03-10 10:44:57', '2021-03-10 10:44:57'),
(234, 31, 'Bauphal', 'বাউফল', 'bauphal.patuakhali.gov.bd', 'bauphal', 1, '2021-03-10 10:44:57', '2021-03-10 10:44:57'),
(235, 31, 'Patuakhali Sadar', 'পটুয়াখালী সদর', 'sadar.patuakhali.gov.bd', 'patuakhali-sadar', 1, '2021-03-10 10:44:57', '2021-03-10 10:44:57'),
(236, 31, 'Dumki', 'দুমকি', 'dumki.patuakhali.gov.bd', 'dumki', 1, '2021-03-10 10:44:57', '2021-03-10 10:44:57'),
(237, 31, 'Dashmina', 'দশমিনা', 'dashmina.patuakhali.gov.bd', 'dashmina', 1, '2021-03-10 10:44:57', '2021-03-10 10:44:57'),
(238, 31, 'Kalapara', 'কলাপাড়া', 'kalapara.patuakhali.gov.bd', 'kalapara', 1, '2021-03-10 10:44:57', '2021-03-10 10:44:57'),
(239, 31, 'Mirzaganj', 'মির্জাগঞ্জ', 'mirzaganj.patuakhali.gov.bd', 'mirzaganj', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(240, 31, 'Galachipa', 'গলাচিপা', 'galachipa.patuakhali.gov.bd', 'galachipa', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(241, 31, 'Rangabali', 'রাঙ্গাবালী', 'rangabali.patuakhali.gov.bd', 'rangabali', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(242, 32, 'Pirojpur Sadar', 'পিরোজপুর সদর', 'sadar.pirojpur.gov.bd', 'pirojpur-sadar', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(243, 32, 'Nazirpur', 'নাজিরপুর', 'nazirpur.pirojpur.gov.bd', 'nazirpur', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(244, 32, 'Kawkhali', 'কাউখালী', 'kawkhali.pirojpur.gov.bd', 'kawkhali', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(245, 32, 'Zianagar', 'জিয়ানগর', 'zianagar.pirojpur.gov.bd', 'zianagar', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(246, 32, 'Bhandaria', 'ভান্ডারিয়া', 'bhandaria.pirojpur.gov.bd', 'bhandaria', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(247, 32, 'Mathbaria', 'মঠবাড়ীয়া', 'mathbaria.pirojpur.gov.bd', 'mathbaria', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(248, 32, 'Nesarabad', 'নেছারাবাদ', 'nesarabad.pirojpur.gov.bd', 'nesarabad', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(249, 33, 'Barisal Sadar', 'বরিশাল সদর', 'barisalsadar.barisal.gov.bd', 'barisal-sadar', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(250, 33, 'Bakerganj', 'বাকেরগঞ্জ', 'bakerganj.barisal.gov.bd', 'bakerganj', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(251, 33, 'Babuganj', 'বাবুগঞ্জ', 'babuganj.barisal.gov.bd', 'babuganj', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(252, 33, 'Wazirpur', 'উজিরপুর', 'wazirpur.barisal.gov.bd', 'wazirpur', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(253, 33, 'Banaripara', 'বানারীপাড়া', 'banaripara.barisal.gov.bd', 'banaripara', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(254, 33, 'Gournadi', 'গৌরনদী', 'gournadi.barisal.gov.bd', 'gournadi', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(255, 33, 'Agailjhara', 'আগৈলঝাড়া', 'agailjhara.barisal.gov.bd', 'agailjhara', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(256, 33, 'Mehendiganj', 'মেহেন্দিগঞ্জ', 'mehendiganj.barisal.gov.bd', 'mehendiganj', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(257, 33, 'Muladi', 'মুলাদী', 'muladi.barisal.gov.bd', 'muladi', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(258, 33, 'Hizla', 'হিজলা', 'hizla.barisal.gov.bd', 'hizla', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(259, 34, 'Bhola Sadar', 'ভোলা সদর', 'sadar.bhola.gov.bd', 'bhola-sadar', 1, '2021-03-10 10:44:58', '2021-03-10 10:44:58'),
(260, 34, 'Borhan Sddin', 'বোরহান উদ্দিন', 'borhanuddin.bhola.gov.bd', 'borhan-sddin', 1, '2021-03-10 10:44:59', '2021-03-10 10:44:59'),
(261, 34, 'Charfesson', 'চরফ্যাশন', 'charfesson.bhola.gov.bd', 'charfesson', 1, '2021-03-10 10:44:59', '2021-03-10 10:44:59'),
(262, 34, 'Doulatkhan', 'দৌলতখান', 'doulatkhan.bhola.gov.bd', 'doulatkhan', 1, '2021-03-10 10:44:59', '2021-03-10 10:44:59'),
(263, 34, 'Monpura', 'মনপুরা', 'monpura.bhola.gov.bd', 'monpura', 1, '2021-03-10 10:44:59', '2021-03-10 10:44:59'),
(264, 34, 'Tazumuddin', 'তজুমদ্দিন', 'tazumuddin.bhola.gov.bd', 'tazumuddin', 1, '2021-03-10 10:44:59', '2021-03-10 10:44:59'),
(265, 34, 'Lalmohan', 'লালমোহন', 'lalmohan.bhola.gov.bd', 'lalmohan', 1, '2021-03-10 10:44:59', '2021-03-10 10:44:59'),
(266, 35, 'Amtali', 'আমতলী', 'amtali.barguna.gov.bd', 'amtali', 1, '2021-03-10 10:44:59', '2021-03-10 10:44:59'),
(267, 35, 'Barguna Sadar', 'বরগুনা সদর', 'sadar.barguna.gov.bd', 'barguna-sadar', 1, '2021-03-10 10:44:59', '2021-03-10 10:44:59'),
(268, 35, 'Betagi', 'বেতাগী', 'betagi.barguna.gov.bd', 'betagi', 1, '2021-03-10 10:44:59', '2021-03-10 10:44:59'),
(269, 35, 'Bamna', 'বামনা', 'bamna.barguna.gov.bd', 'bamna', 1, '2021-03-10 10:44:59', '2021-03-10 10:44:59'),
(270, 35, 'Pathorghata', 'পাথরঘাটা', 'pathorghata.barguna.gov.bd', 'pathorghata', 1, '2021-03-10 10:45:00', '2021-03-10 10:45:00'),
(271, 35, 'Taltali', 'তালতলি', 'taltali.barguna.gov.bd', 'taltali', 1, '2021-03-10 10:45:00', '2021-03-10 10:45:00'),
(272, 36, 'Balaganj', 'বালাগঞ্জ', 'balaganj.sylhet.gov.bd', 'balaganj', 1, '2021-03-10 10:45:00', '2021-03-10 10:45:00'),
(273, 36, 'Beanibazar', 'বিয়ানীবাজার', 'beanibazar.sylhet.gov.bd', 'beanibazar', 1, '2021-03-10 10:45:00', '2021-03-10 10:45:00'),
(274, 36, 'Bishwanath', 'বিশ্বনাথ', 'bishwanath.sylhet.gov.bd', 'bishwanath', 1, '2021-03-10 10:45:00', '2021-03-10 10:45:00'),
(275, 36, 'Companiganj', 'কোম্পানীগঞ্জ', 'companiganj.sylhet.gov.bd', 'companiganj', 1, '2021-03-10 10:45:00', '2021-03-10 10:45:00'),
(276, 36, 'Fenchuganj', 'ফেঞ্চুগঞ্জ', 'fenchuganj.sylhet.gov.bd', 'fenchuganj', 1, '2021-03-10 10:45:00', '2021-03-10 10:45:00'),
(277, 36, 'Golapganj', 'গোলাপগঞ্জ', 'golapganj.sylhet.gov.bd', 'golapganj', 1, '2021-03-10 10:45:00', '2021-03-10 10:45:00'),
(278, 36, 'Gowainghat', 'গোয়াইনঘাট', 'gowainghat.sylhet.gov.bd', 'gowainghat', 1, '2021-03-10 10:45:00', '2021-03-10 10:45:00'),
(279, 36, 'Jaintiapur', 'জৈন্তাপুর', 'jaintiapur.sylhet.gov.bd', 'jaintiapur', 1, '2021-03-10 10:45:00', '2021-03-10 10:45:00'),
(280, 36, 'Kanaighat', 'কানাইঘাট', 'kanaighat.sylhet.gov.bd', 'kanaighat', 1, '2021-03-10 10:45:00', '2021-03-10 10:45:00'),
(281, 36, 'Sylhet Sadar', 'সিলেট সদর', 'sylhetsadar.sylhet.gov.bd', 'sylhet-sadar', 1, '2021-03-10 10:45:01', '2021-03-10 10:45:01'),
(282, 36, 'Zakiganj', 'জকিগঞ্জ', 'zakiganj.sylhet.gov.bd', 'zakiganj', 1, '2021-03-10 10:45:01', '2021-03-10 10:45:01'),
(283, 36, 'Dakshinsurma', 'দক্ষিণ সুরমা', 'dakshinsurma.sylhet.gov.bd', 'dakshinsurma', 1, '2021-03-10 10:45:01', '2021-03-10 10:45:01'),
(284, 36, 'Osmaninagar', 'ওসমানী নগর', 'osmaninagar.sylhet.gov.bd', 'osmaninagar', 1, '2021-03-10 10:45:01', '2021-03-10 10:45:01'),
(285, 37, 'Barlekha', 'বড়লেখা', 'barlekha.moulvibazar.gov.bd', 'barlekha', 1, '2021-03-10 10:45:01', '2021-03-10 10:45:01'),
(286, 37, 'Kamolganj', 'কমলগঞ্জ', 'kamolganj.moulvibazar.gov.bd', 'kamolganj', 1, '2021-03-10 10:45:01', '2021-03-10 10:45:01'),
(287, 37, 'Kulaura', 'কুলাউড়া', 'kulaura.moulvibazar.gov.bd', 'kulaura', 1, '2021-03-10 10:45:01', '2021-03-10 10:45:01'),
(288, 37, 'Moulvibazar Sadar', 'মৌলভীবাজার সদর', 'moulvibazarsadar.moulvibazar.gov.bd', 'moulvibazar-sadar', 1, '2021-03-10 10:45:01', '2021-03-10 10:45:01'),
(289, 37, 'Rajnagar', 'রাজনগর', 'rajnagar.moulvibazar.gov.bd', 'rajnagar', 1, '2021-03-10 10:45:01', '2021-03-10 10:45:01'),
(290, 37, 'Sreemangal', 'শ্রীমঙ্গল', 'sreemangal.moulvibazar.gov.bd', 'sreemangal', 1, '2021-03-10 10:45:01', '2021-03-10 10:45:01'),
(291, 37, 'Juri', 'জুড়ী', 'juri.moulvibazar.gov.bd', 'juri', 1, '2021-03-10 10:45:01', '2021-03-10 10:45:01'),
(292, 38, 'Nabiganj', 'নবীগঞ্জ', 'nabiganj.habiganj.gov.bd', 'nabiganj', 1, '2021-03-10 10:45:02', '2021-03-10 10:45:02'),
(293, 38, 'Bahubal', 'বাহুবল', 'bahubal.habiganj.gov.bd', 'bahubal', 1, '2021-03-10 10:45:02', '2021-03-10 10:45:02'),
(294, 38, 'Ajmiriganj', 'আজমিরীগঞ্জ', 'ajmiriganj.habiganj.gov.bd', 'ajmiriganj', 1, '2021-03-10 10:45:02', '2021-03-10 10:45:02'),
(295, 38, 'Baniachong', 'বানিয়াচং', 'baniachong.habiganj.gov.bd', 'baniachong', 1, '2021-03-10 10:45:02', '2021-03-10 10:45:02'),
(296, 38, 'Lakhai', 'লাখাই', 'lakhai.habiganj.gov.bd', 'lakhai', 1, '2021-03-10 10:45:02', '2021-03-10 10:45:02'),
(297, 38, 'Chunarughat', 'চুনারুঘাট', 'chunarughat.habiganj.gov.bd', 'chunarughat', 1, '2021-03-10 10:45:02', '2021-03-10 10:45:02'),
(298, 38, 'Habiganj Sadar', 'হবিগঞ্জ সদর', 'habiganjsadar.habiganj.gov.bd', 'habiganj-sadar', 1, '2021-03-10 10:45:02', '2021-03-10 10:45:02'),
(299, 38, 'Madhabpur', 'মাধবপুর', 'madhabpur.habiganj.gov.bd', 'madhabpur', 1, '2021-03-10 10:45:02', '2021-03-10 10:45:02'),
(300, 39, 'Sunamganj Sadar', 'সুনামগঞ্জ সদর', 'sadar.sunamganj.gov.bd', 'sunamganj-sadar', 1, '2021-03-10 10:45:03', '2021-03-10 10:45:03'),
(301, 39, 'South Sunamganj', 'দক্ষিণ সুনামগঞ্জ', 'southsunamganj.sunamganj.gov.bd', 'south-sunamganj', 1, '2021-03-10 10:45:03', '2021-03-10 10:45:03'),
(302, 39, 'Bishwambarpur', 'বিশ্বম্ভরপুর', 'bishwambarpur.sunamganj.gov.bd', 'bishwambarpur', 1, '2021-03-10 10:45:03', '2021-03-10 10:45:03'),
(303, 39, 'Chhatak', 'ছাতক', 'chhatak.sunamganj.gov.bd', 'chhatak', 1, '2021-03-10 10:45:03', '2021-03-10 10:45:03'),
(304, 39, 'Jagannathpur', 'জগন্নাথপুর', 'jagannathpur.sunamganj.gov.bd', 'jagannathpur', 1, '2021-03-10 10:45:03', '2021-03-10 10:45:03'),
(305, 39, 'Dowarabazar', 'দোয়ারাবাজার', 'dowarabazar.sunamganj.gov.bd', 'dowarabazar', 1, '2021-03-10 10:45:03', '2021-03-10 10:45:03'),
(306, 39, 'Tahirpur', 'তাহিরপুর', 'tahirpur.sunamganj.gov.bd', 'tahirpur', 1, '2021-03-10 10:45:03', '2021-03-10 10:45:03'),
(307, 39, 'Dharmapasha', 'ধর্মপাশা', 'dharmapasha.sunamganj.gov.bd', 'dharmapasha', 1, '2021-03-10 10:45:03', '2021-03-10 10:45:03'),
(308, 39, 'Jamalganj', 'জামালগঞ্জ', 'jamalganj.sunamganj.gov.bd', 'jamalganj', 1, '2021-03-10 10:45:03', '2021-03-10 10:45:03'),
(309, 39, 'Shalla', 'শাল্লা', 'shalla.sunamganj.gov.bd', 'shalla', 1, '2021-03-10 10:45:03', '2021-03-10 10:45:03'),
(310, 39, 'Derai', 'দিরাই', 'derai.sunamganj.gov.bd', 'derai', 1, '2021-03-10 10:45:04', '2021-03-10 10:45:04'),
(311, 40, 'Belabo', 'বেলাবো', 'belabo.narsingdi.gov.bd', 'belabo', 1, '2021-03-10 10:45:04', '2021-03-10 10:45:04'),
(312, 40, 'Monohardi', 'মনোহরদী', 'monohardi.narsingdi.gov.bd', 'monohardi', 1, '2021-03-10 10:45:04', '2021-03-10 10:45:04'),
(313, 40, 'Narsingdi Sadar', 'নরসিংদী সদর', 'narsingdisadar.narsingdi.gov.bd', 'narsingdi-sadar', 1, '2021-03-10 10:45:04', '2021-03-10 10:45:04'),
(314, 40, 'Palash', 'পলাশ', 'palash.narsingdi.gov.bd', 'palash', 1, '2021-03-10 10:45:05', '2021-03-10 10:45:05'),
(315, 40, 'Raipura', 'রায়পুরা', 'raipura.narsingdi.gov.bd', 'raipura', 1, '2021-03-10 10:45:06', '2021-03-10 10:45:06'),
(316, 40, 'Shibpur', 'শিবপুর', 'shibpur.narsingdi.gov.bd', 'shibpur', 1, '2021-03-10 10:45:06', '2021-03-10 10:45:06'),
(317, 41, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.gazipur.gov.bd', 'kaliganj', 1, '2021-03-10 10:45:06', '2021-03-10 10:45:06'),
(318, 41, 'Kaliakair', 'কালিয়াকৈর', 'kaliakair.gazipur.gov.bd', 'kaliakair', 1, '2021-03-10 10:45:06', '2021-03-10 10:45:06'),
(319, 41, 'Kapasia', 'কাপাসিয়া', 'kapasia.gazipur.gov.bd', 'kapasia', 1, '2021-03-10 10:45:07', '2021-03-10 10:45:07'),
(320, 41, 'Gazipur Sadar', 'গাজীপুর সদর', 'sadar.gazipur.gov.bd', 'gazipur-sadar', 1, '2021-03-10 10:45:07', '2021-03-10 10:45:07'),
(321, 41, 'Sreepur', 'শ্রীপুর', 'sreepur.gazipur.gov.bd', 'sreepur', 1, '2021-03-10 10:45:07', '2021-03-10 10:45:07'),
(322, 42, 'Shariatpur Sadar', 'শরিয়তপুর সদর', 'sadar.shariatpur.gov.bd', 'shariatpur-sadar', 1, '2021-03-10 10:45:07', '2021-03-10 10:45:07'),
(323, 42, 'Naria', 'নড়িয়া', 'naria.shariatpur.gov.bd', 'naria', 1, '2021-03-10 10:45:07', '2021-03-10 10:45:07'),
(324, 42, 'Zajira', 'জাজিরা', 'zajira.shariatpur.gov.bd', 'zajira', 1, '2021-03-10 10:45:07', '2021-03-10 10:45:07'),
(325, 42, 'Gosairhat', 'গোসাইরহাট', 'gosairhat.shariatpur.gov.bd', 'gosairhat', 1, '2021-03-10 10:45:07', '2021-03-10 10:45:07'),
(326, 42, 'Bhedarganj', 'ভেদরগঞ্জ', 'bhedarganj.shariatpur.gov.bd', 'bhedarganj', 1, '2021-03-10 10:45:07', '2021-03-10 10:45:07'),
(327, 42, 'Damudya', 'ডামুড্যা', 'damudya.shariatpur.gov.bd', 'damudya', 1, '2021-03-10 10:45:07', '2021-03-10 10:45:07'),
(328, 43, 'Araihazar', 'আড়াইহাজার', 'araihazar.narayanganj.gov.bd', 'araihazar', 1, '2021-03-10 10:45:07', '2021-03-10 10:45:07'),
(329, 43, 'Bandar', 'বন্দর', 'bandar.narayanganj.gov.bd', 'bandar', 1, '2021-03-10 10:45:07', '2021-03-10 10:45:07'),
(330, 43, 'Narayanganj Sadar', 'নারায়নগঞ্জ সদর', 'narayanganjsadar.narayanganj.gov.bd', 'narayanganj-sadar', 1, '2021-03-10 10:45:07', '2021-03-10 10:45:07'),
(331, 43, 'Rupganj', 'রূপগঞ্জ', 'rupganj.narayanganj.gov.bd', 'rupganj', 1, '2021-03-10 10:45:07', '2021-03-10 10:45:07'),
(332, 43, 'Sonargaon', 'সোনারগাঁ', 'sonargaon.narayanganj.gov.bd', 'sonargaon', 1, '2021-03-10 10:45:07', '2021-03-10 10:45:07'),
(333, 44, 'Basail', 'বাসাইল', 'basail.tangail.gov.bd', 'basail', 1, '2021-03-10 10:45:08', '2021-03-10 10:45:08'),
(334, 44, 'Bhuapur', 'ভুয়াপুর', 'bhuapur.tangail.gov.bd', 'bhuapur', 1, '2021-03-10 10:45:08', '2021-03-10 10:45:08'),
(335, 44, 'Delduar', 'দেলদুয়ার', 'delduar.tangail.gov.bd', 'delduar', 1, '2021-03-10 10:45:08', '2021-03-10 10:45:08'),
(336, 44, 'Ghatail', 'ঘাটাইল', 'ghatail.tangail.gov.bd', 'ghatail', 1, '2021-03-10 10:45:08', '2021-03-10 10:45:08'),
(337, 44, 'Gopalpur', 'গোপালপুর', 'gopalpur.tangail.gov.bd', 'gopalpur', 1, '2021-03-10 10:45:08', '2021-03-10 10:45:08'),
(338, 44, 'Madhupur', 'মধুপুর', 'madhupur.tangail.gov.bd', 'madhupur', 1, '2021-03-10 10:45:08', '2021-03-10 10:45:08'),
(339, 44, 'Mirzapur', 'মির্জাপুর', 'mirzapur.tangail.gov.bd', 'mirzapur', 1, '2021-03-10 10:45:08', '2021-03-10 10:45:08'),
(340, 44, 'Nagarpur', 'নাগরপুর', 'nagarpur.tangail.gov.bd', 'nagarpur', 1, '2021-03-10 10:45:08', '2021-03-10 10:45:08'),
(341, 44, 'Sakhipur', 'সখিপুর', 'sakhipur.tangail.gov.bd', 'sakhipur', 1, '2021-03-10 10:45:08', '2021-03-10 10:45:08'),
(342, 44, 'Tangail Sadar', 'টাঙ্গাইল সদর', 'tangailsadar.tangail.gov.bd', 'tangail-sadar', 1, '2021-03-10 10:45:08', '2021-03-10 10:45:08'),
(343, 44, 'Kalihati', 'কালিহাতী', 'kalihati.tangail.gov.bd', 'kalihati', 1, '2021-03-10 10:45:08', '2021-03-10 10:45:08'),
(344, 44, 'Dhanbari', 'ধনবাড়ী', 'dhanbari.tangail.gov.bd', 'dhanbari', 1, '2021-03-10 10:45:08', '2021-03-10 10:45:08'),
(345, 45, 'Itna', 'ইটনা', 'itna.kishoreganj.gov.bd', 'itna', 1, '2021-03-10 10:45:09', '2021-03-10 10:45:09'),
(346, 45, 'Katiadi', 'কটিয়াদী', 'katiadi.kishoreganj.gov.bd', 'katiadi', 1, '2021-03-10 10:45:09', '2021-03-10 10:45:09'),
(347, 45, 'Bhairab', 'ভৈরব', 'bhairab.kishoreganj.gov.bd', 'bhairab', 1, '2021-03-10 10:45:09', '2021-03-10 10:45:09'),
(348, 45, 'Tarail', 'তাড়াইল', 'tarail.kishoreganj.gov.bd', 'tarail', 1, '2021-03-10 10:45:09', '2021-03-10 10:45:09'),
(349, 45, 'Hossainpur', 'হোসেনপুর', 'hossainpur.kishoreganj.gov.bd', 'hossainpur', 1, '2021-03-10 10:45:09', '2021-03-10 10:45:09'),
(350, 45, 'Pakundia', 'পাকুন্দিয়া', 'pakundia.kishoreganj.gov.bd', 'pakundia', 1, '2021-03-10 10:45:09', '2021-03-10 10:45:09'),
(351, 45, 'Kuliarchar', 'কুলিয়ারচর', 'kuliarchar.kishoreganj.gov.bd', 'kuliarchar', 1, '2021-03-10 10:45:09', '2021-03-10 10:45:09'),
(352, 45, 'Kishoreganj Sadar', 'কিশোরগঞ্জ সদর', 'kishoreganjsadar.kishoreganj.gov.bd', 'kishoreganj-sadar', 1, '2021-03-10 10:45:09', '2021-03-10 10:45:09'),
(353, 45, 'Karimgonj', 'করিমগঞ্জ', 'karimgonj.kishoreganj.gov.bd', 'karimgonj', 1, '2021-03-10 10:45:10', '2021-03-10 10:45:10'),
(354, 45, 'Bajitpur', 'বাজিতপুর', 'bajitpur.kishoreganj.gov.bd', 'bajitpur', 1, '2021-03-10 10:45:10', '2021-03-10 10:45:10'),
(355, 45, 'Austagram', 'অষ্টগ্রাম', 'austagram.kishoreganj.gov.bd', 'austagram', 1, '2021-03-10 10:45:10', '2021-03-10 10:45:10'),
(356, 45, 'Mithamoin', 'মিঠামইন', 'mithamoin.kishoreganj.gov.bd', 'mithamoin', 1, '2021-03-10 10:45:10', '2021-03-10 10:45:10'),
(357, 45, 'Nikli', 'নিকলী', 'nikli.kishoreganj.gov.bd', 'nikli', 1, '2021-03-10 10:45:10', '2021-03-10 10:45:10'),
(358, 46, 'Harirampur', 'হরিরামপুর', 'harirampur.manikganj.gov.bd', 'harirampur', 1, '2021-03-10 10:45:11', '2021-03-10 10:45:11'),
(359, 46, 'Saturia', 'সাটুরিয়া', 'saturia.manikganj.gov.bd', 'saturia', 1, '2021-03-10 10:45:11', '2021-03-10 10:45:11'),
(360, 46, 'Manikganj Sadar', 'মানিকগঞ্জ সদর', 'sadar.manikganj.gov.bd', 'manikganj-sadar', 1, '2021-03-10 10:45:11', '2021-03-10 10:45:11'),
(361, 46, 'Gior', 'ঘিওর', 'gior.manikganj.gov.bd', 'gior', 1, '2021-03-10 10:45:11', '2021-03-10 10:45:11'),
(362, 46, 'Shibaloy', 'শিবালয়', 'shibaloy.manikganj.gov.bd', 'shibaloy', 1, '2021-03-10 10:45:11', '2021-03-10 10:45:11'),
(363, 46, 'Doulatpur', 'দৌলতপুর', 'doulatpur.manikganj.gov.bd', 'doulatpur', 1, '2021-03-10 10:45:11', '2021-03-10 10:45:11'),
(364, 46, 'Singiar', 'সিংগাইর', 'singiar.manikganj.gov.bd', 'singiar', 1, '2021-03-10 10:45:11', '2021-03-10 10:45:11'),
(365, 47, 'Savar', 'সাভার', 'savar.dhaka.gov.bd', 'savar', 1, '2021-03-10 10:45:11', '2021-03-10 10:45:11'),
(366, 47, 'Dhamrai', 'ধামরাই', 'dhamrai.dhaka.gov.bd', 'dhamrai', 1, '2021-03-10 10:45:12', '2021-03-10 10:45:12'),
(367, 47, 'Keraniganj', 'কেরাণীগঞ্জ', 'keraniganj.dhaka.gov.bd', 'keraniganj', 1, '2021-03-10 10:45:12', '2021-03-10 10:45:12'),
(368, 47, 'Nawabganj', 'নবাবগঞ্জ', 'nawabganj.dhaka.gov.bd', 'nawabganj', 1, '2021-03-10 10:45:12', '2021-03-10 10:45:12'),
(369, 47, 'Dohar', 'দোহার', 'dohar.dhaka.gov.bd', 'dohar', 1, '2021-03-10 10:45:12', '2021-03-10 10:45:12'),
(370, 48, 'Munshiganj Sadar', 'মুন্সিগঞ্জ সদর', 'sadar.munshiganj.gov.bd', 'munshiganj-sadar', 1, '2021-03-10 10:45:12', '2021-03-10 10:45:12'),
(371, 48, 'Sreenagar', 'শ্রীনগর', 'sreenagar.munshiganj.gov.bd', 'sreenagar', 1, '2021-03-10 10:45:13', '2021-03-10 10:45:13'),
(372, 48, 'Sirajdikhan', 'সিরাজদিখান', 'sirajdikhan.munshiganj.gov.bd', 'sirajdikhan', 1, '2021-03-10 10:45:13', '2021-03-10 10:45:13'),
(373, 48, 'Louhajanj', 'লৌহজং', 'louhajanj.munshiganj.gov.bd', 'louhajanj', 1, '2021-03-10 10:45:13', '2021-03-10 10:45:13'),
(374, 48, 'Gajaria', 'গজারিয়া', 'gajaria.munshiganj.gov.bd', 'gajaria', 1, '2021-03-10 10:45:13', '2021-03-10 10:45:13'),
(375, 48, 'Tongibari', 'টংগীবাড়ি', 'tongibari.munshiganj.gov.bd', 'tongibari', 1, '2021-03-10 10:45:13', '2021-03-10 10:45:13'),
(376, 49, 'Rajbari Sadar', 'রাজবাড়ী সদর', 'sadar.rajbari.gov.bd', 'rajbari-sadar', 1, '2021-03-10 10:45:13', '2021-03-10 10:45:13'),
(377, 49, 'Goalanda', 'গোয়ালন্দ', 'goalanda.rajbari.gov.bd', 'goalanda', 1, '2021-03-10 10:45:13', '2021-03-10 10:45:13'),
(378, 49, 'Pangsa', 'পাংশা', 'pangsa.rajbari.gov.bd', 'pangsa', 1, '2021-03-10 10:45:13', '2021-03-10 10:45:13'),
(379, 49, 'Baliakandi', 'বালিয়াকান্দি', 'baliakandi.rajbari.gov.bd', 'baliakandi', 1, '2021-03-10 10:45:14', '2021-03-10 10:45:14'),
(380, 49, 'Kalukhali', 'কালুখালী', 'kalukhali.rajbari.gov.bd', 'kalukhali', 1, '2021-03-10 10:45:14', '2021-03-10 10:45:14'),
(381, 50, 'Madaripur Sadar', 'মাদারীপুর সদর', 'sadar.madaripur.gov.bd', 'madaripur-sadar', 1, '2021-03-10 10:45:14', '2021-03-10 10:45:14'),
(382, 50, 'Shibchar', 'শিবচর', 'shibchar.madaripur.gov.bd', 'shibchar', 1, '2021-03-10 10:45:14', '2021-03-10 10:45:14'),
(383, 50, 'Kalkini', 'কালকিনি', 'kalkini.madaripur.gov.bd', 'kalkini', 1, '2021-03-10 10:45:14', '2021-03-10 10:45:14'),
(384, 50, 'Rajoir', 'রাজৈর', 'rajoir.madaripur.gov.bd', 'rajoir', 1, '2021-03-10 10:45:14', '2021-03-10 10:45:14'),
(385, 51, 'Gopalganj Sadar', 'গোপালগঞ্জ সদর', 'sadar.gopalganj.gov.bd', 'gopalganj-sadar', 1, '2021-03-10 10:45:14', '2021-03-10 10:45:14'),
(386, 51, 'Kashiani', 'কাশিয়ানী', 'kashiani.gopalganj.gov.bd', 'kashiani', 1, '2021-03-10 10:45:14', '2021-03-10 10:45:14'),
(387, 51, 'Tungipara', 'টুংগীপাড়া', 'tungipara.gopalganj.gov.bd', 'tungipara', 1, '2021-03-10 10:45:15', '2021-03-10 10:45:15'),
(388, 51, 'Kotalipara', 'কোটালীপাড়া', 'kotalipara.gopalganj.gov.bd', 'kotalipara', 1, '2021-03-10 10:45:15', '2021-03-10 10:45:15'),
(389, 51, 'Muksudpur', 'মুকসুদপুর', 'muksudpur.gopalganj.gov.bd', 'muksudpur', 1, '2021-03-10 10:45:15', '2021-03-10 10:45:15'),
(390, 52, 'Faridpur Sadar', 'ফরিদপুর সদর', 'sadar.faridpur.gov.bd', 'faridpur-sadar', 1, '2021-03-10 10:45:15', '2021-03-10 10:45:15'),
(391, 52, 'Alfadanga', 'আলফাডাঙ্গা', 'alfadanga.faridpur.gov.bd', 'alfadanga', 1, '2021-03-10 10:45:15', '2021-03-10 10:45:15'),
(392, 52, 'Boalmari', 'বোয়ালমারী', 'boalmari.faridpur.gov.bd', 'boalmari', 1, '2021-03-10 10:45:15', '2021-03-10 10:45:15'),
(393, 52, 'Sadarpur', 'সদরপুর', 'sadarpur.faridpur.gov.bd', 'sadarpur', 1, '2021-03-10 10:45:15', '2021-03-10 10:45:15'),
(394, 52, 'Nagarkanda', 'নগরকান্দা', 'nagarkanda.faridpur.gov.bd', 'nagarkanda', 1, '2021-03-10 10:45:15', '2021-03-10 10:45:15'),
(395, 52, 'Bhanga', 'ভাঙ্গা', 'bhanga.faridpur.gov.bd', 'bhanga', 1, '2021-03-10 10:45:16', '2021-03-10 10:45:16'),
(396, 52, 'Charbhadrasan', 'চরভদ্রাসন', 'charbhadrasan.faridpur.gov.bd', 'charbhadrasan', 1, '2021-03-10 10:45:16', '2021-03-10 10:45:16'),
(397, 52, 'Madhukhali', 'মধুখালী', 'madhukhali.faridpur.gov.bd', 'madhukhali', 1, '2021-03-10 10:45:16', '2021-03-10 10:45:16'),
(398, 52, 'Saltha', 'সালথা', 'saltha.faridpur.gov.bd', 'saltha', 1, '2021-03-10 10:45:16', '2021-03-10 10:45:16'),
(399, 53, 'Panchagarh Sadar', 'পঞ্চগড় সদর', 'panchagarhsadar.panchagarh.gov.bd', 'panchagarh-sadar', 1, '2021-03-10 10:45:17', '2021-03-10 10:45:17'),
(400, 53, 'Debiganj', 'দেবীগঞ্জ', 'debiganj.panchagarh.gov.bd', 'debiganj', 1, '2021-03-10 10:45:17', '2021-03-10 10:45:17'),
(401, 53, 'Boda', 'বোদা', 'boda.panchagarh.gov.bd', 'boda', 1, '2021-03-10 10:45:17', '2021-03-10 10:45:17'),
(402, 53, 'Atwari', 'আটোয়ারী', 'atwari.panchagarh.gov.bd', 'atwari', 1, '2021-03-10 10:45:17', '2021-03-10 10:45:17');
INSERT INTO `thanas` (`id`, `district_id`, `name`, `bn_name`, `url`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(403, 53, 'Tetulia', 'তেতুলিয়া', 'tetulia.panchagarh.gov.bd', 'tetulia', 1, '2021-03-10 10:45:17', '2021-03-10 10:45:17'),
(404, 54, 'Nawabganj', 'নবাবগঞ্জ', 'nawabganj.dinajpur.gov.bd', 'nawabganj', 1, '2021-03-10 10:45:17', '2021-03-10 10:45:17'),
(405, 54, 'Birganj', 'বীরগঞ্জ', 'birganj.dinajpur.gov.bd', 'birganj', 1, '2021-03-10 10:45:17', '2021-03-10 10:45:17'),
(406, 54, 'Ghoraghat', 'ঘোড়াঘাট', 'ghoraghat.dinajpur.gov.bd', 'ghoraghat', 1, '2021-03-10 10:45:17', '2021-03-10 10:45:17'),
(407, 54, 'Birampur', 'বিরামপুর', 'birampur.dinajpur.gov.bd', 'birampur', 1, '2021-03-10 10:45:18', '2021-03-10 10:45:18'),
(408, 54, 'Parbatipur', 'পার্বতীপুর', 'parbatipur.dinajpur.gov.bd', 'parbatipur', 1, '2021-03-10 10:45:18', '2021-03-10 10:45:18'),
(409, 54, 'Bochaganj', 'বোচাগঞ্জ', 'bochaganj.dinajpur.gov.bd', 'bochaganj', 1, '2021-03-10 10:45:18', '2021-03-10 10:45:18'),
(410, 54, 'Kaharol', 'কাহারোল', 'kaharol.dinajpur.gov.bd', 'kaharol', 1, '2021-03-10 10:45:19', '2021-03-10 10:45:19'),
(411, 54, 'Fulbari', 'ফুলবাড়ী', 'fulbari.dinajpur.gov.bd', 'fulbari', 1, '2021-03-10 10:45:19', '2021-03-10 10:45:19'),
(412, 54, 'Dinajpur Sadar', 'দিনাজপুর সদর', 'dinajpursadar.dinajpur.gov.bd', 'dinajpur-sadar', 1, '2021-03-10 10:45:19', '2021-03-10 10:45:19'),
(413, 54, 'Hakimpur', 'হাকিমপুর', 'hakimpur.dinajpur.gov.bd', 'hakimpur', 1, '2021-03-10 10:45:19', '2021-03-10 10:45:19'),
(414, 54, 'Khansama', 'খানসামা', 'khansama.dinajpur.gov.bd', 'khansama', 1, '2021-03-10 10:45:19', '2021-03-10 10:45:19'),
(415, 54, 'Birol', 'বিরল', 'birol.dinajpur.gov.bd', 'birol', 1, '2021-03-10 10:45:19', '2021-03-10 10:45:19'),
(416, 54, 'Chirirbandar', 'চিরিরবন্দর', 'chirirbandar.dinajpur.gov.bd', 'chirirbandar', 1, '2021-03-10 10:45:19', '2021-03-10 10:45:19'),
(417, 55, 'Lalmonirhat Sadar', 'লালমনিরহাট সদর', 'sadar.lalmonirhat.gov.bd', 'lalmonirhat-sadar', 1, '2021-03-10 10:45:20', '2021-03-10 10:45:20'),
(418, 55, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.lalmonirhat.gov.bd', 'kaliganj', 1, '2021-03-10 10:45:20', '2021-03-10 10:45:20'),
(419, 55, 'Hatibandha', 'হাতীবান্ধা', 'hatibandha.lalmonirhat.gov.bd', 'hatibandha', 1, '2021-03-10 10:45:20', '2021-03-10 10:45:20'),
(420, 55, 'Patgram', 'পাটগ্রাম', 'patgram.lalmonirhat.gov.bd', 'patgram', 1, '2021-03-10 10:45:20', '2021-03-10 10:45:20'),
(421, 55, 'Aditmari', 'আদিতমারী', 'aditmari.lalmonirhat.gov.bd', 'aditmari', 1, '2021-03-10 10:45:20', '2021-03-10 10:45:20'),
(422, 56, 'Syedpur', 'সৈয়দপুর', 'syedpur.nilphamari.gov.bd', 'syedpur', 1, '2021-03-10 10:45:21', '2021-03-10 10:45:21'),
(423, 56, 'Domar', 'ডোমার', 'domar.nilphamari.gov.bd', 'domar', 1, '2021-03-10 10:45:21', '2021-03-10 10:45:21'),
(424, 56, 'Dimla', 'ডিমলা', 'dimla.nilphamari.gov.bd', 'dimla', 1, '2021-03-10 10:45:21', '2021-03-10 10:45:21'),
(425, 56, 'Jaldhaka', 'জলঢাকা', 'jaldhaka.nilphamari.gov.bd', 'jaldhaka', 1, '2021-03-10 10:45:21', '2021-03-10 10:45:21'),
(426, 56, 'Kishorganj', 'কিশোরগঞ্জ', 'kishorganj.nilphamari.gov.bd', 'kishorganj', 1, '2021-03-10 10:45:22', '2021-03-10 10:45:22'),
(427, 56, 'Nilphamari Sadar', 'নীলফামারী সদর', 'nilphamarisadar.nilphamari.gov.bd', 'nilphamari-sadar', 1, '2021-03-10 10:45:22', '2021-03-10 10:45:22'),
(428, 57, 'Sadullapur', 'সাদুল্লাপুর', 'sadullapur.gaibandha.gov.bd', 'sadullapur', 1, '2021-03-10 10:45:22', '2021-03-10 10:45:22'),
(429, 57, 'Gaibandha Sadar', 'গাইবান্ধা সদর', 'gaibandhasadar.gaibandha.gov.bd', 'gaibandha-sadar', 1, '2021-03-10 10:45:22', '2021-03-10 10:45:22'),
(430, 57, 'Palashbari', 'পলাশবাড়ী', 'palashbari.gaibandha.gov.bd', 'palashbari', 1, '2021-03-10 10:45:22', '2021-03-10 10:45:22'),
(431, 57, 'Saghata', 'সাঘাটা', 'saghata.gaibandha.gov.bd', 'saghata', 1, '2021-03-10 10:45:22', '2021-03-10 10:45:22'),
(432, 57, 'Gobindaganj', 'গোবিন্দগঞ্জ', 'gobindaganj.gaibandha.gov.bd', 'gobindaganj', 1, '2021-03-10 10:45:22', '2021-03-10 10:45:22'),
(433, 57, 'Sundarganj', 'সুন্দরগঞ্জ', 'sundarganj.gaibandha.gov.bd', 'sundarganj', 1, '2021-03-10 10:45:22', '2021-03-10 10:45:22'),
(434, 57, 'Phulchari', 'ফুলছড়ি', 'phulchari.gaibandha.gov.bd', 'phulchari', 1, '2021-03-10 10:45:22', '2021-03-10 10:45:22'),
(435, 58, 'Thakurgaon Sadar', 'ঠাকুরগাঁও সদর', 'thakurgaonsadar.thakurgaon.gov.bd', 'thakurgaon-sadar', 1, '2021-03-10 10:45:22', '2021-03-10 10:45:22'),
(436, 58, 'Pirganj', 'পীরগঞ্জ', 'pirganj.thakurgaon.gov.bd', 'pirganj', 1, '2021-03-10 10:45:22', '2021-03-10 10:45:22'),
(437, 58, 'Ranisankail', 'রাণীশংকৈল', 'ranisankail.thakurgaon.gov.bd', 'ranisankail', 1, '2021-03-10 10:45:23', '2021-03-10 10:45:23'),
(438, 58, 'Haripur', 'হরিপুর', 'haripur.thakurgaon.gov.bd', 'haripur', 1, '2021-03-10 10:45:23', '2021-03-10 10:45:23'),
(439, 58, 'Baliadangi', 'বালিয়াডাঙ্গী', 'baliadangi.thakurgaon.gov.bd', 'baliadangi', 1, '2021-03-10 10:45:23', '2021-03-10 10:45:23'),
(440, 59, 'Rangpur Sadar', 'রংপুর সদর', 'rangpursadar.rangpur.gov.bd', 'rangpur-sadar', 1, '2021-03-10 10:45:23', '2021-03-10 10:45:23'),
(441, 59, 'Gangachara', 'গংগাচড়া', 'gangachara.rangpur.gov.bd', 'gangachara', 1, '2021-03-10 10:45:23', '2021-03-10 10:45:23'),
(442, 59, 'Taragonj', 'তারাগঞ্জ', 'taragonj.rangpur.gov.bd', 'taragonj', 1, '2021-03-10 10:45:23', '2021-03-10 10:45:23'),
(443, 59, 'Badargonj', 'বদরগঞ্জ', 'badargonj.rangpur.gov.bd', 'badargonj', 1, '2021-03-10 10:45:23', '2021-03-10 10:45:23'),
(444, 59, 'Mithapukur', 'মিঠাপুকুর', 'mithapukur.rangpur.gov.bd', 'mithapukur', 1, '2021-03-10 10:45:23', '2021-03-10 10:45:23'),
(445, 59, 'Pirgonj', 'পীরগঞ্জ', 'pirgonj.rangpur.gov.bd', 'pirgonj', 1, '2021-03-10 10:45:23', '2021-03-10 10:45:23'),
(446, 59, 'Kaunia', 'কাউনিয়া', 'kaunia.rangpur.gov.bd', 'kaunia', 1, '2021-03-10 10:45:23', '2021-03-10 10:45:23'),
(447, 59, 'Pirgacha', 'পীরগাছা', 'pirgacha.rangpur.gov.bd', 'pirgacha', 1, '2021-03-10 10:45:23', '2021-03-10 10:45:23'),
(448, 60, 'Kurigram Sadar', 'কুড়িগ্রাম সদর', 'kurigramsadar.kurigram.gov.bd', 'kurigram-sadar', 1, '2021-03-10 10:45:23', '2021-03-10 10:45:23'),
(449, 60, 'Nageshwari', 'নাগেশ্বরী', 'nageshwari.kurigram.gov.bd', 'nageshwari', 1, '2021-03-10 10:45:23', '2021-03-10 10:45:23'),
(450, 60, 'Bhurungamari', 'ভুরুঙ্গামারী', 'bhurungamari.kurigram.gov.bd', 'bhurungamari', 1, '2021-03-10 10:45:23', '2021-03-10 10:45:23'),
(451, 60, 'Phulbari', 'ফুলবাড়ী', 'phulbari.kurigram.gov.bd', 'phulbari', 1, '2021-03-10 10:45:23', '2021-03-10 10:45:23'),
(452, 60, 'Rajarhat', 'রাজারহাট', 'rajarhat.kurigram.gov.bd', 'rajarhat', 1, '2021-03-10 10:45:23', '2021-03-10 10:45:23'),
(453, 60, 'Ulipur', 'উলিপুর', 'ulipur.kurigram.gov.bd', 'ulipur', 1, '2021-03-10 10:45:23', '2021-03-10 10:45:23'),
(454, 60, 'Chilmari', 'চিলমারী', 'chilmari.kurigram.gov.bd', 'chilmari', 1, '2021-03-10 10:45:24', '2021-03-10 10:45:24'),
(455, 60, 'Rowmari', 'রৌমারী', 'rowmari.kurigram.gov.bd', 'rowmari', 1, '2021-03-10 10:45:24', '2021-03-10 10:45:24'),
(456, 60, 'Charrajibpur', 'চর রাজিবপুর', 'charrajibpur.kurigram.gov.bd', 'charrajibpur', 1, '2021-03-10 10:45:24', '2021-03-10 10:45:24'),
(457, 61, 'Sherpur Sadar', 'শেরপুর সদর', 'sherpursadar.sherpur.gov.bd', 'sherpur-sadar', 1, '2021-03-10 10:45:24', '2021-03-10 10:45:24'),
(458, 61, 'Nalitabari', 'নালিতাবাড়ী', 'nalitabari.sherpur.gov.bd', 'nalitabari', 1, '2021-03-10 10:45:24', '2021-03-10 10:45:24'),
(459, 61, 'Sreebordi', 'শ্রীবরদী', 'sreebordi.sherpur.gov.bd', 'sreebordi', 1, '2021-03-10 10:45:24', '2021-03-10 10:45:24'),
(460, 61, 'Nokla', 'নকলা', 'nokla.sherpur.gov.bd', 'nokla', 1, '2021-03-10 10:45:24', '2021-03-10 10:45:24'),
(461, 61, 'Jhenaigati', 'ঝিনাইগাতী', 'jhenaigati.sherpur.gov.bd', 'jhenaigati', 1, '2021-03-10 10:45:24', '2021-03-10 10:45:24'),
(462, 62, 'Fulbaria', 'ফুলবাড়ীয়া', 'fulbaria.mymensingh.gov.bd', 'fulbaria', 1, '2021-03-10 10:45:24', '2021-03-10 10:45:24'),
(463, 62, 'Trishal', 'ত্রিশাল', 'trishal.mymensingh.gov.bd', 'trishal', 1, '2021-03-10 10:45:24', '2021-03-10 10:45:24'),
(464, 62, 'Bhaluka', 'ভালুকা', 'bhaluka.mymensingh.gov.bd', 'bhaluka', 1, '2021-03-10 10:45:24', '2021-03-10 10:45:24'),
(465, 62, 'Muktagacha', 'মুক্তাগাছা', 'muktagacha.mymensingh.gov.bd', 'muktagacha', 1, '2021-03-10 10:45:24', '2021-03-10 10:45:24'),
(466, 62, 'Mymensingh Sadar', 'ময়মনসিংহ সদর', 'mymensinghsadar.mymensingh.gov.bd', 'mymensingh-sadar', 1, '2021-03-10 10:45:24', '2021-03-10 10:45:24'),
(467, 62, 'Dhobaura', 'ধোবাউড়া', 'dhobaura.mymensingh.gov.bd', 'dhobaura', 1, '2021-03-10 10:45:24', '2021-03-10 10:45:24'),
(468, 62, 'Phulpur', 'ফুলপুর', 'phulpur.mymensingh.gov.bd', 'phulpur', 1, '2021-03-10 10:45:24', '2021-03-10 10:45:24'),
(469, 62, 'Haluaghat', 'হালুয়াঘাট', 'haluaghat.mymensingh.gov.bd', 'haluaghat', 1, '2021-03-10 10:45:24', '2021-03-10 10:45:24'),
(470, 62, 'Gouripur', 'গৌরীপুর', 'gouripur.mymensingh.gov.bd', 'gouripur', 1, '2021-03-10 10:45:24', '2021-03-10 10:45:24'),
(471, 62, 'Gafargaon', 'গফরগাঁও', 'gafargaon.mymensingh.gov.bd', 'gafargaon', 1, '2021-03-10 10:45:24', '2021-03-10 10:45:24'),
(472, 62, 'Iswarganj', 'ঈশ্বরগঞ্জ', 'iswarganj.mymensingh.gov.bd', 'iswarganj', 1, '2021-03-10 10:45:25', '2021-03-10 10:45:25'),
(473, 62, 'Nandail', 'নান্দাইল', 'nandail.mymensingh.gov.bd', 'nandail', 1, '2021-03-10 10:45:25', '2021-03-10 10:45:25'),
(474, 62, 'Tarakanda', 'তারাকান্দা', 'tarakanda.mymensingh.gov.bd', 'tarakanda', 1, '2021-03-10 10:45:25', '2021-03-10 10:45:25'),
(475, 63, 'Jamalpur Sadar', 'জামালপুর সদর', 'jamalpursadar.jamalpur.gov.bd', 'jamalpur-sadar', 1, '2021-03-10 10:45:25', '2021-03-10 10:45:25'),
(476, 63, 'Melandah', 'মেলান্দহ', 'melandah.jamalpur.gov.bd', 'melandah', 1, '2021-03-10 10:45:25', '2021-03-10 10:45:25'),
(477, 63, 'Islampur', 'ইসলামপুর', 'islampur.jamalpur.gov.bd', 'islampur', 1, '2021-03-10 10:45:25', '2021-03-10 10:45:25'),
(478, 63, 'Dewangonj', 'দেওয়ানগঞ্জ', 'dewangonj.jamalpur.gov.bd', 'dewangonj', 1, '2021-03-10 10:45:25', '2021-03-10 10:45:25'),
(479, 63, 'Sarishabari', 'সরিষাবাড়ী', 'sarishabari.jamalpur.gov.bd', 'sarishabari', 1, '2021-03-10 10:45:25', '2021-03-10 10:45:25'),
(480, 63, 'Madarganj', 'মাদারগঞ্জ', 'madarganj.jamalpur.gov.bd', 'madarganj', 1, '2021-03-10 10:45:25', '2021-03-10 10:45:25'),
(481, 63, 'Bokshiganj', 'বকশীগঞ্জ', 'bokshiganj.jamalpur.gov.bd', 'bokshiganj', 1, '2021-03-10 10:45:25', '2021-03-10 10:45:25'),
(482, 64, 'Barhatta', 'বারহাট্টা', 'barhatta.netrokona.gov.bd', 'barhatta', 1, '2021-03-10 10:45:25', '2021-03-10 10:45:25'),
(483, 64, 'Durgapur', 'দুর্গাপুর', 'durgapur.netrokona.gov.bd', 'durgapur', 1, '2021-03-10 10:45:25', '2021-03-10 10:45:25'),
(484, 64, 'Kendua', 'কেন্দুয়া', 'kendua.netrokona.gov.bd', 'kendua', 1, '2021-03-10 10:45:25', '2021-03-10 10:45:25'),
(485, 64, 'Atpara', 'আটপাড়া', 'atpara.netrokona.gov.bd', 'atpara', 1, '2021-03-10 10:45:25', '2021-03-10 10:45:25'),
(486, 64, 'Madan', 'মদন', 'madan.netrokona.gov.bd', 'madan', 1, '2021-03-10 10:45:25', '2021-03-10 10:45:25'),
(487, 64, 'Khaliajuri', 'খালিয়াজুরী', 'khaliajuri.netrokona.gov.bd', 'khaliajuri', 1, '2021-03-10 10:45:25', '2021-03-10 10:45:25'),
(488, 64, 'Kalmakanda', 'কলমাকান্দা', 'kalmakanda.netrokona.gov.bd', 'kalmakanda', 1, '2021-03-10 10:45:25', '2021-03-10 10:45:25'),
(489, 64, 'Mohongonj', 'মোহনগঞ্জ', 'mohongonj.netrokona.gov.bd', 'mohongonj', 1, '2021-03-10 10:45:26', '2021-03-10 10:45:26'),
(490, 64, 'Purbadhala', 'পূর্বধলা', 'purbadhala.netrokona.gov.bd', 'purbadhala', 1, '2021-03-10 10:45:26', '2021-03-10 10:45:26'),
(491, 64, 'Netrokona Sadar', 'নেত্রকোণা সদর', 'netrokonasadar.netrokona.gov.bd', 'netrokona-sadar', 1, '2021-03-10 10:45:26', '2021-03-10 10:45:26');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_bn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `name_bn`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sit ex.', 'Eligendi.', 1, '2021-03-10 10:46:34', '2021-03-10 10:46:34'),
(2, 'Quo quia.', 'Omnis.', 1, '2021-03-10 10:46:34', '2021-03-10 10:46:34'),
(3, 'Sint enim.', 'Ut qui.', 1, '2021-03-10 10:46:34', '2021-03-10 10:46:34'),
(4, 'Suscipit.', 'Veritatis.', 1, '2021-03-10 10:46:34', '2021-03-10 10:46:34'),
(5, 'Aut.', 'Sit ullam.', 1, '2021-03-10 10:46:34', '2021-03-10 10:46:34');

-- --------------------------------------------------------

--
-- Table structure for table `upazilas`
--

CREATE TABLE `upazilas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `upazilas`
--

INSERT INTO `upazilas` (`id`, `district_id`, `name`, `bn_name`, `url`, `created_at`, `updated_at`) VALUES
(1, 1, 'Debidwar', 'দেবিদ্বার', 'debidwar.comilla.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(2, 1, 'Barura', 'বরুড়া', 'barura.comilla.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(3, 1, 'Brahmanpara', 'ব্রাহ্মণপাড়া', 'brahmanpara.comilla.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(4, 1, 'Chandina', 'চান্দিনা', 'chandina.comilla.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(5, 1, 'Chauddagram', 'চৌদ্দগ্রাম', 'chauddagram.comilla.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(6, 1, 'Daudkandi', 'দাউদকান্দি', 'daudkandi.comilla.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(7, 1, 'Homna', 'হোমনা', 'homna.comilla.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(8, 1, 'Laksam', 'লাকসাম', 'laksam.comilla.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(9, 1, 'Muradnagar', 'মুরাদনগর', 'muradnagar.comilla.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(10, 1, 'Nangalkot', 'নাঙ্গলকোট', 'nangalkot.comilla.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(11, 1, 'Comilla Sadar', 'কুমিল্লা সদর', 'comillasadar.comilla.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(12, 1, 'Meghna', 'মেঘনা', 'meghna.comilla.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(13, 1, 'Monohargonj', 'মনোহরগঞ্জ', 'monohargonj.comilla.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(14, 1, 'Sadarsouth', 'সদর দক্ষিণ', 'sadarsouth.comilla.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(15, 1, 'Titas', 'তিতাস', 'titas.comilla.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(16, 1, 'Burichang', 'বুড়িচং', 'burichang.comilla.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(17, 1, 'Lalmai', 'লালমাই', 'lalmai.comilla.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(18, 2, 'Chhagalnaiya', 'ছাগলনাইয়া', 'chhagalnaiya.feni.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(19, 2, 'Feni Sadar', 'ফেনী সদর', 'sadar.feni.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(20, 2, 'Sonagazi', 'সোনাগাজী', 'sonagazi.feni.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(21, 2, 'Fulgazi', 'ফুলগাজী', 'fulgazi.feni.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(22, 2, 'Parshuram', 'পরশুরাম', 'parshuram.feni.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(23, 2, 'Daganbhuiyan', 'দাগনভূঞা', 'daganbhuiyan.feni.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(24, 3, 'Brahmanbaria Sadar', 'ব্রাহ্মণবাড়িয়া সদর', 'sadar.brahmanbaria.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(25, 3, 'Kasba', 'কসবা', 'kasba.brahmanbaria.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(26, 3, 'Nasirnagar', 'নাসিরনগর', 'nasirnagar.brahmanbaria.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(27, 3, 'Sarail', 'সরাইল', 'sarail.brahmanbaria.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(28, 3, 'Ashuganj', 'আশুগঞ্জ', 'ashuganj.brahmanbaria.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(29, 3, 'Akhaura', 'আখাউড়া', 'akhaura.brahmanbaria.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(30, 3, 'Nabinagar', 'নবীনগর', 'nabinagar.brahmanbaria.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(31, 3, 'Bancharampur', 'বাঞ্ছারামপুর', 'bancharampur.brahmanbaria.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(32, 3, 'Bijoynagar', 'বিজয়নগর', 'bijoynagar.brahmanbaria.gov.bd    ', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(33, 4, 'Rangamati Sadar', 'রাঙ্গামাটি সদর', 'sadar.rangamati.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(34, 4, 'Kaptai', 'কাপ্তাই', 'kaptai.rangamati.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(35, 4, 'Kawkhali', 'কাউখালী', 'kawkhali.rangamati.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(36, 4, 'Baghaichari', 'বাঘাইছড়ি', 'baghaichari.rangamati.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(37, 4, 'Barkal', 'বরকল', 'barkal.rangamati.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(38, 4, 'Langadu', 'লংগদু', 'langadu.rangamati.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(39, 4, 'Rajasthali', 'রাজস্থলী', 'rajasthali.rangamati.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(40, 4, 'Belaichari', 'বিলাইছড়ি', 'belaichari.rangamati.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(41, 4, 'Juraichari', 'জুরাছড়ি', 'juraichari.rangamati.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(42, 4, 'Naniarchar', 'নানিয়ারচর', 'naniarchar.rangamati.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(43, 5, 'Noakhali Sadar', 'নোয়াখালী সদর', 'sadar.noakhali.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(44, 5, 'Companiganj', 'কোম্পানীগঞ্জ', 'companiganj.noakhali.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(45, 5, 'Begumganj', 'বেগমগঞ্জ', 'begumganj.noakhali.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(46, 5, 'Hatia', 'হাতিয়া', 'hatia.noakhali.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(47, 5, 'Subarnachar', 'সুবর্ণচর', 'subarnachar.noakhali.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(48, 5, 'Kabirhat', 'কবিরহাট', 'kabirhat.noakhali.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(49, 5, 'Senbug', 'সেনবাগ', 'senbug.noakhali.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(50, 5, 'Chatkhil', 'চাটখিল', 'chatkhil.noakhali.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(51, 5, 'Sonaimori', 'সোনাইমুড়ী', 'sonaimori.noakhali.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(52, 6, 'Haimchar', 'হাইমচর', 'haimchar.chandpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(53, 6, 'Kachua', 'কচুয়া', 'kachua.chandpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(54, 6, 'Shahrasti', 'শাহরাস্তি	', 'shahrasti.chandpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(55, 6, 'Chandpur Sadar', 'চাঁদপুর সদর', 'sadar.chandpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(56, 6, 'Matlab South', 'মতলব দক্ষিণ', 'matlabsouth.chandpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(57, 6, 'Hajiganj', 'হাজীগঞ্জ', 'hajiganj.chandpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(58, 6, 'Matlab North', 'মতলব উত্তর', 'matlabnorth.chandpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(59, 6, 'Faridgonj', 'ফরিদগঞ্জ', 'faridgonj.chandpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(60, 7, 'Lakshmipur Sadar', 'লক্ষ্মীপুর সদর', 'sadar.lakshmipur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(61, 7, 'Kamalnagar', 'কমলনগর', 'kamalnagar.lakshmipur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(62, 7, 'Raipur', 'রায়পুর', 'raipur.lakshmipur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(63, 7, 'Ramgati', 'রামগতি', 'ramgati.lakshmipur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(64, 7, 'Ramganj', 'রামগঞ্জ', 'ramganj.lakshmipur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(65, 8, 'Rangunia', 'রাঙ্গুনিয়া', 'rangunia.chittagong.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(66, 8, 'Sitakunda', 'সীতাকুন্ড', 'sitakunda.chittagong.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(67, 8, 'Mirsharai', 'মীরসরাই', 'mirsharai.chittagong.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(68, 8, 'Patiya', 'পটিয়া', 'patiya.chittagong.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(69, 8, 'Sandwip', 'সন্দ্বীপ', 'sandwip.chittagong.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(70, 8, 'Banshkhali', 'বাঁশখালী', 'banshkhali.chittagong.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(71, 8, 'Boalkhali', 'বোয়ালখালী', 'boalkhali.chittagong.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(72, 8, 'Anwara', 'আনোয়ারা', 'anwara.chittagong.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(73, 8, 'Chandanaish', 'চন্দনাইশ', 'chandanaish.chittagong.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(74, 8, 'Satkania', 'সাতকানিয়া', 'satkania.chittagong.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(75, 8, 'Lohagara', 'লোহাগাড়া', 'lohagara.chittagong.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(76, 8, 'Hathazari', 'হাটহাজারী', 'hathazari.chittagong.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(77, 8, 'Fatikchhari', 'ফটিকছড়ি', 'fatikchhari.chittagong.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(78, 8, 'Raozan', 'রাউজান', 'raozan.chittagong.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(79, 8, 'Karnafuli', 'কর্ণফুলী', 'karnafuli.chittagong.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(80, 9, 'Coxsbazar Sadar', 'কক্সবাজার সদর', 'sadar.coxsbazar.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(81, 9, 'Chakaria', 'চকরিয়া', 'chakaria.coxsbazar.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(82, 9, 'Kutubdia', 'কুতুবদিয়া', 'kutubdia.coxsbazar.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(83, 9, 'Ukhiya', 'উখিয়া', 'ukhiya.coxsbazar.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(84, 9, 'Moheshkhali', 'মহেশখালী', 'moheshkhali.coxsbazar.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(85, 9, 'Pekua', 'পেকুয়া', 'pekua.coxsbazar.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(86, 9, 'Ramu', 'রামু', 'ramu.coxsbazar.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(87, 9, 'Teknaf', 'টেকনাফ', 'teknaf.coxsbazar.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(88, 10, 'Khagrachhari Sadar', 'খাগড়াছড়ি সদর', 'sadar.khagrachhari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(89, 10, 'Dighinala', 'দিঘীনালা', 'dighinala.khagrachhari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(90, 10, 'Panchari', 'পানছড়ি', 'panchari.khagrachhari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(91, 10, 'Laxmichhari', 'লক্ষীছড়ি', 'laxmichhari.khagrachhari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(92, 10, 'Mohalchari', 'মহালছড়ি', 'mohalchari.khagrachhari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(93, 10, 'Manikchari', 'মানিকছড়ি', 'manikchari.khagrachhari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(94, 10, 'Ramgarh', 'রামগড়', 'ramgarh.khagrachhari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(95, 10, 'Matiranga', 'মাটিরাঙ্গা', 'matiranga.khagrachhari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(96, 10, 'Guimara', 'গুইমারা', 'guimara.khagrachhari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(97, 11, 'Bandarban Sadar', 'বান্দরবান সদর', 'sadar.bandarban.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(98, 11, 'Alikadam', 'আলীকদম', 'alikadam.bandarban.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(99, 11, 'Naikhongchhari', 'নাইক্ষ্যংছড়ি', 'naikhongchhari.bandarban.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(100, 11, 'Rowangchhari', 'রোয়াংছড়ি', 'rowangchhari.bandarban.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(101, 11, 'Lama', 'লামা', 'lama.bandarban.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(102, 11, 'Ruma', 'রুমা', 'ruma.bandarban.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(103, 11, 'Thanchi', 'থানচি', 'thanchi.bandarban.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(104, 12, 'Belkuchi', 'বেলকুচি', 'belkuchi.sirajganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(105, 12, 'Chauhali', 'চৌহালি', 'chauhali.sirajganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(106, 12, 'Kamarkhand', 'কামারখন্দ', 'kamarkhand.sirajganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(107, 12, 'Kazipur', 'কাজীপুর', 'kazipur.sirajganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(108, 12, 'Raigonj', 'রায়গঞ্জ', 'raigonj.sirajganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(109, 12, 'Shahjadpur', 'শাহজাদপুর', 'shahjadpur.sirajganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(110, 12, 'Sirajganj Sadar', 'সিরাজগঞ্জ সদর', 'sirajganjsadar.sirajganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(111, 12, 'Tarash', 'তাড়াশ', 'tarash.sirajganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(112, 12, 'Ullapara', 'উল্লাপাড়া', 'ullapara.sirajganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(113, 13, 'Sujanagar', 'সুজানগর', 'sujanagar.pabna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(114, 13, 'Ishurdi', 'ঈশ্বরদী', 'ishurdi.pabna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(115, 13, 'Bhangura', 'ভাঙ্গুড়া', 'bhangura.pabna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(116, 13, 'Pabna Sadar', 'পাবনা সদর', 'pabnasadar.pabna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(117, 13, 'Bera', 'বেড়া', 'bera.pabna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(118, 13, 'Atghoria', 'আটঘরিয়া', 'atghoria.pabna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(119, 13, 'Chatmohar', 'চাটমোহর', 'chatmohar.pabna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(120, 13, 'Santhia', 'সাঁথিয়া', 'santhia.pabna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(121, 13, 'Faridpur', 'ফরিদপুর', 'faridpur.pabna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(122, 14, 'Kahaloo', 'কাহালু', 'kahaloo.bogra.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(123, 14, 'Bogra Sadar', 'বগুড়া সদর', 'sadar.bogra.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(124, 14, 'Shariakandi', 'সারিয়াকান্দি', 'shariakandi.bogra.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(125, 14, 'Shajahanpur', 'শাজাহানপুর', 'shajahanpur.bogra.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(126, 14, 'Dupchanchia', 'দুপচাচিঁয়া', 'dupchanchia.bogra.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(127, 14, 'Adamdighi', 'আদমদিঘি', 'adamdighi.bogra.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(128, 14, 'Nondigram', 'নন্দিগ্রাম', 'nondigram.bogra.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(129, 14, 'Sonatala', 'সোনাতলা', 'sonatala.bogra.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(130, 14, 'Dhunot', 'ধুনট', 'dhunot.bogra.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(131, 14, 'Gabtali', 'গাবতলী', 'gabtali.bogra.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(132, 14, 'Sherpur', 'শেরপুর', 'sherpur.bogra.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(133, 14, 'Shibganj', 'শিবগঞ্জ', 'shibganj.bogra.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(134, 15, 'Paba', 'পবা', 'paba.rajshahi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(135, 15, 'Durgapur', 'দুর্গাপুর', 'durgapur.rajshahi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(136, 15, 'Mohonpur', 'মোহনপুর', 'mohonpur.rajshahi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(137, 15, 'Charghat', 'চারঘাট', 'charghat.rajshahi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(138, 15, 'Puthia', 'পুঠিয়া', 'puthia.rajshahi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(139, 15, 'Bagha', 'বাঘা', 'bagha.rajshahi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(140, 15, 'Godagari', 'গোদাগাড়ী', 'godagari.rajshahi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(141, 15, 'Tanore', 'তানোর', 'tanore.rajshahi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(142, 15, 'Bagmara', 'বাগমারা', 'bagmara.rajshahi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(143, 16, 'Natore Sadar', 'নাটোর সদর', 'natoresadar.natore.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(144, 16, 'Singra', 'সিংড়া', 'singra.natore.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(145, 16, 'Baraigram', 'বড়াইগ্রাম', 'baraigram.natore.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(146, 16, 'Bagatipara', 'বাগাতিপাড়া', 'bagatipara.natore.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(147, 16, 'Lalpur', 'লালপুর', 'lalpur.natore.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(148, 16, 'Gurudaspur', 'গুরুদাসপুর', 'gurudaspur.natore.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(149, 16, 'Naldanga', 'নলডাঙ্গা', 'naldanga.natore.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(150, 17, 'Akkelpur', 'আক্কেলপুর', 'akkelpur.joypurhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(151, 17, 'Kalai', 'কালাই', 'kalai.joypurhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(152, 17, 'Khetlal', 'ক্ষেতলাল', 'khetlal.joypurhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(153, 17, 'Panchbibi', 'পাঁচবিবি', 'panchbibi.joypurhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(154, 17, 'Joypurhat Sadar', 'জয়পুরহাট সদর', 'joypurhatsadar.joypurhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(155, 18, 'Chapainawabganj Sadar', 'চাঁপাইনবাবগঞ্জ সদর', 'chapainawabganjsadar.chapainawabganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(156, 18, 'Gomostapur', 'গোমস্তাপুর', 'gomostapur.chapainawabganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(157, 18, 'Nachol', 'নাচোল', 'nachol.chapainawabganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(158, 18, 'Bholahat', 'ভোলাহাট', 'bholahat.chapainawabganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(159, 18, 'Shibganj', 'শিবগঞ্জ', 'shibganj.chapainawabganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(160, 19, 'Mohadevpur', 'মহাদেবপুর', 'mohadevpur.naogaon.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(161, 19, 'Badalgachi', 'বদলগাছী', 'badalgachi.naogaon.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(162, 19, 'Patnitala', 'পত্নিতলা', 'patnitala.naogaon.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(163, 19, 'Dhamoirhat', 'ধামইরহাট', 'dhamoirhat.naogaon.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(164, 19, 'Niamatpur', 'নিয়ামতপুর', 'niamatpur.naogaon.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(165, 19, 'Manda', 'মান্দা', 'manda.naogaon.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(166, 19, 'Atrai', 'আত্রাই', 'atrai.naogaon.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(167, 19, 'Raninagar', 'রাণীনগর', 'raninagar.naogaon.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(168, 19, 'Naogaon Sadar', 'নওগাঁ সদর', 'naogaonsadar.naogaon.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(169, 19, 'Porsha', 'পোরশা', 'porsha.naogaon.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(170, 19, 'Sapahar', 'সাপাহার', 'sapahar.naogaon.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(171, 20, 'Manirampur', 'মণিরামপুর', 'manirampur.jessore.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(172, 20, 'Abhaynagar', 'অভয়নগর', 'abhaynagar.jessore.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(173, 20, 'Bagherpara', 'বাঘারপাড়া', 'bagherpara.jessore.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(174, 20, 'Chougachha', 'চৌগাছা', 'chougachha.jessore.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(175, 20, 'Jhikargacha', 'ঝিকরগাছা', 'jhikargacha.jessore.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(176, 20, 'Keshabpur', 'কেশবপুর', 'keshabpur.jessore.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(177, 20, 'Jessore Sadar', 'যশোর সদর', 'sadar.jessore.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(178, 20, 'Sharsha', 'শার্শা', 'sharsha.jessore.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(179, 21, 'Assasuni', 'আশাশুনি', 'assasuni.satkhira.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(180, 21, 'Debhata', 'দেবহাটা', 'debhata.satkhira.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(181, 21, 'Kalaroa', 'কলারোয়া', 'kalaroa.satkhira.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(182, 21, 'Satkhira Sadar', 'সাতক্ষীরা সদর', 'satkhirasadar.satkhira.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(183, 21, 'Shyamnagar', 'শ্যামনগর', 'shyamnagar.satkhira.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(184, 21, 'Tala', 'তালা', 'tala.satkhira.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(185, 21, 'Kaliganj', 'কালিগঞ্জ', 'kaliganj.satkhira.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(186, 22, 'Mujibnagar', 'মুজিবনগর', 'mujibnagar.meherpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(187, 22, 'Meherpur Sadar', 'মেহেরপুর সদর', 'meherpursadar.meherpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(188, 22, 'Gangni', 'গাংনী', 'gangni.meherpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(189, 23, 'Narail Sadar', 'নড়াইল সদর', 'narailsadar.narail.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(190, 23, 'Lohagara', 'লোহাগড়া', 'lohagara.narail.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(191, 23, 'Kalia', 'কালিয়া', 'kalia.narail.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(192, 24, 'Chuadanga Sadar', 'চুয়াডাঙ্গা সদর', 'chuadangasadar.chuadanga.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(193, 24, 'Alamdanga', 'আলমডাঙ্গা', 'alamdanga.chuadanga.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(194, 24, 'Damurhuda', 'দামুড়হুদা', 'damurhuda.chuadanga.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(195, 24, 'Jibannagar', 'জীবননগর', 'jibannagar.chuadanga.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(196, 25, 'Kushtia Sadar', 'কুষ্টিয়া সদর', 'kushtiasadar.kushtia.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(197, 25, 'Kumarkhali', 'কুমারখালী', 'kumarkhali.kushtia.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(198, 25, 'Khoksa', 'খোকসা', 'khoksa.kushtia.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(199, 25, 'Mirpur', 'মিরপুর', 'mirpurkushtia.kushtia.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(200, 25, 'Daulatpur', 'দৌলতপুর', 'daulatpur.kushtia.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(201, 25, 'Bheramara', 'ভেড়ামারা', 'bheramara.kushtia.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(202, 26, 'Shalikha', 'শালিখা', 'shalikha.magura.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(203, 26, 'Sreepur', 'শ্রীপুর', 'sreepur.magura.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(204, 26, 'Magura Sadar', 'মাগুরা সদর', 'magurasadar.magura.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(205, 26, 'Mohammadpur', 'মহম্মদপুর', 'mohammadpur.magura.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(206, 27, 'Paikgasa', 'পাইকগাছা', 'paikgasa.khulna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(207, 27, 'Fultola', 'ফুলতলা', 'fultola.khulna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(208, 27, 'Digholia', 'দিঘলিয়া', 'digholia.khulna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(209, 27, 'Rupsha', 'রূপসা', 'rupsha.khulna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(210, 27, 'Terokhada', 'তেরখাদা', 'terokhada.khulna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(211, 27, 'Dumuria', 'ডুমুরিয়া', 'dumuria.khulna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(212, 27, 'Botiaghata', 'বটিয়াঘাটা', 'botiaghata.khulna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(213, 27, 'Dakop', 'দাকোপ', 'dakop.khulna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(214, 27, 'Koyra', 'কয়রা', 'koyra.khulna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(215, 28, 'Fakirhat', 'ফকিরহাট', 'fakirhat.bagerhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(216, 28, 'Bagerhat Sadar', 'বাগেরহাট সদর', 'sadar.bagerhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(217, 28, 'Mollahat', 'মোল্লাহাট', 'mollahat.bagerhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(218, 28, 'Sarankhola', 'শরণখোলা', 'sarankhola.bagerhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(219, 28, 'Rampal', 'রামপাল', 'rampal.bagerhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(220, 28, 'Morrelganj', 'মোড়েলগঞ্জ', 'morrelganj.bagerhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(221, 28, 'Kachua', 'কচুয়া', 'kachua.bagerhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(222, 28, 'Mongla', 'মোংলা', 'mongla.bagerhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(223, 28, 'Chitalmari', 'চিতলমারী', 'chitalmari.bagerhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(224, 29, 'Jhenaidah Sadar', 'ঝিনাইদহ সদর', 'sadar.jhenaidah.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(225, 29, 'Shailkupa', 'শৈলকুপা', 'shailkupa.jhenaidah.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(226, 29, 'Harinakundu', 'হরিণাকুন্ডু', 'harinakundu.jhenaidah.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(227, 29, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.jhenaidah.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(228, 29, 'Kotchandpur', 'কোটচাঁদপুর', 'kotchandpur.jhenaidah.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(229, 29, 'Moheshpur', 'মহেশপুর', 'moheshpur.jhenaidah.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(230, 30, 'Jhalakathi Sadar', 'ঝালকাঠি সদর', 'sadar.jhalakathi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(231, 30, 'Kathalia', 'কাঠালিয়া', 'kathalia.jhalakathi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(232, 30, 'Nalchity', 'নলছিটি', 'nalchity.jhalakathi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(233, 30, 'Rajapur', 'রাজাপুর', 'rajapur.jhalakathi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(234, 31, 'Bauphal', 'বাউফল', 'bauphal.patuakhali.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(235, 31, 'Patuakhali Sadar', 'পটুয়াখালী সদর', 'sadar.patuakhali.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(236, 31, 'Dumki', 'দুমকি', 'dumki.patuakhali.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(237, 31, 'Dashmina', 'দশমিনা', 'dashmina.patuakhali.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(238, 31, 'Kalapara', 'কলাপাড়া', 'kalapara.patuakhali.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(239, 31, 'Mirzaganj', 'মির্জাগঞ্জ', 'mirzaganj.patuakhali.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(240, 31, 'Galachipa', 'গলাচিপা', 'galachipa.patuakhali.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(241, 31, 'Rangabali', 'রাঙ্গাবালী', 'rangabali.patuakhali.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(242, 32, 'Pirojpur Sadar', 'পিরোজপুর সদর', 'sadar.pirojpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(243, 32, 'Nazirpur', 'নাজিরপুর', 'nazirpur.pirojpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(244, 32, 'Kawkhali', 'কাউখালী', 'kawkhali.pirojpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(245, 32, 'Zianagar', 'জিয়ানগর', 'zianagar.pirojpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(246, 32, 'Bhandaria', 'ভান্ডারিয়া', 'bhandaria.pirojpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(247, 32, 'Mathbaria', 'মঠবাড়ীয়া', 'mathbaria.pirojpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(248, 32, 'Nesarabad', 'নেছারাবাদ', 'nesarabad.pirojpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(249, 33, 'Barisal Sadar', 'বরিশাল সদর', 'barisalsadar.barisal.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(250, 33, 'Bakerganj', 'বাকেরগঞ্জ', 'bakerganj.barisal.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(251, 33, 'Babuganj', 'বাবুগঞ্জ', 'babuganj.barisal.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(252, 33, 'Wazirpur', 'উজিরপুর', 'wazirpur.barisal.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(253, 33, 'Banaripara', 'বানারীপাড়া', 'banaripara.barisal.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(254, 33, 'Gournadi', 'গৌরনদী', 'gournadi.barisal.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(255, 33, 'Agailjhara', 'আগৈলঝাড়া', 'agailjhara.barisal.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(256, 33, 'Mehendiganj', 'মেহেন্দিগঞ্জ', 'mehendiganj.barisal.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(257, 33, 'Muladi', 'মুলাদী', 'muladi.barisal.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(258, 33, 'Hizla', 'হিজলা', 'hizla.barisal.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(259, 34, 'Bhola Sadar', 'ভোলা সদর', 'sadar.bhola.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(260, 34, 'Borhan Sddin', 'বোরহান উদ্দিন', 'borhanuddin.bhola.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(261, 34, 'Charfesson', 'চরফ্যাশন', 'charfesson.bhola.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(262, 34, 'Doulatkhan', 'দৌলতখান', 'doulatkhan.bhola.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(263, 34, 'Monpura', 'মনপুরা', 'monpura.bhola.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(264, 34, 'Tazumuddin', 'তজুমদ্দিন', 'tazumuddin.bhola.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(265, 34, 'Lalmohan', 'লালমোহন', 'lalmohan.bhola.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(266, 35, 'Amtali', 'আমতলী', 'amtali.barguna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(267, 35, 'Barguna Sadar', 'বরগুনা সদর', 'sadar.barguna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(268, 35, 'Betagi', 'বেতাগী', 'betagi.barguna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(269, 35, 'Bamna', 'বামনা', 'bamna.barguna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(270, 35, 'Pathorghata', 'পাথরঘাটা', 'pathorghata.barguna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(271, 35, 'Taltali', 'তালতলি', 'taltali.barguna.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(272, 36, 'Balaganj', 'বালাগঞ্জ', 'balaganj.sylhet.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(273, 36, 'Beanibazar', 'বিয়ানীবাজার', 'beanibazar.sylhet.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(274, 36, 'Bishwanath', 'বিশ্বনাথ', 'bishwanath.sylhet.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(275, 36, 'Companiganj', 'কোম্পানীগঞ্জ', 'companiganj.sylhet.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(276, 36, 'Fenchuganj', 'ফেঞ্চুগঞ্জ', 'fenchuganj.sylhet.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(277, 36, 'Golapganj', 'গোলাপগঞ্জ', 'golapganj.sylhet.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(278, 36, 'Gowainghat', 'গোয়াইনঘাট', 'gowainghat.sylhet.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(279, 36, 'Jaintiapur', 'জৈন্তাপুর', 'jaintiapur.sylhet.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(280, 36, 'Kanaighat', 'কানাইঘাট', 'kanaighat.sylhet.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(281, 36, 'Sylhet Sadar', 'সিলেট সদর', 'sylhetsadar.sylhet.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(282, 36, 'Zakiganj', 'জকিগঞ্জ', 'zakiganj.sylhet.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(283, 36, 'Dakshinsurma', 'দক্ষিণ সুরমা', 'dakshinsurma.sylhet.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(284, 36, 'Osmaninagar', 'ওসমানী নগর', 'osmaninagar.sylhet.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(285, 37, 'Barlekha', 'বড়লেখা', 'barlekha.moulvibazar.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(286, 37, 'Kamolganj', 'কমলগঞ্জ', 'kamolganj.moulvibazar.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(287, 37, 'Kulaura', 'কুলাউড়া', 'kulaura.moulvibazar.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(288, 37, 'Moulvibazar Sadar', 'মৌলভীবাজার সদর', 'moulvibazarsadar.moulvibazar.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(289, 37, 'Rajnagar', 'রাজনগর', 'rajnagar.moulvibazar.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(290, 37, 'Sreemangal', 'শ্রীমঙ্গল', 'sreemangal.moulvibazar.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(291, 37, 'Juri', 'জুড়ী', 'juri.moulvibazar.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(292, 38, 'Nabiganj', 'নবীগঞ্জ', 'nabiganj.habiganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(293, 38, 'Bahubal', 'বাহুবল', 'bahubal.habiganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(294, 38, 'Ajmiriganj', 'আজমিরীগঞ্জ', 'ajmiriganj.habiganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(295, 38, 'Baniachong', 'বানিয়াচং', 'baniachong.habiganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(296, 38, 'Lakhai', 'লাখাই', 'lakhai.habiganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(297, 38, 'Chunarughat', 'চুনারুঘাট', 'chunarughat.habiganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(298, 38, 'Habiganj Sadar', 'হবিগঞ্জ সদর', 'habiganjsadar.habiganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(299, 38, 'Madhabpur', 'মাধবপুর', 'madhabpur.habiganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(300, 39, 'Sunamganj Sadar', 'সুনামগঞ্জ সদর', 'sadar.sunamganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(301, 39, 'South Sunamganj', 'দক্ষিণ সুনামগঞ্জ', 'southsunamganj.sunamganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(302, 39, 'Bishwambarpur', 'বিশ্বম্ভরপুর', 'bishwambarpur.sunamganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(303, 39, 'Chhatak', 'ছাতক', 'chhatak.sunamganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(304, 39, 'Jagannathpur', 'জগন্নাথপুর', 'jagannathpur.sunamganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(305, 39, 'Dowarabazar', 'দোয়ারাবাজার', 'dowarabazar.sunamganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(306, 39, 'Tahirpur', 'তাহিরপুর', 'tahirpur.sunamganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(307, 39, 'Dharmapasha', 'ধর্মপাশা', 'dharmapasha.sunamganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(308, 39, 'Jamalganj', 'জামালগঞ্জ', 'jamalganj.sunamganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(309, 39, 'Shalla', 'শাল্লা', 'shalla.sunamganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(310, 39, 'Derai', 'দিরাই', 'derai.sunamganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(311, 40, 'Belabo', 'বেলাবো', 'belabo.narsingdi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(312, 40, 'Monohardi', 'মনোহরদী', 'monohardi.narsingdi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(313, 40, 'Narsingdi Sadar', 'নরসিংদী সদর', 'narsingdisadar.narsingdi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(314, 40, 'Palash', 'পলাশ', 'palash.narsingdi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(315, 40, 'Raipura', 'রায়পুরা', 'raipura.narsingdi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(316, 40, 'Shibpur', 'শিবপুর', 'shibpur.narsingdi.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(317, 41, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.gazipur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(318, 41, 'Kaliakair', 'কালিয়াকৈর', 'kaliakair.gazipur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(319, 41, 'Kapasia', 'কাপাসিয়া', 'kapasia.gazipur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(320, 41, 'Gazipur Sadar', 'গাজীপুর সদর', 'sadar.gazipur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(321, 41, 'Sreepur', 'শ্রীপুর', 'sreepur.gazipur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(322, 42, 'Shariatpur Sadar', 'শরিয়তপুর সদর', 'sadar.shariatpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(323, 42, 'Naria', 'নড়িয়া', 'naria.shariatpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(324, 42, 'Zajira', 'জাজিরা', 'zajira.shariatpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(325, 42, 'Gosairhat', 'গোসাইরহাট', 'gosairhat.shariatpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(326, 42, 'Bhedarganj', 'ভেদরগঞ্জ', 'bhedarganj.shariatpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(327, 42, 'Damudya', 'ডামুড্যা', 'damudya.shariatpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(328, 43, 'Araihazar', 'আড়াইহাজার', 'araihazar.narayanganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(329, 43, 'Bandar', 'বন্দর', 'bandar.narayanganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(330, 43, 'Narayanganj Sadar', 'নারায়নগঞ্জ সদর', 'narayanganjsadar.narayanganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(331, 43, 'Rupganj', 'রূপগঞ্জ', 'rupganj.narayanganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(332, 43, 'Sonargaon', 'সোনারগাঁ', 'sonargaon.narayanganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(333, 44, 'Basail', 'বাসাইল', 'basail.tangail.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(334, 44, 'Bhuapur', 'ভুয়াপুর', 'bhuapur.tangail.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(335, 44, 'Delduar', 'দেলদুয়ার', 'delduar.tangail.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(336, 44, 'Ghatail', 'ঘাটাইল', 'ghatail.tangail.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(337, 44, 'Gopalpur', 'গোপালপুর', 'gopalpur.tangail.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(338, 44, 'Madhupur', 'মধুপুর', 'madhupur.tangail.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(339, 44, 'Mirzapur', 'মির্জাপুর', 'mirzapur.tangail.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(340, 44, 'Nagarpur', 'নাগরপুর', 'nagarpur.tangail.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(341, 44, 'Sakhipur', 'সখিপুর', 'sakhipur.tangail.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(342, 44, 'Tangail Sadar', 'টাঙ্গাইল সদর', 'tangailsadar.tangail.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(343, 44, 'Kalihati', 'কালিহাতী', 'kalihati.tangail.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(344, 44, 'Dhanbari', 'ধনবাড়ী', 'dhanbari.tangail.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(345, 45, 'Itna', 'ইটনা', 'itna.kishoreganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(346, 45, 'Katiadi', 'কটিয়াদী', 'katiadi.kishoreganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(347, 45, 'Bhairab', 'ভৈরব', 'bhairab.kishoreganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(348, 45, 'Tarail', 'তাড়াইল', 'tarail.kishoreganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(349, 45, 'Hossainpur', 'হোসেনপুর', 'hossainpur.kishoreganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(350, 45, 'Pakundia', 'পাকুন্দিয়া', 'pakundia.kishoreganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(351, 45, 'Kuliarchar', 'কুলিয়ারচর', 'kuliarchar.kishoreganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(352, 45, 'Kishoreganj Sadar', 'কিশোরগঞ্জ সদর', 'kishoreganjsadar.kishoreganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(353, 45, 'Karimgonj', 'করিমগঞ্জ', 'karimgonj.kishoreganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(354, 45, 'Bajitpur', 'বাজিতপুর', 'bajitpur.kishoreganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(355, 45, 'Austagram', 'অষ্টগ্রাম', 'austagram.kishoreganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(356, 45, 'Mithamoin', 'মিঠামইন', 'mithamoin.kishoreganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(357, 45, 'Nikli', 'নিকলী', 'nikli.kishoreganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(358, 46, 'Harirampur', 'হরিরামপুর', 'harirampur.manikganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(359, 46, 'Saturia', 'সাটুরিয়া', 'saturia.manikganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(360, 46, 'Manikganj Sadar', 'মানিকগঞ্জ সদর', 'sadar.manikganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(361, 46, 'Gior', 'ঘিওর', 'gior.manikganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(362, 46, 'Shibaloy', 'শিবালয়', 'shibaloy.manikganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(363, 46, 'Doulatpur', 'দৌলতপুর', 'doulatpur.manikganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(364, 46, 'Singiar', 'সিংগাইর', 'singiar.manikganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(365, 47, 'Savar', 'সাভার', 'savar.dhaka.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(366, 47, 'Dhamrai', 'ধামরাই', 'dhamrai.dhaka.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(367, 47, 'Keraniganj', 'কেরাণীগঞ্জ', 'keraniganj.dhaka.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(368, 47, 'Nawabganj', 'নবাবগঞ্জ', 'nawabganj.dhaka.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(369, 47, 'Dohar', 'দোহার', 'dohar.dhaka.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(370, 48, 'Munshiganj Sadar', 'মুন্সিগঞ্জ সদর', 'sadar.munshiganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(371, 48, 'Sreenagar', 'শ্রীনগর', 'sreenagar.munshiganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(372, 48, 'Sirajdikhan', 'সিরাজদিখান', 'sirajdikhan.munshiganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(373, 48, 'Louhajanj', 'লৌহজং', 'louhajanj.munshiganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(374, 48, 'Gajaria', 'গজারিয়া', 'gajaria.munshiganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(375, 48, 'Tongibari', 'টংগীবাড়ি', 'tongibari.munshiganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(376, 49, 'Rajbari Sadar', 'রাজবাড়ী সদর', 'sadar.rajbari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(377, 49, 'Goalanda', 'গোয়ালন্দ', 'goalanda.rajbari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(378, 49, 'Pangsa', 'পাংশা', 'pangsa.rajbari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(379, 49, 'Baliakandi', 'বালিয়াকান্দি', 'baliakandi.rajbari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(380, 49, 'Kalukhali', 'কালুখালী', 'kalukhali.rajbari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(381, 50, 'Madaripur Sadar', 'মাদারীপুর সদর', 'sadar.madaripur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(382, 50, 'Shibchar', 'শিবচর', 'shibchar.madaripur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(383, 50, 'Kalkini', 'কালকিনি', 'kalkini.madaripur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(384, 50, 'Rajoir', 'রাজৈর', 'rajoir.madaripur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(385, 51, 'Gopalganj Sadar', 'গোপালগঞ্জ সদর', 'sadar.gopalganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(386, 51, 'Kashiani', 'কাশিয়ানী', 'kashiani.gopalganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(387, 51, 'Tungipara', 'টুংগীপাড়া', 'tungipara.gopalganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(388, 51, 'Kotalipara', 'কোটালীপাড়া', 'kotalipara.gopalganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(389, 51, 'Muksudpur', 'মুকসুদপুর', 'muksudpur.gopalganj.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(390, 52, 'Faridpur Sadar', 'ফরিদপুর সদর', 'sadar.faridpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(391, 52, 'Alfadanga', 'আলফাডাঙ্গা', 'alfadanga.faridpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(392, 52, 'Boalmari', 'বোয়ালমারী', 'boalmari.faridpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(393, 52, 'Sadarpur', 'সদরপুর', 'sadarpur.faridpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(394, 52, 'Nagarkanda', 'নগরকান্দা', 'nagarkanda.faridpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(395, 52, 'Bhanga', 'ভাঙ্গা', 'bhanga.faridpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(396, 52, 'Charbhadrasan', 'চরভদ্রাসন', 'charbhadrasan.faridpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(397, 52, 'Madhukhali', 'মধুখালী', 'madhukhali.faridpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(398, 52, 'Saltha', 'সালথা', 'saltha.faridpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(399, 53, 'Panchagarh Sadar', 'পঞ্চগড় সদর', 'panchagarhsadar.panchagarh.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(400, 53, 'Debiganj', 'দেবীগঞ্জ', 'debiganj.panchagarh.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(401, 53, 'Boda', 'বোদা', 'boda.panchagarh.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(402, 53, 'Atwari', 'আটোয়ারী', 'atwari.panchagarh.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(403, 53, 'Tetulia', 'তেতুলিয়া', 'tetulia.panchagarh.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(404, 54, 'Nawabganj', 'নবাবগঞ্জ', 'nawabganj.dinajpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(405, 54, 'Birganj', 'বীরগঞ্জ', 'birganj.dinajpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(406, 54, 'Ghoraghat', 'ঘোড়াঘাট', 'ghoraghat.dinajpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(407, 54, 'Birampur', 'বিরামপুর', 'birampur.dinajpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(408, 54, 'Parbatipur', 'পার্বতীপুর', 'parbatipur.dinajpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(409, 54, 'Bochaganj', 'বোচাগঞ্জ', 'bochaganj.dinajpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(410, 54, 'Kaharol', 'কাহারোল', 'kaharol.dinajpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(411, 54, 'Fulbari', 'ফুলবাড়ী', 'fulbari.dinajpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(412, 54, 'Dinajpur Sadar', 'দিনাজপুর সদর', 'dinajpursadar.dinajpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(413, 54, 'Hakimpur', 'হাকিমপুর', 'hakimpur.dinajpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(414, 54, 'Khansama', 'খানসামা', 'khansama.dinajpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(415, 54, 'Birol', 'বিরল', 'birol.dinajpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(416, 54, 'Chirirbandar', 'চিরিরবন্দর', 'chirirbandar.dinajpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(417, 55, 'Lalmonirhat Sadar', 'লালমনিরহাট সদর', 'sadar.lalmonirhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(418, 55, 'Kaliganj', 'কালীগঞ্জ', 'kaliganj.lalmonirhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(419, 55, 'Hatibandha', 'হাতীবান্ধা', 'hatibandha.lalmonirhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(420, 55, 'Patgram', 'পাটগ্রাম', 'patgram.lalmonirhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(421, 55, 'Aditmari', 'আদিতমারী', 'aditmari.lalmonirhat.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(422, 56, 'Syedpur', 'সৈয়দপুর', 'syedpur.nilphamari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(423, 56, 'Domar', 'ডোমার', 'domar.nilphamari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(424, 56, 'Dimla', 'ডিমলা', 'dimla.nilphamari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(425, 56, 'Jaldhaka', 'জলঢাকা', 'jaldhaka.nilphamari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(426, 56, 'Kishorganj', 'কিশোরগঞ্জ', 'kishorganj.nilphamari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(427, 56, 'Nilphamari Sadar', 'নীলফামারী সদর', 'nilphamarisadar.nilphamari.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(428, 57, 'Sadullapur', 'সাদুল্লাপুর', 'sadullapur.gaibandha.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(429, 57, 'Gaibandha Sadar', 'গাইবান্ধা সদর', 'gaibandhasadar.gaibandha.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(430, 57, 'Palashbari', 'পলাশবাড়ী', 'palashbari.gaibandha.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(431, 57, 'Saghata', 'সাঘাটা', 'saghata.gaibandha.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(432, 57, 'Gobindaganj', 'গোবিন্দগঞ্জ', 'gobindaganj.gaibandha.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(433, 57, 'Sundarganj', 'সুন্দরগঞ্জ', 'sundarganj.gaibandha.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(434, 57, 'Phulchari', 'ফুলছড়ি', 'phulchari.gaibandha.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(435, 58, 'Thakurgaon Sadar', 'ঠাকুরগাঁও সদর', 'thakurgaonsadar.thakurgaon.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(436, 58, 'Pirganj', 'পীরগঞ্জ', 'pirganj.thakurgaon.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(437, 58, 'Ranisankail', 'রাণীশংকৈল', 'ranisankail.thakurgaon.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(438, 58, 'Haripur', 'হরিপুর', 'haripur.thakurgaon.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(439, 58, 'Baliadangi', 'বালিয়াডাঙ্গী', 'baliadangi.thakurgaon.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(440, 59, 'Rangpur Sadar', 'রংপুর সদর', 'rangpursadar.rangpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(441, 59, 'Gangachara', 'গংগাচড়া', 'gangachara.rangpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(442, 59, 'Taragonj', 'তারাগঞ্জ', 'taragonj.rangpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(443, 59, 'Badargonj', 'বদরগঞ্জ', 'badargonj.rangpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(444, 59, 'Mithapukur', 'মিঠাপুকুর', 'mithapukur.rangpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(445, 59, 'Pirgonj', 'পীরগঞ্জ', 'pirgonj.rangpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(446, 59, 'Kaunia', 'কাউনিয়া', 'kaunia.rangpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(447, 59, 'Pirgacha', 'পীরগাছা', 'pirgacha.rangpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(448, 60, 'Kurigram Sadar', 'কুড়িগ্রাম সদর', 'kurigramsadar.kurigram.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(449, 60, 'Nageshwari', 'নাগেশ্বরী', 'nageshwari.kurigram.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(450, 60, 'Bhurungamari', 'ভুরুঙ্গামারী', 'bhurungamari.kurigram.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(451, 60, 'Phulbari', 'ফুলবাড়ী', 'phulbari.kurigram.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(452, 60, 'Rajarhat', 'রাজারহাট', 'rajarhat.kurigram.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(453, 60, 'Ulipur', 'উলিপুর', 'ulipur.kurigram.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(454, 60, 'Chilmari', 'চিলমারী', 'chilmari.kurigram.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(455, 60, 'Rowmari', 'রৌমারী', 'rowmari.kurigram.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(456, 60, 'Charrajibpur', 'চর রাজিবপুর', 'charrajibpur.kurigram.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(457, 61, 'Sherpur Sadar', 'শেরপুর সদর', 'sherpursadar.sherpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(458, 61, 'Nalitabari', 'নালিতাবাড়ী', 'nalitabari.sherpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(459, 61, 'Sreebordi', 'শ্রীবরদী', 'sreebordi.sherpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(460, 61, 'Nokla', 'নকলা', 'nokla.sherpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36');
INSERT INTO `upazilas` (`id`, `district_id`, `name`, `bn_name`, `url`, `created_at`, `updated_at`) VALUES
(461, 61, 'Jhenaigati', 'ঝিনাইগাতী', 'jhenaigati.sherpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(462, 62, 'Fulbaria', 'ফুলবাড়ীয়া', 'fulbaria.mymensingh.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(463, 62, 'Trishal', 'ত্রিশাল', 'trishal.mymensingh.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(464, 62, 'Bhaluka', 'ভালুকা', 'bhaluka.mymensingh.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(465, 62, 'Muktagacha', 'মুক্তাগাছা', 'muktagacha.mymensingh.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(466, 62, 'Mymensingh Sadar', 'ময়মনসিংহ সদর', 'mymensinghsadar.mymensingh.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(467, 62, 'Dhobaura', 'ধোবাউড়া', 'dhobaura.mymensingh.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(468, 62, 'Phulpur', 'ফুলপুর', 'phulpur.mymensingh.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(469, 62, 'Haluaghat', 'হালুয়াঘাট', 'haluaghat.mymensingh.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(470, 62, 'Gouripur', 'গৌরীপুর', 'gouripur.mymensingh.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(471, 62, 'Gafargaon', 'গফরগাঁও', 'gafargaon.mymensingh.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(472, 62, 'Iswarganj', 'ঈশ্বরগঞ্জ', 'iswarganj.mymensingh.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(473, 62, 'Nandail', 'নান্দাইল', 'nandail.mymensingh.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(474, 62, 'Tarakanda', 'তারাকান্দা', 'tarakanda.mymensingh.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(475, 63, 'Jamalpur Sadar', 'জামালপুর সদর', 'jamalpursadar.jamalpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(476, 63, 'Melandah', 'মেলান্দহ', 'melandah.jamalpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(477, 63, 'Islampur', 'ইসলামপুর', 'islampur.jamalpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(478, 63, 'Dewangonj', 'দেওয়ানগঞ্জ', 'dewangonj.jamalpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(479, 63, 'Sarishabari', 'সরিষাবাড়ী', 'sarishabari.jamalpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(480, 63, 'Madarganj', 'মাদারগঞ্জ', 'madarganj.jamalpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(481, 63, 'Bokshiganj', 'বকশীগঞ্জ', 'bokshiganj.jamalpur.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(482, 64, 'Barhatta', 'বারহাট্টা', 'barhatta.netrokona.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(483, 64, 'Durgapur', 'দুর্গাপুর', 'durgapur.netrokona.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(484, 64, 'Kendua', 'কেন্দুয়া', 'kendua.netrokona.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(485, 64, 'Atpara', 'আটপাড়া', 'atpara.netrokona.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(486, 64, 'Madan', 'মদন', 'madan.netrokona.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(487, 64, 'Khaliajuri', 'খালিয়াজুরী', 'khaliajuri.netrokona.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(488, 64, 'Kalmakanda', 'কলমাকান্দা', 'kalmakanda.netrokona.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(489, 64, 'Mohongonj', 'মোহনগঞ্জ', 'mohongonj.netrokona.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(490, 64, 'Purbadhala', 'পূর্বধলা', 'purbadhala.netrokona.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36'),
(491, 64, 'Netrokona Sadar', 'নেত্রকোণা সদর', 'netrokonasadar.netrokona.gov.bd', '2021-03-10 10:44:36', '2021-03-10 10:44:36');

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
(1, 'Abasvumi', 'admin@gmail.com', '2021-03-10 10:44:07', '01733322211', 'abasvumi/uploads/images/user/1615639813.jpeg', 1, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'aHTu5MfxB5', '2021-03-10 10:44:07', '2021-03-13 06:50:13');

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
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `agents_email_unique` (`email`);

--
-- Indexes for table `all_services`
--
ALTER TABLE `all_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `all_services_external_user_id_foreign` (`external_user_id`),
  ADD KEY `all_services_service_category_id_foreign` (`service_category_id`);

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
-- Indexes for table `dhaka_neigbors`
--
ALTER TABLE `dhaka_neigbors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dhaka_neigbor_areas`
--
ALTER TABLE `dhaka_neigbor_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dhaka_neigbor_areas_dhaka_neigbor_id_foreign` (`dhaka_neigbor_id`),
  ADD KEY `dhaka_neigbor_areas_area_id_foreign` (`area_id`);

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
-- Indexes for table `external_users`
--
ALTER TABLE `external_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `external_users_email_unique` (`email`);

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
-- Indexes for table `popular_places`
--
ALTER TABLE `popular_places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_external_user_id_foreign` (`external_user_id`),
  ADD KEY `products_product_category_id_foreign` (`product_category_id`),
  ADD KEY `products_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `properties_external_user_id_foreign` (`external_user_id`),
  ADD KEY `properties_division_id_foreign` (`division_id`),
  ADD KEY `properties_district_id_foreign` (`district_id`),
  ADD KEY `properties_thana_id_foreign` (`thana_id`),
  ADD KEY `properties_area_id_foreign` (`area_id`),
  ADD KEY `properties_block_id_foreign` (`block_id`);

--
-- Indexes for table `property_images`
--
ALTER TABLE `property_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_locations`
--
ALTER TABLE `property_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_locations_division_id_foreign` (`division_id`),
  ADD KEY `property_locations_district_id_foreign` (`district_id`),
  ADD KEY `property_locations_upazila_id_foreign` (`upazila_id`);

--
-- Indexes for table `property_types`
--
ALTER TABLE `property_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prosucts`
--
ALTER TABLE `prosucts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prosucts_external_user_id_foreign` (`external_user_id`),
  ADD KEY `prosucts_product_category_id_foreign` (`product_category_id`),
  ADD KEY `prosucts_unit_id_foreign` (`unit_id`);

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
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `services_block_id_foreign` (`block_id`),
  ADD KEY `services_service_type_id_foreign` (`service_type_id`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_types`
--
ALTER TABLE `service_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribes`
--
ALTER TABLE `subscribes`
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
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upazilas`
--
ALTER TABLE `upazilas`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `all_services`
--
ALTER TABLE `all_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `amenitis`
--
ALTER TABLE `amenitis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `area_guides`
--
ALTER TABLE `area_guides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `developers`
--
ALTER TABLE `developers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dhaka_neigbors`
--
ALTER TABLE `dhaka_neigbors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dhaka_neigbor_areas`
--
ALTER TABLE `dhaka_neigbor_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `external_users`
--
ALTER TABLE `external_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `parks`
--
ALTER TABLE `parks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `popular_places`
--
ALTER TABLE `popular_places`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `property_images`
--
ALTER TABLE `property_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `property_locations`
--
ALTER TABLE `property_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property_types`
--
ALTER TABLE `property_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `prosucts`
--
ALTER TABLE `prosucts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `real_estate_solutions`
--
ALTER TABLE `real_estate_solutions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `religious_institutions`
--
ALTER TABLE `religious_institutions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serviceimages`
--
ALTER TABLE `serviceimages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subscribes`
--
ALTER TABLE `subscribes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `thanas`
--
ALTER TABLE `thanas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=492;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `upazilas`
--
ALTER TABLE `upazilas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=492;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `all_services`
--
ALTER TABLE `all_services`
  ADD CONSTRAINT `all_services_external_user_id_foreign` FOREIGN KEY (`external_user_id`) REFERENCES `external_users` (`id`),
  ADD CONSTRAINT `all_services_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`);

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
-- Constraints for table `dhaka_neigbor_areas`
--
ALTER TABLE `dhaka_neigbor_areas`
  ADD CONSTRAINT `dhaka_neigbor_areas_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`),
  ADD CONSTRAINT `dhaka_neigbor_areas_dhaka_neigbor_id_foreign` FOREIGN KEY (`dhaka_neigbor_id`) REFERENCES `dhaka_neigbors` (`id`);

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
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_external_user_id_foreign` FOREIGN KEY (`external_user_id`) REFERENCES `external_users` (`id`),
  ADD CONSTRAINT `products_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `properties`
--
ALTER TABLE `properties`
  ADD CONSTRAINT `properties_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`),
  ADD CONSTRAINT `properties_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`),
  ADD CONSTRAINT `properties_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `properties_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`),
  ADD CONSTRAINT `properties_external_user_id_foreign` FOREIGN KEY (`external_user_id`) REFERENCES `external_users` (`id`),
  ADD CONSTRAINT `properties_thana_id_foreign` FOREIGN KEY (`thana_id`) REFERENCES `thanas` (`id`);

--
-- Constraints for table `property_locations`
--
ALTER TABLE `property_locations`
  ADD CONSTRAINT `property_locations_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `property_locations_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`),
  ADD CONSTRAINT `property_locations_upazila_id_foreign` FOREIGN KEY (`upazila_id`) REFERENCES `upazilas` (`id`);

--
-- Constraints for table `prosucts`
--
ALTER TABLE `prosucts`
  ADD CONSTRAINT `prosucts_external_user_id_foreign` FOREIGN KEY (`external_user_id`) REFERENCES `external_users` (`id`),
  ADD CONSTRAINT `prosucts_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`),
  ADD CONSTRAINT `prosucts_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

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
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`),
  ADD CONSTRAINT `services_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`),
  ADD CONSTRAINT `services_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`id`),
  ADD CONSTRAINT `services_developer_id_foreign` FOREIGN KEY (`developer_id`) REFERENCES `developers` (`id`),
  ADD CONSTRAINT `services_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `services_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`),
  ADD CONSTRAINT `services_service_type_id_foreign` FOREIGN KEY (`service_type_id`) REFERENCES `service_types` (`id`),
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
