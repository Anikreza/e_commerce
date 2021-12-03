-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 03, 2021 at 07:32 PM
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
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_book_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_cover_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `quantity`, `user_id`, `status`, `product_id`, `category_book_type_id`, `category_cover_type_id`, `created_at`, `updated_at`) VALUES
(1, 5, '18', 'Sent', 11, NULL, NULL, '2021-12-02 14:05:15', '2021-12-02 14:05:15'),
(3, 3, '18', 'Sent', 12, NULL, NULL, '2021-12-02 14:11:45', '2021-12-02 14:11:45'),
(4, 10, '18', 'Sent', 14, NULL, NULL, '2021-12-02 14:12:42', '2021-12-02 14:12:42'),
(7, 3, '18', 'Sent', 13, NULL, NULL, '2021-12-02 14:41:12', '2021-12-02 14:41:12'),
(9, 5, '18', 'Sent', 11, NULL, NULL, '2021-12-02 14:59:18', '2021-12-02 14:59:18'),
(10, 5, '19', 'Delivered', 11, NULL, NULL, '2021-12-02 15:32:29', '2021-12-02 15:32:29'),
(12, 2, '19', 'Added To Cart', 12, NULL, NULL, '2021-12-03 08:53:28', '2021-12-03 08:53:28');

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
