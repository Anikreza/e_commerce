-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 06, 2021 at 11:06 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

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
  `user_id` varchar(222) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderID` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_book_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_cover_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Thriller', NULL, NULL),
(2, 'Adventure', NULL, NULL),
(3, 'Romance', NULL, NULL),
(4, 'Kids', '2021-12-03 11:50:13', '2021-12-03 11:50:13');

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
(23, '2021_11_18_200004_create_carts_table', 3);

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
(66, 'App\\Models\\User', 18, 'myapptoken', 'c4c4c2bf05fc96c68fa3276e524b5d923e46e85cf62e045e6d14e071f3c2da41', '[\"*\"]', NULL, '2021-11-22 16:13:20', '2021-11-22 16:13:20'),
(67, 'App\\Models\\User', 18, 'myapptoken', 'acb5e31bd2c8b7f831788fd11720bd5b6d0d3ef3e0f193764d12b3e230c83d6d', '[\"*\"]', NULL, '2021-11-27 10:46:34', '2021-11-27 10:46:34'),
(68, 'App\\Models\\User', 19, 'myapptoken', '23c85d6dbe2b00b63d0953d50f8a4e78bf1ad32152b334dc17435356eb11cc60', '[\"*\"]', NULL, '2021-11-27 14:57:01', '2021-11-27 14:57:01'),
(69, 'App\\Models\\User', 18, 'myapptoken', '28a6bc9e39dfa5e6fcb0a4e5961603e72f7698ac95332f40576b4c0279a1615b', '[\"*\"]', NULL, '2021-11-27 14:59:19', '2021-11-27 14:59:19'),
(70, 'App\\Models\\User', 19, 'myapptoken', 'e76de7d3abfbde6860cdb83661544372379fa73d0e3ff7752e6d00cf2342f1cd', '[\"*\"]', NULL, '2021-11-27 15:34:42', '2021-11-27 15:34:42'),
(71, 'App\\Models\\User', 18, 'myapptoken', 'aa3b4708a0a0ce634a6d65153a95aa1449a66d57fabc1b9bade87496707616f4', '[\"*\"]', NULL, '2021-11-27 15:35:10', '2021-11-27 15:35:10'),
(72, 'App\\Models\\User', 19, 'myapptoken', '32ea50ac882a2cf34c3d648b93b04f2fc4fa9f9d17aafed92e95fc3276143bf3', '[\"*\"]', NULL, '2021-11-27 15:49:23', '2021-11-27 15:49:23'),
(73, 'App\\Models\\User', 18, 'myapptoken', '686eb5a69f37299c2a5c80d81bdb8bb8c8e226c150e1b93b8118700bd06cdd91', '[\"*\"]', NULL, '2021-11-27 16:02:56', '2021-11-27 16:02:56'),
(74, 'App\\Models\\User', 19, 'myapptoken', 'd49171995cb98c4a1eff837f17640ce76f9e08ecee3aa9e6cba2eeece08864cf', '[\"*\"]', NULL, '2021-11-27 16:06:46', '2021-11-27 16:06:46'),
(75, 'App\\Models\\User', 18, 'myapptoken', 'e8ce992d07129a51f133afb95f469c37ba3d3d00eb3c17adc2d083b8c69102ac', '[\"*\"]', NULL, '2021-11-27 16:08:58', '2021-11-27 16:08:58'),
(76, 'App\\Models\\User', 19, 'myapptoken', '86a114d6902f58ae568345d8f95d0cdeaa5666b323a961f1f006d80c1f401160', '[\"*\"]', NULL, '2021-11-27 16:35:01', '2021-11-27 16:35:01'),
(77, 'App\\Models\\User', 18, 'myapptoken', 'fdb99791b42909c4d1c128955a606827b2b658c82e267fe3f2f583c916a6e4cf', '[\"*\"]', NULL, '2021-11-27 17:18:07', '2021-11-27 17:18:07'),
(78, 'App\\Models\\User', 19, 'myapptoken', 'fc1ed450da43030a9db85f74afdf59f6e95e38f2a56716e24fa0642c21fe461f', '[\"*\"]', NULL, '2021-11-27 17:26:48', '2021-11-27 17:26:48'),
(79, 'App\\Models\\User', 18, 'myapptoken', '0d2b1770e0b064d6f6b92db5c8182a5c71e617828bd9da774b103baabf21781f', '[\"*\"]', NULL, '2021-11-27 17:46:15', '2021-11-27 17:46:15'),
(80, 'App\\Models\\User', 19, 'myapptoken', '868c8b2ad49089f1ab13822436acec5b55cced3f398e439bb4680e5ac533d5ff', '[\"*\"]', NULL, '2021-11-27 18:24:10', '2021-11-27 18:24:10'),
(81, 'App\\Models\\User', 18, 'myapptoken', '22be20f8f48d45630c5c8fbdeeb0b8fedb6d48625ae794ac06282d7885dc4540', '[\"*\"]', NULL, '2021-11-27 18:24:38', '2021-11-27 18:24:38'),
(82, 'App\\Models\\User', 19, 'myapptoken', '72ab440e19829c0b7d30c168f99a5468858be20281b1942c3149728e6979d4d4', '[\"*\"]', NULL, '2021-11-28 05:09:52', '2021-11-28 05:09:52'),
(83, 'App\\Models\\User', 18, 'myapptoken', 'abc03b4171013593d22ee2107e5c3e9e4bd77a60186e707ac6495bff7caab7ef', '[\"*\"]', NULL, '2021-11-28 05:25:00', '2021-11-28 05:25:00'),
(84, 'App\\Models\\User', 19, 'myapptoken', 'cacc21e82b67947a45dcdfc9125e41929470dad4541b734774cc481ba6b8bf15', '[\"*\"]', NULL, '2021-11-28 08:09:20', '2021-11-28 08:09:20'),
(85, 'App\\Models\\User', 18, 'myapptoken', '0d734a8f81e726121f7a40d607ac3256b65cd94387df68fb3d88d3e4530df0e6', '[\"*\"]', NULL, '2021-11-28 08:30:48', '2021-11-28 08:30:48'),
(86, 'App\\Models\\User', 20, 'myapptoken', 'dad9b6f46ae1dd4847184fc98a24657cd9ee8b76dbe4fb0b0d7771c8bdcb74e9', '[\"*\"]', NULL, '2021-11-28 12:35:00', '2021-11-28 12:35:00'),
(87, 'App\\Models\\User', 21, 'myapptoken', 'f50ae55f2a8606391d67fd680a67e0af05804fa39cd81e005f503180d35b46eb', '[\"*\"]', NULL, '2021-11-28 12:35:25', '2021-11-28 12:35:25'),
(88, 'App\\Models\\User', 22, 'myapptoken', '33cdb771ece1677bcb9f03f4806a5a2d27956a4326e598d00b0cfb4bad12be55', '[\"*\"]', NULL, '2021-11-28 12:37:02', '2021-11-28 12:37:02'),
(89, 'App\\Models\\User', 23, 'myapptoken', '060eb076652d77cd21ede5ea2a36e97fa175d245ee29dec78761c64416884886', '[\"*\"]', NULL, '2021-11-28 12:37:58', '2021-11-28 12:37:58'),
(90, 'App\\Models\\User', 19, 'myapptoken', 'bf1e33458d60216a566f484fd1fca8106e5b30d4c74d2765ececa54306b3d70a', '[\"*\"]', NULL, '2021-11-28 12:47:21', '2021-11-28 12:47:21'),
(91, 'App\\Models\\User', 18, 'myapptoken', '2006f1870b5dce5248ac14711da7835fb996658037d8464ede35a637a2a100da', '[\"*\"]', NULL, '2021-11-28 13:55:07', '2021-11-28 13:55:07'),
(92, 'App\\Models\\User', 18, 'myapptoken', '1e5e2b33536914ef99ef9c8a505f139d2ef4188450cfe694e2c7bd4c31667a1b', '[\"*\"]', NULL, '2021-11-28 14:38:10', '2021-11-28 14:38:10'),
(93, 'App\\Models\\User', 18, 'myapptoken', 'fdbe7ab0256a664d4abae5f58fadcb4a15d79ed86f934b5ef6a0c5c4981436be', '[\"*\"]', NULL, '2021-11-28 23:56:35', '2021-11-28 23:56:35'),
(94, 'App\\Models\\User', 19, 'myapptoken', '47eea6b96d6b9ca3985f1b6ffa9ded837ed045ce2756ae1bef8c0eeb0a804a9c', '[\"*\"]', NULL, '2021-11-29 12:56:42', '2021-11-29 12:56:42'),
(95, 'App\\Models\\User', 18, 'myapptoken', 'ed420686ad26d12b63552e9d15ca02a1c60f331464cffe9d4b048328c16d6af3', '[\"*\"]', NULL, '2021-11-29 12:56:53', '2021-11-29 12:56:53'),
(96, 'App\\Models\\User', 18, 'myapptoken', 'bfa8a5d4b7927874285c3c2363382c670d9c3f90e8fd89aa8b4d1f839d5e0241', '[\"*\"]', NULL, '2021-11-29 17:55:15', '2021-11-29 17:55:15'),
(97, 'App\\Models\\User', 18, 'myapptoken', '8848d75aa509e1a54a285e0347d6efe8c423767a27f1b2635d05e5f7fb70dddb', '[\"*\"]', NULL, '2021-11-29 18:22:19', '2021-11-29 18:22:19'),
(98, 'App\\Models\\User', 18, 'myapptoken', '224e50fabceac2555217b10b29491bfc25378757df8d02d1cbd9dcc2fa6379ce', '[\"*\"]', NULL, '2021-11-29 18:22:25', '2021-11-29 18:22:25'),
(99, 'App\\Models\\User', 18, 'myapptoken', '85064f54f4c58610b199059afc8a39b70bf35b693fa943bb1f57dcdc149e7af9', '[\"*\"]', NULL, '2021-11-29 18:23:22', '2021-11-29 18:23:22'),
(100, 'App\\Models\\User', 19, 'myapptoken', '329e93f275c65c26921980245a73186c9dea064fbe547b3b29eb7ca913b59ee3', '[\"*\"]', NULL, '2021-11-29 18:27:26', '2021-11-29 18:27:26'),
(101, 'App\\Models\\User', 18, 'myapptoken', 'b0d32380983cb1694686b56d997366a4077a2e6e6b3684b4951776f56e3b736c', '[\"*\"]', NULL, '2021-11-29 18:37:47', '2021-11-29 18:37:47'),
(102, 'App\\Models\\User', 18, 'myapptoken', 'd2eb4f14cc0ea182064a56bd1b17df0e8bcea3a2b45de1342c2c419822dede5c', '[\"*\"]', NULL, '2021-11-29 18:43:59', '2021-11-29 18:43:59'),
(103, 'App\\Models\\User', 18, 'myapptoken', '15970179d5ebc1b682ac21a5e6f09acd9fd74272b4b6a421e7be90864fafd3bb', '[\"*\"]', NULL, '2021-11-29 18:44:15', '2021-11-29 18:44:15'),
(104, 'App\\Models\\User', 19, 'myapptoken', 'bb9b025964863f81b6c5fd9fb067327f395736108cfb156099623fc672de5722', '[\"*\"]', NULL, '2021-11-29 18:44:27', '2021-11-29 18:44:27'),
(105, 'App\\Models\\User', 18, 'myapptoken', 'dc4ac46f70a57c8c650cb9743e84d2456958fe0e63117f25f387b29886ca14c4', '[\"*\"]', NULL, '2021-11-29 18:50:41', '2021-11-29 18:50:41'),
(106, 'App\\Models\\User', 18, 'myapptoken', '741306d6e5ae4549a49038ea6bc64ca7ef4984705e2ab711fd13302bc137f3e5', '[\"*\"]', NULL, '2021-11-29 18:51:00', '2021-11-29 18:51:00'),
(107, 'App\\Models\\User', 18, 'myapptoken', '736b34ffec615b6cd2b67502e8a18bd33ad21725aa44a78e886ff7951596d3a3', '[\"*\"]', NULL, '2021-11-29 18:51:49', '2021-11-29 18:51:49'),
(108, 'App\\Models\\User', 18, 'myapptoken', 'c981244d63bc19c52afcf01c98b01a49ffff8257824d08c6cebfdaceb27004ae', '[\"*\"]', NULL, '2021-11-29 18:52:46', '2021-11-29 18:52:46'),
(109, 'App\\Models\\User', 18, 'myapptoken', '5bbb8bc724b97c190d7d0509f587241f0c8cefe6e61fbde22f77548fdf8421c0', '[\"*\"]', NULL, '2021-11-29 18:52:52', '2021-11-29 18:52:52'),
(110, 'App\\Models\\User', 18, 'myapptoken', '7e033af765766071550ef40ef656d07b9a074943b18a15396e5b6dfd89db26fa', '[\"*\"]', NULL, '2021-11-29 18:53:14', '2021-11-29 18:53:14'),
(111, 'App\\Models\\User', 18, 'myapptoken', 'bcea6df5882455910bdda2854cc14468a7fd9c8b2e64191fc34c49338e86d549', '[\"*\"]', NULL, '2021-11-29 18:54:20', '2021-11-29 18:54:20'),
(112, 'App\\Models\\User', 18, 'myapptoken', '0e65b1d71ea839fb9e50d32c0568557997050153a264524b7a07a588c91962ee', '[\"*\"]', NULL, '2021-11-29 19:00:43', '2021-11-29 19:00:43'),
(113, 'App\\Models\\User', 18, 'myapptoken', 'b4489da01dacd1930739fa433e0c6eb6c281ce322edb67ea8f014e5ba0988bb6', '[\"*\"]', NULL, '2021-11-29 19:02:26', '2021-11-29 19:02:26'),
(114, 'App\\Models\\User', 18, 'myapptoken', 'f160683f3549c7ff7cb3cac0bce4df536f284741a4f3751bc9c8fe7eb6d5d476', '[\"*\"]', NULL, '2021-11-29 19:04:00', '2021-11-29 19:04:00'),
(115, 'App\\Models\\User', 18, 'myapptoken', '4e8455172ed06b255906e2cc18a63fba941298ccc92989f6321c3f924036957e', '[\"*\"]', NULL, '2021-11-29 19:04:28', '2021-11-29 19:04:28'),
(116, 'App\\Models\\User', 18, 'myapptoken', '4f8e24abb32d0c3ffa6484f694bb3d12387fe67d79f806fff1664c0cdd9fbbb3', '[\"*\"]', NULL, '2021-11-29 19:05:46', '2021-11-29 19:05:46'),
(117, 'App\\Models\\User', 18, 'myapptoken', 'bf3cbda84b754cb200bb38fea5a4b29313546b14ee48576c9252d7a4c6434ee7', '[\"*\"]', NULL, '2021-11-29 19:08:48', '2021-11-29 19:08:48'),
(118, 'App\\Models\\User', 18, 'myapptoken', 'f4324e3dd37a6df4f0c7f2221695db48e2a50e14e4fabcce85bb653dd36c8418', '[\"*\"]', NULL, '2021-11-29 19:11:28', '2021-11-29 19:11:28'),
(119, 'App\\Models\\User', 19, 'myapptoken', '387a7d3feec2c4900dedff781bc42803d95778a1933e8662b57bef26f6c2ca11', '[\"*\"]', NULL, '2021-11-29 19:11:36', '2021-11-29 19:11:36'),
(120, 'App\\Models\\User', 18, 'myapptoken', 'b5a73870621eef8e23ebd2421922391360a267faf74bcaec6dce8e45179daf8c', '[\"*\"]', NULL, '2021-11-29 19:16:57', '2021-11-29 19:16:57'),
(121, 'App\\Models\\User', 18, 'myapptoken', '88370bdef16ce442871495e53bd0b8aedef4fd40009d42ca608f4e6e9ff34608', '[\"*\"]', NULL, '2021-11-30 12:48:35', '2021-11-30 12:48:35'),
(122, 'App\\Models\\User', 18, 'myapptoken', 'eedbf1727bd96a66348d3827b09470bc46dcf624f25f03d54e9f2d22c7463774', '[\"*\"]', NULL, '2021-11-30 12:48:52', '2021-11-30 12:48:52'),
(123, 'App\\Models\\User', 19, 'myapptoken', 'a8879cb93dd84b47d06f417ca2a7a1afd51a9108e99fc7658d1e4097de1b08ae', '[\"*\"]', NULL, '2021-11-30 14:19:35', '2021-11-30 14:19:35'),
(124, 'App\\Models\\User', 18, 'myapptoken', 'ad486ef1946c4f193aec4a96de7d484671f0269ea682cf934b8ee24538197d6d', '[\"*\"]', NULL, '2021-12-01 09:23:19', '2021-12-01 09:23:19'),
(125, 'App\\Models\\User', 19, 'myapptoken', '8626a9e08da439720963b17349e3cec79dc6b926f219e41782de1b0f7bdb209c', '[\"*\"]', NULL, '2021-12-01 09:32:11', '2021-12-01 09:32:11'),
(126, 'App\\Models\\User', 18, 'myapptoken', 'ec17189a408af67c7c1e2add46e9bccbfdbd77af464b37739a90ec6b2eca5fa3', '[\"*\"]', NULL, '2021-12-01 09:32:42', '2021-12-01 09:32:42'),
(127, 'App\\Models\\User', 18, 'myapptoken', '3dcc8ed7017e85a3dce6585730f0a4df921ddcbcd12c403d62316b91b682f0df', '[\"*\"]', NULL, '2021-12-01 09:52:57', '2021-12-01 09:52:57'),
(128, 'App\\Models\\User', 18, 'myapptoken', 'bed922a814ddcc5e799070e7d42c149ffaca7d138155f970805fdc82e60401fe', '[\"*\"]', NULL, '2021-12-01 09:53:57', '2021-12-01 09:53:57'),
(129, 'App\\Models\\User', 18, 'myapptoken', '320dd7f43b9c5e1a0a4c28a21faf657b70fce77573ca3f89ee8c47726dfd7942', '[\"*\"]', NULL, '2021-12-01 15:20:10', '2021-12-01 15:20:10'),
(130, 'App\\Models\\User', 18, 'myapptoken', 'dfc04d947e38cdce9b3992d8b6ef0846715d9c99511c63e7d609f55e505526df', '[\"*\"]', NULL, '2021-12-01 16:45:16', '2021-12-01 16:45:16'),
(131, 'App\\Models\\User', 18, 'myapptoken', 'a639abf6e6134acd455f18c7622614d6ac6f8ec7ff8eb1ea3aacb283fa421374', '[\"*\"]', NULL, '2021-12-01 16:46:58', '2021-12-01 16:46:58'),
(132, 'App\\Models\\User', 19, 'myapptoken', '79fd492bd2ab3336736689f03dfa18c7cff936ceddd3a5f20d1762f1d9773c1b', '[\"*\"]', NULL, '2021-12-01 16:49:37', '2021-12-01 16:49:37'),
(133, 'App\\Models\\User', 19, 'myapptoken', '001e4203537ff8e64e09a58403192266a839aa63ae139346515fc95f25375b1e', '[\"*\"]', NULL, '2021-12-01 16:50:00', '2021-12-01 16:50:00'),
(134, 'App\\Models\\User', 18, 'myapptoken', 'e8fb6b0cdd57642e9f8db3a2bd8d491f06c23b1cb00c2d57b657b31954e1e24c', '[\"*\"]', NULL, '2021-12-01 16:51:11', '2021-12-01 16:51:11'),
(135, 'App\\Models\\User', 18, 'myapptoken', '3b52a987e3b88f524c75d477dc4f458f858fdb81c70675cabe81a2167ba3a06c', '[\"*\"]', NULL, '2021-12-01 20:08:08', '2021-12-01 20:08:08'),
(136, 'App\\Models\\User', 18, 'myapptoken', '10d4dc9eec2cb453f81f92a6fa3bd1f1c2c5391944aa97ba0ed6d52652ec3099', '[\"*\"]', NULL, '2021-12-01 20:53:37', '2021-12-01 20:53:37'),
(137, 'App\\Models\\User', 18, 'myapptoken', '04f0d83e24422aa7017d35a362a9517902819a24c2afb0740d8dc6f5e8cfa321', '[\"*\"]', NULL, '2021-12-01 20:55:48', '2021-12-01 20:55:48'),
(138, 'App\\Models\\User', 18, 'myapptoken', '3efdbd444164ae58994e202a41b1ccb1d306c5b487b5ea6afce70b474a8e168c', '[\"*\"]', NULL, '2021-12-01 22:23:55', '2021-12-01 22:23:55'),
(139, 'App\\Models\\User', 19, 'myapptoken', 'a84d94570252db43386dfcf4a44cdd749af44fa4a222137f4185a8a1ce0ef16e', '[\"*\"]', NULL, '2021-12-02 13:08:37', '2021-12-02 13:08:37'),
(140, 'App\\Models\\User', 19, 'myapptoken', '70365243fc14ef21d08237ef19010c265654f1ed5e37dfe3376ddf844fac306a', '[\"*\"]', NULL, '2021-12-02 13:08:42', '2021-12-02 13:08:42'),
(141, 'App\\Models\\User', 18, 'myapptoken', '6988148c1c8a07ae6b1d3d99c9889150c7d8b5d3e52ba285f25f049f3393ac4a', '[\"*\"]', NULL, '2021-12-02 13:09:05', '2021-12-02 13:09:05'),
(142, 'App\\Models\\User', 18, 'myapptoken', 'c5e6177c945a09cdf6d7ef4d3dad3767a3ca04008c3f97dbfd1986a37ad4354a', '[\"*\"]', NULL, '2021-12-02 13:12:16', '2021-12-02 13:12:16'),
(143, 'App\\Models\\User', 19, 'myapptoken', '1d220f91fa009ef5deb03c9a7ff2a9dd445aa77996f7e232f7cfb3d53e6dadda', '[\"*\"]', NULL, '2021-12-02 13:18:15', '2021-12-02 13:18:15'),
(144, 'App\\Models\\User', 19, 'myapptoken', '48913365c05b45e5e6233ea81b57b23c89daa680a6096dec1e63e3f5f5405f00', '[\"*\"]', NULL, '2021-12-02 13:25:32', '2021-12-02 13:25:32'),
(145, 'App\\Models\\User', 18, 'myapptoken', '7828fd21780c8dcbe6466c3f102bb146391ef029114d2db0f32c2a0742ca7b05', '[\"*\"]', NULL, '2021-12-02 13:27:20', '2021-12-02 13:27:20'),
(146, 'App\\Models\\User', 19, 'myapptoken', 'f49708e015fd8631585bd330adb5fc5ff76656a36f3490d22c27f5b301645b58', '[\"*\"]', NULL, '2021-12-02 15:31:40', '2021-12-02 15:31:40'),
(147, 'App\\Models\\User', 18, 'myapptoken', '8ce82fc7cdf96cfc0c5e2a9d473ca4e26ff70be6681d696c272ac2fde9f1ace9', '[\"*\"]', NULL, '2021-12-02 15:44:05', '2021-12-02 15:44:05'),
(148, 'App\\Models\\User', 18, 'myapptoken', '15c84c65398946afe6a0df98405e6187458bbaf0bdae963a14c323b3fc82c614', '[\"*\"]', NULL, '2021-12-02 17:27:40', '2021-12-02 17:27:40'),
(149, 'App\\Models\\User', 18, 'myapptoken', 'c6602c0c2fdd3f2285cfe664ab5408e544da88bb1757122bd43638260bd2c313', '[\"*\"]', NULL, '2021-12-02 17:28:51', '2021-12-02 17:28:51'),
(150, 'App\\Models\\User', 18, 'myapptoken', '49650cfc8f685a889d17c51a1ceb2d772b33f3b02fe8f7c1c578aa4025338d2e', '[\"*\"]', NULL, '2021-12-02 17:46:09', '2021-12-02 17:46:09'),
(151, 'App\\Models\\User', 18, 'myapptoken', 'f1c9fa0cb8994a05a61efe0a46033de68a46edac42b578e900b2d42cb37445e5', '[\"*\"]', NULL, '2021-12-02 17:47:00', '2021-12-02 17:47:00'),
(152, 'App\\Models\\User', 18, 'myapptoken', '2e5ebd3b6d7d70b2bcf2d6129f16bc39e866f1b815cb765f2b80c7ed55bd3485', '[\"*\"]', NULL, '2021-12-02 21:23:19', '2021-12-02 21:23:19'),
(153, 'App\\Models\\User', 19, 'myapptoken', 'ef2981ed2b1fd10468de4bea66ad7a840c32a7e5f0670bac2d40b62ceb767ff5', '[\"*\"]', NULL, '2021-12-02 21:52:17', '2021-12-02 21:52:17'),
(154, 'App\\Models\\User', 18, 'myapptoken', '3e0ead092f36a0786583e4b22790b097713387e3365df632093cf1c4ddefa207', '[\"*\"]', NULL, '2021-12-02 23:03:02', '2021-12-02 23:03:02'),
(155, 'App\\Models\\User', 18, 'myapptoken', '9eecd7eecde370dc35ae0151463fa0f93dc45d2500ffeef09b0d1c5c6b9894c6', '[\"*\"]', NULL, '2021-12-02 23:07:16', '2021-12-02 23:07:16'),
(156, 'App\\Models\\User', 18, 'myapptoken', '1099aef6bda04dc7930b71665503fc092a3ace22b8bb8e21f6a8799fac2114fa', '[\"*\"]', NULL, '2021-12-03 07:08:05', '2021-12-03 07:08:05'),
(157, 'App\\Models\\User', 20, 'myapptoken', '35c1d341efb8011e43541d2f8a3758177fa319c66428bd45832e4b7228fcc348', '[\"*\"]', NULL, '2021-12-03 07:38:26', '2021-12-03 07:38:26'),
(158, 'App\\Models\\User', 21, 'myapptoken', 'a4e00130bac94f8ab44fa2b8c2607e9dfc805f41fddca980eaadaa8652629e52', '[\"*\"]', NULL, '2021-12-03 07:39:17', '2021-12-03 07:39:17'),
(159, 'App\\Models\\User', 18, 'myapptoken', '709ced141550274b65cfaf2ad75fa229d68559585beea13444e95ffd1cd13c91', '[\"*\"]', NULL, '2021-12-03 07:42:05', '2021-12-03 07:42:05'),
(160, 'App\\Models\\User', 22, 'myapptoken', 'cf0dbe46ea45a1c792a92d46877573e54afe75771f400a64f1afaf16aa9de75f', '[\"*\"]', NULL, '2021-12-03 07:45:18', '2021-12-03 07:45:18'),
(161, 'App\\Models\\User', 23, 'myapptoken', 'ffee0a7a38ed98d29b79393a5cd415d920157a222fc46ecca5c1a6809498e4e9', '[\"*\"]', NULL, '2021-12-03 07:46:36', '2021-12-03 07:46:36'),
(162, 'App\\Models\\User', 24, 'myapptoken', 'd3c4d432a9c149155cec95e408895c9e07c8755a50299616524cd15e0dc3ebe2', '[\"*\"]', NULL, '2021-12-03 07:48:10', '2021-12-03 07:48:10'),
(163, 'App\\Models\\User', 25, 'myapptoken', 'deb1522f0ee4dba1590c8e832ba9399357f4b81f69db810d9c136e8b977852c9', '[\"*\"]', NULL, '2021-12-03 07:49:53', '2021-12-03 07:49:53'),
(164, 'App\\Models\\User', 26, 'myapptoken', '8115286a6a40add4c0de0c7654cd593edc85fd978ec93281a337a1f5430ad466', '[\"*\"]', NULL, '2021-12-03 07:52:50', '2021-12-03 07:52:50'),
(165, 'App\\Models\\User', 27, 'myapptoken', '9d9d044b5fb53f7705340ca3b67fcdbceaf226e8057a742e6313a539a6ce7b2d', '[\"*\"]', NULL, '2021-12-03 07:56:29', '2021-12-03 07:56:29'),
(166, 'App\\Models\\User', 28, 'myapptoken', '2d7ea5a02d85f989fecb2a932863ea606facc0b2e56853ba66c106458da35ce1', '[\"*\"]', NULL, '2021-12-03 07:57:52', '2021-12-03 07:57:52'),
(167, 'App\\Models\\User', 29, 'myapptoken', '56176588b5a2572e0ec132ebc1ddc93f624aa4e91b8bae9aa189a5b5bfed9dad', '[\"*\"]', NULL, '2021-12-03 08:01:30', '2021-12-03 08:01:30'),
(168, 'App\\Models\\User', 30, 'myapptoken', '4a78bf5e206a7094e5c407c88bd500624806d3e3e28c32292df0537f216e0707', '[\"*\"]', NULL, '2021-12-03 08:02:54', '2021-12-03 08:02:54'),
(169, 'App\\Models\\User', 31, 'myapptoken', 'ba77c01287c9a2b5bddc61368a0aeee5ab4606011f9594af1d3cb2f2b75bfaf7', '[\"*\"]', NULL, '2021-12-03 08:04:05', '2021-12-03 08:04:05'),
(170, 'App\\Models\\User', 32, 'myapptoken', '9eba860ff0d7d5869e21fa67885c1f6b01c378af18b7753b15efa9a48df410c7', '[\"*\"]', NULL, '2021-12-03 08:05:03', '2021-12-03 08:05:03'),
(171, 'App\\Models\\User', 18, 'myapptoken', '86b1b2d8f5bedce00f0dfeea14ba41129a56033236abd16c80fa5ebe74767ade', '[\"*\"]', NULL, '2021-12-03 08:07:27', '2021-12-03 08:07:27'),
(172, 'App\\Models\\User', 18, 'myapptoken', 'c0923d897ab42bac0400eb210f6d6c848c59f4555da5a81449cbddfcfa215e55', '[\"*\"]', NULL, '2021-12-03 08:07:32', '2021-12-03 08:07:32'),
(173, 'App\\Models\\User', 18, 'myapptoken', '4553ac44c6c704ed79f0c44020b6af2bd43125f0e5cf65a8ec64ecb417280b8c', '[\"*\"]', NULL, '2021-12-03 08:07:32', '2021-12-03 08:07:32'),
(174, 'App\\Models\\User', 18, 'myapptoken', 'fc144a6a585e37bdbbb3400822061ab01d44cdf0296d7958c00d405ef2170134', '[\"*\"]', NULL, '2021-12-03 08:07:32', '2021-12-03 08:07:32'),
(175, 'App\\Models\\User', 18, 'myapptoken', '0136a095c2e68075ac20353db46ea083b3536974f54e9f1b57d2d3327dbe034f', '[\"*\"]', NULL, '2021-12-03 08:07:33', '2021-12-03 08:07:33'),
(176, 'App\\Models\\User', 18, 'myapptoken', '0c03edc2d8a3ce47a9585e5b1580437e0b74ae1e7999211006dc9c1d6720f70c', '[\"*\"]', NULL, '2021-12-03 08:07:36', '2021-12-03 08:07:36'),
(177, 'App\\Models\\User', 18, 'myapptoken', '15d61da482abf0f2175df346cf5a4d24f2c4b4fc3fd8e8b58409f9b420899b22', '[\"*\"]', NULL, '2021-12-03 08:28:00', '2021-12-03 08:28:00'),
(178, 'App\\Models\\User', 19, 'myapptoken', 'c4e9f0a80d05e33ab3e27b66795267e7688cdb3ba6a5597c1c88a9f25f6013f3', '[\"*\"]', NULL, '2021-12-03 08:36:19', '2021-12-03 08:36:19'),
(179, 'App\\Models\\User', 18, 'myapptoken', '18122be64f1893daf43de3a558d5bba5d37a73846a2041652ac614f022c916fa', '[\"*\"]', NULL, '2021-12-03 08:38:23', '2021-12-03 08:38:23'),
(180, 'App\\Models\\User', 19, 'myapptoken', '6de1ac3cab2b65a20776e3263c1451fa05c1ca5d6f5c8a21c0d08bf190faadb1', '[\"*\"]', NULL, '2021-12-03 08:38:49', '2021-12-03 08:38:49'),
(181, 'App\\Models\\User', 18, 'myapptoken', '84f17f0b632ba3bd7cffd6d9ec0a73d8875b684ccb9068009dfdbbfa10bd888f', '[\"*\"]', NULL, '2021-12-03 08:39:46', '2021-12-03 08:39:46'),
(182, 'App\\Models\\User', 19, 'myapptoken', '85234bd60935f3734070c349b0af58e522904252a658a56c95db8ab36fa69cd6', '[\"*\"]', NULL, '2021-12-03 08:40:51', '2021-12-03 08:40:51'),
(183, 'App\\Models\\User', 18, 'myapptoken', 'b49c0a4fe05333f236deed94b1dedb044bc90b6b053f224520e6b4289a665faf', '[\"*\"]', NULL, '2021-12-03 08:54:41', '2021-12-03 08:54:41'),
(184, 'App\\Models\\User', 19, 'myapptoken', '992ffaab69e30f97b2c50474a9824bcae354e347a3b1aa1b5a50d35a032ad329', '[\"*\"]', NULL, '2021-12-03 08:55:15', '2021-12-03 08:55:15'),
(185, 'App\\Models\\User', 19, 'myapptoken', '9fbc951b100f50d866234e02f003ba455be12e4605ed8c1914e57f86ad83547a', '[\"*\"]', NULL, '2021-12-03 08:57:15', '2021-12-03 08:57:15'),
(186, 'App\\Models\\User', 18, 'myapptoken', '5a450776aa8062e5f3f6a9cf2a3e0208a2a4953f9e88c8d488f23a837ee2f55b', '[\"*\"]', NULL, '2021-12-03 09:08:40', '2021-12-03 09:08:40'),
(187, 'App\\Models\\User', 19, 'myapptoken', 'fc60b07e652a9a3cc581cbb240f9498cf26c6ace8956f7c080a7ed5ce60f354c', '[\"*\"]', NULL, '2021-12-03 09:19:18', '2021-12-03 09:19:18'),
(188, 'App\\Models\\User', 18, 'myapptoken', 'f8a6880431261e033f83a8acec8e6cd4c54c870897d869c98e2ce9cc4767af72', '[\"*\"]', NULL, '2021-12-03 09:49:26', '2021-12-03 09:49:26'),
(189, 'App\\Models\\User', 19, 'myapptoken', '4c203329b1efe9b3182389483603c3ec5efccf2dbcf7ced4ce73d43ca97a94b9', '[\"*\"]', NULL, '2021-12-03 10:30:29', '2021-12-03 10:30:29'),
(190, 'App\\Models\\User', 18, 'myapptoken', '9e7db03ecdc7748b489849b880ac9b6e09dc5f26591b48a7d77281774e31cb78', '[\"*\"]', NULL, '2021-12-03 10:47:18', '2021-12-03 10:47:18'),
(191, 'App\\Models\\User', 19, 'myapptoken', 'd6f5aa22660414efd40658e8d72e961ec8e4020270fb31d2767c8d2bfb25745d', '[\"*\"]', NULL, '2021-12-03 12:16:51', '2021-12-03 12:16:51'),
(192, 'App\\Models\\User', 18, 'myapptoken', '232e6767caecb52887564ea4eb29d1584eb740707122964b45694d73dba935bb', '[\"*\"]', NULL, '2021-12-03 15:05:14', '2021-12-03 15:05:14'),
(193, 'App\\Models\\User', 19, 'myapptoken', '22c142fcffd4e96fdc9767aa6a86e919d3a56087601fabb60f88a17dbc7a29ec', '[\"*\"]', NULL, '2021-12-03 15:38:47', '2021-12-03 15:38:47'),
(194, 'App\\Models\\User', 18, 'myapptoken', 'd269ef26eed6d2fa45efa887cce66e73505db645c7ac72a47710d0d540ccc5d6', '[\"*\"]', NULL, '2021-12-03 15:40:38', '2021-12-03 15:40:38'),
(195, 'App\\Models\\User', 19, 'myapptoken', 'e35c0c51d5ac6938eb1c80d05aa95826a42233eb6bb59765c6c5a554517b1da8', '[\"*\"]', NULL, '2021-12-03 15:41:16', '2021-12-03 15:41:16'),
(196, 'App\\Models\\User', 18, 'myapptoken', 'c478b7641f4b491270b42ae632f49ac0911b03be0b7437cf4239a873297decfb', '[\"*\"]', NULL, '2021-12-03 15:43:55', '2021-12-03 15:43:55'),
(197, 'App\\Models\\User', 18, 'myapptoken', 'a5e5f51205ca33e832711617f4d4bc0b7fad6be67898ad3aa7ee20f1e5e926ee', '[\"*\"]', NULL, '2021-12-03 15:45:08', '2021-12-03 15:45:08'),
(198, 'App\\Models\\User', 18, 'myapptoken', '671104a5a786e63be5bca36379b0cd0bddfad938c9601f967ffa0a3526e91c18', '[\"*\"]', NULL, '2021-12-03 16:02:11', '2021-12-03 16:02:11'),
(199, 'App\\Models\\User', 19, 'myapptoken', 'ee6e408b00cefe455c2a2002ebf3bf7d2000956138767cb026f200a116a734d0', '[\"*\"]', NULL, '2021-12-03 17:41:15', '2021-12-03 17:41:15'),
(200, 'App\\Models\\User', 18, 'myapptoken', 'b125d9b22ca28659d360680490c0586fb1588e010ce44c8ff4803c404ecb1e1a', '[\"*\"]', NULL, '2021-12-03 18:24:21', '2021-12-03 18:24:21'),
(201, 'App\\Models\\User', 19, 'myapptoken', '48d795cc5b48e20479e10e25b5a9391470baa821d21078d65472a8f978c18fdd', '[\"*\"]', NULL, '2021-12-03 18:26:06', '2021-12-03 18:26:06'),
(202, 'App\\Models\\User', 18, 'myapptoken', 'c91ce77a67053a3145195501be28823afefbaefa71b8bbb343d16403cebb6718', '[\"*\"]', NULL, '2021-12-03 18:42:33', '2021-12-03 18:42:33'),
(203, 'App\\Models\\User', 19, 'myapptoken', '25a955eb6ab1df82a022ca3ea7875c8cb8ad6822e213c9270b485452fc34cc84', '[\"*\"]', NULL, '2021-12-03 18:43:09', '2021-12-03 18:43:09'),
(204, 'App\\Models\\User', 19, 'myapptoken', '913487ad99fc5d99aba85f27a72618b40cbc919b87b3167ab9e95f3faa9ee3be', '[\"*\"]', NULL, '2021-12-03 18:51:07', '2021-12-03 18:51:07'),
(205, 'App\\Models\\User', 18, 'myapptoken', 'cd88c0e81b8f0c95fdefea046c2a0ecdba64c97979e5bd07495dafee8a48e728', '[\"*\"]', NULL, '2021-12-03 18:53:18', '2021-12-03 18:53:18'),
(206, 'App\\Models\\User', 19, 'myapptoken', 'df41dfa867add2fdd28d9244bbdc1ba7e54f1f6f8accfcdff4119309fff184a5', '[\"*\"]', NULL, '2021-12-03 18:54:37', '2021-12-03 18:54:37'),
(207, 'App\\Models\\User', 18, 'myapptoken', '66abbb868fdea484bf37bad5a8f48107d33e84acfd7b54b33c75cf630046f636', '[\"*\"]', NULL, '2021-12-03 18:54:44', '2021-12-03 18:54:44'),
(208, 'App\\Models\\User', 19, 'myapptoken', '071434c5bd0b81dc66ea81602170a8ad7b2ee906ae665baab69015b55778069f', '[\"*\"]', NULL, '2021-12-03 18:55:52', '2021-12-03 18:55:52'),
(209, 'App\\Models\\User', 18, 'myapptoken', '326f98ba5c5527810cc41e321c9c73fc1218b1fa74220971e9352f2d388a93a9', '[\"*\"]', NULL, '2021-12-03 18:56:31', '2021-12-03 18:56:31'),
(210, 'App\\Models\\User', 19, 'myapptoken', 'ed1a6f2531ec124facb12f10158fac4e30b665dd69790abe030f4e199ad2356c', '[\"*\"]', NULL, '2021-12-03 18:56:36', '2021-12-03 18:56:36'),
(211, 'App\\Models\\User', 18, 'myapptoken', 'd300ec75063c5ad255b3ee6341e606af87b0cbcf45c4978c98b3818970954452', '[\"*\"]', NULL, '2021-12-04 01:00:06', '2021-12-04 01:00:06'),
(212, 'App\\Models\\User', 19, 'myapptoken', '0a933b09376df8c14c442686ffd00359753bcaa0c7dde1d8a48d51e921df1bec', '[\"*\"]', NULL, '2021-12-04 01:21:03', '2021-12-04 01:21:03'),
(213, 'App\\Models\\User', 18, 'myapptoken', 'c8201ec89742426270b4429a1ef71dba1ab1fc699c7bd1d720ce32f70fee9ef3', '[\"*\"]', NULL, '2021-12-04 01:36:02', '2021-12-04 01:36:02'),
(214, 'App\\Models\\User', 19, 'myapptoken', '824158d656e654bdba672969f7764d9700059e179b956b8f61c23fd90a9e22b7', '[\"*\"]', NULL, '2021-12-04 10:50:52', '2021-12-04 10:50:52'),
(215, 'App\\Models\\User', 18, 'myapptoken', '0e14896ff8a00fe07d0e1e77ff3ed3f3b062e7b61fe70eef177977bb43b6c73c', '[\"*\"]', NULL, '2021-12-04 11:26:19', '2021-12-04 11:26:19'),
(216, 'App\\Models\\User', 19, 'myapptoken', '2d200725bb4cfdbef70125c90e956e70e232802bb8e7feb46db7db26af1fed14', '[\"*\"]', NULL, '2021-12-04 11:26:35', '2021-12-04 11:26:35'),
(217, 'App\\Models\\User', 18, 'myapptoken', 'ded210bd9b7ad1e05a37134e157d057530dd606aa7bda9969810c7801ba05f3c', '[\"*\"]', NULL, '2021-12-04 11:27:37', '2021-12-04 11:27:37'),
(218, 'App\\Models\\User', 19, 'myapptoken', '53d18865195ebc185d67d2fbf51d98d296b35c45eb892593284f0111bc1c58f8', '[\"*\"]', NULL, '2021-12-04 11:38:23', '2021-12-04 11:38:23'),
(219, 'App\\Models\\User', 18, 'myapptoken', 'f54c686abf6ea96a06a192f90e298479f338dcb46867e2be3db36b2923cafeb2', '[\"*\"]', NULL, '2021-12-04 12:59:45', '2021-12-04 12:59:45'),
(220, 'App\\Models\\User', 19, 'myapptoken', '03a6d3349c7d85dccce54e349dd1fe09e910ac85afc01b43fe9f5b44e70a78a7', '[\"*\"]', NULL, '2021-12-04 13:01:14', '2021-12-04 13:01:14'),
(221, 'App\\Models\\User', 18, 'myapptoken', 'a6421207376b341fb30b28e8bdd71b38ce521b43f0a1131fb85755f1593e85cb', '[\"*\"]', NULL, '2021-12-04 13:10:45', '2021-12-04 13:10:45'),
(222, 'App\\Models\\User', 19, 'myapptoken', '716c68b7ff09fdf18f5aef394094e8429545e6a6120ada36aac7c0c659d851c5', '[\"*\"]', NULL, '2021-12-04 13:23:23', '2021-12-04 13:23:23'),
(223, 'App\\Models\\User', 18, 'myapptoken', '1d1f2302c2676a996737bebacac4d35e15d051138f032238d4b74762aff4919f', '[\"*\"]', NULL, '2021-12-04 14:52:37', '2021-12-04 14:52:37'),
(224, 'App\\Models\\User', 19, 'myapptoken', '888fbc0c655da6635e90df83fb0ac814f894368bd22db89431cc972d05feb815', '[\"*\"]', NULL, '2021-12-04 14:53:24', '2021-12-04 14:53:24'),
(225, 'App\\Models\\User', 18, 'myapptoken', '54106ca57048094bc88553623ca45976e9a263fedb6f16381eb90e0efe73829f', '[\"*\"]', NULL, '2021-12-04 16:14:30', '2021-12-04 16:14:30'),
(226, 'App\\Models\\User', 19, 'myapptoken', '565d11a15313a4d5b055b7a80b2575f29fb59aac7de28dc947d128252a3aed0f', '[\"*\"]', NULL, '2021-12-04 16:17:25', '2021-12-04 16:17:25'),
(227, 'App\\Models\\User', 19, 'myapptoken', '3b88b4f6aed64dd2e4bb2f6983f4b74070da8cb564ec315df145596845668396', '[\"*\"]', NULL, '2021-12-04 16:45:36', '2021-12-04 16:45:36'),
(228, 'App\\Models\\User', 18, 'myapptoken', 'b27199083b518fd565c0345826a35fea6dec2acdcac4b009235756b93398b26a', '[\"*\"]', NULL, '2021-12-04 17:39:43', '2021-12-04 17:39:43'),
(229, 'App\\Models\\User', 19, 'myapptoken', '0ec826d7796b509beab0fe217335697802fa8130d199a2c9371ad416e1ef5b83', '[\"*\"]', NULL, '2021-12-04 17:41:58', '2021-12-04 17:41:58'),
(230, 'App\\Models\\User', 18, 'myapptoken', '075d4bcdeca23ad5d6476a8360ee798f017dde60b48353ef2ab5de06d0d4e7e9', '[\"*\"]', NULL, '2021-12-04 17:51:05', '2021-12-04 17:51:05'),
(231, 'App\\Models\\User', 19, 'myapptoken', 'ff2243627ecabecf753b1778c81d45d420a7022a2d668d5bdaea5abd32645852', '[\"*\"]', NULL, '2021-12-04 17:51:24', '2021-12-04 17:51:24'),
(232, 'App\\Models\\User', 18, 'myapptoken', '82acab44dcc2d690c984b5d05579ae45689ecfb4465f85500ef946e62c306f9c', '[\"*\"]', NULL, '2021-12-04 20:15:38', '2021-12-04 20:15:38'),
(233, 'App\\Models\\User', 19, 'myapptoken', 'ebf2a13cafc6b4be9468f8dc74c2ca3b90a7db101126b3fc96ff39339dd91eac', '[\"*\"]', NULL, '2021-12-04 20:19:56', '2021-12-04 20:19:56'),
(234, 'App\\Models\\User', 18, 'myapptoken', '6fae5062ad8271536216002103bd9a5bc9fe043ab0ead3cbe8b87613d3107339', '[\"*\"]', NULL, '2021-12-04 20:33:26', '2021-12-04 20:33:26'),
(235, 'App\\Models\\User', 19, 'myapptoken', 'e84765c40b21730708f589675eb502e18f70e64873983f3b5b0c5248b5c60e27', '[\"*\"]', NULL, '2021-12-04 20:33:50', '2021-12-04 20:33:50'),
(236, 'App\\Models\\User', 19, 'myapptoken', 'd70cfb9bec9f4ff300197fc1b3af47a8bfe1bf62a28a9f0c68aaa8fe0563c23c', '[\"*\"]', NULL, '2021-12-04 20:43:53', '2021-12-04 20:43:53'),
(237, 'App\\Models\\User', 18, 'myapptoken', '33c80a2bf499302cc049586cdd77358ea0c472402d5b42240c5cd0a67d2b1669', '[\"*\"]', NULL, '2021-12-04 21:34:00', '2021-12-04 21:34:00'),
(238, 'App\\Models\\User', 18, 'myapptoken', '25295984a1542de11243f55da7e4507770e887986c7b76a9e95bc6498b61b632', '[\"*\"]', NULL, '2021-12-04 21:35:13', '2021-12-04 21:35:13'),
(239, 'App\\Models\\User', 18, 'myapptoken', 'f37443867cf5540ec5fdffb71865d0697f835a612af4e656e6b8cdc315ec0968', '[\"*\"]', NULL, '2021-12-04 21:35:31', '2021-12-04 21:35:31'),
(240, 'App\\Models\\User', 19, 'myapptoken', '491930377b0a4e27df2d20e8e71b545828705926d17e9265402f2a204d6ac699', '[\"*\"]', NULL, '2021-12-04 21:35:38', '2021-12-04 21:35:38'),
(241, 'App\\Models\\User', 19, 'myapptoken', '2b72099370dfdbdce7694af4e3728438f4668b3b0d062f6067816a3a09a5a6ad', '[\"*\"]', NULL, '2021-12-04 21:35:57', '2021-12-04 21:35:57'),
(242, 'App\\Models\\User', 19, 'myapptoken', '8a361382a45cb3803969836af1dd3b7df00ccbd627dec9462ab474a2b7cbed40', '[\"*\"]', NULL, '2021-12-04 21:37:43', '2021-12-04 21:37:43'),
(243, 'App\\Models\\User', 19, 'myapptoken', '3ad9819f5beff30ccc5d8b5a94e6508229c694e03c8ad4e112344a6c8fbaeb42', '[\"*\"]', NULL, '2021-12-05 11:31:30', '2021-12-05 11:31:30'),
(244, 'App\\Models\\User', 18, 'myapptoken', '5dccb4af7400c50f3973ddf41e28406a91180fc3c94b06cc9c23485720bec396', '[\"*\"]', NULL, '2021-12-05 11:32:22', '2021-12-05 11:32:22'),
(245, 'App\\Models\\User', 19, 'myapptoken', '71774db1b6e175c7d2901044b080a55bed41f36101ebf57cb8e82edfd49c900a', '[\"*\"]', NULL, '2021-12-05 13:10:40', '2021-12-05 13:10:40'),
(246, 'App\\Models\\User', 18, 'myapptoken', '11afb0a174a5952391702a207614c78aff2c31811806d12916d2052d6e731d03', '[\"*\"]', NULL, '2021-12-05 17:58:57', '2021-12-05 17:58:57'),
(247, 'App\\Models\\User', 18, 'myapptoken', 'cb3266002f9905c7df72c00da43eb5acbd886ce26b65ab68bd67e1810d26c17f', '[\"*\"]', NULL, '2021-12-05 18:01:08', '2021-12-05 18:01:08'),
(248, 'App\\Models\\User', 19, 'myapptoken', '85e06437321b9f8786ad1f14c3484cd69e4118cf7323b2c090b80d73bea15e4f', '[\"*\"]', NULL, '2021-12-05 18:04:41', '2021-12-05 18:04:41'),
(249, 'App\\Models\\User', 18, 'myapptoken', '72f155225d2b9481ab3dc63637b9bcc8624ea7ebb146cf9e2338fd3ca25a298c', '[\"*\"]', NULL, '2021-12-05 18:11:27', '2021-12-05 18:11:27'),
(250, 'App\\Models\\User', 18, 'myapptoken', '9a68074e686aa2faa1e01315ad5e96b17c42a88d6e87016997c33584ce212cc0', '[\"*\"]', NULL, '2021-12-05 18:14:03', '2021-12-05 18:14:03'),
(251, 'App\\Models\\User', 18, 'myapptoken', 'd85548a91e66e0570fb0538f9dba2f85287087dfcdb636fc0e914aaddc42d2cb', '[\"*\"]', NULL, '2021-12-05 18:14:43', '2021-12-05 18:14:43'),
(252, 'App\\Models\\User', 19, 'myapptoken', '70a9213d7a0c8f40402484a3c66e2ab10ee05190ac52aa3d37c6527e50ab02f9', '[\"*\"]', NULL, '2021-12-05 18:19:22', '2021-12-05 18:19:22'),
(253, 'App\\Models\\User', 18, 'myapptoken', 'be1090ff16562af006cf4d4ab5147ea173c9e1a4fb20422625576e67ef259c74', '[\"*\"]', NULL, '2021-12-05 18:19:52', '2021-12-05 18:19:52'),
(254, 'App\\Models\\User', 18, 'myapptoken', 'c5f3dd14cd5cdcad00ce424dba0e746df0d096d99b4ad947d79273dc6dce3071', '[\"*\"]', NULL, '2021-12-05 18:20:11', '2021-12-05 18:20:11'),
(255, 'App\\Models\\User', 19, 'myapptoken', 'b6c5aeb70b9182772c306e0b1c490c60b26bb4b6b2ebd1ce142337734e8979af', '[\"*\"]', NULL, '2021-12-05 18:25:52', '2021-12-05 18:25:52'),
(256, 'App\\Models\\User', 19, 'myapptoken', '29882d768fd4afd86f0268476e8cba22e93c013b788192c6d6fe7cb0ceba018c', '[\"*\"]', NULL, '2021-12-05 18:26:00', '2021-12-05 18:26:00'),
(257, 'App\\Models\\User', 19, 'myapptoken', 'e262ab813d9cffce1f5cf35fd89c3056795040411942ea347bf6e103208d7c10', '[\"*\"]', NULL, '2021-12-05 21:03:40', '2021-12-05 21:03:40'),
(258, 'App\\Models\\User', 18, 'myapptoken', '8cf5683486b052ac83a5f3ec7d205d61f134572a324e285b6b22dec598bf3f13', '[\"*\"]', NULL, '2021-12-05 21:51:53', '2021-12-05 21:51:53'),
(259, 'App\\Models\\User', 19, 'myapptoken', '285aebcf046d02c8b524dead4152119d30a0693665611cd421dad36822c2a756', '[\"*\"]', NULL, '2021-12-05 22:47:10', '2021-12-05 22:47:10'),
(260, 'App\\Models\\User', 18, 'myapptoken', '6b4199cd4eec2b63c2955bc70a494faaf23714c08fbf8ba4a27e558b4fed9d28', '[\"*\"]', NULL, '2021-12-05 22:52:51', '2021-12-05 22:52:51'),
(261, 'App\\Models\\User', 19, 'myapptoken', '4871b7f06502c3e82636a8262ce56cd733dbdfef87f2e99f1b09de1e4fe358bb', '[\"*\"]', NULL, '2021-12-05 22:53:19', '2021-12-05 22:53:19'),
(262, 'App\\Models\\User', 18, 'myapptoken', 'b6df7210751fa6b24b2a7eb10397f4c343c1a96bf2640f263a7652c22376576d', '[\"*\"]', NULL, '2021-12-05 23:10:48', '2021-12-05 23:10:48'),
(263, 'App\\Models\\User', 19, 'myapptoken', '1d4595abf7d6ca5d74b1f0657dff9a916f8fa51ba0e0e2df3d3a93a618fa2f72', '[\"*\"]', NULL, '2021-12-05 23:29:12', '2021-12-05 23:29:12'),
(264, 'App\\Models\\User', 18, 'myapptoken', '883ea00f3c6b8956741691451282e908da9a07d0dcbf6cc1fe570ffe926c4411', '[\"*\"]', NULL, '2021-12-06 08:07:00', '2021-12-06 08:07:00'),
(265, 'App\\Models\\User', 19, 'myapptoken', '21d23ec49fd243fa35c270356de58034e3a5169d150a2a4cbf3d166f6b06f24d', '[\"*\"]', NULL, '2021-12-06 08:09:19', '2021-12-06 08:09:19'),
(266, 'App\\Models\\User', 19, 'myapptoken', 'a2a5d23c4307d2c48812c94fc60d01190905c93ea4f8aa35a059762de6fbe2e9', '[\"*\"]', NULL, '2021-12-06 14:00:43', '2021-12-06 14:00:43'),
(267, 'App\\Models\\User', 18, 'myapptoken', '88c2b0e2601fd3f74be70544088450b134c8e0b80e12743e027750bffd3a33a3', '[\"*\"]', NULL, '2021-12-06 14:00:51', '2021-12-06 14:00:51'),
(268, 'App\\Models\\User', 19, 'myapptoken', 'a46426d54aaef9a3ede865dc7de9399d2fc1239c10b641ba07f7902aaec4f173', '[\"*\"]', NULL, '2021-12-06 14:02:14', '2021-12-06 14:02:14'),
(269, 'App\\Models\\User', 18, 'myapptoken', 'd13410017f6f345f3483cf9cb10803fc738473465c65f85ff84d27614a6b78eb', '[\"*\"]', NULL, '2021-12-06 15:52:29', '2021-12-06 15:52:29'),
(270, 'App\\Models\\User', 19, 'myapptoken', '8c606282ea4af3dfc8a9b54dc839998eb22eeb4afb01733d9b9ac5d30cd3efc7', '[\"*\"]', NULL, '2021-12-06 16:26:42', '2021-12-06 16:26:42');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `products_in_stock` bigint(20) DEFAULT NULL,
  `sell_count` bigint(20) DEFAULT '0',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `category_book_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_cover_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `status`, `title`, `author`, `product_img`, `price`, `products_in_stock`, `sell_count`, `description`, `category_book_type_id`, `category_cover_type_id`, `created_at`, `updated_at`) VALUES
