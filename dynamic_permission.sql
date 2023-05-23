-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2023 at 11:32 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dynamic_permission`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_emp`
--

CREATE TABLE `tb_emp` (
  `emp_id` bigint(20) UNSIGNED ZEROFILL NOT NULL,
  `emp_username` varchar(255) NOT NULL,
  `emp_password` varchar(255) NOT NULL,
  `emp_name` varchar(255) NOT NULL,
  `emp_position_id` bigint(20) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_emp`
--

INSERT INTO `tb_emp` (`emp_id`, `emp_username`, `emp_password`, `emp_name`, `emp_position_id`) VALUES
(00000000000000000001, 'test', '1234', 'test', 00000000000000000001),
(00000000000000000002, 'test2', '1234', 'test2', 00000000000000000002);

-- --------------------------------------------------------

--
-- Table structure for table `tb_page`
--

CREATE TABLE `tb_page` (
  `page_id` bigint(20) UNSIGNED ZEROFILL NOT NULL,
  `page_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_page`
--

INSERT INTO `tb_page` (`page_id`, `page_name`) VALUES
(00000000000000000001, 'add_emp.php'),
(00000000000000000002, 'show_emp.php'),
(00000000000000000003, 'add_permission.php'),
(00000000000000000004, 'show_permission.php'),
(00000000000000000005, 'add_position.php');

-- --------------------------------------------------------

--
-- Table structure for table `tb_page_per`
--

CREATE TABLE `tb_page_per` (
  `pp_perid` bigint(20) UNSIGNED ZEROFILL NOT NULL,
  `pp_pageid` bigint(20) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_page_per`
--

INSERT INTO `tb_page_per` (`pp_perid`, `pp_pageid`) VALUES
(00000000000000000001, 00000000000000000001),
(00000000000000000001, 00000000000000000003),
(00000000000000000001, 00000000000000000005),
(00000000000000000002, 00000000000000000002),
(00000000000000000002, 00000000000000000004);

-- --------------------------------------------------------

--
-- Table structure for table `tb_permission`
--

CREATE TABLE `tb_permission` (
  `permission_id` bigint(20) UNSIGNED ZEROFILL NOT NULL,
  `permission_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_permission`
--

INSERT INTO `tb_permission` (`permission_id`, `permission_name`) VALUES
(00000000000000000001, 'insert'),
(00000000000000000002, 'view');

-- --------------------------------------------------------

--
-- Table structure for table `tb_position`
--

CREATE TABLE `tb_position` (
  `position_id` bigint(20) UNSIGNED ZEROFILL NOT NULL,
  `position_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_position`
--

INSERT INTO `tb_position` (`position_id`, `position_name`) VALUES
(00000000000000000001, 'admin'),
(00000000000000000002, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pos_per`
--

CREATE TABLE `tb_pos_per` (
  `pos_id` bigint(20) UNSIGNED ZEROFILL NOT NULL,
  `per_id` bigint(20) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_pos_per`
--

INSERT INTO `tb_pos_per` (`pos_id`, `per_id`) VALUES
(00000000000000000001, 00000000000000000001),
(00000000000000000001, 00000000000000000002),
(00000000000000000002, 00000000000000000002);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_emp`
--
ALTER TABLE `tb_emp`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `emp_position_id` (`emp_position_id`);

--
-- Indexes for table `tb_page`
--
ALTER TABLE `tb_page`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `tb_page_per`
--
ALTER TABLE `tb_page_per`
  ADD PRIMARY KEY (`pp_perid`,`pp_pageid`),
  ADD KEY `pp_pageid` (`pp_pageid`);

--
-- Indexes for table `tb_permission`
--
ALTER TABLE `tb_permission`
  ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `tb_position`
--
ALTER TABLE `tb_position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `tb_pos_per`
--
ALTER TABLE `tb_pos_per`
  ADD PRIMARY KEY (`pos_id`,`per_id`),
  ADD KEY `per_id` (`per_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_emp`
--
ALTER TABLE `tb_emp`
  MODIFY `emp_id` bigint(20) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_page`
--
ALTER TABLE `tb_page`
  MODIFY `page_id` bigint(20) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_permission`
--
ALTER TABLE `tb_permission`
  MODIFY `permission_id` bigint(20) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_position`
--
ALTER TABLE `tb_position`
  MODIFY `position_id` bigint(20) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_emp`
--
ALTER TABLE `tb_emp`
  ADD CONSTRAINT `tb_emp_ibfk_1` FOREIGN KEY (`emp_position_id`) REFERENCES `tb_position` (`position_id`);

--
-- Constraints for table `tb_page_per`
--
ALTER TABLE `tb_page_per`
  ADD CONSTRAINT `tb_page_per_ibfk_1` FOREIGN KEY (`pp_perid`) REFERENCES `tb_permission` (`permission_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_page_per_ibfk_2` FOREIGN KEY (`pp_pageid`) REFERENCES `tb_page` (`page_id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_pos_per`
--
ALTER TABLE `tb_pos_per`
  ADD CONSTRAINT `tb_pos_per_ibfk_1` FOREIGN KEY (`pos_id`) REFERENCES `tb_position` (`position_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_pos_per_ibfk_2` FOREIGN KEY (`per_id`) REFERENCES `tb_permission` (`permission_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
