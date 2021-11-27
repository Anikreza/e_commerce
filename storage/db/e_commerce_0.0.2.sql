-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 27, 2021 at 04:34 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_book_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_cover_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `quantity`, `user_id`, `product_id`, `category_book_type_id`, `category_cover_type_id`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 11, 1, 1, '2021-11-24 13:59:00', '2021-11-24 13:59:00'),
(10, 1, 2, 12, 2, 1, '2021-11-26 12:43:32', '2021-11-26 12:43:32'),
(11, 1, 2, 13, 2, 2, '2021-11-26 12:44:06', '2021-11-26 12:44:06'),
(12, 3, 2, 11, 1, 1, '2021-11-26 12:50:34', '2021-11-26 12:50:34');

-- --------------------------------------------------------

--
-- Table structure for table `category_book_types`
--

CREATE TABLE `category_book_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_book_types` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_book_types`
--

INSERT INTO `category_book_types` (`id`, `category_book_types`, `created_at`, `updated_at`) VALUES
(1, 'Fantasy', NULL, NULL),
(2, 'Adventure', NULL, NULL),
(3, 'Romance', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_cover_types`
--

CREATE TABLE `category_cover_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_cover_types` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_cover_types`
--

INSERT INTO `category_cover_types` (`id`, `category_cover_types`, `created_at`, `updated_at`) VALUES
(1, 'Hard', NULL, NULL),
(2, 'Soft', NULL, NULL),
(3, 'Audio', NULL, NULL);

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
(18, '2021_11_18_200001_create_category_cover_types_table', 2),
(19, '2021_11_18_200002_create_category_book_types_table', 2),
(20, '2021_11_18_200003_create_products_table', 2),
(23, '2021_11_18_200004_create_carts_table', 3),
(25, '2021_11_26_140038_create_product_orders_table', 4);

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
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'myapptoken', '5ef130143f1963d24102bd0b1afe74bfc50f7c5bdfae9e6d9b62cb3869323233', '[\"*\"]', NULL, '2021-11-18 04:27:04', '2021-11-18 04:27:04'),
(2, 'App\\Models\\User', 1, 'myapptoken', '36de4a0957c7be36cd2464010bc1cc900c1620fdc51ecfb7a2f33d6c228334ce', '[\"*\"]', NULL, '2021-11-18 04:31:40', '2021-11-18 04:31:40'),
(3, 'App\\Models\\User', 2, 'myapptoken', '7e01ecd30d516967cd651c44089acdac7659768fe4cba40db61f01b10988b9fc', '[\"*\"]', NULL, '2021-11-18 06:12:04', '2021-11-18 06:12:04'),
(4, 'App\\Models\\User', 2, 'myapptoken', 'a90305dec25c1320a25100b5fe24474a395165d8453305f4307ef0cf67a00b20', '[\"*\"]', NULL, '2021-11-18 06:13:27', '2021-11-18 06:13:27'),
(5, 'App\\Models\\User', 3, 'myapptoken', '0fcf133ba34043cedb7fa1514849235256da702606c5ec0743366e8480a1aa14', '[\"*\"]', NULL, '2021-11-18 06:20:11', '2021-11-18 06:20:11'),
(6, 'App\\Models\\User', 4, 'myapptoken', 'abee1600b846696fc4be6860c46bad1ba0c6feca99b8f7034a5bb28e3d88c898', '[\"*\"]', NULL, '2021-11-18 06:22:43', '2021-11-18 06:22:43'),
(7, 'App\\Models\\User', 5, 'myapptoken', 'fb4788cb3ef8f938a5c97aaa6f25e267f045d33e3cabca306167b5cf9e95a70b', '[\"*\"]', NULL, '2021-11-18 06:26:25', '2021-11-18 06:26:25'),
(8, 'App\\Models\\User', 6, 'myapptoken', '105cebb19095408b7777b86ffa3b014b7bebe092247edbe08795659c18db1da2', '[\"*\"]', NULL, '2021-11-18 06:30:02', '2021-11-18 06:30:02'),
(9, 'App\\Models\\User', 6, 'myapptoken', 'f89e37a42339208f97df79711c32dca55f3cddc87bc923fbd743587bc70306f6', '[\"*\"]', NULL, '2021-11-18 06:30:53', '2021-11-18 06:30:53'),
(10, 'App\\Models\\User', 7, 'myapptoken', '95731117dadbb9574b82e4a1cda57cca45ae3561f7a6a7be69f74371bb37012b', '[\"*\"]', NULL, '2021-11-18 06:31:26', '2021-11-18 06:31:26'),
(11, 'App\\Models\\User', 8, 'myapptoken', '5c9a2b1554d5f80f85abc134cf51da9fb977e16f33cc4299ce7de806758004f9', '[\"*\"]', NULL, '2021-11-18 06:32:26', '2021-11-18 06:32:26'),
(12, 'App\\Models\\User', 9, 'myapptoken', '628e5d7043f83c46706073eae4a6fb6365bc49985114cbd0498f8d253e1ca629', '[\"*\"]', NULL, '2021-11-18 06:34:05', '2021-11-18 06:34:05'),
(13, 'App\\Models\\User', 10, 'myapptoken', 'ea9629238338456e31be9db88147e9fcdc8c1776f0a361ebe87ac2a73a5ae42f', '[\"*\"]', NULL, '2021-11-18 06:53:47', '2021-11-18 06:53:47'),
(14, 'App\\Models\\User', 11, 'myapptoken', '8b7e04cd754755d8d410045c5a32ba112945019136abcc7e9f3ce0f5b5e1c779', '[\"*\"]', NULL, '2021-11-18 06:55:06', '2021-11-18 06:55:06'),
(15, 'App\\Models\\User', 12, 'myapptoken', 'd7ce5973378aca9a1b9379db4788fbb71b57f8a0e49800d29d4088a2cb8f0506', '[\"*\"]', NULL, '2021-11-18 07:03:35', '2021-11-18 07:03:35'),
(16, 'App\\Models\\User', 13, 'myapptoken', '32d2fff5b6a5f6b9b9db424c09b69f5427e77f53db27f71dfe44df33ab37d506', '[\"*\"]', NULL, '2021-11-18 07:04:52', '2021-11-18 07:04:52'),
(17, 'App\\Models\\User', 14, 'myapptoken', 'ffb50fd07fe243d63eb59feb3c69ebb4a1417388cf61049dfb54e8a8c5214afa', '[\"*\"]', NULL, '2021-11-18 07:06:21', '2021-11-18 07:06:21'),
(18, 'App\\Models\\User', 15, 'myapptoken', '4d91d58a1c6534404f0ba3e5780a85bb59c7b5190d52627352f91c1d6d5b5409', '[\"*\"]', NULL, '2021-11-18 07:08:07', '2021-11-18 07:08:07'),
(19, 'App\\Models\\User', 16, 'myapptoken', 'f38db091297ad5d4f01d3f63bbed297a515b3d4ab4cbe8411063a3ba322f245b', '[\"*\"]', NULL, '2021-11-18 07:13:00', '2021-11-18 07:13:00'),
(20, 'App\\Models\\User', 17, 'myapptoken', '3f0228bf2fd82ea99392eab3e4fa1746a0cf5e56e501a97de5f4d0db04ad7498', '[\"*\"]', NULL, '2021-11-18 07:13:35', '2021-11-18 07:13:35'),
(21, 'App\\Models\\User', 13, 'myapptoken', 'efbfa664e574c4ef064c7b964e81aa1f1aa7aec413b6561805e07671229a4431', '[\"*\"]', NULL, '2021-11-18 07:26:12', '2021-11-18 07:26:12'),
(22, 'App\\Models\\User', 14, 'myapptoken', 'bd059899142e6fba3ccc35474f0ae2da69c8534649cf9a085e38b7caa19b962b', '[\"*\"]', NULL, '2021-11-18 07:36:25', '2021-11-18 07:36:25'),
(23, 'App\\Models\\User', 14, 'myapptoken', 'c551b61e310443b1c1f99876da4164e316af178867cef29a126a5d9c6cbb0390', '[\"*\"]', NULL, '2021-11-18 07:36:26', '2021-11-18 07:36:26'),
(24, 'App\\Models\\User', 14, 'myapptoken', '060a353c2d8f90eb4e7450fe6bb2783d4e674b64c617d3ae943ea4ae48440b41', '[\"*\"]', NULL, '2021-11-18 07:51:34', '2021-11-18 07:51:34'),
(25, 'App\\Models\\User', 14, 'myapptoken', '83671293ac61cf710cfe98c7ff6061d8464e73f2d9b5127eef50b47a08c6d171', '[\"*\"]', NULL, '2021-11-18 07:51:53', '2021-11-18 07:51:53'),
(26, 'App\\Models\\User', 14, 'myapptoken', 'e220991833ec528505d636a46a7a8c4aaabb3ebd1d641ba6751beaa822dbb96a', '[\"*\"]', NULL, '2021-11-18 07:52:07', '2021-11-18 07:52:07'),
(27, 'App\\Models\\User', 14, 'myapptoken', 'a1e13fac2932094897ffbf199207d1fb22edc57ac884d6ada7acf88ccbb93c27', '[\"*\"]', NULL, '2021-11-18 07:52:08', '2021-11-18 07:52:08'),
(28, 'App\\Models\\User', 14, 'myapptoken', '80cc50f85a984d7037d70f346b421bd27481fd4748cd9ebf525426aef5c51b8c', '[\"*\"]', NULL, '2021-11-18 07:54:00', '2021-11-18 07:54:00'),
(29, 'App\\Models\\User', 14, 'myapptoken', 'cc49320e5f83c186f04c34d9fd0f685f27866aee50575b5aea53eca00ec9cbf1', '[\"*\"]', NULL, '2021-11-18 07:56:07', '2021-11-18 07:56:07'),
(30, 'App\\Models\\User', 14, 'myapptoken', '13c840b1e5a7617a3f04e369afd83217c42029568ee708df11447ceea3ad1373', '[\"*\"]', NULL, '2021-11-18 07:56:24', '2021-11-18 07:56:24'),
(31, 'App\\Models\\User', 14, 'myapptoken', 'a60a0022afa3b6868c73ea750a529255823b68043a9684f3c1875b86f5c58e6b', '[\"*\"]', NULL, '2021-11-18 07:57:39', '2021-11-18 07:57:39'),
(32, 'App\\Models\\User', 14, 'myapptoken', '241db78ce5d2053eb77265c7f072aa9d77356e83e304b2d9a13ea3f249290db1', '[\"*\"]', NULL, '2021-11-18 08:00:38', '2021-11-18 08:00:38'),
(33, 'App\\Models\\User', 14, 'myapptoken', '8d80300e74b720e44bcb02fa50b3504c78c8b5e9347a789f1be1f79752397d0a', '[\"*\"]', NULL, '2021-11-18 13:38:19', '2021-11-18 13:38:19'),
(34, 'App\\Models\\User', 14, 'myapptoken', '1c0a026eb6a75cd800ae4abc7ec16a3cea19d60a5fc5a6dd41b297f4b92b967c', '[\"*\"]', NULL, '2021-11-19 01:09:26', '2021-11-19 01:09:26'),
(35, 'App\\Models\\User', 14, 'myapptoken', '7d6499dbd58f4d5ab0a7342bec1e99b6fbb4bcd07863817e0f3870a8415d598c', '[\"*\"]', NULL, '2021-11-19 01:28:54', '2021-11-19 01:28:54'),
(36, 'App\\Models\\User', 14, 'myapptoken', 'faca003ff9269a2632baa2da1d94507484c07928ba1d82614976a4948459b260', '[\"*\"]', NULL, '2021-11-19 01:40:48', '2021-11-19 01:40:48'),
(37, 'App\\Models\\User', 14, 'myapptoken', '217c4dcb9a103af4f125b6bd9c5448a750fb48e36b31a9ffa98e054e5fb6d3f2', '[\"*\"]', NULL, '2021-11-19 02:14:55', '2021-11-19 02:14:55'),
(38, 'App\\Models\\User', 18, 'myapptoken', '0d154b55ecb912e5ebc64ab4bbccc2123d4b946c84361d4e283df724676fa372', '[\"*\"]', NULL, '2021-11-19 05:51:35', '2021-11-19 05:51:35'),
(39, 'App\\Models\\User', 18, 'myapptoken', '94a7a2641dce686eb7a71bcc24d7432bca15dbc79df0146ee71e096c288c04cb', '[\"*\"]', NULL, '2021-11-19 05:52:45', '2021-11-19 05:52:45'),
(40, 'App\\Models\\User', 18, 'myapptoken', 'cdf0a65d205724e782b232b93b32eb3ee54f7119a96e880c767039bcace3e275', '[\"*\"]', NULL, '2021-11-19 05:54:11', '2021-11-19 05:54:11'),
(41, 'App\\Models\\User', 14, 'myapptoken', '99472b5e2864b995e11c5dff27bef874e19de8a108ee3a603a8ab47cc5fd5ea2', '[\"*\"]', NULL, '2021-11-19 05:54:58', '2021-11-19 05:54:58'),
(42, 'App\\Models\\User', 14, 'myapptoken', '9d1ba9c72e3ade27630dd074c11d84e9456d72b0cecc993acdba2dfbefa3fcca', '[\"*\"]', NULL, '2021-11-19 05:55:38', '2021-11-19 05:55:38'),
(43, 'App\\Models\\User', 18, 'myapptoken', 'cfb0fe63cc1cab2e5bf650d3a35304d224ff76329796a3461f5c7f63a0ccf980', '[\"*\"]', NULL, '2021-11-19 05:56:49', '2021-11-19 05:56:49'),
(44, 'App\\Models\\User', 14, 'myapptoken', 'e4d3ec458b4de768b23f375f9fad95d485c614c9ef282661e7b68cac7afd836d', '[\"*\"]', NULL, '2021-11-19 05:57:07', '2021-11-19 05:57:07'),
(45, 'App\\Models\\User', 14, 'myapptoken', '0e140ff6dde49f25a3c74aed9f1f21366ee2bdd6d399ec74da18e4c9bb90792a', '[\"*\"]', NULL, '2021-11-19 05:58:47', '2021-11-19 05:58:47'),
(46, 'App\\Models\\User', 18, 'myapptoken', 'fd3fdc6acaa407f5599202dfea2b3d20eb5084e23445c453a1e53e4814c94dde', '[\"*\"]', NULL, '2021-11-19 05:59:00', '2021-11-19 05:59:00'),
(47, 'App\\Models\\User', 18, 'myapptoken', '15a22581fe49b5d862098bd88e290920b6e575789a45df7b659cb300cc520ebf', '[\"*\"]', NULL, '2021-11-19 06:00:20', '2021-11-19 06:00:20'),
(48, 'App\\Models\\User', 18, 'myapptoken', '8dd3cdfcbe040be38f5c7da39d51bdf7f0a2c731396fba1391461c441c5d697f', '[\"*\"]', NULL, '2021-11-19 06:03:30', '2021-11-19 06:03:30'),
(49, 'App\\Models\\User', 18, 'myapptoken', '734eba590a664f6cbb2d3df035f39fb487c3426e3e279cbaf924c8b7bf52d945', '[\"*\"]', NULL, '2021-11-19 06:06:55', '2021-11-19 06:06:55'),
(50, 'App\\Models\\User', 14, 'myapptoken', '337b842d1781f6221494111f126609c4d2abad99ba861ab6795374d68ae9698e', '[\"*\"]', NULL, '2021-11-19 06:07:54', '2021-11-19 06:07:54'),
(51, 'App\\Models\\User', 18, 'myapptoken', '26af095be30b3622bfe93a8ea6817fdf5016949573ad04e6f7f28ea551613c84', '[\"*\"]', NULL, '2021-11-19 06:08:09', '2021-11-19 06:08:09'),
(52, 'App\\Models\\User', 19, 'myapptoken', '589e2dba5233d7a2eb54aae068da111f2b7f459b20c991c0e7de781949dfeec7', '[\"*\"]', NULL, '2021-11-19 06:47:07', '2021-11-19 06:47:07'),
(53, 'App\\Models\\User', 18, 'myapptoken', 'ec9468d6eecdcb833e9382bf4d182b663afc8030492e7f8cd02dc9cc4fa8be95', '[\"*\"]', NULL, '2021-11-19 06:47:51', '2021-11-19 06:47:51'),
(54, 'App\\Models\\User', 19, 'myapptoken', '1b1fce56818871faf72b2f90c6a7328a6c3e3c72b89fab33424fc09ca65877f0', '[\"*\"]', NULL, '2021-11-19 08:12:26', '2021-11-19 08:12:26'),
(55, 'App\\Models\\User', 18, 'myapptoken', '2696ee8bdc3b368977d8f354e685a0ecad569884d7d58e82fce4e2b019e39eab', '[\"*\"]', NULL, '2021-11-19 08:16:16', '2021-11-19 08:16:16'),
(56, 'App\\Models\\User', 19, 'myapptoken', 'dc5678cab41702ec8e19586d40dc7225877007fe1dc9fbb21cdd6c05b523dc8d', '[\"*\"]', NULL, '2021-11-19 08:17:32', '2021-11-19 08:17:32'),
(57, 'App\\Models\\User', 18, 'myapptoken', 'd2a96144a0f9d3e68c565852c2df71801ac84edd25b845a1ff55f0bbefd7f049', '[\"*\"]', NULL, '2021-11-19 08:55:59', '2021-11-19 08:55:59'),
(58, 'App\\Models\\User', 19, 'myapptoken', 'e5384c10ae02eaa8397fc9ab9c09a976ca2bccbd64565605921450458148bad1', '[\"*\"]', NULL, '2021-11-19 09:13:46', '2021-11-19 09:13:46'),
(59, 'App\\Models\\User', 19, 'myapptoken', '35662e752af5dcce07e1233dbfb5185422dd286d66703595a3303bf854f76e91', '[\"*\"]', NULL, '2021-11-19 09:26:54', '2021-11-19 09:26:54'),
(60, 'App\\Models\\User', 18, 'myapptoken', '76c158fce68ad1f059799e93eaab46d5191cf2e4eea40b748f0532548007274c', '[\"*\"]', NULL, '2021-11-21 04:54:19', '2021-11-21 04:54:19'),
(61, 'App\\Models\\User', 19, 'myapptoken', '162579dda0751755e029210239c3802e1a811d8688714c3d5e633008b6c5ef1b', '[\"*\"]', NULL, '2021-11-21 05:16:30', '2021-11-21 05:16:30'),
(62, 'App\\Models\\User', 19, 'myapptoken', '4ec61890344513f72eafd97c9e8a4b385e82501be2afa34af8f199da3ca7c019', '[\"*\"]', NULL, '2021-11-21 05:18:37', '2021-11-21 05:18:37'),
(63, 'App\\Models\\User', 18, 'myapptoken', 'c7a05e89ac7c9c2fc6dd6447302e0b0095a0bd60cffd8db7a86fcb8529c9d75c', '[\"*\"]', NULL, '2021-11-21 06:13:21', '2021-11-21 06:13:21'),
(64, 'App\\Models\\User', 18, 'myapptoken', '9677d017deda4e36faa4d804f2147894d09ae5c5b26be6b60693a741dfeae6bb', '[\"*\"]', NULL, '2021-11-22 12:54:49', '2021-11-22 12:54:49'),
(65, 'App\\Models\\User', 19, 'myapptoken', 'd76fbb280bff9c389762f1647862e3ff99255918e23683f709cee7876e944b11', '[\"*\"]', NULL, '2021-11-22 16:12:42', '2021-11-22 16:12:42'),
(66, 'App\\Models\\User', 18, 'myapptoken', 'c4c4c2bf05fc96c68fa3276e524b5d923e46e85cf62e045e6d14e071f3c2da41', '[\"*\"]', NULL, '2021-11-22 16:13:20', '2021-11-22 16:13:20');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `products_in_stock` bigint(20) DEFAULT NULL,
  `order_number` bigint(20) DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `category_book_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_cover_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `author`, `product_img`, `price`, `products_in_stock`, `order_number`, `description`, `category_book_type_id`, `category_cover_type_id`, `created_at`, `updated_at`) VALUES
