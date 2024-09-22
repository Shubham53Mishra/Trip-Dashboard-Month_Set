-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2024 at 04:35 PM
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
-- Database: `trip_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `trans_id` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `comment` text NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`trans_id`, `username`, `comment`, `time`) VALUES
('69326587e1', 'wedewew', 'wefwefew', '2024-09-21 12:50:31'),
('69326587e1', 'moto', 'some time', '2024-09-22 13:29:03'),
('69326587e1', 'moto', 'some time', '2024-09-22 13:29:09'),
('69326587e1', 'moto', 'some time', '2024-09-22 13:30:59'),
('69326587e1', 'moto', 'some time', '2024-09-22 13:37:13'),
('69326587e1', 'moto', 'some time', '2024-09-22 13:37:24'),
('69326587e1', 'moto', 'some time', '2024-09-22 13:40:31'),
('69326587e1', 'moto', 'some time', '2024-09-22 13:40:42'),
('69326587e1', 'moto', 'some time', '2024-09-22 13:42:24'),
('69326587e1', 'moto', 'some time', '2024-09-22 13:42:28'),
('69326587e1', 'moto', 'some time', '2024-09-22 13:42:43'),
('69326587e1', 'moto', 'some time', '2024-09-22 13:43:36'),
('69326587e1', 'moto', 'some time', '2024-09-22 13:44:17'),
('69326587e1', 'moto', 'some time', '2024-09-22 13:44:56'),
('69326587e1', 'moto', 'abhi nhii hai', '2024-09-22 13:51:03'),
('69326587e1', 'moto', 'abhi nhii hai', '2024-09-22 13:51:06'),
('69326587e1', 'moto', 'abhi nhii hai', '2024-09-22 13:58:11'),
('69326587e1', 'moto', 'abhi nhii hai', '2024-09-22 13:59:15'),
('69326587e1', 'Shubham mishra', 'some time per', '2024-09-22 15:36:57'),
('69326587e1', 'Shubham mishra', 'some time per', '2024-09-22 15:37:04'),
('7777236958', 'Shubhammishra', 'gglh,', '2024-09-21 11:48:42'),
('7777236958', 'Shubhammishra', 'gglh,', '2024-09-21 11:48:48'),
('7777236958', 'Shubhammishra', 'gglh,', '2024-09-21 11:52:32'),
('7777236958', 'Shubhammishra', 'gglh,', '2024-09-21 11:52:41'),
('7777236958', 'Shubhammishra', 'gglh,', '2024-09-21 11:54:35'),
('7777236958', 'Shubhammishra', 'gglh,', '2024-09-21 11:56:47'),
('7777236958', 'Shubhammishra', 'gglh,', '2024-09-21 12:03:32'),
('7777236958', 'Shubhammishra', 'gglh,', '2024-09-21 12:05:02'),
('7777236958', 'Shubhammishra', 'gglh,', '2024-09-21 12:08:09'),
('7777236958', 'Shubhammishra', 'gglh,', '2024-09-21 12:23:47'),
('7777236958', 'Shubhammishra', 'gglh,', '2024-09-21 12:24:00'),
('7777236958', 'Shubhammishra', 'gglh,', '2024-09-21 12:25:11'),
('7777236958', 'Shubhammishra', 'gglh,', '2024-09-21 12:28:21'),
('9955425874', 'Shubham mishra1', 'wihknwr', '2024-09-22 13:08:40'),
('9995203658', 'Shubham mishra', 'hello sir\r\n', '2024-09-22 13:12:32'),
('9995203658', 'Shubham mishra', 'hello sir\r\n', '2024-09-22 13:12:35'),
('9995203658', 'Shubham mishra', 'hello sir\r\n', '2024-09-22 13:18:00'),
('9995203658', 'Shubham mishra', 'hello sir\r\n', '2024-09-22 13:18:54'),
('9995203658', 'Shubham mishra', 'hello sir\r\n', '2024-09-22 13:21:46'),
('9995203658', 'Shubham mishra', 'hello sir\r\n', '2024-09-22 13:21:52'),
('9995203658', 'Shubham mishra', 'hello sir\r\n', '2024-09-22 13:22:59'),
('9995203658', 'Shubham mishra', 'hello sir\r\n', '2024-09-22 13:26:21'),
('9995203658', 'moto', 'shf', '2024-09-22 13:59:26'),
('9995203658', 'moto', 'shf', '2024-09-22 13:59:29'),
('9995203658', 'moto', 'shf', '2024-09-22 14:00:05');

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE `trip` (
  `id` int(10) NOT NULL,
  `bookedon` datetime NOT NULL,
  `pickup_date` datetime NOT NULL,
  `drop_date` datetime NOT NULL,
  `trans_id` varchar(100) NOT NULL,
  `vendor_email_id` varchar(50) NOT NULL,
  `customer_email_id` varchar(50) DEFAULT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_mobile` varchar(10) DEFAULT NULL,
  `customer_address` varchar(100) DEFAULT NULL,
  `customer_id_name` varchar(50) DEFAULT NULL,
  `customer_id_number` varchar(50) DEFAULT NULL,
  `customer_dl_number` varchar(50) DEFAULT NULL,
  `bikes_id` varchar(400) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `comment` varchar(400) DEFAULT '',
  `returned_bikes_id` varchar(600) DEFAULT '',
  `web` int(5) NOT NULL,
  `rent` int(10) NOT NULL,
  `payment_mode` varchar(10) NOT NULL,
  `late_apply` int(11) NOT NULL,
  `amount_paid` varchar(10) NOT NULL,
  `amount_left` varchar(10) NOT NULL,
  `rido_points_used` int(11) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `coupon_code` varchar(100) NOT NULL,
  `booking` varchar(100) NOT NULL,
  `paid_on` datetime NOT NULL DEFAULT current_timestamp(),
  `admin_status` varchar(100) NOT NULL,
  `booking_from` varchar(100) NOT NULL,
  `tenture` int(11) NOT NULL DEFAULT 60,
  `user_status` varchar(30) NOT NULL,
  `contact_name` varchar(50) DEFAULT NULL,
  `house_no` varchar(30) DEFAULT NULL,
  `landmark` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `delivery_location` varchar(500) DEFAULT NULL,
  `invoice` varchar(150) DEFAULT NULL,
  `vendor_payment_status` varchar(10) NOT NULL DEFAULT 'pending',
  `vendor_processed_on` datetime DEFAULT NULL,
  `actual_amount_processed` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `trip`