(11, 'Published', 'The Children of Jocasta', 'by Natalie Haynes', 'assets/images/1637673755.jpg', 15.2, 159, 1, 'When you have grown up as I have, there is no security in not knowing things, in avoiding the ugliest truths because they can\'t be faced . . . Because that is what happened the last time, and that is why my siblings and I have grown up in a cursed house, children of cursed parents . . .\n\nJocasta is just fifteen when she is told that she must marry the King of Thebes, an old man she has never met. Her life has never been her own, and nor will it be, unless she outlives her strange, absent husband.\n\nIsmene is the same age when she is attacked in the palace she calls home. Since the day of her parents\' tragic deaths a decade earlier, she has always longed to feel safe with the family she still has. But with a single act of violence, all that is about to change.\n\nWith the turn of these two events, a tragedy is set in motion. But not as you know it.\n\nIn Children of Jocasta, Natalie Haynes reimagines the Oedipus and Antigone stories from the perspectives of two of the women who have often been overlooked; retelling the myth to reveal a new side of an ancient story.', 1, 1, '2021-11-23 07:22:35', '2021-11-23 07:22:35'),
(12, 'Published', 'New York', 'by Edward Rutherfurd', 'assets/images/1637673892.jpg', 22.5, 188, 3, 'Edward Rutherfurd tells the story of this great city as no other author could u from the epic, empty grandeur of the New World to the skyscrapers of the City that Never Sleeps, from the intimate detail of lives long forgotten to those lived today at breakneck speed. The novel begins with a tiny Indian fishing village and the Dutch traders who first carved out their hopes amidst the splendour of the wilderness. The British settlers and merchants followed, with their aristocratic governors and unpopular taxation which led to rebellion, war, the burning of the city and the birth of the American Nation. Yet a country that had already rent itself asunder once did so again over slavery. As the country fought its bloody Civil War, the city was torn apart by deadly riots. Hopes and dreams, greed and corruption - they have always been the companions of freedom and opportunity in the city\'s teeming streets. As the immigrant ships berthed next to Ellis Island in the shadow of the Statue of Liberty, they poured more and more Germans, Irish, Italians and Jews into the churning ethnic mix of the city. Deals were struck, politicians corrupted, men bought or assassinated, heiresses wooed, fortunes were speculated on Wall Street and men became rich beyond the dreams of avarice.', 2, 1, '2021-11-23 07:24:52', '2021-11-23 07:24:52'),
(13, 'Published', 'All Quiet on the Western Front', 'by Erich Maria Remarque', 'assets/images/1637673965.jpg', 45.22, 200, 3, 'Considered by many the greatest war novel of all time, All Quiet on the Western Front is Erich Maria Remarque\'s masterpiece of the German experience during World War I.\r\n\r\nI am young, I am twenty years old; yet I know nothing of life but despair, death, fear, and fatuous superficiality cast over an abyss of sorrow. . . .\r\n\r\nThis is the testament of Paul Bäumer, who enlists with his classmates in the German army during World War I. They become soldiers with youthful enthusiasm. But the world of duty, culture, and progress they had been taught breaks in pieces under the first bombardment in the trenches.\r\n\r\nThrough years of vivid horror, Paul holds fast to a single vow: to fight against the principle of hate that meaninglessly pits young men of the same generation but different uniforms against one another . . . if only he can come out of the war alive.', 2, 2, '2021-11-23 07:26:05', '2021-11-23 07:26:05'),
(14, 'Published', 'War and Peace', 'by Leo Tolstoy', 'assets/images/1637674010.jpg', 60.28, 198, 2, 'In this important book, eminent authorities discuss how various nations have sought to integrate their political, economic, and military goals in order to preserve their long-term interests in time of war and peace. Edited and with two chapters written by Paul M. Kennedy, the author of The Rise and Fall of the Great Powers, the book analyzes classic examples of European garand strategies and offers incisive advice on the proper balance of priorities that should be carried out by the United States today.\r\n\r\nThe book begins with a chapter by Kennedy that shows how the concept of grand strategy has broadened from a preoccupation with battlefield operations to a consideration of such factors as the management of national resources, the vital role of diplomacy, and the willingness of the general populace to support the burdens of war or the cost of large defense forces in peacetime. In succeeding chapters John Hattendorf, Michael Howard, and Eliot Cohen analyze British grand strategies in the War of Spanish Succession and the two world wars. Arther Ferrill, J. H. Elliott, Dennis E. Showalter, Douglas Porch, and Condoleeza Rice then discuss grand strategy in the Roman Empire, imperial Spain, Germany, France, and the Soviet Union.\r\n\r\nThe book concludes with reflections by Kennedy on American grand strategy today and in the future. He argues that America must avoid nuclear war, create armed forces flexible enough to deal with a variety of possible fighting contingencies, preserve its alliance system, and institute serious measures to reverse the economic and social trends that have weakened its preeminent position in the world. In other words, says Kennedy, America must maintain a reservoir of productive, financial, technological, and educational strength to be in a good position to meet the unpredictable and turbulent world of the early twenty-first century.', 2, 2, '2021-11-23 07:26:50', '2021-11-23 07:26:50'),
(15, 'Published', 'White Is for Witching', 'by Helen Oyeyemi', 'assets/images/1637674061.jpg', 24.5, 196, 1, 'In a vast, mysterious house on the cliffs near Dover, the Silver family is reeling from the hole punched into its heart. Lily is gone and her twins, Miranda and Eliot, and her husband, the gentle Luc, mourn her absence with unspoken intensity. All is not well with the house, either, which creaks and grumbles and malignly confuses visitors in its mazy rooms, forcing winter apples in the garden when the branches should be bare. Generations of women inhabit its walls. And Miranda, with her new appetite for chalk and her keen sense for spirits, is more attuned to them than she is to her brother and father. She is leaving them slowly –\r\n\r\nSlipping away from them –\r\n\r\nAnd when one dark night she vanishes entirely, the survivors are left to tell her story.\r\n\r\nMiri I conjure you\r\n\r\nThis is a spine-tingling tale that has Gothic roots but an utterly modern sensibility. Told by a quartet of crystalline voices, it is electrifying in its expression of myth and memory, loss and magic, fear and love.', 2, 1, '2021-11-23 07:27:41', '2021-11-23 07:27:41'),
(26, 'Published', 'To Kill a Mockingbird', 'by Harper Lee', 'assets/images/1638553813.jpg', 42.55, 188, 9, 'The unforgettable novel of a childhood in a sleepy Southern town and the crisis of conscience that rocked it. \"To Kill A Mockingbird\" became both an instant bestseller and a critical success when it was first published in 1960. It went on to win the Pulitzer Prize in 1961 and was later made into an Academy Award-winning film, also a classic.\r\n\r\nCompassionate, dramatic, and deeply moving, \"To Kill A Mockingbird\" takes readers to the roots of human behavior - to innocence and experience, kindness and cruelty, love and hatred, humor and pathos. Now with over 18 million copies in print and translated into forty languages, this regional story by a young Alabama woman claims universal appeal. Harper Lee always considered her book to be a simple love story. Today it is regarded as a masterpiece of American literature.', 1, 1, '2021-12-03 11:50:13', '2021-12-03 11:50:13'),
(27, 'Published', 'One Hundred Years of Solitude', 'by Gabriel García Márquez,', 'assets/images/1638553977.jpg', 45.1, 161, 42, 'One Hundred Years of Solitude is perhaps the most important landmark of the so-called Boom in contemporary Latin American fiction. Published in 1967, the novel was an instant success, running to hundreds of editions, winning four international prizes and being translated into 27 languages. In 1982, its author received the Nobel Prize for Literature. Michael Wood places the novel in the context of modern Colombia\'s violent history, and helps the reader to explore the rich and complex vision of the world which Garcia Marquez presents in it. Close reference is made to the text itself (in English translation), and there is a guide to further reading.', 2, 1, '2021-12-03 11:52:57', '2021-12-03 11:52:57'),
(28, 'Published', 'The Grapes of Wrath', 'by John Steinbeck', 'assets/images/1638762852.jpg', 35.2, 200, 0, 'The Pulitzer Prize-winning epic of the Great Depression, a book that galvanized—and sometimes outraged—millions of readers.\r\n\r\nFirst published in 1939, Steinbeck’s Pulitzer Prize-winning epic of the Great Depression chronicles the Dust Bowl migration of the 1930s and tells the story of one Oklahoma farm family, the Joads—driven from their homestead and forced to travel west to the promised land of California. Out of their trials and their repeated collisions against the hard realities of an America divided into Haves and Have-Nots evolves a drama that is intensely human yet majestic in its scale and moral vision, elemental yet plainspoken, tragic but ultimately stirring in its human dignity. A portrait of the conflict between the powerful and the powerless, of one man’s fierce reaction to injustice, and of one woman’s stoical strength, the novel captures the horrors of the Great Depression and probes into the very nature of equality and justice in America. At once a naturalistic epic, captivity narrative, road novel, and transcendental gospel, Steinbeck’s powerful landmark novel is perhaps the most American of American Classics.', 2, 1, '2021-12-05 21:54:12', '2021-12-05 21:54:12'),
(29, 'Published', 'Wuthering Heights', 'by Emily Brontë', 'assets/images/1638763163.jpg', 28.5, 200, 0, 'This best-selling Norton Critical Edition is based on the 1847 first edition of the novel. For the Fourth Edition, the editor has collated the 1847 text with several modern editions and has corrected a number of variants, including accidentals. The text is accompanied by entirely new explanatory annotations.\r\n\r\nNew to the fourth Edition are twelve of Emily Bronte\'s letters regarding the publication of the 1847 edition of Wuthering Heights as well as the evolution of the 1850 edition, prose and poetry selections by the author, four reviews of the novel, and poetry selections by the author, four reviews of the novel, and Edward Chitham\'s insightful and informative chronology of the creative process behind the beloved work.', 3, 2, '2021-12-05 21:59:23', '2021-12-05 21:59:23'),
(30, 'Published', 'Around the World in Eighty Days', 'by Jules Verne', 'assets/images/1638763280.png', 18.8, 200, 0, 'One night in the reform club, Phileas Fogg bets his companions that he can travel across the globe in just eighty days. Breaking the well-established routine of his daily life, he immediately sets off for Dover with his astonished valet Passepartout. Passing through exotic lands and dangerous locations, they seize whatever transportation is at hand—whether train or elephant—overcoming set-backs and always racing against the clock', 2, 1, '2021-12-05 22:01:20', '2021-12-05 22:01:20'),
(31, 'Published', 'Los Tres Mosqueteros', 'by H. Rider Haggard', 'assets/images/1638763511.jpg', 22, 200, 0, 'H. Rider Haggard\'s King Solomon\'s Mines has entertained generations of readers since its first publication in 1885. Following a mysterious map of dubious reliability, a small group of men trek into southern Africa in search of a lost friend-and a lost treasure, the fabled mines of King Solomon. Led by the English adventurer and fortune hunter Allan Quartermain, they discover a frozen corpse, survive untold dangers in remote mountains and deserts, and encounter the merciless King Twala en route to the legendary hoard of diamonds.', 4, 1, '2021-12-05 22:05:11', '2021-12-05 22:05:11'),
(32, 'Published', 'The Three Musketeers', 'by Alexandre Dumas', 'assets/images/1638763661.jpg', 28.9, 200, 0, 'Alexandre Dumas’s most famous tale— and possibly the most famous historical novel of all time— in a handsome hardcover volume.\r\n\r\nThis swashbuckling epic of chivalry, honor, and derring-do, set in France during the 1620s, is richly populated with romantic heroes, unattainable heroines, kings, queens, cavaliers, and criminals in a whirl of adventure, espionage, conspiracy, murder, vengeance, love, scandal, and suspense. Dumas transforms minor historical figures into larger- than-life characters: the Comte d’Artagnan, an impetuous young man in pursuit of glory; the beguilingly evil seductress “Milady”; the powerful and devious Cardinal Richelieu; the weak King Louis XIII and his unhappy queen—and, of course, the three musketeers themselves, Athos, Porthos, and Aramis, whose motto “all for one, one for all” has come to epitomize devoted friendship. With a plot that delivers stolen diamonds, masked balls, purloined letters, and, of course, great bouts of swordplay, The Three Musketeers is eternally entertaining.', 4, 1, '2021-12-05 22:07:41', '2021-12-05 22:07:41'),
(33, 'Published', 'The Swiss Family Robinson', 'by Johann David Wyss', 'assets/images/1638763758.jpg', 20, 200, 0, 'The Robinsons leave their home in Switzerland planning to settle half a world away. But things do not turn out as they had expected. The sole survivors of a terrible shipwreck, they wash ashore to learn that the danger has only begun. Their new world will test their courage, cleverness, endurance, and faith as they struggle to survive and create a civilization of their own in the wilderness.\r\n\r\nNote: This Townsend Library classic has been carefully edited to be more accessible to today\'s students. It includes a brief author\'s biography and an afterword that provides important context about the work.', 2, 1, '2021-12-05 22:09:18', '2021-12-05 22:09:18'),
(34, 'Published', 'The Adventures of Huckleberry Finn', 'by Mark Twain', 'assets/images/1638763863.jpg', 40.9, 200, 0, 'A nineteenth-century boy from a Mississippi River town recounts his adventures as he travels down the river with a runaway slave, encountering a family involved in a feud, two scoundrels pretending to be royalty, and Tom Sawyer\'s aunt who mistakes him for Tom.', 4, 1, '2021-12-05 22:11:03', '2021-12-05 22:11:03'),
(35, 'Published', 'The Exile: An Outlander', 'by Diana Gabaldon', 'assets/images/1638763980.jpg', 35.5, 175, 25, 'Diana Gabaldon’s brilliant storytelling has captivated millions of readers in her bestselling and award-winning Outlander saga. Now, in her first-ever graphic novel, Gabaldon gives readers a fresh look at the events of the original Outlander: Jamie Fraser’s side of the story, gorgeously rendered by artist Hoang Nguyen.\r\n \r\nAfter too long an absence, Jamie Fraser is coming home to Scotland—but not without great trepidation. Though his beloved godfather, Murtagh, promised Jamie’s late parents he’d watch over their brash son, making good on that vow will be no easy task. There’s already a fat bounty on the young exile’s head, courtesy of Captain Black Jack Randall, the sadistic British officer who’s crossed paths—and swords—with Jamie in the past. And in the court of the mighty MacKenzie clan, Jamie is a pawn in the power struggle between his uncles: aging chieftain Colum, who demands his nephew’s loyalty—or his life—and Dougal, war chieftain of Clan MacKenzie, who’d sooner see Jamie put to the sword than anointed Colum’s heir.', 3, 1, '2021-12-05 22:13:00', '2021-12-05 22:13:00'),
(36, 'Published', 'Devil in Winter', 'by Lisa Kleypas', 'assets/images/1638764054.jpg', 28.5, 174, 26, 'Desperate to escape her scheming relatives, Evangeline Jenner has sought the help of the most infamous scoundrel in London. A marriage of convenience is the only solution.\r\n\r\nNo one would have ever paired the shy, stammering wallflower with the sinfully handsome viscount. It quickly becomes clear, however, that Evie is a woman of hidden strength—and Sebastian desires her more than any woman he\'s ever known.\r\n\r\nDetermined to win her husband\'s elusive heart, Evie dares to strike a bargain with the devil: if Sebastian can stay celibate for three months, she will allow him into her bed. When Evie is threatened by a vengeful enemy from the past, Sebastian vows to do whatever it takes to protect his wife . . . even at the expense of his own life.\r\n\r\nTogether they will defy their perilous fate, for the sake of all-consuming love.', 3, 1, '2021-12-05 22:14:14', '2021-12-05 22:14:14'),
(37, 'Published', 'Virgin River', 'by Robyn Carr', 'assets/images/1638764172.jpg', 40, 199, 1, 'Welcome back to Virgin River with the book that started it all…\r\n\r\nWanted: Midwife/nurse practitioner in Virgin River, population six hundred. Make a difference against a backdrop of towering California redwoods and crystal clear rivers. Rent-free cabin included.\r\n\r\nWhen the recently widowed Melinda Monroe sees this ad, she quickly decides that the remote mountain town of Virgin River might be the perfect place to escape her heartache, and to reenergize the nursing career she loves. But her high hopes are dashed within an hour of arriving—the cabin is a dump, the roads are treacherous and the local doctor wants nothing to do with her. Realizing she’s made a huge mistake, Mel decides to leave town the following morning.\r\n\r\nBut a tiny baby abandoned on a front porch changes her plans…and former marine Jack Sheridan cements them into place.', 3, 1, '2021-12-05 22:16:12', '2021-12-05 22:16:12'),
(38, 'Published', 'The Woman in Cabin 10', 'by Ruth Ware', 'assets/images/1638764265.jpg', 18.9, 200, 0, 'Lo Blacklock, a journalist who writes for a travel magazine, has just been given the assignment of a lifetime: a week on a luxury cruise with only a handful of cabins. The sky is clear, the waters calm, and the veneered, select guests jovial as the exclusive cruise ship, the Aurora, begins her voyage in the picturesque North Sea. At first, Lo\'s stay is nothing but pleasant: the cabins are plush, the dinner parties are sparkling, and the guests are elegant. But as the week wears on, frigid winds whip the deck, gray skies fall, and Lo witnesses what she can only describe as a dark and terrifying nightmare: a woman being thrown overboard. The problem? All passengers remain accounted for and so, the ship sails on as if nothing has happened, despite Lo\'s desperate attempts to convey that something (or someone) has gone terribly, terribly wrong.', 1, 2, '2021-12-05 22:17:45', '2021-12-05 22:17:45'),
(39, 'Published', 'Behind Closed Doors', 'by B.A. Paris', 'assets/images/1638764381.jpg', 22.9, 200, 0, 'Everyone knows a couple like Jack and Grace. He has looks and wealth; she has charm and elegance. He’s a dedicated attorney who has never lost a case; she is a flawless homemaker, a masterful gardener and cook, and dotes on her disabled younger sister. Though they are still newlyweds, they seem to have it all. You might not want to like them, but you do. You’re hopelessly charmed by the ease and comfort of their home, by the graciousness of the dinner parties they throw. You’d like to get to know Grace better.\r\n\r\nBut it’s difficult, because you realize Jack and Grace are inseparable.\r\n\r\nSome might call this true love. Others might wonder why Grace never answers the phone. Or why she can never meet for coffee, even though she doesn’t work. How she can cook such elaborate meals but remain so slim. Or why she never seems to take anything with her when she leaves the house, not even a pen. Or why there are such high-security metal shutters on all the downstairs windows.', 1, 2, '2021-12-05 22:19:41', '2021-12-05 22:19:41'),
(40, 'Published', 'The Couple Next Door', 'by Shari Lapena', 'assets/images/1638764468.jpg', 45.1, 200, 0, 'It all started at a dinner party. . .\r\n\r\nA domestic suspense debut about a young couple and their apparently friendly neighbors--a twisty, rollercoaster ride of lies, betrayal, and the secrets between husbands and wives. . .\r\n\r\nAnne and Marco Conti seem to have it all--a loving relationship, a wonderful home, and their beautiful baby, Cora. But one night when they are at a dinner party next door, a terrible crime is committed. Suspicion immediately focuses on the parents. But the truth is a much more complicated story.\r\n\r\nInside the curtained house, an unsettling account of what actually happened unfolds. Detective Rasbach knows that the panicked couple is hiding something. Both Anne and Marco soon discover that the other is keeping secrets, secrets they\'ve kept for years.', 1, 3, '2021-12-05 22:21:08', '2021-12-05 22:21:08'),
(41, 'Published', 'The Killing Floor', 'by Raymond Embrack', 'assets/images/1638765529.jpg', 22.9, 200, 0, 'Private eye Peter Surf is on a case in the Time\'s Up hunting ground known as the Pink Coast, hired to stop a brutal outlaw biker gang that has taken to home invasions, his employer a former hitwoman. Just when Surf has built a cocktail bar in his office, he gets a case. But how do you bounce an outlaw biker gang? And when this much evil is on the run, where does it go for escapism?', 1, 1, '2021-12-05 22:38:49', '2021-12-05 22:38:49'),
(42, 'Published', 'Little Women', 'by Louisa May Alcott', 'assets/images/1638765648.jpg', 27.55, 200, 0, 'Generations of readers young and old, male and female, have fallen in love with the March sisters of Louisa May Alcott’s most popular and enduring novel, Little Women. Here are talented tomboy and author-to-be Jo, tragically frail Beth, beautiful Meg, and romantic, spoiled Amy, united in their devotion to each other and their struggles to survive in New England during the Civil War.\r\n\r\nIt is no secret that Alcott based Little Women on her own early life. While her father, the freethinking reformer and abolitionist Bronson Alcott, hobnobbed with such eminent male authors as Emerson, Thoreau, and Hawthorne, Louisa supported herself and her sisters with \"woman’s work,” including sewing, doing laundry, and acting as a domestic servant.', 4, 1, '2021-12-05 22:40:48', '2021-12-05 22:40:48'),
(43, 'Published', 'Anne of Green Gables', 'by L.M. Montgomery', 'assets/images/1638765739.jpg', 27.55, 197, 24, 'This heartwarming story has beckoned generations of readers into the special world of Green Gables, an old-fashioned farm outside a town called Avonlea. Anne Shirley, an eleven-year-old orphan, has arrived in this verdant corner of Prince Edward Island only to discover that the Cuthberts—elderly Matthew and his stern sister, Marilla—want to adopt a boy, not a feisty redheaded girl. But before they can send her back, Anne—who simply must have more scope for her imagination and a real home—wins them over completely. A much-loved classic that explores all the vulnerability, expectations, and dreams of a child growing up, Anne of Green Gables is also a wonderful portrait of a time, a place, a family… and, most of all, love.', 4, 2, '2021-12-05 22:42:19', '2021-12-05 22:42:19'),
(44, 'Published', 'The Adventures of Tom Sawyer', 'by Mark Twain', 'assets/images/1638765836.jpg', 44, 171, 2, 'The Adventures of Tom Sawyer revolves around the youthful adventures of the novel\'s schoolboy protagonist, Thomas Sawyer, whose reputation precedes him for causing mischief and strife. Tom lives with his Aunt Polly, half-brother Sid, and cousin Mary in the quaint town of St. Petersburg, just off the shore of the Mississippi River. St. Petersburg is described as a typical small-town atmosphere where the Christian faith is predominant, the social network is close-knit, and familiarity resides.\r\n\r\nUnlike his brother Sid, Tom receives \"lickings\" from his Aunt Polly; ever the mischief-maker, would rather play hooky than attend school and often sneaks out his bedroom window at night to adventure with his friend, Huckleberry Finn ­ the town\'s social outcast. Tom, despite his dread of schooling, is extremely clever and would normally get away with his pranks if Sid were not such a \"tattle-tale.\"', 4, 1, '2021-12-05 22:43:56', '2021-12-05 22:43:56'),
(45, 'Published', 'Treasure Island', 'by Robert Louis Stevenson', 'assets/images/1638765908.jpg', 28.5, 199, 1, '\"For sheer storytelling delight and pure adventure, Treasure Island has never been surpassed. From the moment young Jim Hawkins first encounters the sinister Blind Pew at the Admiral Benbow Inn until the climactic battle for treasure on a tropic isle, the novel creates scenes and characters that have fired the imaginations of generations of readers. Written by a superb prose stylist, a master of both action and atmosphere, the story centers upon the conflict between good and evil - but in this case a particularly engaging form of evil. It is the villainy of that most ambiguous rogue Long John Silver that sets the tempo of this tale of treachery, greed, and daring. Designed to forever kindle a dream of high romance and distant horizons, Treasure Island is, in the words of G. K. Chesterton, \'the realization of an ideal, that which is promised in its provocative and beckoning map; a vision not only of white skeletons but also green palm trees and sapphire seas.\' G. S. Fraser terms it \'an utterly original book\' and goes on to write: \'There will always be a place for stories like Treasure Island that can keep boys and old men happy.\'', 4, 1, '2021-12-05 22:45:08', '2021-12-05 22:45:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` int(11) DEFAULT NULL,
  `address` varchar(244) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobile`, `address`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(18, 'Tanvir Reza Anik', 'tanventure@gmail.com', 1858734122, 'dfgdfgfd', NULL, '$2y$10$Ij42mP5mD37wC5sWGf3kfO/RgyY5Oo6uOaqu1Wdi/EPnz2vOmL4Ra', NULL, '2021-11-19 05:51:34', '2021-11-19 05:51:34'),
(19, 'Alex', 'Alex@gmail.com', 1212, 'dfgfdgfdgDhaka', NULL, '$2y$10$mjcGYY2Jtou0penSuqGTKesXBYKWTVi/ZpM859J2w0dochpCKaVF6', NULL, '2021-11-21 05:16:30', '2021-11-21 05:16:30');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_book_types`
--
ALTER TABLE `category_book_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
