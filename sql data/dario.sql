-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2023 at 05:20 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dario`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `cnt_id` int(11) NOT NULL,
  `cnt_code` varchar(255) NOT NULL,
  `cnt_title` varchar(255) NOT NULL,
  `cnt_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`cnt_id`, `cnt_code`, `cnt_title`, `cnt_created`) VALUES
(1, 'US', 'United States', '1776-07-04'),
(2, 'CA', 'Canada', '1867-07-01'),
(3, 'IL', 'Israel', '1947-02-01'),
(5, 'In', 'India', '1947-02-01');

-- --------------------------------------------------------

--
-- Table structure for table `numbers`
--

CREATE TABLE `numbers` (
  `num_id` int(11) NOT NULL,
  `cnt_id` int(11) NOT NULL,
  `num_number` varchar(255) NOT NULL,
  `num_created` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `numbers`
--

INSERT INTO `numbers` (`num_id`, `cnt_id`, `num_number`, `num_created`) VALUES
(1, 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `send_log`
--

CREATE TABLE `send_log` (
  `log_id` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `num_id` int(11) NOT NULL,
  `log_message` varchar(255) NOT NULL,
  `log_success` tinyint(1) NOT NULL,
  `log_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `send_log`
--

INSERT INTO `send_log` (`log_id`, `usr_id`, `num_id`, `log_message`, `log_success`, `log_created`) VALUES
(1, 1, 1, 'test', 1, '2023-03-28'),
(2, 1, 2, 'Test bar 2', 0, '2023-03-28'),
(3, 1, 1, 'Tasd2', 0, '2023-03-28'),
(4, 2, 1, 'Tasd2', 0, '2023-03-28'),
(5, 3, 1, 'Tfsdf 2', 0, '2023-03-28'),
(6, 4, 1, 'Test fsdf bar 2', 0, '2023-03-28'),
(7, 5, 1, 'Test sdf bar 2', 1, '2023-03-28'),
(8, 6, 1, 'Test sdf bar 2', 1, '2023-03-28'),
(9, 2, 1, 'Test asd asd 2', 0, '2023-03-28'),
(10, 3, 1, 'Test ffas 2', 1, '2023-03-28'),
(11, 9, 1, 'anther one', 0, '2022-03-02'),
(11, 9, 1, 'anther one', 0, '2021-03-02'),
(12, 1, 1, 'anther one', 0, '2020-03-02'),
(13, 2, 1, 'anther one', 0, '2019-03-02'),
(14, 3, 1, 'anther one', 0, '2018-03-02'),
(15, 4, 1, 'anther one', 0, '2017-03-02'),
(16, 5, 1, 'anther one', 0, '2016-03-02'),
(17, 6, 1, 'anther one', 0, '2015-03-02'),
(18, 7, 1, 'anther one', 0, '2014-03-02'),
(19, 8, 1, 'anther one', 0, '2013-03-02'),
(20, 9, 1, 'anther one', 0, '2012-03-02'),
(21, 1, 1, 'anther one', 0, '2011-03-02'),
(22, 2, 1, 'anther one', 0, '2010-03-02'),
(23, 3, 1, 'anther one', 0, '2009-03-02'),
(24, 4, 1, 'anther one', 0, '2008-03-02'),
(25, 5, 1, 'anther one', 0, '2007-03-02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `usr_id` int(11) NOT NULL,
  `usr_name` varchar(255) NOT NULL,
  `usr_active` tinyint(1) NOT NULL,
  `usr_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`usr_id`, `usr_name`, `usr_active`, `usr_created`) VALUES
(1, 'bar cohen', 1, '2023-03-28'),
(2, 'rami scott', 1, '2014-03-05'),
(3, 'barbara Nolan', 1, '2015-03-05'),
(4, 'Thad Tilman', 0, '2018-03-08'),
(5, 'Thad Tilman', 0, '2018-03-08'),
(6, 'Gwen Bigo', 0, '2018-03-08'),
(7, 'Gutato Kya', 1, '2018-03-08'),
(8, 'Avi Ron', 1, '2018-03-08'),
(9, 'Noya Koren', 0, '2018-03-08');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