(11, 'The Children of Jocasta', 'by Natalie Haynes', 'assets/images/1637673755.jpg', 155, 0, NULL, 'When you have grown up as I have, there is no security in not knowing things, in avoiding the ugliest truths because they can\'t be faced . . . Because that is what happened the last time, and that is why my siblings and I have grown up in a cursed house, children of cursed parents . . .\n\nJocasta is just fifteen when she is told that she must marry the King of Thebes, an old man she has never met. Her life has never been her own, and nor will it be, unless she outlives her strange, absent husband.\n\nIsmene is the same age when she is attacked in the palace she calls home. Since the day of her parents\' tragic deaths a decade earlier, she has always longed to feel safe with the family she still has. But with a single act of violence, all that is about to change.\n\nWith the turn of these two events, a tragedy is set in motion. But not as you know it.\n\nIn Children of Jocasta, Natalie Haynes reimagines the Oedipus and Antigone stories from the perspectives of two of the women who have often been overlooked; retelling the myth to reveal a new side of an ancient story.', 1, 1, '2021-11-23 07:22:35', '2021-11-23 07:22:35'),
(12, 'New York', 'by Edward Rutherfurd', 'assets/images/1637673892.jpg', 200, -2, NULL, 'Edward Rutherfurd tells the story of this great city as no other author could u from the epic, empty grandeur of the New World to the skyscrapers of the City that Never Sleeps, from the intimate detail of lives long forgotten to those lived today at breakneck speed. The novel begins with a tiny Indian fishing village and the Dutch traders who first carved out their hopes amidst the splendour of the wilderness. The British settlers and merchants followed, with their aristocratic governors and unpopular taxation which led to rebellion, war, the burning of the city and the birth of the American Nation. Yet a country that had already rent itself asunder once did so again over slavery. As the country fought its bloody Civil War, the city was torn apart by deadly riots. Hopes and dreams, greed and corruption - they have always been the companions of freedom and opportunity in the city\'s teeming streets. As the immigrant ships berthed next to Ellis Island in the shadow of the Statue of Liberty, they poured more and more Germans, Irish, Italians and Jews into the churning ethnic mix of the city. Deals were struck, politicians corrupted, men bought or assassinated, heiresses wooed, fortunes were speculated on Wall Street and men became rich beyond the dreams of avarice.', 2, 1, '2021-11-23 07:24:52', '2021-11-23 07:24:52'),
(13, 'All Quiet on the Western Front', 'by Erich Maria Remarque', 'assets/images/1637673965.jpg', 255, 9, NULL, 'Considered by many the greatest war novel of all time, All Quiet on the Western Front is Erich Maria Remarque\'s masterpiece of the German experience during World War I.\r\n\r\nI am young, I am twenty years old; yet I know nothing of life but despair, death, fear, and fatuous superficiality cast over an abyss of sorrow. . . .\r\n\r\nThis is the testament of Paul Bäumer, who enlists with his classmates in the German army during World War I. They become soldiers with youthful enthusiasm. But the world of duty, culture, and progress they had been taught breaks in pieces under the first bombardment in the trenches.\r\n\r\nThrough years of vivid horror, Paul holds fast to a single vow: to fight against the principle of hate that meaninglessly pits young men of the same generation but different uniforms against one another . . . if only he can come out of the war alive.', 2, 2, '2021-11-23 07:26:05', '2021-11-23 07:26:05'),
(14, 'War and Peace', 'by Leo Tolstoy', 'assets/images/1637674010.jpg', 450, 22, NULL, 'In this important book, eminent authorities discuss how various nations have sought to integrate their political, economic, and military goals in order to preserve their long-term interests in time of war and peace. Edited and with two chapters written by Paul M. Kennedy, the author of The Rise and Fall of the Great Powers, the book analyzes classic examples of European garand strategies and offers incisive advice on the proper balance of priorities that should be carried out by the United States today.\r\n\r\nThe book begins with a chapter by Kennedy that shows how the concept of grand strategy has broadened from a preoccupation with battlefield operations to a consideration of such factors as the management of national resources, the vital role of diplomacy, and the willingness of the general populace to support the burdens of war or the cost of large defense forces in peacetime. In succeeding chapters John Hattendorf, Michael Howard, and Eliot Cohen analyze British grand strategies in the War of Spanish Succession and the two world wars. Arther Ferrill, J. H. Elliott, Dennis E. Showalter, Douglas Porch, and Condoleeza Rice then discuss grand strategy in the Roman Empire, imperial Spain, Germany, France, and the Soviet Union.\r\n\r\nThe book concludes with reflections by Kennedy on American grand strategy today and in the future. He argues that America must avoid nuclear war, create armed forces flexible enough to deal with a variety of possible fighting contingencies, preserve its alliance system, and institute serious measures to reverse the economic and social trends that have weakened its preeminent position in the world. In other words, says Kennedy, America must maintain a reservoir of productive, financial, technological, and educational strength to be in a good position to meet the unpredictable and turbulent world of the early twenty-first century.', NULL, NULL, '2021-11-23 07:26:50', '2021-11-23 07:26:50'),
(15, 'White Is for Witching', 'by Helen Oyeyemi', 'assets/images/1637674061.jpg', 240, 14, NULL, 'In a vast, mysterious house on the cliffs near Dover, the Silver family is reeling from the hole punched into its heart. Lily is gone and her twins, Miranda and Eliot, and her husband, the gentle Luc, mourn her absence with unspoken intensity. All is not well with the house, either, which creaks and grumbles and malignly confuses visitors in its mazy rooms, forcing winter apples in the garden when the branches should be bare. Generations of women inhabit its walls. And Miranda, with her new appetite for chalk and her keen sense for spirits, is more attuned to them than she is to her brother and father. She is leaving them slowly –\r\n\r\nSlipping away from them –\r\n\r\nAnd when one dark night she vanishes entirely, the survivors are left to tell her story.\r\n\r\nMiri I conjure you\r\n\r\nThis is a spine-tingling tale that has Gothic roots but an utterly modern sensibility. Told by a quartet of crystalline voices, it is electrifying in its expression of myth and memory, loss and magic, fear and love.', 3, 1, '2021-11-23 07:27:41', '2021-11-23 07:27:41');

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

