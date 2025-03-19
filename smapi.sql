-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2025 at 09:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `follower_user`
--

CREATE TABLE `follower_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `follower_id` bigint(20) UNSIGNED NOT NULL,
  `following_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `follower_user`
--

INSERT INTO `follower_user` (`id`, `follower_id`, `following_id`, `created_at`, `updated_at`) VALUES
(3, 2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
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
(7, '2025_03_19_052639_create_posts_table', 2),
(8, '2025_03_19_052713_create_comments_table', 2),
(9, '2025_03_19_060225_create_posts_table', 3),
(10, '2025_03_19_061452_create_followers_table', 4),
(11, '2025_03_19_061759_create_follower_user_table', 5),
(12, '2025_03_19_062647_create_follower_user_table', 6),
(13, '2025_03_19_070048_create_post_likes_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'SocialMediaApp', 'a8fc23500030d19e83884f298cebee2b3dba1e331e6fb265ee7bd9dc3cc284d1', '[\"*\"]', NULL, NULL, '2025-03-18 22:32:44', '2025-03-18 22:32:44'),
(2, 'App\\Models\\User', 2, 'SocialMediaApp', '710a41042b05078001c9720fc14509d32b519e9811a95fd4dbdb8b01938bd846', '[\"*\"]', NULL, NULL, '2025-03-18 22:35:41', '2025-03-18 22:35:41'),
(3, 'App\\Models\\User', 2, 'SocialMediaApp', 'f4a0f0937935683f5d35dffc9f7ae28d149b2c7e32507d399c65efe3117c1539', '[\"*\"]', '2025-03-18 22:51:00', NULL, '2025-03-18 22:38:01', '2025-03-18 22:51:00'),
(4, 'App\\Models\\User', 3, 'SocialMediaApp', 'd8f435c65540662098d74b61a9212c0d221b5fc4ba91c71eac585f26b992c0dc', '[\"*\"]', NULL, NULL, '2025-03-18 22:45:12', '2025-03-18 22:45:12'),
(5, 'App\\Models\\User', 2, 'SocialMediaApp', 'fa331ba4a1256525b705e58ee190db912d2ba424ea446ebad03501eb7f555587', '[\"*\"]', '2025-03-18 23:08:12', NULL, '2025-03-18 22:51:03', '2025-03-18 23:08:12'),
(6, 'App\\Models\\User', 2, 'SocialMediaApp', '85a2903bfa1197295ae93e0bdc832c5659cf001d765daefe17ede07a01686576', '[\"*\"]', '2025-03-18 23:41:01', NULL, '2025-03-18 23:08:37', '2025-03-18 23:41:01'),
(7, 'App\\Models\\User', 2, 'SocialMediaApp', 'f05868f4b55be1a66bed2a5be0458d10cd3f4fe2ab56bf9373ac6be240bd6c8b', '[\"*\"]', '2025-03-18 23:45:08', NULL, '2025-03-18 23:20:48', '2025-03-18 23:45:08'),
(8, 'App\\Models\\User', 4, 'SocialMediaApp', '3a73265627fe34baf7eb26c2a33083a7658f1f1aca4c84347e23e9b4b66b8e2a', '[\"*\"]', NULL, NULL, '2025-03-18 23:21:36', '2025-03-18 23:21:36'),
(9, 'App\\Models\\User', 2, 'SocialMediaApp', '0dba2fb2b9619d8a7d502550219511ea0a4c40e8fc2a446030d7f2d1287f8b04', '[\"*\"]', '2025-03-18 23:52:46', NULL, '2025-03-18 23:45:15', '2025-03-18 23:52:46'),
(10, 'App\\Models\\User', 2, 'SocialMediaApp', 'f75cfe37c48492582432734b08eca7c9c8ecc2ac612cbd10f0868c94277af1ed', '[\"*\"]', '2025-03-18 23:51:13', NULL, '2025-03-18 23:49:15', '2025-03-18 23:51:13'),
(11, 'App\\Models\\User', 2, 'SocialMediaApp', '4fb9bcb63c5115533b06515c59267017e949af1054a33f702e79385b3d7b1a5b', '[\"*\"]', '2025-03-19 00:01:11', NULL, '2025-03-18 23:51:24', '2025-03-19 00:01:11'),
(12, 'App\\Models\\User', 2, 'SocialMediaApp', '8ad0956ffe08f130769ae8dcdae1c5e262c2f5c920dcce0df4b0410206f7effe', '[\"*\"]', '2025-03-19 00:18:38', NULL, '2025-03-18 23:56:41', '2025-03-19 00:18:38'),
(13, 'App\\Models\\User', 2, 'SocialMediaApp', '2a7b16e0a8eb09a467b89d3b261490b96409acd293bfe69dc1bad95765d265c8', '[\"*\"]', NULL, NULL, '2025-03-19 00:51:51', '2025-03-19 00:51:51');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `images`, `created_at`, `updated_at`) VALUES
(1, 2, 'testetstt', 'dfsagadfga', NULL, NULL, NULL),
(2, 2, NULL, 'This is the content of my first post', NULL, '2025-03-18 23:12:29', '2025-03-18 23:12:29'),
(3, 2, 'Test ageng', 'This is the coneawent of my first post', NULL, '2025-03-18 23:13:38', '2025-03-18 23:13:38'),
(4, 2, 'Test ageng', 'This is the coneawent of my first post', NULL, '2025-03-18 23:41:01', '2025-03-18 23:41:01'),
(5, 2, 'Judul Postingan (Edited)', 'Isi yang telah diperbarui.', NULL, '2025-03-18 23:42:16', '2025-03-18 23:42:16'),
(6, 2, 'Judul Postingan (EditeDd)', 'Isi yang telah diperbarui.', NULL, '2025-03-18 23:42:22', '2025-03-18 23:42:22');

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Ageeng', 'agungprabowo1101@gmail.com', NULL, '$2y$10$9wZ/KOxm.QE.B6vQdOmWSOoTYXDZQuo67Y7NDZUQpDjFHZCGWK6A6', NULL, '2025-03-18 22:35:41', '2025-03-18 22:47:07'),
(3, 'ageng1', 'agungpsadfarabowo1101@gmail.com', NULL, '$2y$10$4dzJffTPAbTAvSHk6IwLwObGyS4i2Qyh6bi1SVVTqsNTBsXw87Vje', NULL, '2025-03-18 22:45:12', '2025-03-18 22:45:12'),
(4, 'ageng2', 'agungsdadsapsadfarabowo1101@gmail.com', NULL, '$2y$10$xBBSKdz/UZmnWgfIcB7/PO.9D3xZUIEPIg/wm2MTb1SHIzI4Qz1Gq', NULL, '2025-03-18 23:21:36', '2025-03-18 23:21:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postt` (`post_id`),
  ADD KEY `user` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `follower_user`
--
ALTER TABLE `follower_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `follower_user_follower_id_foreign` (`follower_id`),
  ADD KEY `follower_user_following_id_foreign` (`following_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_likes_post_id_foreign` (`post_id`),
  ADD KEY `post_likes_user_id_foreign` (`user_id`);

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
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `follower_user`
--
ALTER TABLE `follower_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `postt` FOREIGN KEY (`post_id`) REFERENCES `post_likes` (`id`),
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `follower_user`
--
ALTER TABLE `follower_user`
  ADD CONSTRAINT `follower_user_follower_id_foreign` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `follower_user_following_id_foreign` FOREIGN KEY (`following_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `post_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