--

INSERT INTO `trip` (`id`, `bookedon`, `pickup_date`, `drop_date`, `trans_id`, `vendor_email_id`, `customer_email_id`, `customer_name`, `customer_mobile`, `customer_address`, `customer_id_name`, `customer_id_number`, `customer_dl_number`, `bikes_id`, `status`, `comment`, `returned_bikes_id`, `web`, `rent`, `payment_mode`, `late_apply`, `amount_paid`, `amount_left`, `rido_points_used`, `discount`, `coupon_code`, `booking`, `paid_on`, `admin_status`, `booking_from`, `tenture`, `user_status`, `contact_name`, `house_no`, `landmark`, `area`, `latitude`, `longitude`, `delivery_location`, `invoice`, `vendor_payment_status`, `vendor_processed_on`, `actual_amount_processed`) VALUES
(323, '2023-02-16 03:57:00', '2023-02-16 15:00:00', '2023-02-20 16:40:00', '6632589635', 'wheels2goahmedabad@gmail.com', 'jagdishgouda113@gmail.com', 'Jagdish Gouda', '8919228860', NULL, NULL, NULL, NULL, '1032', 0, '', '', 0, 1, '', 0, '1', '0', 0, NULL, '', 'Payment Done', '2023-02-16 10:29:10', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(829, '2023-07-14 20:00:00', '2023-07-14 20:00:00', '2023-07-16 21:00:00', '6652589958', 'wheels2goahmedabad@gmail.com', 'hnaylesh@gmail.com', 'anand buddhbhatti', '8849312427', NULL, NULL, NULL, NULL, '6631', 0, '', '', 0, 944, '', 0, '944', '0', 0, NULL, '', 'Payment Done', '2023-07-15 10:36:27', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(729, '2023-06-12 11:00:00', '2023-06-12 11:00:00', '2023-06-14 18:00:00', '6654114789', 'wheels2goahmedabad@gmail.com', 'gwalaniharish08@gmail.com', 'harish gwalani', '9370866099', NULL, NULL, NULL, NULL, 'gj38', 0, '', '', 0, 837, '', 0, '837', '0', 0, NULL, '', 'Payment Done', '2023-06-12 12:12:49', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(432, '2023-03-19 21:00:00', '2023-03-19 21:00:00', '2023-03-20 09:00:00', '6654852100', 'wheels2goahmedabad@gmail.com', 'Chauhanmilan1356@gmail.com', 'Chauhan milan sanjaybhai', '9313917107', NULL, NULL, NULL, NULL, '02dc', 0, '', '', 0, 360, '', 0, '360', '0', 0, NULL, '', 'Payment Done', '2023-03-20 07:24:57', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(339, '2023-02-19 20:36:00', '2023-02-19 20:36:00', '2023-02-20 21:00:00', '6662158745', 'wheels2goahmedabad@gmail.com', 'Chauhanmilan1356@gmail.com', 'Chauhan milan sanjaybhai', '9313917107', NULL, NULL, NULL, NULL, '8547 ', 0, '', '', 0, 370, '', 0, '370', '0', 0, NULL, '', 'Payment Done', '2023-02-19 15:07:26', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(281, '2023-02-04 08:34:00', '2023-02-04 21:00:00', '2023-02-05 21:00:00', '6664258968', 'wheels2goahmedabad@gmail.com', 'madhumitha.raguram@gmail.com', 'Madhumitha Raguram', '7904693327', NULL, NULL, NULL, NULL, 'gj38', 0, '', '', 0, 360, '', 0, '360', '0', 0, NULL, '', 'Payment Done', '2023-02-04 15:05:08', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(329, '2023-02-17 10:55:00', '2023-02-17 21:00:00', '2023-02-19 21:00:00', '6665214758', 'wheels2goahmedabad@gmail.com', 'risbei24@gmail.com', 'Rishabh', '7208405148', NULL, NULL, NULL, NULL, '3604', 0, '', '', 0, 552, '', 0, '552', '0', 0, NULL, '', 'Payment Done', '2023-02-17 17:29:47', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(210, '2023-01-19 06:11:00', '2023-01-19 10:00:00', '2023-01-21 03:00:00', '67543565', 'wheels2goahmedabad@gmail.com', 'azeem.khan777@gmail.com', 'Azzem ahmed', '9799303700', NULL, NULL, NULL, NULL, '7223', 0, '', '', 0, 870, '', 0, '870', '0', 0, NULL, '', 'Payment Done', '2023-01-19 09:48:31', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(124, '2022-12-18 20:23:00', '2022-12-18 21:00:00', '2022-12-20 21:00:00', '69245678', 'wheels2goahmedabad@gmail.com', 'vishalnandanwar1995@gmail.com ', 'Vishal Nandanwar', '8421245721', NULL, NULL, NULL, NULL, '7271', 0, '', '', 0, 775, '', 0, '774.50', '0', 0, NULL, '', 'Payment Done', '2022-12-18 15:54:03', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(150, '2022-12-23 12:58:00', '2022-12-30 09:00:00', '2023-01-30 09:00:00', '69326587', 'wheels2goahmedabad@gmail.com', '', 'Harshil Makwana', '8691563950', NULL, NULL, NULL, NULL, '6631', 0, '', '', 0, 6000, '', 0, '6000', '0', 0, NULL, '', 'Payment Done', '2022-12-31 07:30:16', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(256, '2023-01-30 00:00:00', '2023-01-30 09:00:00', '2023-03-01 09:00:00', '69326587e1', 'wheels2goahmedabad@gmail.com', '', 'Harshil Makwana', '8691563950', '', '', '', '', '6631', 0, '', '', 0, 6000, 'Pay 20%', 0, '6000', '0', 0, 0, '', 'payment not done', '2022-12-31 07:30:16', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(361, '2023-03-01 00:00:00', '2023-03-01 09:00:00', '2023-04-01 09:00:00', '69326587e2', 'wheels2goahmedabad@gmail.com', '', 'Harshil Makwana', '8691563950', '', '', '', '', '6631', 0, '', '', 0, 6000, 'Pay 20%', 0, '6000', '0', 0, 0, '', 'payment not done', '2022-12-31 07:30:16', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(467, '2023-04-01 00:00:00', '2023-04-01 09:00:00', '2023-05-01 09:00:00', '69326587e3', 'wheels2goahmedabad@gmail.com', '', 'Harshil Makwana', '8691563950', '', '', '', '', '6631', 0, '', '', 0, 6000, 'Pay 20%', 0, '6000', '0', 0, 0, '', 'payment not done', '2022-12-31 07:30:16', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(607, '2023-05-01 00:00:00', '2023-05-01 09:00:00', '2023-05-31 09:00:00', '69326587e4', 'wheels2goahmedabad@gmail.com', '', 'Harshil Makwana', '8691563950', '', '', '', '', '6631', 0, '', '', 0, 6000, 'Pay 20%', 0, '6000', '0', 0, 0, '', 'payment not done', '2022-12-31 07:30:16', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(109, '2022-11-01 14:10:00', '2022-11-15 18:00:00', '2022-12-15 18:00:00', '69823487', 'wheels2goahmedabad@gmail.com', 'banerjee.debayan2@gmail.com', 'debyan benarjee', '9565957349', NULL, NULL, NULL, NULL, '1482', 0, '', '', 0, 3964, '', 0, '3964', '0', 0, NULL, '', 'Payment Done', '2022-12-14 08:42:36', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(112, '2022-12-15 00:00:00', '2022-12-15 18:00:00', '2023-01-15 09:00:00', '69823487e1', 'wheels2goahmedabad@gmail.com', 'banerjee.debayan2@gmail.com', 'debyan benarjee', '9565957349', '', '', '', '', '1482', 0, '', '', 0, 6000, 'Pay 20%', 0, '6000', '0', 0, 0, '', 'payment not done', '2022-12-14 08:42:36', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(197, '2023-01-15 00:00:00', '2023-01-15 09:00:00', '2023-02-15 09:00:00', '69823487e2', 'wheels2goahmedabad@gmail.com', 'banerjee.debayan2@gmail.com', 'debyan benarjee', '9565957349', '', '', '', '', '1482', 0, '', '', 0, 6000, 'Pay 20%', 0, '6000', '0', 0, 0, '', 'payment not done', '2022-12-14 08:42:36', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(242, '2023-01-25 14:33:00', '2023-01-26 18:00:00', '2023-01-29 09:00:00', '7458213698', 'wheels2goahmedabad@gmail.com', 'jumur.pandya@gmail.com ', 'Jumur Pandya', '9427271967', NULL, NULL, NULL, NULL, 'uw', 0, '', '', 0, 828, '', 0, '828', '0', 0, NULL, '', 'Payment Done', '2023-01-27 09:08:46', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(248, '2023-01-29 00:00:00', '2023-01-29 09:00:00', '2023-01-30 09:00:00', '7458213698e1', 'wheels2goahmedabad@gmail.com', 'jumur.pandya@gmail.com ', 'Jumur Pandya', '9427271967', '', '', '', '', 'uw', 0, '', '', 0, 399, 'Pay 20%', 0, '399', '0', 0, 0, '', 'payment not done', '2023-01-27 09:08:46', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(209, '2023-01-18 15:21:00', '2023-01-18 15:21:00', '2023-01-19 16:00:00', '74582569', 'wheels2goahmedabad@gmail.com', 'utsavvekariya7299@gmail.com', 'Utsav Vekariya', '9106727965', NULL, NULL, NULL, NULL, 'gj38', 0, '', '', 0, 350, '', 0, '350', '0', 0, NULL, '', 'Payment Done', '2023-01-18 09:52:52', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(211, '2023-01-19 00:00:00', '2023-01-19 16:00:00', '2023-01-20 16:00:00', '74582569e1', 'wheels2goahmedabad@gmail.com', 'utsavvekariya7299@gmail.com', 'Utsav Vekariya', '9106727965', '', '', '', '', 'gj38', 0, '', '', 0, 350, 'Pay 20%', 0, '350', '0', 0, 0, '', 'payment not done', '2023-01-18 09:52:52', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(214, '2023-01-20 00:00:00', '2023-01-20 16:00:00', '2023-01-21 16:00:00', '74582569e2', 'wheels2goahmedabad@gmail.com', 'utsavvekariya7299@gmail.com', 'Utsav Vekariya', '9106727965', '', '', '', '', 'gj38', 0, '', '', 0, 350, 'Pay 20%', 0, '350', '0', 0, 0, '', 'payment not done', '2023-01-18 09:52:52', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(838, '2023-07-18 19:00:00', '2023-07-18 19:00:00', '2023-07-25 19:00:00', '7485962536', 'wheels2goahmedabad@gmail.com', 'pillainadiya143@gmail.com', '	Nadiya Pillai', '7359527956', NULL, NULL, NULL, NULL, '5468', 0, '', '', 0, 2071, '', 0, '2071', '0', 0, NULL, '', 'Payment Done', '2023-07-19 12:08:37', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(455, '2023-03-27 12:03:00', '2023-03-27 12:03:00', '2023-03-28 12:03:00', '7728495972', 'wheels2goahmedabad@gmail.com', 'sarathchan93@gmail.com', 'Sarath Chandran', '9944707516', NULL, NULL, NULL, NULL, '3971', 0, '', '', 0, 370, '', 0, '370', '0', 0, NULL, '', 'Payment Done', '2023-03-27 12:05:50', 'confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(456, '2023-03-27 00:00:00', '2023-03-28 12:03:00', '2023-03-29 12:03:00', '7728495972e1', 'wheels2goahmedabad@gmail.com', 'sarathchan93@gmail.com', 'Sarath Chandran', '9944707516', '', '', '', '', '3971', 0, '', '', 0, 370, 'Pay 20%', 0, '370', '0', 0, 0, '', 'payment not done', '2023-03-27 12:05:50', 'confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(448, '2023-03-24 01:24:00', '2023-03-23 16:00:00', '2023-03-25 16:00:00', '7774125896', 'wheels2goahmedabad@gmail.com', 'emmanuelsivinag@gmail.com', 'Emmanuel Sivin', '9567548066', NULL, NULL, NULL, NULL, '6086', 0, '', '', 0, 501, '', 0, '501', '0', 0, NULL, '', 'Payment Done', '2023-03-24 07:55:40', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(282, '2023-02-04 08:37:00', '2023-02-04 20:00:00', '2023-02-13 20:00:00', '7777236958', 'wheels2goahmedabad@gmail.com', 'prachi.patil1993@gmail.com', 'Prachi Patil', '8655880862', NULL, NULL, NULL, NULL, '1482', 0, '', '', 0, 2450, '', 0, '2450', '0', 0, NULL, '', 'Payment Done', '2023-02-04 15:09:13', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(693, '2023-06-02 11:10:00', '2023-06-02 11:10:00', '2023-06-04 20:00:00', '7777714145', 'wheels2goahmedabad@gmail.com', 'pran0dal@gmail.com', 'Praneit Dallvi', '8691936691', NULL, NULL, NULL, NULL, '02dc', 0, '', '', 0, 876, '', 0, '876.04', '0', 0, NULL, '', 'Payment Done', '2023-06-02 11:13:37', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(702, '2023-06-04 00:00:00', '2023-06-04 20:00:00', '2023-06-05 20:00:00', '7777714145e1', 'wheels2goahmedabad@gmail.com', 'pran0dal@gmail.com', 'Praneit Dallvi', '8691936691', '', '', '', '', '02dc', 0, '', '', 0, 450, 'Pay 20%', 0, '450', '0', 0, 0, '', 'payment not done', '2023-06-02 11:13:37', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(64, '2022-11-17 09:33:00', '2022-11-17 10:34:00', '2022-11-17 22:00:00', '85236412', 'wheels2goahmedabad@gmail.com', 'nidhi.dua27@gmail.com', 'Nidhi Dua', '9479169305', NULL, NULL, NULL, NULL, '8547', 0, '', '', 0, 254, '', 0, '254', '0', 0, NULL, '', '', '2022-11-17 05:06:20', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(222, '2023-01-19 12:35:00', '2023-01-20 21:00:00', '2023-01-23 17:00:00', '8523659854', 'wheels2goahmedabad@gmail.com', 'meenaljha95@gmail.com', 'Meenal Jha', '7014774033', NULL, NULL, NULL, NULL, 'VYOTO', 0, '', '', 0, 870, '', 0, '870', '0', 0, NULL, '', 'Payment Done', '2023-01-22 07:06:25', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(689, '2023-06-01 14:57:00', '2023-06-01 14:57:00', '2023-06-02 19:00:00', '8547142536', 'wheels2goahmedabad@gmail.com', 'kraftech2021@gmail.com', 'sameer dedhia', '8884070795', NULL, NULL, NULL, NULL, '5468', 0, '', '', 0, 552, '', 0, '552', '0', 0, NULL, '', 'Payment Done', '2023-06-01 14:59:51', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(289, '2023-02-06 07:48:00', '2023-02-06 14:00:00', '2023-02-12 14:00:00', '8555478963', 'wheels2goahmedabad@gmail.com', 'rohit7nov@gmail.com ', 'Rohit Gaikwad', '7709370508', NULL, NULL, NULL, NULL, 'gj38', 0, '', '', 0, 1308, '', 0, '1308', '0', 0, NULL, '', 'Payment Done', '2023-02-06 14:20:12', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(253, '2023-01-28 16:32:00', '2023-01-29 16:32:00', '2023-01-30 16:33:00', '8569741236', 'wheels2goahmedabad@gmail.com', 'rahulmehtadj@gmail.com', 'Rahul Mehta', '8080076116', NULL, NULL, NULL, NULL, '8547 ', 0, '', '', 0, 1, '', 0, '1', '0', 0, NULL, '', 'Payment Done', '2023-01-29 11:04:10', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(148, '2022-12-29 11:31:00', '2022-12-31 10:00:00', '2023-01-07 13:00:00', '86234598', 'wheels2goahmedabad@gmail.com', 'cudaykumar@rediffmail.com 	', 'UDAY KUMAR Cholkar', '9890169711', NULL, NULL, NULL, NULL, '6086', 0, '', '', 0, 1899, '', 0, '1898.83', '0', 0, NULL, '', 'Payment Done', '2022-12-31 06:03:53', 'confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(235, '2023-01-24 16:53:00', '2023-01-25 15:00:00', '2023-01-28 21:00:00', '8785987425', 'wheels2goahmedabad@gmail.com', 'jinal.taunk7@gmail.com ', 'Jinal Taunk', '9926461897', NULL, NULL, NULL, NULL, '6086', 0, '', '', 0, 1115, '', 0, '1115', '0', 0, NULL, '', 'Payment Done', '2023-01-25 11:25:22', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(247, '2023-01-28 00:00:00', '2023-01-28 21:00:00', '2023-01-29 09:00:00', '8785987425e1', 'wheels2goahmedabad@gmail.com', 'jinal.taunk7@gmail.com ', 'Jinal Taunk', '9926461897', '', '', '', '', '6086', 0, '', '', 0, 450, 'Pay 20%', 0, '450', '0', 0, 0, '', 'payment not done', '2023-01-25 11:25:22', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(719, '2023-06-09 18:50:00', '2023-06-09 18:50:00', '2023-06-16 18:00:00', '8841995475', 'wheels2goahmedabad@gmail.com', 'kothari.gtpl@gmail.com', 'Abdulkadir Kothari', '9909570086', NULL, NULL, NULL, NULL, '1032', 0, '', '', 0, 1242, '', 0, '1242', '0', 0, NULL, '', 'Payment Done', '2023-06-09 18:53:11', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(745, '2023-06-16 00:00:00', '2023-06-16 18:00:00', '2023-06-18 18:00:00', '8841995475e1', 'wheels2goahmedabad@gmail.com', 'kothari.gtpl@gmail.com', 'Abdulkadir Kothari', '9909570086', '', '', '', '', '1032', 0, '', '', 0, 750, 'Pay 20%', 0, '750', '0', 0, 0, '', 'payment not done', '2023-06-09 18:53:11', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(750, '2023-06-18 00:00:00', '2023-06-18 18:00:00', '2023-06-20 18:00:00', '8841995475e2', 'wheels2goahmedabad@gmail.com', 'kothari.gtpl@gmail.com', 'Abdulkadir Kothari', '9909570086', '', '', '', '', '1032', 0, '', '', 0, 800, 'Pay 20%', 0, '1600', '0', 0, 0, '', 'payment not done', '2023-06-09 18:53:11', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(416, '2023-03-14 15:00:00', '2023-03-14 15:00:00', '2023-04-13 15:00:00', '8844552459', 'wheels2goahmedabad@gmail.com', 'bhbh', 'Tosshif sk', '7984685584', NULL, NULL, NULL, NULL, '6586Black', 0, '', '', 0, 6000, '', 0, '6000', '0', 0, NULL, '', 'Payment Done', '2023-03-14 10:55:35', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(434, '2023-03-20 14:56:00', '2023-03-20 14:56:00', '2023-03-21 14:56:00', '8852114474', 'wheels2goahmedabad@gmail.com', '', 'Parth Test verification', '9714876587', NULL, NULL, NULL, NULL, '38472989374', 0, '', '', 0, 1, '', 0, '1', '0', 0, NULL, '', 'Payment Done', '2023-03-20 09:27:06', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(375, '2023-03-04 03:32:00', '2023-03-04 14:00:00', '2023-03-05 11:00:00', '8852369858', 'wheels2goahmedabad@gmail.com', 'kritikadargar832@gmail.com', 'Kritika', '9460966832', NULL, NULL, NULL, NULL, 'gj38', 0, '', '', 0, 276, '', 0, '276.12', '0', 0, NULL, '', 'Payment Done', '2023-03-04 10:05:39', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(442, '2023-03-22 14:00:00', '2023-03-22 14:00:00', '2023-03-28 14:00:00', '8852695896', 'wheels2goahmedabad@gmail.com', 'thejauntfanatics@gmail.com', 'Limisha Kanani', '9821938745', NULL, NULL, NULL, NULL, 'gj16cr', 0, '', '', 0, 2300, '', 0, '2300', '0', 0, NULL, '', 'Payment Done', '2023-03-22 10:00:01', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(458, '2023-03-28 00:00:00', '2023-03-28 14:00:00', '2023-03-29 14:00:00', '8852695896e1', 'wheels2goahmedabad@gmail.com', 'thejauntfanatics@gmail.com', 'Limisha Kanani', '9821938745', '', '', '', '', 'gj16cr', 0, '', '', 0, 360, 'Pay 20%', 0, '360', '0', 0, 0, '', 'payment not done', '2023-03-22 10:00:01', 'confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(330, '2023-02-10 23:21:00', '2023-02-11 21:00:00', '2023-02-25 18:00:00', '8882012589', 'wheels2goahmedabad@gmail.com', 'shalin_1452@yahoo.co.in', 'Ekta Shah', '9974031379', NULL, NULL, NULL, NULL, 'gj38', 0, '', '', 0, 2804, '', 0, '2804', '0', 0, NULL, '', 'Payment Done', '2023-02-17 17:53:14', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(347, '2023-02-21 02:35:00', '2023-02-21 14:00:00', '2023-02-24 16:00:00', '8882145695', 'wheels2goahmedabad@gmail.com', 'mehulpramodsheth@gmail.com', 'MEHUL SHETH', '9833973223', NULL, NULL, NULL, NULL, '1482', 0, '', '', 0, 828, '', 0, '828', '0', 0, NULL, '', 'Payment Done', '2023-02-21 09:06:35', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(334, '2023-02-18 03:29:00', '2023-02-18 09:00:00', '2023-02-18 21:00:00', '8884258963', 'wheels2goahmedabad@gmail.com', 'dhayal.1@iitj.ac.in', 'Rahul Dhayal', '8003296685', NULL, NULL, NULL, NULL, '1482', 0, '', '', 0, 327, '', 0, '327', '0', 0, NULL, '', 'Payment Done', '2023-02-18 10:00:56', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(471, '2023-03-30 01:40:00', '2023-03-30 13:00:00', '2023-04-04 16:00:00', '8884412569', 'wheels2goahmedabad@gmail.com', 'adityagupta27oct@gmail.com', 'Aditya Gupta', '9111455500', NULL, NULL, NULL, NULL, 'Black 6G', 0, '', '', 0, 1348, '', 0, '1348', '0', 0, NULL, '', 'Payment Done', '2023-04-01 13:41:55', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(482, '2023-04-03 14:17:00', '2023-04-03 14:19:00', '2023-04-05 11:00:00', '8884426985', 'wheels2goahmedabad@gmail.com', 'karthikss1996@gmail.com', 'Karthik S S', '9496313591', NULL, NULL, NULL, NULL, 'gj16cr', 0, '', '', 0, 639, '', 0, '639', '0', 0, NULL, '', 'Payment Done', '2023-04-04 14:20:37', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(485, '2023-04-04 20:31:00', '2023-04-04 20:31:00', '2023-04-05 21:00:00', '8884452214', 'wheels2goahmedabad@gmail.com', 'Chauhanmilan1356@gmail.com ', 'Chauhan milan sanjaybhai', '9313917107', NULL, NULL, NULL, NULL, 'Black 6G', 0, '', '', 0, 370, '', 0, '370', '0', 0, NULL, '', 'Payment Done', '2023-04-05 20:32:41', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(353, '2023-02-23 08:50:00', '2023-02-23 21:00:00', '2023-02-26 21:00:00', '88844557412', 'wheels2goahmedabad@gmail.com', 'ranveer7686@gmail.com', 'Ranveer Singh', '8849441089', NULL, NULL, NULL, NULL, '7271', 0, '', '', 0, 1350, '', 0, '1350', '0', 0, NULL, '', 'Payment Done', '2023-02-23 15:21:43', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(468, '2023-03-30 12:18:00', '2023-03-31 12:00:00', '2023-04-02 17:00:00', '8884521147', 'wheels2goahmedabad@gmail.com', 'divyakodgire18@gmail.com', 'DIVYA KODGIRE', '9834755607', NULL, NULL, NULL, NULL, '6086', 0, '', '', 0, 828, '', 0, '828', '0', 0, NULL, '', 'Payment Done', '2023-04-01 12:21:00', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(452, '2023-03-25 20:15:00', '2023-03-26 09:00:00', '2023-03-26 19:00:00', '8884523698', 'wheels2goahmedabad@gmail.com', 'mayurmakwana4181@gmail.com', 'mayur makwana', '6355019401', NULL, NULL, NULL, NULL, '6086', 0, '', '', 0, 450, '', 0, '450', '0', 0, NULL, '', 'Payment Done', '2023-03-25 20:16:08', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(328, '2023-02-17 10:52:00', '2023-02-17 12:00:00', '2023-02-24 12:00:00', '8884581265', 'wheels2goahmedabad@gmail.com', 'pramodkverma@yahoo.com', 'Pramod Kumar Verma', '7814286250', NULL, NULL, NULL, NULL, '02dc', 0, '', '', 0, 1440, '', 0, '1440', '0', 0, NULL, '', 'Payment Done', '2023-02-17 17:24:46', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(345, '2023-02-21 00:00:00', '2023-02-24 12:00:00', '2023-02-25 12:00:00', '8884581265e1', 'wheels2goahmedabad@gmail.com', 'pramodkverma@yahoo.com', 'Pramod Kumar Verma', '7814286250', '', '', '', '', '02dc', 0, '', '', 0, 360, 'Pay 20%', 0, '360', '0', 0, 0, '', 'payment not done', '2023-02-17 17:24:46', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(358, '2023-02-25 00:00:00', '2023-02-25 12:00:00', '2023-03-17 12:00:00', '8884581265e2', 'wheels2goahmedabad@gmail.com', 'pramodkverma@yahoo.com', 'Pramod Kumar Verma', '7814286250', '', '', '', '', '02dc', 0, '', '', 0, 3600, 'Pay 20%', 0, '3600', '0', 0, 0, '', 'payment not done', '2023-02-17 17:24:46', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(424, '2023-03-16 00:00:00', '2023-03-17 12:00:00', '2023-03-19 12:00:00', '8884581265e3', 'wheels2goahmedabad@gmail.com', 'pramodkverma@yahoo.com', 'Pramod Kumar Verma', '7814286250', '', '', '', '', '02dc', 0, '', '', 0, 400, 'Pay 20%', 0, '400', '0', 0, 0, '', 'payment not done', '2023-02-17 17:24:46', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(454, '2023-03-26 11:55:00', '2023-03-27 10:43:00', '2023-04-02 19:00:00', '888528385', 'wheels2goahmedabad@gmail.com', 'spramod320@gmail.com', 'Pramod Kumar', '9002270989', NULL, NULL, NULL, NULL, '1032', 0, '', '', 0, 1381, '', 0, '1381', '0', 0, NULL, '', 'Payment Done', '2023-03-27 11:58:20', 'confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(491, '2023-04-07 00:13:00', '2023-04-07 09:00:00', '2023-04-07 21:00:00', '8887722254', 'wheels2goahmedabad@gmail.com', 'jaydipchauhan737@gmail.com', 'Jayraj Chauhan', '9328477485', NULL, NULL, NULL, NULL, '6086', 0, '', '', 0, 250, '', 0, '250', '0', 0, NULL, '', 'Payment Done', '2023-04-07 12:14:46', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(714, '2023-06-08 12:19:00', '2023-06-08 12:19:00', '2023-06-08 20:00:00', '8888414148', 'wheels2goahmedabad@gmail.com', 'abhiawasthi7000@gmail.com', 'Abhishek Awasthi', '7400838889', NULL, NULL, NULL, NULL, '6586Black', 0, '', '', 0, 292, '', 0, '292.01', '0', 0, NULL, '', 'Payment Done', '2023-06-08 12:20:10', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(473, '2023-03-30 14:00:00', '2023-04-30 11:00:00', '2023-03-31 11:00:00', '8889652366', 'wheels2goahmedabad@gmail.com', 'sethvikas@gmail.com', 'Vikas Seth', '9377178877', NULL, NULL, NULL, NULL, 'gj16cr', 0, '', '', 0, 243, '', 0, '243', '0', 0, NULL, '', 'Payment Done', '2023-04-01 14:01:29', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(474, '2023-04-01 00:00:00', '2023-03-31 11:00:00', '2023-04-01 11:00:00', '8889652366e1', 'wheels2goahmedabad@gmail.com', 'sethvikas@gmail.com', 'Vikas Seth', '9377178877', '', '', '', '', 'gj16cr', 0, '', '', 0, 370, 'Pay 20%', 0, '370', '0', 0, 0, '', 'payment not done', '2023-04-01 14:01:29', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(475, '2023-04-01 00:00:00', '2023-04-01 11:00:00', '2023-04-02 11:00:00', '8889652366e2', 'wheels2goahmedabad@gmail.com', 'sethvikas@gmail.com', 'Vikas Seth', '9377178877', '', '', '', '', 'gj16cr', 0, '', '', 0, 370, 'Pay 20%', 0, '370', '0', 0, 0, '', 'payment not done', '2023-04-01 14:01:29', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(477, '2023-04-01 00:00:00', '2023-04-02 11:00:00', '2023-04-03 11:00:00', '8889652366e3', 'wheels2goahmedabad@gmail.com', 'sethvikas@gmail.com', 'Vikas Seth', '9377178877', '', '', '', '', 'gj16cr', 0, '', '', 0, 370, 'Pay 20%', 0, '370', '0', 0, 0, '', 'payment not done', '2023-04-01 14:01:29', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(223, '2023-01-18 15:55:00', '2023-01-19 19:00:00', '2023-01-22 13:00:00', '8965321458', 'wheels2goahmedabad@gmail.com', 'chirag95.cr@gmail.com', 'Chirag Rao', '9764377456', NULL, NULL, NULL, NULL, '1032', 0, '', '', 0, 828, '', 0, '828', '0', 0, NULL, '', 'Payment Done', '2023-01-22 10:27:14', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(234, '1970-01-01 00:00:00', '2023-01-25 14:00:00', '2023-01-28 14:00:00', '8965874253', 'wheels2goahmedabad@gmail.com', 'Senmukul68@gmail.com', 'Mukul Sen', '8302488684', NULL, NULL, NULL, NULL, '02dc', 0, '', '', 0, 752, '', 0, '752', '0', 0, NULL, '', 'Payment Done', '2023-01-25 09:57:00', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(244, '2023-01-28 00:00:00', '2023-01-28 14:00:00', '2023-01-29 09:00:00', '8965874253e1', 'wheels2goahmedabad@gmail.com', 'Senmukul68@gmail.com', 'Mukul Sen', '8302488684', '', '', '', '', '02dc', 0, '', '', 0, 399, 'Pay 20%', 0, '399', '0', 0, 0, '', 'payment not done', '2023-01-25 09:57:00', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(718, '2023-06-09 11:15:00', '2023-06-09 11:15:00', '2023-06-09 15:00:00', '9001245789', 'wheels2goahmedabad@gmail.com', 'djorpit@gmail.com', 'Jeet Dholariya', '6354199918', NULL, NULL, NULL, NULL, '5468', 0, '', '', 0, 127, '', 0, '127', '0', 0, NULL, '', 'Payment Done', '2023-06-09 11:16:50', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(104, '2022-12-01 14:42:00', '2022-12-10 18:00:00', '2022-12-17 19:00:00', '92345842', 'wheels2goahmedabad@gmail.com', 'himanshu1456@gmail.com', '	Himanshu Shekhar', '9679030078', NULL, NULL, NULL, NULL, '8547 ', 0, '', '', 0, 1661, '', 0, '1661', '0', 0, NULL, '', 'Payment Done', '2022-12-12 09:14:26', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(828, '2023-07-14 10:00:00', '2023-07-14 11:28:00', '2023-08-11 20:00:00', '9521474589', 'wheels2goahmedabad@gmail.com', 'sen.lalit@gmail.com', 'Lalit Sen', '9988097745', NULL, NULL, NULL, NULL, '1032', 0, '', '', 0, 4360, '', 0, '4360', '0', 0, NULL, '', 'Payment Done', '2023-07-14 11:29:35', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(90, '2022-12-04 13:07:00', '2022-12-04 13:07:00', '2022-12-10 22:08:00', '95234581', 'wheels2goahmedabad@gmail.com', 'royalveera79@gmail.com', '	Venkat Reddimsetti', '9599635469', NULL, NULL, NULL, NULL, '7664', 0, '', '', 0, 362, '', 0, '362', '0', 0, NULL, '', 'Payment Done', '2022-12-04 07:40:34', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(740, '2023-06-14 19:00:00', '2023-06-14 19:00:00', '2023-07-14 19:00:00', '9541214747', 'wheels2goahmedabad@gmail.com', 'garg.prateek2209@gmail.com', 'Prateek Garg', '7209765856', NULL, NULL, NULL, NULL, 'gj38', 0, '', '', 0, 4327, '', 0, '4327', '0', 0, NULL, '', 'Payment Done', '2023-06-15 11:56:51', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(826, '2023-07-13 00:00:00', '2023-07-14 19:00:00', '2023-07-29 10:00:00', '9541214747e1', 'wheels2goahmedabad@gmail.com', 'garg.prateek2209@gmail.com', 'Prateek Garg', '7209765856', '', '', '', '', 'gj38', 0, '', '', 0, 3000, 'Pay 20%', 0, '3000', '0', 0, 0, '', 'payment not done', '2023-06-15 11:56:51', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(768, '2023-06-22 20:06:00', '2023-06-22 20:06:00', '2023-06-23 19:00:00', '9582110005', 'wheels2goahmedabad@gmail.com', 'nilay.dongare007@gmail.com', 'Nilay Dongare', '7738862229', NULL, NULL, NULL, NULL, '7271', 0, '', '', 0, 261, '', 0, '261', '0', 0, NULL, '', 'Payment Done', '2023-06-22 20:08:18', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(267, '2023-02-01 01:35:00', '2023-02-01 12:00:00', '2023-02-09 21:00:00', '9603147896', 'wheels2goahmedabad@gmail.com', 'suraj.nair2410@gmail.com ', 'Suraj Surendran Nair', '8000206768', NULL, NULL, NULL, NULL, '6086', 0, '', '', 0, 1852, '', 0, '1852', '0', 0, NULL, '', 'Payment Done', '2023-02-01 08:06:35', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(251, '2023-01-29 03:17:00', '2023-01-29 12:00:00', '2023-02-03 17:00:00', '9620458742', 'wheels2goahmedabad@gmail.com', 'tlondhe3499@gmail.com', 'Rushabh Dange', '8625877942', NULL, NULL, NULL, NULL, '02dc', 0, '', '', 0, 1308, '', 0, '1308', '0', 0, NULL, '', 'Payment Done', '2023-01-29 09:49:28', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(219, '2023-01-21 02:49:00', '2023-01-21 09:00:00', '2023-01-21 21:00:00', '9632587425', 'wheels2goahmedabad@gmail.com', 'aman210719@gmail.com', 'AMAN KATIRA', '8396015477', NULL, NULL, NULL, NULL, 'gj38', 0, '', '', 0, 250, '', 0, '250', '0', 0, NULL, '', 'Payment Done', '2023-01-21 09:20:22', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(215, '2023-01-20 07:45:00', '2023-01-20 09:00:00', '2023-01-22 21:00:00', '96358795', 'wheels2goahmedabad@gmail.com', 'vidhi6353@gmail.com', 'Vidhi', '6353970311', NULL, NULL, NULL, NULL, '78', 0, '', '', 0, 752, '', 0, '752', '0', 0, NULL, '', 'Payment Done', '2023-01-20 06:16:25', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(153, '2023-01-04 16:06:00', '2023-01-04 14:00:00', '2023-01-05 16:00:00', '96523654', 'wheels2goahmedabad@gmail.com', 'harshitgoal@gmail.com', 'Harshit Agrawal', '6263490593', NULL, NULL, NULL, NULL, '3971', 0, '', '', 0, 476, '', 0, '476', '0', 0, NULL, '', 'Payment Done', '2023-01-04 10:40:19', 'confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(182, '2023-01-02 14:10:00', '2023-01-12 14:00:00', '2023-01-15 14:00:00', '9658745', 'wheels2goahmedabad@gmail.com', 'akshaysoni56789@gmail.com', 'Akshay Soni', '7426069602', NULL, NULL, NULL, NULL, '6086', 0, '', '', 0, 1100, '', 0, '1100', '0', 0, NULL, '', 'Payment Done', '2023-01-12 08:42:53', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(787, '2023-06-27 18:05:00', '2023-06-27 18:05:00', '2023-08-27 21:00:00', '9852146578', 'wheels2goahmedabad@gmail.com', 'rohitrohit70040@gmail.com', 'Rohit Chaurasiya', '9910626851', NULL, NULL, NULL, NULL, '7223', 0, '', '', 0, 6000, '', 0, '6000', '0', 0, NULL, '', 'Payment Done', '2023-06-26 18:05:53', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(368, '2023-03-03 17:43:00', '2023-03-03 17:43:00', '2023-03-05 21:00:00', '9952364125', 'wheels2goahmedabad@gmail.com', 'prajjawalyo28@gmail.com', 'Prajjawal Jain', '7597459941', NULL, NULL, NULL, NULL, '7223', 0, '', '', 0, 1350, '', 0, '1350', '0', 0, NULL, '', 'Payment Done', '2023-03-03 12:16:04', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(728, '2023-06-12 11:00:00', '2023-06-12 11:00:00', '2023-06-12 20:00:00', '9954111425', 'wheels2goahmedabad@gmail.com', 'bhumikashekhawat.7@gmail.com', 'Bhumika Shekhawat', '8946805433', NULL, NULL, NULL, NULL, 'Black 6G', 0, '', '', 0, 290, '', 0, '290', '0', 0, NULL, '', 'Payment Done', '2023-06-12 12:02:11', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(357, '2023-02-24 03:06:00', '2023-02-24 15:00:00', '2023-03-03 15:00:00', '9955425874', 'wheels2goahmedabad@gmail.com', 'akshatshah280201@gmail.com', 'Akshat Shah', '8866385896', NULL, NULL, NULL, NULL, '8547 ', 0, '', '', 0, 1900, '', 0, '1900', '0', 0, NULL, '', 'Payment Done', '2023-02-24 09:37:36', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(490, '2023-04-07 11:27:00', '2023-04-07 11:27:00', '2023-04-07 21:00:00', '9994425589', 'wheels2goahmedabad@gmail.com', 'rahulgaurani35@gmail.com', 'Rahul Gaurani', '8160971665', NULL, NULL, NULL, NULL, '0871 ', 0, '', '', 0, 290, '', 0, '290', '0', 0, NULL, '', 'Payment Done', '2023-04-07 11:29:58', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(470, '2023-04-29 01:32:00', '2023-03-29 11:00:00', '2023-04-03 10:00:00', '9994458269', 'wheels2goahmedabad@gmail.com', 'giganmaher1432@gmail.com', 'odedra gigan', '8849465655', NULL, NULL, NULL, NULL, '3971', 0, '', '', 0, 1253, '', 0, '1253', '0', 0, NULL, '', 'Payment Done', '2023-04-01 13:34:29', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(283, '2023-02-04 08:40:00', '2023-02-04 16:00:00', '2023-03-04 16:00:00', '9995203658', 'wheels2goahmedabad@gmail.com', 'dsharma051998@gmail.com ', 'Divyansh Sharma', '7976296019', NULL, NULL, NULL, NULL, 'VYOTO', 0, '', '', 0, 4360, '', 0, '4360', '0', 0, NULL, '', 'Payment Done', '2023-02-04 15:12:24', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(338, '2023-02-19 08:30:00', '2023-02-19 19:00:00', '2023-02-26 18:00:00', '9995214586', 'wheels2goahmedabad@gmail.com', 'hermannschueler@gmail.com', 'hermann ulrich schueler', '9650076523', NULL, NULL, NULL, NULL, '3604', 0, '', '', 0, 1, '', 0, '1', '0', 0, NULL, '', 'Payment Done', '2023-02-19 15:02:36', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(359, '2023-02-26 00:00:00', '2023-02-26 18:00:00', '2023-02-28 18:00:00', '9995214586e1', 'wheels2goahmedabad@gmail.com', 'hermannschueler@gmail.com', 'hermann ulrich schueler', '9650076523', '', '', '', '', '3604', 0, '', '', 0, 810, 'Pay 20%', 0, '810', '0', 0, 0, '', 'payment not done', '2023-02-19 15:02:36', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(336, '2023-02-19 04:02:00', '2023-02-19 09:00:00', '2023-02-28 21:00:00', '999551478', 'wheels2goahmedabad@gmail.com', 'as151295@gmail.com', 'azeem siddiqui', '9987428377', NULL, NULL, NULL, NULL, '78', 0, '', '', 0, 1869, '', 0, '1869', '0', 0, NULL, '', 'Payment Done', '2023-02-19 10:34:58', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(331, '2023-02-18 03:17:00', '2023-02-18 13:00:00', '2023-02-20 21:00:00', '9999412589', 'wheels2goahmedabad@gmail.com', 'jayeshec12@gmail.com', 'jayesh Munjani', '8460875520', NULL, NULL, NULL, NULL, '6586Black', 0, '', '', 0, 777, '', 0, '777', '0', 0, NULL, '', 'Payment Done', '2023-02-18 09:49:09', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(52, '2022-11-06 10:54:00', '2022-11-06 10:54:00', '2022-12-06 19:54:00', 'Bavithren B store', 'wheels2goahmedabad@gmail.com', '', 'Bavithren B', '9444830404', NULL, NULL, NULL, NULL, '6086', 0, '', '', 0, 6000, '', 0, '6000', '0', 0, NULL, '', '', '2022-11-13 05:25:24', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(62, '2022-11-16 00:00:00', '2022-11-16 21:00:00', '2022-11-17 21:00:00', 'e43', 'wheels2goahmedabad@gmail.com', '', 'Rajeev Sharma', '', '', '', '', '', '7872', 0, '', '', 0, 350, 'Pay 20%', 0, '350', '0', 0, 0, '', 'payment not done', '2022-11-13 09:41:52', 'Confirmed', '', 60, '', '', '', '', '', '', '', '', '', 'pending', NULL, ''),
(51, '2022-11-12 10:41:00', '2022-11-12 10:41:00', '2022-11-13 18:00:00', 'Madhuri Chaudhry Store', 'wheels2goahmedabad@gmail.com', '', 'Madhuri Chaudhry', '', NULL, NULL, NULL, NULL, '6586', 0, '', '', 0, 700, '', 0, '700', '0', 0, NULL, '', '', '2022-11-13 05:12:21', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(55, '2022-11-12 12:46:00', '2022-11-13 12:46:00', '2022-11-18 22:00:00', 'Mohit Bhatt Offline', 'wheels2goahmedabad@gmail.com', '', 'Mohit Bhatt', '', NULL, NULL, NULL, NULL, '5468', 0, '', '', 0, 1598, '', 0, '1598', '0', 0, NULL, '', '', '2022-11-13 07:17:30', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, ''),
(49, '2022-11-01 20:04:00', '2022-11-01 20:04:00', '2022-11-16 20:00:00', 'Offline Store', 'wheels2goahmedabad@gmail.com', '', 'Chirag Mehta', '', NULL, NULL, NULL, NULL, '6086', 0, '', '', 0, 3000, '', 0, '3000', '0', 0, NULL, '', '', '2022-11-12 14:36:55', 'Confirmed', '', 60, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`trans_id`,`time`);

--
-- Indexes for table `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`trans_id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `trip`
--
ALTER TABLE `trip`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=840;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