CREATE TABLE `product_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` float DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_orders`
--

INSERT INTO `product_orders` (`id`, `name`, `phone`, `address`, `total`, `user_id`, `product_id`, `cart_id`, `created_at`, `updated_at`) VALUES
(1, 'adfa', '0111111', 'fdf-11', 111, 19, 13, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(18, 'Tanvir Reza Anik', 'tanventure@gmail.com', NULL, '$2y$10$Ij42mP5mD37wC5sWGf3kfO/RgyY5Oo6uOaqu1Wdi/EPnz2vOmL4Ra', NULL, '2021-11-19 05:51:34', '2021-11-19 05:51:34'),
(19, 'Alex', 'Alex@gmail.com', NULL, '$2y$10$mjcGYY2Jtou0penSuqGTKesXBYKWTVi/ZpM859J2w0dochpCKaVF6', NULL, '2021-11-21 05:16:30', '2021-11-21 05:16:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_category_book_type_id_foreign` (`category_book_type_id`),
  ADD KEY `carts_category_cover_type_id_foreign` (`category_cover_type_id`);

--
-- Indexes for table `category_book_types`
--
ALTER TABLE `category_book_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_cover_types`
--
ALTER TABLE `category_cover_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_book_type_id_foreign` (`category_book_type_id`),
  ADD KEY `products_category_cover_type_id_foreign` (`category_cover_type_id`);

--
-- Indexes for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_orders_user_id_foreign` (`user_id`),
  ADD KEY `product_orders_product_id_foreign` (`product_id`),
  ADD KEY `product_orders_cart_id_foreign` (`cart_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `category_book_types`
--
ALTER TABLE `category_book_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category_cover_types`
--
ALTER TABLE `category_cover_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_orders`
--
ALTER TABLE `product_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_category_book_type_id_foreign` FOREIGN KEY (`category_book_type_id`) REFERENCES `category_book_types` (`id`),
  ADD CONSTRAINT `carts_category_cover_type_id_foreign` FOREIGN KEY (`category_cover_type_id`) REFERENCES `category_cover_types` (`id`),
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_book_type_id_foreign` FOREIGN KEY (`category_book_type_id`) REFERENCES `category_book_types` (`id`),
  ADD CONSTRAINT `products_category_cover_type_id_foreign` FOREIGN KEY (`category_cover_type_id`) REFERENCES `category_cover_types` (`id`);

--
-- Constraints for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD CONSTRAINT `product_orders_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `product_orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
