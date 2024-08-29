-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2024 at 07:40 AM
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
-- Database: `lara_vel`
--

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
-- Table structure for table `loan_details`
--

CREATE TABLE `loan_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `clientid` int(11) NOT NULL,
  `num_of_payment` int(11) NOT NULL,
  `first_payment_date` date NOT NULL,
  `last_payment_date` date NOT NULL,
  `loan_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(8, '2016_06_01_000004_create_oauth_clients_table', 2),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(10, '2024_07_10_122756_loan_details_table', 3),
(11, '2024_07_10_123040_user_table', 3),
(12, '2024_08_12_072215_create_user_details_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0299811033a1813044d0d09370d34cb9e946651c170c409cc405269b067ff46c7e2c4ebe2f327805', 1, 5, 'Personal Access Token', '[]', 0, '2024-08-10 03:14:40', '2024-08-10 03:14:40', '2025-08-10 08:44:40'),
('036897d34ade0d15153b3cbf332a0b0b4ead0bee8398a9338fa317b50bcb9f76f6b7560dceeedd73', 1, 5, 'Personal Access Token', '[]', 0, '2024-08-11 06:03:29', '2024-08-11 06:03:30', '2025-08-11 11:33:29'),
('038758b8efe1a5ea15a5d5b10f2c3aac937e722e41a68e8760ff89c336990737ea5de30efb6f70f3', 1, 5, 'Personal Access Token', '[]', 0, '2024-08-10 03:56:35', '2024-08-10 03:56:36', '2025-08-10 09:26:35'),
('03e5e27288ad526afab127303e19becc3cd9d4b5d0bbf28cde907e819885cf88f42f99ab08053f85', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-14 12:15:18', '2024-08-14 12:15:21', '2025-08-14 17:45:18'),
('053981c3c9df81e018d801bd140794a089ea4f47ce0cdac6b15efd08e29bdf4f192d4a74f3a45f98', 5, 5, 'Personal Access Token', '[]', 0, '2024-08-14 12:38:49', '2024-08-14 12:38:49', '2025-08-14 18:08:49'),
('066e70c1e66291da0c13e294b4b77ca059abf75f160f5129bfe103c703b969bf3dc3ca2fed167c20', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-27 11:54:28', '2024-08-27 11:54:30', '2025-08-27 17:24:28'),
('06f9f25cfc6d53424f71a042534a6b31bf386d10260c7ce861dc20c690ed8a130ce0555785dd8340', 1, 5, 'Personal Access Token', '[]', 0, '2024-08-10 03:57:21', '2024-08-10 03:57:22', '2025-08-10 09:27:21'),
('0c6e62d0a6e7146b6010bfc654159cddc0a7b40ae4335ae276f302608a1683f480b779a1c167ddbc', 1, 5, 'Personal Access Token', '[]', 0, '2024-07-07 07:06:16', '2024-07-07 07:06:16', '2025-07-07 12:36:16'),
('1582a149aa228a67dc3b63beb4440a896483adefe05e4d38f6b0c476961305b9a8d530aaa2a8cc5e', 2, 5, 'Personal Access Token', '[]', 0, '2024-07-07 07:01:56', '2024-07-07 07:01:56', '2025-07-07 12:31:56'),
('1bd410cff5c545b6c4c3f792ada53f2fd4a64d753cb4faa2c78091a3b9c4581b31c807003dd4eebc', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-23 02:43:48', '2024-08-23 02:43:48', '2025-08-23 08:13:48'),
('1ec94b39dddf32dd16bccf2fc1446f0dace30a62d94bf7609f9f8f7ac852ee058a9d0eac8b953dd5', 1, 5, 'Personal Access Token', '[]', 0, '2024-08-10 04:45:31', '2024-08-10 04:45:31', '2025-08-10 10:15:31'),
('21a1c81b487a78465f54b61050316967c46886c3eb684149e98531e574fed4e124b0f9c199c5112f', 1, 5, 'Personal Access Token', '[]', 0, '2024-07-07 06:56:04', '2024-07-07 06:56:04', '2025-07-07 12:26:04'),
('2f0ebb7f6cac568dd261961ac8b04f7a5a05389887263f152c38aba5e1e6c266a159088bc9d05972', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-14 07:02:56', '2024-08-14 07:02:56', '2025-08-14 12:32:56'),
('32586449c19fa7b73724ca8e334f5bd9181001a62c1f4043c86e7ecc184d5789879bbe3ea16d0131', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-11 23:00:26', '2024-08-11 23:00:27', '2025-08-12 04:30:26'),
('334f35f8e813bbcb5bbc4cd49fc7d0fd2e7ea1b907bbffbf0e4605f22849c479420554c9153b9ca2', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-23 02:22:18', '2024-08-23 02:22:18', '2025-08-23 07:52:18'),
('37b5f50f7aa0157cc887cf9510f88c3804efcf3f2248dcb4f18a3182d4b6e87278444f8c1b6d04d7', 1, 5, 'Personal Access Token', '[]', 0, '2024-08-11 06:42:33', '2024-08-11 06:42:33', '2025-08-11 12:12:33'),
('381a81794ad5993580f73c605ee2fb33245011f8c310934cbaf089e39a126a104407df83ae9221a9', 9, 5, 'Personal Access Token', '[]', 0, '2024-08-14 12:40:56', '2024-08-14 12:40:56', '2025-08-14 18:10:56'),
('383d3399be641086794df6f38e9e6e8428466e89c31437fc99f071d873431a1df78a1abc7c5a2964', 1, 5, 'Personal Access Token', '[]', 0, '2024-08-10 06:44:36', '2024-08-10 06:44:36', '2025-08-10 12:14:36'),
('392ba2403bf11f50cded44d2bcca31a4f2c985ffb9b85706966000d85e299cac3cd8f9906102eb23', 4, 5, 'Personal Access Token', '[]', 0, '2024-08-14 12:37:39', '2024-08-14 12:37:40', '2025-08-14 18:07:39'),
('43262c79760745b554829e426d1c45f3bf464eccc5e28a129343e5c441a2fe5959eabd6b3bc4ae39', 1, 5, 'Personal Access Token', '[]', 0, '2024-08-10 06:46:44', '2024-08-10 06:46:44', '2025-08-10 12:16:44'),
('44eb4ac407491af045258415de6ab5b323e9d15ba89502e5010b52ca4793c75a91049e7ce84ce56c', 8, 5, 'Personal Access Token', '[]', 0, '2024-08-14 12:40:21', '2024-08-14 12:40:22', '2025-08-14 18:10:21'),
('48991662eb4d623628a74b505fb9ba6e4d21c6c6258f29fb65f0db643b2213beb01c6cbe84e9a396', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-12 13:41:38', '2024-08-12 13:41:38', '2025-08-12 19:11:38'),
('506574b8eaf8b574c12e374541f809254ddbf3ead08f2cc01d3e79588ecbea8735ff381fed13185b', 1, 5, 'Personal Access Token', '[]', 0, '2024-07-07 06:58:18', '2024-07-07 06:58:18', '2025-07-07 12:28:18'),
('5688d78150ab52620d21e068c8c8b45d90f8a727a37c76f05a865b7738750949326ef8e68a929343', 7, 5, 'Personal Access Token', '[]', 0, '2024-08-10 02:41:16', '2024-08-10 02:41:17', '2025-08-10 08:11:16'),
('57982f8c4433efe268e2ceba2fa32a514bd2957938d18fb65977471a2be58764585f5a6f45e5ef49', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-23 00:56:47', '2024-08-23 00:56:48', '2025-08-23 06:26:47'),
('58bc5d932abd9f023d4bd7e34f9382a57aa1637090cecd4507bcc87f99b8b64f7095665418ef9d5f', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-14 12:41:08', '2024-08-14 12:41:09', '2025-08-14 18:11:08'),
('5ff82e292a30763f0aae2b88759f224ddf30c85737aeda1a484c72aabf90effeabac3199babfa4b4', 1, 5, 'Personal Access Token', '[]', 0, '2024-07-07 06:59:20', '2024-07-07 06:59:21', '2025-07-07 12:29:20'),
('63dc017e0bb9447fbdd83ff68a7e2bf6ad162743d59f7b9def8324c501aeead872f30cf5699f4191', 2, 5, 'Personal Access Token', '[]', 0, '2024-07-07 07:46:07', '2024-07-07 07:46:07', '2025-07-07 13:16:07'),
('6b47c1c8785cedde9f3c9f6e3eef3c7d0a2661f4db06d8cfa188ade2b77820971694c31ecb4be597', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-24 04:45:54', '2024-08-24 04:45:54', '2025-08-24 10:15:54'),
('6f57dc1a1f7d81c71710938083b5858d14fb8a07dea1f0a0c9699082d5386ac13bc920756de0b5e4', 1, 5, 'Personal Access Token', '[]', 0, '2024-08-10 06:38:41', '2024-08-10 06:38:42', '2025-08-10 12:08:41'),
('73a27b7dc404260c780d97bc5b921e326235aa2c5a066ed25d9bb3df6afaf677baf61594ca6953c6', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-11 12:43:17', '2024-08-11 12:43:17', '2025-08-11 18:13:17'),
('754116049c25306103a8028269f8b787735f84139d9ed5e3ed35cef2d7177dd902617544ed8e068c', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-22 01:32:54', '2024-08-22 01:32:56', '2025-08-22 07:02:54'),
('7c2359f04d882a030a95d167babab17584b804a6de18bbc19bd12978cd656a23c21266023cc5877f', 1, 5, 'Personal Access Token', '[]', 0, '2024-07-07 06:56:11', '2024-07-07 06:56:11', '2025-07-07 12:26:11'),
('7ce222e473d892ea2282afc94e502105dd8b31a46036e8bcbbf0466c533b6772b128bbee207124bb', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-26 05:32:17', '2024-08-26 05:32:18', '2025-08-26 11:02:17'),
('8141834f420d6fe6a1d1bec3709edfc402acdc91c6aa6da83f5cd1259832e5942012eb8e3303f783', 2, 5, 'Personal Access Token', '[]', 0, '2024-07-07 07:23:40', '2024-07-07 07:23:40', '2025-07-07 12:53:40'),
('8206e074d4a054e474abdbf9af9713eaac8f8d2941855f5fb34796edab8215e7f3cd8eb95f54be1b', 1, 5, 'Personal Access Token', '[]', 0, '2024-07-07 07:00:10', '2024-07-07 07:00:10', '2025-07-07 12:30:10'),
('823ed60d19f05ae7961a9dc76877eea00a3fe94d517ad54941f361bfd734191cdbb4bd10accdd6d6', 2, 5, 'Personal Access Token', '[]', 0, '2024-07-07 07:46:42', '2024-07-07 07:46:42', '2025-07-07 13:16:42'),
('83f3b68e083a9627bfb4bae8f2a4fcb63205e31e4ea6c1562f6b482fb4555bcb9140dd3a103a856e', 1, 5, 'Personal Access Token', '[]', 0, '2024-08-10 06:47:13', '2024-08-10 06:47:13', '2025-08-10 12:17:13'),
('870709f68e71ccca566e081f293bf9943b7ba002b851ee184140441a6c11de20bfb9704530f78795', 2, 5, 'Personal Access Token', '[]', 0, '2024-07-07 07:10:13', '2024-07-07 07:10:14', '2025-07-07 12:40:13'),
('8fc688f0d54a1eb63712cde3b47766a19e0d4fcff4463fe95e3403c8292b4b94da9c86e135b8c3f1', 1, 5, 'Personal Access Token', '[]', 0, '2024-07-07 06:56:50', '2024-07-07 06:56:50', '2025-07-07 12:26:50'),
('931dcb096252e1bc6de32dde6a901e92f2e3f710938f31bcc3afab8ab6a382c62dc6e8d1ddb86f61', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-13 06:58:16', '2024-08-13 06:58:16', '2025-08-13 12:28:16'),
('9478f7cb134c8a283f0808a8e1bf01622da87129fddff4d7c3bb23ba3e9da39aab972ea28e974077', 2, 5, 'Personal Access Token', '[]', 0, '2024-07-07 07:44:31', '2024-07-07 07:44:32', '2025-07-07 13:14:31'),
('99a2b301c23c139e42dd6ec353a76f4a6c587db4954ace63284d3808e3220f0341ee7bf05430d64d', 3, 5, 'Personal Access Token', '[]', 0, '2024-08-11 11:13:48', '2024-08-11 11:13:49', '2025-08-11 16:43:48'),
('9d1083f991381b199c152c33acab296d0e60f70732db7259a455113fbc1950c0c285aeb4ad1293de', 1, 5, 'Personal Access Token', '[]', 0, '2024-08-10 04:26:07', '2024-08-10 04:26:07', '2025-08-10 09:56:07'),
('a429e56366f053da94be980f3e615f8c6d81335d1836e83589a14749696964a19843285e71c4fd6c', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-24 04:47:30', '2024-08-24 04:47:30', '2025-08-24 10:17:30'),
('b61ca5d3b3c30c3de803d3d25ea04a49ab831aa40d96457a36b37be0ce47b320a7cb594631be7832', 1, 5, 'Personal Access Token', '[]', 0, '2024-08-10 06:48:16', '2024-08-10 06:48:16', '2025-08-10 12:18:16'),
('bb00b623ea0d129ec281082bd8753613ca1056b01f3d7fd05894c6f9e5fa3f95dc4764299570ab7e', 1, 5, 'Personal Access Token', '[]', 0, '2024-08-10 03:11:41', '2024-08-10 03:11:42', '2025-08-10 08:41:41'),
('bb09284ceee96541b1097aec6c21cfe5d1596fd42e3ef26c06d33e5c8981d27d07712d161a334697', 6, 5, 'Personal Access Token', '[]', 0, '2024-08-14 12:39:21', '2024-08-14 12:39:21', '2025-08-14 18:09:21'),
('c201960558b33a080db431f7724b6fd02fd4196a9430bfae21630dba1abf5df43f169fee039b0295', 1, 5, 'Personal Access Token', '[]', 0, '2024-07-07 06:55:24', '2024-07-07 06:55:24', '2025-07-07 12:25:24'),
('c721143cb4de0d1218c4f68c3433a7864531688e88c1eb5a636b7750f7485f0093a7f55ce5a10520', 2, 5, 'Personal Access Token', '[]', 0, '2024-07-07 07:13:31', '2024-07-07 07:13:31', '2025-07-07 12:43:31'),
('ce8e63b51d01318e62abff8d624f8502a31a3b53bb473fa9805c15fbfc4626e99f0b083fc96e1e90', 1, 5, 'Personal Access Token', '[]', 0, '2024-08-10 10:42:07', '2024-08-10 10:42:07', '2025-08-10 16:12:07'),
('cfa8be6886c910860252c14744be015d6aace24864df46e6c7fc2e5308b8ca373c0fde3597f71986', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-12 12:25:25', '2024-08-12 12:25:25', '2025-08-12 17:55:25'),
('d02c6e12dea43c7f29259805c87f7ef906e32e162f9cf8ad218b3594320e8f6f83d290e09e99df99', 7, 5, 'Personal Access Token', '[]', 0, '2024-08-14 12:39:49', '2024-08-14 12:39:50', '2025-08-14 18:09:49'),
('d1ed4411b8ef8564c9063734751888e17fb28519f7d8745c13cb1af62ca9f82207c8229ab6b3e7a1', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-11 11:10:52', '2024-08-11 11:10:52', '2025-08-11 16:40:52'),
('de6961494704c91915369b75fa5426aecd9ec050342849108b84f61d0e303ca8fadc8555e3bdfb10', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-12 12:24:43', '2024-08-12 12:24:43', '2025-08-12 17:54:43'),
('df38f6fbc9a1ce04b49bc64d2490556717957c62b49e95adc5506bb08f572689e54ff8d912d90ed1', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-12 12:22:56', '2024-08-12 12:22:56', '2025-08-12 17:52:56'),
('df7a1de13ecb5e97a01ec4058f772224b3508b578bdd33209c763d4a206ac227a17c9eebbaf1933e', 1, 5, 'Personal Access Token', '[]', 0, '2024-08-10 06:46:53', '2024-08-10 06:46:53', '2025-08-10 12:16:53'),
('dfcd91efb94f0906eef3b88f12c4a086d950051db04e9a95e384439a6db363731b81e0907e0e014f', 1, 5, 'Personal Access Token', '[]', 0, '2024-08-10 06:38:41', '2024-08-10 06:38:42', '2025-08-10 12:08:41'),
('e01c3d7f77a0d5ecc98972cccedd87ca29cdce499bb4ad66e887d1c502be9a16b8c11ba4482a152c', 2, 5, 'Personal Access Token', '[]', 0, '2024-07-07 07:27:18', '2024-07-07 07:27:19', '2025-07-07 12:57:18'),
('e207493356cb174b876e84a1f6b3e12598a2c7d64dc86c7625029b6e6c2a41e469efccdc29352d2d', 1, 5, 'Personal Access Token', '[]', 0, '2024-08-11 10:42:25', '2024-08-11 10:42:25', '2025-08-11 16:12:25'),
('e874a99ad4768113ca7f53a35a66bce18f5b652cf35a32158700a4d8789984a13c41bc9e84a9a115', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-11 11:17:31', '2024-08-11 11:17:32', '2025-08-11 16:47:31'),
('eed37f4e77be827bbcf6ac397d005826ff9c0ac6b227c24a50d7dd49dd34f8e8899147048e48a2ee', 1, 5, 'Personal Access Token', '[]', 0, '2024-07-07 06:57:42', '2024-07-07 06:57:42', '2025-07-07 12:27:42'),
('fd1977fa9fd3169884f04f49e607fef72d0c6a0697a675f4fe16d09655f719a6092282ea3c303a65', 1, 5, 'Personal Access Token', '[]', 0, '2024-08-10 03:13:29', '2024-08-10 03:13:29', '2025-08-10 08:43:29'),
('ff18420bd61c5c721a26a24f315e18b62f49e834ebb69a83628daaccdc85ffd142027222164a16d1', 2, 5, 'Personal Access Token', '[]', 0, '2024-08-12 12:24:56', '2024-08-12 12:24:56', '2025-08-12 17:54:56');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'nVdlQs1VIS9ssEP0BlboltaVJMMvwdvcrvzOaKIq', NULL, 'http://localhost', 1, 0, 0, '2024-07-07 03:49:53', '2024-07-07 03:49:53'),
(2, NULL, 'Laravel Password Grant Client', 'xrnLDRuHH9ifTZX8g9muL8K3JHFrBLTaeQDl9PIW', 'users', 'http://localhost', 0, 1, 0, '2024-07-07 03:49:53', '2024-07-07 03:49:53'),
(3, NULL, 'Laravel Personal Access Client', 'odGuSUpiTAvSnKONr2jrKM9TQqG3VkXpXbFyOmBq', NULL, 'http://localhost', 1, 0, 0, '2024-07-07 05:36:47', '2024-07-07 05:36:47'),
(4, NULL, 'Laravel Password Grant Client', 'TV0TpGLgH3Au9TeGeZly4CCO2Ny1yDmezl3DxwFf', 'users', 'http://localhost', 0, 1, 0, '2024-07-07 05:36:47', '2024-07-07 05:36:47'),
(5, NULL, 'Laravel Personal Access Client', '7zg3NgvU817HeHXfagE6hT4VNt8eBsJsDvQoeomF', NULL, 'http://localhost', 1, 0, 0, '2024-07-07 06:04:53', '2024-07-07 06:04:53'),
(6, NULL, 'Laravel Password Grant Client', 'll75CzhqkDwQ3s8gYSLUmw0QKI3SoUdrwhDDuCCY', 'users', 'http://localhost', 0, 1, 0, '2024-07-07 06:04:54', '2024-07-07 06:04:54'),
(7, NULL, 'y', 'qRvSHa9plyjfNZtNgn7YQQC8GJwmnTbA4e8Mggt9', 'users', 'http://localhost', 0, 1, 0, '2024-07-07 06:17:37', '2024-07-07 06:17:37');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-07-07 03:49:53', '2024-07-07 03:49:53'),
(2, 3, '2024-07-07 05:36:47', '2024-07-07 05:36:47'),
(3, 5, '2024-07-07 06:04:54', '2024-07-07 06:04:54');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
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
(1, 'App\\Models\\User', 1, 'Personal Access Token', '3b19f0f33fff6918bcf7abb993d647a98be5d91a92a93a798c909af232ec1767', '[\"*\"]', NULL, NULL, '2024-07-07 05:18:50', '2024-07-07 05:18:50'),
(2, 'App\\Models\\User', 1, 'Personal Access Token', 'af928e86549070868d833265abe202fabe5b5b5afbfa94d98b342271591c8aa4', '[\"*\"]', NULL, NULL, '2024-07-07 05:22:54', '2024-07-07 05:22:54'),
(3, 'App\\Models\\User', 1, 'Personal Access Token', '82530e298aa6e6298481bc1190a75258ee12f0716f265c0a50d74f86388be789', '[\"*\"]', NULL, NULL, '2024-07-07 06:05:09', '2024-07-07 06:05:09'),
(4, 'App\\Models\\User', 1, 'Personal Access Token', '9208e2940b0a9e57c84ab3ed7d831dc6849d168a09ecb588a62ea1c102f91785', '[\"*\"]', NULL, NULL, '2024-07-07 06:05:38', '2024-07-07 06:05:38'),
(5, 'App\\Models\\User', 1, 'Personal Access Token', 'dbf2580ba8f771df7fa540fc3353856cf2a419d6be6c6d45bc78c5b5ea8c8042', '[\"*\"]', NULL, NULL, '2024-07-07 06:06:38', '2024-07-07 06:06:38'),
(6, 'App\\Models\\User', 1, 'Personal Access Token', '7d7c2ff946b83c90d6b17bf34071490a1772ec6333cb64408d7dbfd3508729b3', '[\"*\"]', NULL, NULL, '2024-07-07 06:07:24', '2024-07-07 06:07:24'),
(7, 'App\\Models\\User', 1, 'Personal Access Token', '52e0ed14d9d8b68b58c69ae8bd87f05551e60d50e484d8781872009a71fc9787', '[\"*\"]', NULL, NULL, '2024-07-07 06:08:01', '2024-07-07 06:08:01'),
(8, 'App\\Models\\User', 1, 'Personal Access Token', '44d5bb2214b04a02d83ed05fe1510607f767ab2408345f8f0f1a6943ce35d4d0', '[\"*\"]', NULL, NULL, '2024-07-07 06:17:55', '2024-07-07 06:17:55'),
(9, 'App\\Models\\User', 1, 'Personal Access Token', '7925364477da9dfa25aebf03dd6b25544f7ecfde7306ccff1f2a722ae66be915', '[\"*\"]', NULL, NULL, '2024-07-07 06:32:27', '2024-07-07 06:32:27'),
(10, 'App\\Models\\User', 1, 'Personal Access Token', '69bf41443798ded7880d315db0cd637e9ffeaead72d5d14b5024dd87fec2e363', '[\"*\"]', NULL, NULL, '2024-07-07 07:05:21', '2024-07-07 07:05:21'),
(11, 'App\\Models\\User', 1, 'Personal Access Token', '0c4f09bf939a84fab4cd9ba3dce3a5362f7fe2c67fd29580444ca9f09784dbb0', '[\"*\"]', NULL, NULL, '2024-07-07 07:06:04', '2024-07-07 07:06:04');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'developer', '$2y$12$w54cu1WI1rgAwvNNq4t.RulqwK0gH2LQMmgqFldJ9K9PKYX.DJSeC', NULL, NULL);

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
(2, 'Gaurav', 'gaurav123@gmail.com', NULL, '$2y$12$Z1AWK2nun8JybOVP74W4GeXXCjlFT7cv1Zg0iNIgFUepElgzMHeIi', NULL, '2024-08-11 11:10:52', '2024-08-11 11:10:52'),
(5, 'Saurav SIngh', 'saurav123@gmail.com', NULL, '$2y$12$eAf1hQacyJZIMi1daYcAs.M3Yrtjyl5kXAzRMIL5VGOzbS59Jm2ma', NULL, '2024-08-14 12:38:48', '2024-08-14 12:38:48'),
(6, 'Rahul Kumar', 'rahul123@gmail.com', NULL, '$2y$12$Z/j46B0WXaE/OJQdJOeQs.dfbZV5M6U5s87p2I7UossU7K8kVwOCy', NULL, '2024-08-14 12:39:21', '2024-08-14 12:39:21'),
(7, 'Mohit Kumar', 'mohit12@gmail.com', NULL, '$2y$12$U7aqXiWIu3P1EM3xZ33LOOjsx2X7Xyp/9eFaJklxB3wS.wfGlDlBi', NULL, '2024-08-14 12:39:49', '2024-08-14 12:39:49'),
(10, 'Mahesh', 'mahesh254@gmail.com', NULL, '$2y$12$Z1AWK2nun8JybOVP74W4GeXXCjlFT7cv1Zg0iNIgFUepElgzMHeIi', NULL, '2024-08-11 11:10:52', '2024-08-11 11:10:52'),
(11, 'Sumit SIngh', 'sumit1234@gmail.com', NULL, '$2y$12$58p97Xec1J8ZZ8H/1r74F.hHUxKxZUgtYrDyRTMFcTmL0m0/M4/pW', NULL, '2024-08-14 12:38:48', '2024-08-27 00:17:37'),
(12, 'Deepak Kumar', 'deepak23@gmail.com', NULL, '$2y$12$Z/j46B0WXaE/OJQdJOeQs.dfbZV5M6U5s87p2I7UossU7K8kVwOCy', NULL, '2024-08-14 12:39:21', '2024-08-14 12:39:21'),
(13, 'Rohit Kumar', 'rohit12@gmail.com', NULL, '$2y$12$U7aqXiWIu3P1EM3xZ33LOOjsx2X7Xyp/9eFaJklxB3wS.wfGlDlBi', NULL, '2024-08-14 12:39:49', '2024-08-14 12:39:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `profile_image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `country`, `state`, `city`, `address`, `user_type`, `profile_image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 2, 'India', 'Delhi', 'New Delhi', 'H-369 Noida', 'subscriber', 'profile_images/1723467878_images.jpg', '2024-08-12 07:34:38', '2024-08-12 07:34:38', NULL),
(3, 6, 'India', 'Uttar Pradesh', 'Noida', 'H-369 Noida', 'editor', 'profile_images/1724389972_palak_3.jpg', '2024-08-22 23:42:52', '2024-08-22 23:42:52', NULL),
(4, 11, 'India', 'Uttar Pradesh', 'Noida', 'H-369 Noida', 'admin', 'profile_images/1724737657_palak_2.jpg', '2024-08-23 02:04:29', '2024-08-27 00:17:38', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `loan_details`
--
ALTER TABLE `loan_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_details_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_details`
--
ALTER TABLE `loan_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
