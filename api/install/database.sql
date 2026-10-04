-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 13, 2025 at 05:39 AM
-- Server version: 10.11.10-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u760058054_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `image`, `password`, `remember_token`, `created_at`, `updated_at`, `email_verified_at`) VALUES
(1, 'Rashid King', 'admin@gmail.com', 'admin', '65cef38a6bb3c1708061578.png', '$2y$10$n5F1ImlcsWyh3086oxeBCuGzM9BKlU1zaTf8nQ0XerHVlgK1oulVm', 'v1alACv5U57gqRxQkAiAFTjdp3DkrGutPvFnZyRHHh8gwbLQbo4pfhQFmutD', NULL, '2025-03-09 15:59:51', NULL),
(2, 'Rashid King', 'admin@gmail.com', 'adminqq', '65cef38a6bb3c1708061578.png', '$2a$12$zPeELktyjfYJxtTdnjTQh.r11QkR6h6xxohSMfbPcoOOhXzm17CJ.', 'v1alACv5U57gqRxQkAiAFTjdp3DkrGutPvFnZyRHHh8gwbLQbo4pfhQFmutD', NULL, '2025-01-29 15:50:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ai_records`
--

CREATE TABLE `ai_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `invest_amount` decimal(28,8) DEFAULT NULL,
  `return_amount` decimal(28,8) DEFAULT NULL,
  `profit_or_lose` varchar(255) DEFAULT 'pending',
  `profit` decimal(28,8) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `status` varchar(255) DEFAULT 'runing',
  `coins` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`coins`)),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checkin`
--

CREATE TABLE `checkin` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `day` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coins`
--

CREATE TABLE `coins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(28,8) DEFAULT 0.00000000,
  `profit_loss` decimal(10,2) DEFAULT NULL,
  `twenty_four` decimal(10,2) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coins`
--

INSERT INTO `coins` (`id`, `name`, `symbol`, `image`, `price`, `profit_loss`, `twenty_four`, `status`, `created_at`, `updated_at`) VALUES
(1, 'TetherUS', 'USDT', '65df8dca9576c1709149642.png', 1.00015996, 3.00, 0.01, 'active', '2024-02-20 16:28:20', '2024-05-20 06:15:12'),
(2, 'Bitcoin', 'BTC', '66489159628b11716031833.png', 104296.10000000, 10.00, -3.32, 'active', '2023-12-03 19:22:46', '2025-06-13 10:23:25'),
(3, 'Ethereum', 'ETH', '656cd79f30a8d1701631903.png', 2511.00000000, 3.00, -9.22, 'active', '2023-12-03 19:29:20', '2025-06-13 10:23:25'),
(4, 'ALGO', 'ALGO', '6571ceba0914d1701957306.png', 0.17520000, 3.00, -10.15, 'active', '2023-12-03 19:33:07', '2025-06-13 10:23:25'),
(5, 'XRP', 'XRP', '656cd819956de1701632025.png', 2.11960000, 3.00, -5.91, 'active', '2023-12-03 19:33:45', '2025-06-13 10:23:25'),
(6, 'Cardano', 'ADA', '656cd849405a21701632073.png', 0.63080000, 3.00, -9.07, 'active', '2023-12-03 19:34:33', '2025-06-13 10:23:25'),
(7, 'Polygon', 'MATIC', '656cd871b28851701632113.png', 0.00000000, 3.00, 0.00, 'active', '2023-12-03 19:35:13', '2025-06-13 10:23:25'),
(8, 'Dogecoin', 'DOGE', '656cd885eb0251701632133.jpg', 0.17266000, 2.00, -9.46, 'active', '2023-12-03 19:35:33', '2025-06-13 10:23:25'),
(9, 'Solana', 'SOL', '656cd8a06f6fd1701632160.png', 143.70000000, 3.00, -10.14, 'active', '2023-12-03 19:36:00', '2025-06-13 10:23:25'),
(10, 'Polkadot', 'DOT', '656cd8b3129ae1701632179.jpg', 3.78000000, 3.00, -8.72, 'active', '2023-12-03 19:36:19', '2025-06-13 10:23:25'),
(11, 'LITECOIN', 'LTC', '656cd8d561c961701632213.jpg', 83.02000000, 3.00, -7.92, 'active', '2023-12-03 19:36:53', '2025-06-13 10:23:25'),
(12, 'ATOM', 'ATOM', '6571cf7778aa31701957495.jpg', 4.06600000, 3.00, -8.53, 'active', '2023-12-03 19:37:12', '2025-06-13 10:23:25'),
(13, 'Stacks', 'STX', '656cd984cab821701632388.png', 0.61600000, 2.00, -9.01, 'active', '2023-12-03 19:39:35', '2025-06-13 10:23:25'),
(14, 'Green Token', 'GRN', '65bbce6383e421706806883.png', 0.09010000, 3.00, NULL, 'active', '2024-02-01 16:15:53', '2024-04-17 12:24:13'),
(15, 'Equity Shares', 'ESC', '65cececb106e21708052171.png', 0.10359000, 2.50, NULL, 'active', '2024-02-08 17:25:37', '2024-03-29 08:31:25'),
(16, 'BNB', 'BNB', '65d47fcea6f201708425166.png', 648.13000000, 3.00, -2.71, 'active', '2024-02-20 16:32:46', '2025-06-13 10:23:25'),
(17, 'TRON', 'TRX', '65d48148862221708425544.png', 0.27180000, 3.00, -1.16, 'active', '2024-02-20 16:39:04', '2025-06-13 10:23:25'),
(18, 'DREP', 'DREP', '65d481d7a3a481708425687.png', 0.00000000, 3.00, 0.00, 'active', '2024-02-20 16:41:27', '2025-06-13 10:23:25'),
(19, 'Render Token', 'RNDR', '65e1a0928a0aa1709285522.png', 0.00000000, 3.00, 0.00, 'active', '2024-03-01 15:32:02', '2025-06-13 10:23:25'),
(20, 'Optimism', 'OP', '65e684f731ab81709606135.png', 0.58600000, 3.00, -15.07, 'active', '2024-03-01 15:34:29', '2025-06-13 10:23:25'),
(21, 'VeChain', 'VET', '65e6857a843a81709606266.png', 0.02220000, 3.00, -10.09, 'active', '2024-03-01 15:38:08', '2025-06-13 10:23:25'),
(22, 'Celestia', 'TIA', '65e1a2df3af731709286111.png', 1.79100000, 3.00, -13.40, 'active', '2024-03-01 15:41:51', '2025-06-13 10:23:25'),
(23, 'Sei', 'SEI', '65e1a34a06ecf1709286218.png', 0.17430000, 3.00, -11.12, 'active', '2024-03-01 15:43:38', '2025-06-13 10:23:25'),
(24, 'ARB', 'Arbitrum', '65e1a5b972d7e1709286841.png', 0.52940000, 3.00, NULL, 'active', '2024-03-01 15:46:41', '2024-05-19 14:25:37'),
(25, 'Lido DAO', 'LDO', '65e1a4032ce4e1709286403.png', 0.81200000, 2.00, -14.80, 'active', '2024-03-01 15:46:43', '2025-06-13 10:23:25'),
(26, 'Maker', 'MKR', '65e1a6d93707c1709287129.png', 1865.00000000, 3.00, -8.04, 'active', '2024-03-01 15:56:52', '2025-06-13 10:23:25'),
(27, 'The Graph', 'GRT', '65e1a667b98641709287015.png', 0.08570000, 3.00, -9.98, 'active', '2024-03-01 15:56:55', '2025-06-13 10:23:25'),
(28, 'Theta Token', 'THETA', '65e1a75fb928e1709287263.png', 0.69500000, 3.00, -10.90, 'active', '2024-03-01 16:01:03', '2025-06-13 10:23:25'),
(29, 'Arweave', 'AR', '65e1a7f8bf0581709287416.png', 6.08000000, 3.00, -10.59, 'active', '2024-03-01 16:03:36', '2025-06-13 10:23:25'),
(30, 'Flow', 'FLOW', '65e1a894397b51709287572.png', 0.34700000, 3.00, -7.96, 'active', '2024-03-01 16:06:12', '2025-06-13 10:23:25'),
(31, 'Aave', 'AAVE', '65e1a900e0a571709287680.png', 268.92000000, 3.00, -10.27, 'active', '2024-03-01 16:08:00', '2025-06-13 10:23:25'),
(32, 'ORDI', 'ORDI', '65e1a9651a2f41709287781.png', 7.53100000, 3.00, -15.33, 'active', '2024-03-01 16:09:41', '2025-06-13 10:23:25'),
(33, 'Bonk', 'BONK', '65e1a9c3cd0751709287875.png', 0.00001407, 3.00, -14.57, 'active', '2024-03-01 16:11:15', '2025-06-13 10:23:25'),
(34, 'Chiliz', 'CHZ', '65e1aa469219d1709288006.png', 0.03595000, 3.00, -6.72, 'active', '2024-03-01 16:13:26', '2025-06-13 10:23:25'),
(35, 'Quant', 'QNT', '65e1aaddaef631709288157.png', 106.07000000, 3.00, -8.72, 'active', '2024-03-01 16:15:57', '2025-06-13 10:23:25'),
(36, 'The Sandbox', 'SAND', '65e1ab63314d71709288291.png', 0.25970000, 3.00, -8.10, 'active', '2024-03-01 16:18:11', '2025-06-13 10:23:25'),
(37, 'Fetch.ai', 'FET', '65e2fbc2c70591709374402.png', 0.66000000, 3.00, -12.12, 'active', '2024-03-02 16:13:22', '2025-06-13 10:23:25'),
(38, 'Gala', 'GALA', '65e2fc48b195b1709374536.png', 0.01483000, 3.00, -10.61, 'active', '2024-03-02 16:15:36', '2025-06-13 10:23:25'),
(39, 'FLOKI', 'FLOKI', '65e2fca6760f11709374630.png', 0.00007609, 3.00, -14.46, 'active', '2024-03-02 16:17:10', '2025-06-13 10:23:25'),
(40, 'Axelar', 'AXL', '65e2fd1b5b7bd1709374747.png', 0.41500000, 3.00, -11.48, 'active', '2024-03-02 16:19:07', '2025-06-13 10:23:25'),
(41, 'NEO', 'NEO', '65e2fd6d87de71709374829.png', 5.55000000, 3.00, -9.61, 'active', '2024-03-02 16:20:29', '2025-06-13 10:23:25'),
(42, 'EOS', 'EOS', '65e2fdbe6a79f1709374910.png', 0.00000000, 3.00, 0.00, 'active', '2024-03-02 16:21:50', '2025-06-13 10:23:25'),
(43, 'Worldcoin', 'WLD', '65e2fe7659ea01709375094.png', 0.96200000, 3.00, -13.95, 'active', '2024-03-02 16:24:54', '2025-06-13 10:23:25'),
(44, 'Blur', 'BLUR', '65e2fecaddd461709375178.png', 0.07980000, 3.00, -9.83, 'active', '2024-03-02 16:26:18', '2025-06-13 10:23:25'),
(45, 'Klaytn', 'KLAY', '65e2ff1d977cd1709375261.png', 0.00000000, 3.00, 0.00, 'active', '2024-03-02 16:27:41', '2025-06-13 10:23:25'),
(46, 'Gnosis', 'GNO', '65e2ffdc147681709375452.jpeg', 112.00000000, 3.00, -8.27, 'active', '2024-03-02 16:30:52', '2025-06-13 10:23:25'),
(47, 'Kava', 'KAVA', '65e30045adece1709375557.png', 0.42220000, 3.00, 1.93, 'active', '2024-03-02 16:32:38', '2025-06-13 10:23:25'),
(48, 'Astar', 'ASTR', '65e300c8797771709375688.jpeg', 0.02479000, 3.00, -8.69, 'active', '2024-03-02 16:34:48', '2025-06-13 10:23:25'),
(49, 'WOO Network', 'WOO', '65e3015138ef01709375825.png', 0.07020000, 2.50, -12.69, 'active', '2024-03-02 16:37:05', '2025-06-13 10:23:25'),
(50, 'eCash', 'XEC', '65e301b7bb0241709375927.png', 0.00002020, 3.00, -8.06, 'active', '2024-03-02 16:38:47', '2025-06-13 10:23:25'),
(51, 'Nexo', 'NEXO', '65e30208380f51709376008.png', 1.20900000, 3.00, -2.97, 'active', '2024-03-02 16:40:08', '2025-06-13 10:23:25'),
(52, 'Curve', 'CRV', '65e3026c165731709376108.jpeg', 0.58420000, 3.00, -9.82, 'active', '2024-03-02 16:41:48', '2025-06-13 10:23:25'),
(53, 'Jupiter', 'JUP', '65e302fa6964a1709376250.jpg', 0.40120000, 3.00, -12.42, 'active', '2024-03-02 16:44:10', '2025-06-13 10:23:25'),
(54, 'Ronin', 'RONIN', '65e3035ce4b161709376348.png', 0.50100000, 3.00, -10.54, 'active', '2024-03-02 16:45:48', '2025-06-13 10:23:25'),
(55, 'Frax Share', 'FXS', '65e303caa4d791709376458.png', 2.55600000, 3.00, -9.14, 'active', '2024-03-02 16:47:38', '2025-06-13 10:23:25'),
(56, 'Compound', 'COMP', '65e30432b7a801709376562.png', 52.33000000, 3.00, -7.64, 'active', '2024-03-02 16:49:22', '2025-06-13 10:23:25'),
(57, 'CKB', 'CKB', '65e304738795a1709376627.png', 0.00364900, 3.00, -11.35, 'active', '2024-03-02 16:50:27', '2025-06-13 10:23:25'),
(58, 'Manta', 'MANTA', '65e3051d3739e1709376797.jpeg', 0.20300000, 3.00, -12.88, 'active', '2024-03-02 16:53:17', '2025-06-13 10:23:25'),
(59, 'SuperVerse', 'SUPER', '65e305e9ac6c41709377001.png', 0.61790000, 3.00, -9.48, 'active', '2024-03-02 16:56:41', '2025-06-13 10:23:25'),
(60, '1 inch', '1INCH', '65e306440278a1709377092.png', 0.19050000, 3.00, -11.60, 'active', '2024-03-02 16:58:12', '2025-06-13 10:23:25'),
(61, 'Enjin Coin', 'ENJ', '65e306aee4f4b1709377198.jpeg', 0.06610000, 3.00, -10.56, 'active', '2024-03-02 16:59:58', '2025-06-13 10:23:25'),
(62, 'Holo', 'HOT', '65e30769311bb1709377385.png', 0.00088200, 3.00, -10.00, 'active', '2024-03-02 17:03:05', '2025-06-13 10:23:25'),
(63, 'Rocket Pool', 'RPL', '65e307c168aca1709377473.jpeg', 5.82000000, 3.00, -16.02, 'active', '2024-03-02 17:04:33', '2025-06-13 10:23:25'),
(64, 'Celo', 'CELO', '65e30817642251709377559.png', 0.28410000, 2.50, -10.89, 'active', '2024-03-02 17:05:59', '2025-06-13 10:23:25'),
(65, 'Trust Wallet Token', 'TWT', '65e308ec913091709377772.png', 0.75470000, 2.50, -5.43, 'active', '2024-03-02 17:09:32', '2025-06-13 10:23:25'),
(66, 'IoTeX', 'IOTX', '65e3096567e641709377893.png', 0.02176000, 3.00, 3.77, 'active', '2024-03-02 17:11:33', '2025-06-13 10:23:25'),
(67, 'GMX', 'GMX', '65e309d2246ea1709378002.jpg', 14.88000000, 3.00, -9.21, 'active', '2024-03-02 17:13:22', '2025-06-13 10:23:25'),
(68, 'Terra', 'LUNA', '65e30a24cfc631709378084.jpeg', 0.15630000, 3.00, -10.48, 'active', '2024-03-02 17:14:44', '2025-06-13 10:23:25'),
(69, 'Siacoin', 'SC', '65e30aa0157a81709378208.png', 0.00303800, 3.00, -8.38, 'active', '2024-03-02 17:16:48', '2025-06-13 10:23:25'),
(70, 'Zilliqa', 'ZIL', '65e30aec282ce1709378284.png', 0.01082000, 3.00, -8.69, 'active', '2024-03-02 17:18:04', '2025-06-13 10:23:25'),
(71, 'AltLayer', 'ALT', '65e30b52dbd851709378386.png', 0.02415000, 3.00, -14.33, 'active', '2024-03-02 17:19:46', '2025-06-13 10:23:25'),
(72, 'Zcash', 'ZEC', '65e30bfe009d61709378558.png', 45.39000000, 3.00, -7.16, 'active', '2024-03-02 17:22:38', '2025-06-13 10:23:25'),
(73, 'Qtum', 'QTUM', '65e30c812e5891709378689.jpeg', 2.01400000, 2.50, -7.53, 'active', '2024-03-02 17:24:49', '2025-06-13 10:23:25'),
(74, 'Dash', 'DASH', '65e30cc5936371709378757.png', 19.95000000, 3.00, -7.51, 'active', '2024-03-02 17:25:57', '2025-06-13 10:23:25'),
(75, 'NEM', 'XEM', '65e30d7d1a9151709378941.jpeg', 0.00000000, 2.00, 0.00, 'active', '2024-03-02 17:29:01', '2025-06-13 10:23:25'),
(76, 'Glimmer', 'GLMR', '65e30e2950ea31709379113.png', 0.07390000, 2.50, -10.32, 'active', '2024-03-02 17:31:53', '2025-06-13 10:23:25'),
(77, 'Livepeer', 'LPT', '65e597829b8951709545346.png', 6.97000000, 3.00, -8.06, 'active', '2024-03-04 15:42:26', '2025-06-13 10:23:25'),
(78, 'Harmony', 'ONE', '65e5981de37171709545501.jpeg', 0.01029000, 3.00, -12.05, 'active', '2024-03-04 15:44:12', '2025-06-13 10:23:25'),
(79, 'Pixels', 'PIXEL', '65e59960c24931709545824.jpeg', 0.03759000, 2.30, -13.37, 'active', '2024-03-04 15:50:24', '2025-06-13 10:23:25'),
(80, 'Ankr', 'ANKR', '65e599c78850b1709545927.png', 0.01506000, 3.00, -8.62, 'active', '2024-03-04 15:52:07', '2025-06-13 10:23:25'),
(81, 'Neutron', 'NTRN', '65e59a20e97731709546016.png', 0.09340000, 3.00, -10.96, 'active', '2024-03-04 15:53:36', '2025-06-13 10:23:25'),
(82, 'Sushi', 'SUSHI', '65e59a6d5c6481709546093.png', 0.61200000, 3.00, -14.17, 'active', '2024-03-04 15:54:53', '2025-06-13 10:23:25'),
(83, 'PAX Gold', 'PAXG', '65e59acb6a6c71709546187.png', 3450.40000000, 3.00, 1.81, 'active', '2024-03-04 15:56:27', '2025-06-13 10:23:25'),
(84, 'Decred', 'DCR', '65e59b19a15cd1709546265.jpeg', 14.30000000, 3.00, -3.44, 'active', '2024-03-04 15:57:45', '2025-06-13 10:23:25'),
(85, 'Ravencoin', 'RVN', '65e59b608cefa1709546336.png', 0.01908000, 3.00, -10.80, 'active', '2024-03-04 15:58:56', '2025-06-13 10:23:25'),
(86, 'Portal', 'PORTAL', '65e59c05982821709546501.jpeg', 0.03560000, 3.00, -14.22, 'active', '2024-03-04 16:00:33', '2025-06-13 10:23:25'),
(87, 'Flux', 'FLUX', '65e59c8c2d49d1709546636.png', 0.19930000, 3.00, -10.75, 'active', '2024-03-04 16:03:56', '2025-06-13 10:23:25'),
(88, 'SafePal', 'SFP', '65e59cd2689c61709546706.png', 0.45250000, 3.00, -7.07, 'active', '2024-03-04 16:05:06', '2025-06-13 10:23:25'),
(89, '0x', 'ZRX', '65e59d0c130291709546764.png', 0.22510000, 3.00, -8.09, 'active', '2024-03-04 16:06:04', '2025-06-13 10:23:25'),
(90, 'JUST', 'JST', '65e59d5a54dae1709546842.png', 0.03246000, 3.00, -3.54, 'active', '2024-03-04 16:07:22', '2025-06-13 10:23:25'),
(91, 'Xai', 'XAI', '65e59dd8da66b1709546968.png', 0.05700000, 3.00, -13.11, 'active', '2024-03-04 16:09:28', '2025-06-13 10:23:25'),
(92, 'Galxe', 'GAL', '65e59e158ca421709547029.png', 0.00000000, 3.00, 0.00, 'active', '2024-03-04 16:10:29', '2025-06-13 10:23:25'),
(93, 'Magic', 'MAGIC', '65e59e60b705f1709547104.jpeg', 0.11280000, 3.00, -14.29, 'active', '2024-03-04 16:11:44', '2025-06-13 10:23:25'),
(94, 'UMA', 'UMA', '65e59ecdd0b6f1709547213.png', 1.27000000, 3.00, -10.06, 'active', '2024-03-04 16:13:33', '2025-06-13 10:23:25'),
(95, 'Uniswap', 'UNI', '65e5c746e653c1709557574.png', 7.13900000, 3.00, -11.31, 'active', '2024-03-04 16:13:34', '2025-06-13 10:23:25'),
(96, 'BAND', 'BAND', '65e59f04ce9681709547268.png', 0.60400000, 3.00, -11.70, 'active', '2024-03-04 16:14:28', '2025-06-13 10:23:25'),
(97, 'Biconomy', 'BICO', '65e59f518551a1709547345.jpeg', 0.08880000, 3.00, -14.86, 'active', '2024-03-04 16:15:45', '2025-06-13 10:23:25'),
(98, 'Storj', 'STORJ', '65e59fc0e3b621709547456.png', 0.24700000, 3.00, -9.69, 'active', '2024-03-04 16:17:36', '2025-06-13 10:23:25'),
(99, 'Threshold', 'T', '65e5a0057330d1709547525.png', 0.01387000, 3.00, -8.02, 'active', '2024-03-04 16:18:45', '2025-06-13 10:23:25'),
(100, 'JITO', 'JTO', '65e5a04902f8a1709547593.png', 1.84200000, 3.00, -12.20, 'active', '2024-03-04 16:19:53', '2025-06-13 10:23:25'),
(101, 'COTI', 'COTI', '65e5a0d228a281709547730.jpeg', 0.05024000, 3.00, -11.75, 'active', '2024-03-04 16:22:10', '2025-06-13 10:23:25'),
(102, 'ICON', 'ICX', '65e5a193c26141709547923.png', 0.14090000, 3.00, -10.03, 'active', '2024-03-04 16:25:23', '2025-06-13 10:23:25'),
(103, 'API3', 'API3', '65e5a212751da1709548050.jpeg', 0.65600000, 3.00, -9.77, 'active', '2024-03-04 16:27:30', '2025-06-13 10:23:25'),
(104, 'Cartesi', 'CTSI', '65e5a26f3f0f91709548143.png', 0.05740000, 3.00, -10.59, 'active', '2024-03-04 16:29:03', '2025-06-13 10:23:25'),
(105, 'Chromia', 'CHR', '65e5a2dd04ad41709548253.png', 0.07720000, 3.00, -11.47, 'active', '2024-03-04 16:30:53', '2025-06-13 10:23:25'),
(106, 'Raydium', 'RAY', '65e5a3218d33b1709548321.jpeg', 2.07600000, 3.00, -8.51, 'active', '2024-03-04 16:32:01', '2025-06-13 10:23:25'),
(107, 'Fusionist', 'ACE', '65e5a38740e8d1709548423.jpeg', 0.52900000, 3.00, -10.94, 'active', '2024-03-04 16:33:43', '2025-06-13 10:23:25'),
(108, 'Solar', 'SXP', '65e5a3f6ab4151709548534.png', 0.16840000, 3.00, -9.02, 'active', '2024-03-04 16:35:34', '2025-06-13 10:23:25'),
(109, 'Ontology', 'ONT', '65e5a440b518a1709548608.png', 0.12520000, 3.00, -10.19, 'active', '2024-03-04 16:36:48', '2025-06-13 10:23:25'),
(110, 'JOE', 'JOE', '65e5a48f1abfa1709548687.jpeg', 0.14770000, 3.00, -11.93, 'active', '2024-03-04 16:38:07', '2025-06-13 10:23:25'),
(111, 'Syscoin', 'SYS', '65e5a4d0ea0711709548752.png', 0.03580000, 3.00, -14.56, 'active', '2024-03-04 16:39:12', '2025-06-13 10:23:25'),
(112, 'Prometeus', 'PROM', '65e5a5aa1dee11709548970.jpeg', 5.25100000, 3.00, -2.67, 'active', '2024-03-04 16:42:50', '2025-06-13 10:23:25'),
(113, 'Pax Dollar', 'USDP', '65e5a61246ef71709549074.jpeg', 1.00020000, 3.00, 0.04, 'active', '2024-03-04 16:44:34', '2025-06-13 10:23:25'),
(114, 'Hive', 'HIVE', '65e5a66f4b6e61709549167.jpeg', 0.21230000, 3.00, -9.47, 'active', '2024-03-04 16:46:07', '2025-06-13 10:23:25'),
(115, 'DENT', 'DENT', '65e5a6b211b401709549234.jpeg', 0.00062100, 3.00, -15.16, 'active', '2024-03-04 16:47:14', '2025-06-13 10:23:25'),
(116, 'Lisk', 'LSK', '65e5a7e731de31709549543.png', 0.39600000, 3.00, -9.80, 'active', '2024-03-04 16:52:23', '2025-06-13 10:23:25'),
(117, 'Synapse', 'SYN', '65e5a84935e6c1709549641.jpeg', 0.13990000, 3.00, -10.72, 'active', '2024-03-04 16:54:01', '2025-06-13 10:23:25'),
(118, 'Numeraire', 'NMR', '65e5a8ac2ea701709549740.png', 7.45000000, 3.00, -9.37, 'active', '2024-03-04 16:55:40', '2025-06-13 10:23:25'),
(119, 'Alchemy Pay', 'ACH', '65e5a9005858f1709549824.png', 0.01888000, 3.00, -9.58, 'active', '2024-03-04 16:57:04', '2025-06-13 10:23:25'),
(120, 'Marlin', 'POND', '65e5a94d9314f1709549901.png', 0.00851000, 3.00, -8.10, 'active', '2024-03-04 16:58:21', '2025-06-13 10:23:25'),
(121, 'Nano', 'XNO', '65e5a9af1e6a51709549999.png', 0.94600000, 3.00, -5.02, 'active', '2024-03-04 16:59:59', '2025-06-13 10:23:25'),
(122, 'CyberConnect', 'CYBER', '65e5aa60acafb1709550176.png', 1.24400000, 3.00, -7.99, 'active', '2024-03-04 17:02:56', '2025-06-13 10:23:25'),
(123, 'Secret', 'SCRT', '65e5ab3875b631709550392.jpeg', 0.16200000, 3.00, -8.37, 'active', '2024-03-04 17:06:32', '2025-06-13 10:23:25'),
(124, 'Status', 'SNT', '65e5ab7864aed1709550456.png', 0.00000000, 3.00, 0.00, 'active', '2024-03-04 17:07:36', '2025-06-13 10:23:25'),
(125, 'Gains Network', 'GNS', '65e5ac1b685361709550619.jpeg', 1.13600000, 3.00, -5.80, 'active', '2024-03-04 17:10:19', '2025-06-13 10:23:25'),
(126, 'Ark', 'ARK', '65e5ac8c7520d1709550732.png', 0.35530000, 3.00, -9.18, 'active', '2024-03-04 17:12:12', '2025-06-13 10:23:25'),
(127, 'Radiant Capital', 'RDNT', '65e5ad09eb2db1709550857.jpeg', 0.02136000, 3.00, -12.85, 'active', '2024-03-04 17:14:17', '2025-06-13 10:23:25'),
(128, 'Vanar', 'VANRY', '65e5ad54259d31709550932.jpeg', 0.02910000, 3.00, -11.82, 'active', '2024-03-04 17:15:32', '2025-06-13 10:23:25'),
(129, 'Hashflow', 'HFT', '65e5ada0731f31709551008.jpeg', 0.05220000, 3.00, -12.71, 'active', '2024-03-04 17:16:48', '2025-06-13 10:23:25'),
(130, 'Horizen', 'ZEN', '65e5adfb5ff761709551099.png', 8.75000000, 3.00, -7.60, 'active', '2024-03-04 17:18:19', '2025-06-13 10:23:25'),
(131, 'IQ', 'IQ', '65e5ae4490e9b1709551172.jpeg', 0.00364600, 3.00, -5.79, 'active', '2024-03-04 17:19:32', '2025-06-13 10:23:25'),
(132, 'Liquity', 'LQTY', '65e5aedacb7c31709551322.jpeg', 0.92800000, 3.00, -15.33, 'active', '2024-03-04 17:22:02', '2025-06-13 10:23:25'),
(133, 'WINkLink', 'WIN', '65e5af6266b951709551458.jpeg', 0.00004988, 3.00, -3.86, 'active', '2024-03-04 17:24:18', '2025-06-13 10:23:25'),
(134, 'Spell Token', 'SPELL', '65e5afed2fcd61709551597.png', 0.00047350, 2.00, -9.05, 'active', '2024-03-04 17:26:37', '2025-06-13 10:23:25'),
(135, 'Bluzelle', 'BLZ', '65e5b040759761709551680.png', 0.00000000, 3.00, 0.00, 'active', '2024-03-04 17:28:00', '2025-06-13 10:23:25'),
(136, 'DODO', 'DODO', '65e5b09f3c6b01709551775.png', 0.03930000, 3.00, -6.21, 'active', '2024-03-04 17:29:35', '2025-06-13 10:23:25'),
(137, 'Stella', 'ALPHA', '65e5b0dbd1b021709551835.jpeg', 0.02160000, 3.00, -10.00, 'active', '2024-03-04 17:30:35', '2025-06-13 10:23:25'),
(138, 'KyberNetwork', 'KNC', '65e5b12fd91dd1709551919.png', 0.31670000, 3.00, -8.23, 'active', '2024-03-04 17:31:59', '2025-06-13 10:23:25'),
(139, 'Pundi X', 'PUNDIX', '65e5b1b30c2991709552051.png', 0.28740000, 3.00, -7.83, 'active', '2024-03-04 17:34:11', '2025-06-13 10:23:25'),
(140, 'Dusk', 'DUSK', '65e5b1f6ea9ee1709552118.png', 0.05240000, 3.00, -12.08, 'active', '2024-03-04 17:35:18', '2025-06-13 10:23:25'),
(141, 'Metal', 'MTL', '65e5b2402b67d1709552192.png', 0.70000000, 3.00, -7.29, 'active', '2024-03-04 17:36:32', '2025-06-13 10:23:25'),
(142, 'Loom Network', 'LOOM', '65e5b2af91cce1709552303.png', 0.00000000, 3.00, 0.00, 'active', '2024-03-04 17:38:23', '2025-06-13 10:23:25'),
(143, 'Steem', 'STEEM', '65e5b33aca24b1709552442.png', 0.12410000, 3.00, -9.42, 'active', '2024-03-04 17:40:42', '2025-06-13 10:23:25'),
(144, 'Cortex', 'CTXC', '65e5b3af006821709552559.jpeg', 0.00000000, 3.00, 0.00, 'active', '2024-03-04 17:42:39', '2025-06-13 10:23:25'),
(145, 'Civic', 'CVC', '65e5b40123e061709552641.png', 0.09240000, 3.00, -11.41, 'active', '2024-03-04 17:44:01', '2025-06-13 10:23:25'),
(146, 'MOBOX', 'MBOX', '65e5b43f05d371709552703.png', 0.04600000, 3.00, -11.88, 'active', '2024-03-04 17:45:03', '2025-06-13 10:23:25'),
(147, 'Adventure Gold', 'AGLD', '65e5b49ab06171709552794.png', 0.72200000, 3.00, -11.19, 'active', '2024-03-04 17:46:34', '2025-06-13 10:23:25'),
(148, 'BakeryToken', 'BAKE', '65e5b4f0414ef1709552880.jpeg', 0.10070000, 3.00, -11.28, 'active', '2024-03-04 17:48:00', '2025-06-13 10:23:25'),
(149, 'WazirX', 'WRX', '65e5b532175a71709552946.png', 0.00000000, 3.00, 0.00, 'active', '2024-03-04 17:49:06', '2025-06-13 10:23:25'),
(150, 'Request Network', 'REQ', '65e5b58514fb31709553029.png', 0.13630000, 3.00, -7.22, 'active', '2024-03-04 17:50:29', '2025-06-13 10:23:25'),
(151, 'Acala Token', 'ACA', '65e5b5c68f0971709553094.jpeg', 0.02610000, 3.00, -8.42, 'active', '2024-03-04 17:51:34', '2025-06-13 10:23:25'),
(152, 'Rupiah Token', 'IDRT', '65f2ccae51a661710410926.jpeg', 0.00000000, 2.00, 0.00, 'active', '2024-03-14 16:08:46', '2025-05-19 16:40:09'),
(153, 'test', 'TEST', '664891c49f1f21716031940.png', 0.00010700, 1.00, 0.00, 'active', '2024-05-18 11:32:20', '2024-05-20 06:15:14'),
(154, 'tests', 'TEST', '66489238b3ce11716032056.png', 0.00010700, 3.00, 0.00, 'active', '2024-05-18 11:34:16', '2024-05-20 06:15:14'),
(155, 'Bit now', 'BN', NULL, 0.00000000, 10.00, NULL, 'active', '2024-07-21 05:40:34', '2024-07-21 05:44:53');

-- --------------------------------------------------------

--
-- Table structure for table `commission_logs`
--

CREATE TABLE `commission_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `to_id` int(11) NOT NULL DEFAULT 0,
  `from_id` int(11) NOT NULL DEFAULT 0,
  `level` varchar(191) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `type` varchar(40) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `trx` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `method_id` int(11) NOT NULL,
  `charge` decimal(10,2) NOT NULL DEFAULT 0.00,
  `rate` decimal(10,2) NOT NULL DEFAULT 1.00,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `amount` decimal(10,2) NOT NULL,
  `method_currency` varchar(10) NOT NULL,
  `final_amount` decimal(10,2) NOT NULL,
  `trx` varchar(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `methods`
--

CREATE TABLE `methods` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `payment_address` varchar(255) NOT NULL,
  `payment_address_type` varchar(255) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `min_limit` decimal(10,2) NOT NULL,
  `max_limit` decimal(10,2) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `methods`
--

INSERT INTO `methods` (`id`, `name`, `currency`, `symbol`, `payment_address`, `payment_address_type`, `rate`, `min_limit`, `max_limit`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USDT (TRC20)', 'USDT', '$', 'TK7aVdUvhr5x7yAhmRBbDyXVK4xZRkZPgw', 'Tron (TRC 20)', 1.00, 50.00, 2000000.00, 'active', '2024-05-18 12:02:56', '2025-03-05 14:59:51'),
(4, 'Binance', 'Usdt', '$', 'TK7aVdUvhr5x7yAhmRBbDyXVK4xZRkZPgw', 'Crypto', 1.00, 50.00, 1000000.00, 'active', '2024-10-16 06:30:46', '2025-03-05 15:00:01'),
(5, 'Easypaisa & Raast I\'d', 'PKR', 'PKR', 'Bnk', '03410886437', 290.00, 50.00, 100000.00, 'active', '2024-11-16 07:47:01', '2025-03-17 23:06:21'),
(6, 'bank.ubl', 'Pkr', 'Pkr', '0226275469038', '0226275469038', 290.00, 50.00, 1000000.00, 'active', '2025-01-07 11:03:14', '2025-03-17 23:06:07');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_12_04_005001_create_coins_table', 1),
(3, '2023_12_06_042322_create_trades_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `site_name` varchar(255) DEFAULT NULL,
  `cur_text` varchar(255) DEFAULT NULL,
  `cur_sym` varchar(10) DEFAULT NULL,
  `signup_bonus` decimal(10,2) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `crypto_api_key` varchar(255) DEFAULT NULL,
  `deposit_refer_bonus` decimal(10,2) DEFAULT NULL,
  `trade_refer_bonus` decimal(10,2) DEFAULT NULL,
  `telegram_link` varchar(255) DEFAULT NULL,
  `whatsapp_link` varchar(255) DEFAULT NULL,
  `transfer_charge` decimal(10,2) DEFAULT NULL,
  `transfer_min_limit` decimal(10,1) DEFAULT NULL,
  `check_in_bonus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`check_in_bonus`)),
  `bot_trading_profit` decimal(10,2) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`site_name`, `cur_text`, `cur_sym`, `signup_bonus`, `updated_at`, `updatedAt`, `crypto_api_key`, `deposit_refer_bonus`, `trade_refer_bonus`, `telegram_link`, `whatsapp_link`, `transfer_charge`, `transfer_min_limit`, `check_in_bonus`, `bot_trading_profit`, `id`) VALUES
('BTC bot trading', 'USD', '$', 0.00, '2025-03-20 16:17:02', '2024-05-15 06:49:55', 'HcZ4i4vn0U9g863qB9m47Kud2Rd9sLzymJOj1ez8FF7zMdCbISSfwD7DhIPOyn7N,8V2E1wsvj42JZxN9DUjbriERQsSoqlyOP8RVJ0n5CXmTycDiVzwDOOZKadFBAItX', 10.00, 3.00, 'https://t.me/+nQAFFLxNjPI2Yzg0', 'https://whatsapp.com/channel/0029VankXEzGehEICLVhx51h', 0.00, 0.1, '{\"Saturday\":0,\"Sunday\":0.2,\"Monday\":0.3,\"Tuesday\":0.4,\"Wednesday\":0.5,\"Thursday\":0.6,\"Friday\":0.2}', 1.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `trades`
--

CREATE TABLE `trades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `coin_id` bigint(20) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `buy_price` decimal(28,8) DEFAULT NULL,
  `return_time` varchar(255) DEFAULT NULL,
  `amount` decimal(28,8) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `trade_close_price` decimal(18,8) DEFAULT 0.00000000,
  `win_loss` varchar(50) DEFAULT 'pending',
  `profit` decimal(18,8) DEFAULT 0.00000000,
  `status` varchar(50) DEFAULT 'runing'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(40) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `remark` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transferlogs`
--

CREATE TABLE `transferlogs` (
  `id` int(11) NOT NULL,
  `charge` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `after_charge_amount` decimal(10,2) NOT NULL,
  `from_user` varchar(24) NOT NULL,
  `to_user` varchar(24) NOT NULL,
  `trx` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `update_logs`
--

CREATE TABLE `update_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(40) DEFAULT NULL,
  `update_log` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pay_id` int(11) DEFAULT NULL,
  `refBy` decimal(10,0) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `withdraw_pin` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `isDeposit` tinyint(1) DEFAULT 0,
  `bot_balance` decimal(10,2) DEFAULT NULL,
  `bot_collect_time` timestamp NULL DEFAULT NULL,
  `isBotOpen` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `profit_balances` decimal(10,2) NOT NULL DEFAULT 0.00,
  `points` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_ip` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `longitude` varchar(40) DEFAULT NULL,
  `latitude` varchar(40) DEFAULT NULL,
  `browser` varchar(40) DEFAULT NULL,
  `os` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `method_id` int(11) NOT NULL,
  `charge` decimal(10,2) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `amount` decimal(10,2) NOT NULL,
  `method_currency` varchar(50) NOT NULL,
  `after_charge` decimal(10,2) NOT NULL,
  `final_amount` decimal(10,2) NOT NULL,
  `trx` varchar(255) NOT NULL,
  `payment_address` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `currency` varchar(50) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `charge` decimal(10,2) NOT NULL,
  `min_limit` decimal(10,2) NOT NULL,
  `max_limit` decimal(10,2) NOT NULL,
  `status` varchar(20) DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `info_from_user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_methods`
--

INSERT INTO `withdraw_methods` (`id`, `name`, `currency`, `symbol`, `rate`, `charge`, `min_limit`, `max_limit`, `status`, `created_at`, `updated_at`, `info_from_user`) VALUES
(1, 'Withdraw only bank on 9:am', 'PKR', 'PKR', 280.00, 0.00, 5000000.00, 20.00, 'active', '2024-05-18 13:22:38', '2025-02-25 07:29:41', 'All bank available'),
(6, 'Easypaisa & jazz cash', 'PKR withdraw on 9:am', 'PKR', 280.00, 0.00, 5000000.00, 20.00, 'active', '2024-11-11 13:32:40', '2025-02-22 22:22:48', 'Eysipysa& jazz cash'),
(7, 'USDT Automatic Withdraw', 'USDT', '$', 1.00, 5.00, 10.00, 50000.00, 'active', '2025-02-08 21:01:56', '2025-03-14 10:21:46', 'Your (TRC 20) Address');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ai_records`
--
ALTER TABLE `ai_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkin`
--
ALTER TABLE `checkin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coins`
--
ALTER TABLE `coins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission_logs`
--
ALTER TABLE `commission_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `methods`
--
ALTER TABLE `methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trades`
--
ALTER TABLE `trades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transferlogs`
--
ALTER TABLE `transferlogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `update_logs`
--
ALTER TABLE `update_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ai_records`
--
ALTER TABLE `ai_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `checkin`
--
ALTER TABLE `checkin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coins`
--
ALTER TABLE `coins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `commission_logs`
--
ALTER TABLE `commission_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `methods`
--
ALTER TABLE `methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trades`
--
ALTER TABLE `trades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transferlogs`
--
ALTER TABLE `transferlogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `update_logs`
--
ALTER TABLE `update_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;