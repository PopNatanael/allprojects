-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 17, 2022 at 11:00 AM
-- Server version: 8.0.28-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dk`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `uuid` binary(16) NOT NULL,
  `identity` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'inactive',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`uuid`, `identity`, `password`, `firstName`, `lastName`, `status`, `created`, `updated`) VALUES
(0x11ec9f94977f7894a8f77a4cea3b0f40, 'admin', '$2y$11$OwMimRB1aTrv.VH0uRIDFeU3eh7NNraKncCRruhW.lKOPyz/R7Fq6', 'DotKernel', 'Admin', 'active', '2022-03-09 10:35:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role`
--

CREATE TABLE `admin_role` (
  `uuid` binary(16) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_role`
--

INSERT INTO `admin_role` (`uuid`, `name`, `created`, `updated`) VALUES
(0x11ec9f949742b8dcac527a4cea3b0f40, 'superuser', '2022-03-09 10:35:08', NULL),
(0x11ec9f94977f73809bbe7a4cea3b0f40, 'admin', '2022-03-09 10:35:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `userUuid` binary(16) NOT NULL,
  `roleUuid` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`userUuid`, `roleUuid`) VALUES
(0x11ec9f94977f7894a8f77a4cea3b0f40, 0x11ec9f949742b8dcac527a4cea3b0f40);

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `uuid` binary(16) NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` enum('active','deleted') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'active',
  `year` binary(16) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`uuid`, `name`, `status`, `year`, `created`, `updated`) VALUES
(0x11eca539a8a3e466a563f65e98372cfb, 'maicata', 'active', 0x11eca539dbfd428a8e39f65e98372cfb, '2022-03-16 15:44:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_message`
--

CREATE TABLE `contact_message` (
  `uuid` binary(16) NOT NULL,
  `email` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `messageType` enum('Bug Report','Feature','Report User','Another','new_message') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'new_message',
  `messageStatus` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'inactive',
  `platform` enum('website','designer','admin') NOT NULL DEFAULT 'website',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contact_message`
--

INSERT INTO `contact_message` (`uuid`, `email`, `name`, `subject`, `message`, `messageType`, `messageStatus`, `platform`, `created`, `updated`) VALUES
(0x11eca1336774651aa542f21d708e6571, 'natipop1@gmail.com', 'popnatanael', 'DotKernel Message 2022-03-11 14:04:28', 'asdfasdf', 'Feature', 'active', 'website', '2022-03-11 12:04:29', '2022-03-15 13:07:24'),
(0x11eca1336cb463d6a07cf21d708e6571, 'natipop2@gmail.com', 'pop natanael', 'DotKernel Message 2022-03-11 14:04:38', 'asdfasdfadfd', 'Bug Report', 'active', 'website', '2022-03-11 12:04:38', '2022-03-15 13:27:14'),
(0x11eca13372be298892ebf21d708e6571, 'natipo222@gmail.com', 'pop natanaelx', 'DotKernel Message 2022-03-11 14:04:48', ':)', 'Another', 'active', 'website', '2022-03-11 12:04:48', '2022-03-14 11:00:29'),
(0x11eca13593a1e2aaaac0f21d708e6571, 'natipop4@gmail.com', 'pop natanaelx', 'DotKernel Message 2022-03-11 14:20:02', 'asdasd', 'Report User', 'active', 'website', '2022-03-11 12:20:02', '2022-03-15 13:07:30'),
(0x11eca1359947f31685ccf21d708e6571, 'natipop4@gmail.com', 'pop natanaelx', 'DotKernel Message 2022-03-11 14:20:11', 'asdasdasdasd', 'Bug Report', 'inactive', 'website', '2022-03-11 12:20:11', '2022-03-11 12:20:11'),
(0x11eca143539db23ea7fff21d708e6571, 'natipop4@gmail.com', 'asdf', 'DotKernel Message 2022-03-11 15:58:27', 'asdfasdf', 'Report User', 'inactive', 'website', '2022-03-11 13:58:27', '2022-03-11 13:58:27');

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `uuid` binary(16) NOT NULL,
  `studentId` binary(16) NOT NULL,
  `classId` binary(16) NOT NULL,
  `grade` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20200416084037, 'DefaultSchema', '2020-09-09 13:52:53', '2020-09-09 13:52:54', 0),
(20200416084050, 'DefaultAdminSchema', '2022-03-09 10:34:42', '2022-03-09 10:34:58', 0),
(20200416154725, 'ContactMessage', '2020-09-09 13:52:54', '2020-09-09 13:52:54', 0);

-- --------------------------------------------------------

--
-- Table structure for table `students_class`
--

CREATE TABLE `students_class` (
  `class_uuid` binary(16) NOT NULL,
  `student_uuid` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uuid` binary(16) NOT NULL,
  `identity` varchar(100) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `status` enum('pending','active') NOT NULL DEFAULT 'pending',
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `hash` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uuid`, `identity`, `slug`, `password`, `status`, `isDeleted`, `hash`, `created`, `updated`) VALUES
(0x11ec9bcabc50431a9648d25807c60349, 'natipop1@yahoo.com', NULL, '$2y$10$VyQq7Xag6mY/jQftvaJjCelyhAVANJaUsRH9G.lH5qDkUuYNUelzu', 'active', 0, 'f5fbcb6f7994c14ccf6ffb79d9698dce8a0b755512bbc0fbdfb498d480397a51', '2022-03-04 14:52:38', '2022-03-04 14:53:41');

-- --------------------------------------------------------

--
-- Table structure for table `user_avatar`
--

CREATE TABLE `user_avatar` (
  `uuid` binary(16) NOT NULL,
  `userUuid` binary(16) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_avatar`
--

INSERT INTO `user_avatar` (`uuid`, `userUuid`, `name`, `created`, `updated`) VALUES
(0x11ec9e1d85b7ec5e8b15de8fe84e45b7, 0x11ec9bcabc50431a9648d25807c60349, 'avatar-85b7bcde-9e1d-11ec-8aee-de8fe84e45b7.jpg', '2022-03-07 13:50:17', '2022-03-07 13:50:17');

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE `user_detail` (
  `uuid` binary(16) NOT NULL,
  `userUuid` binary(16) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_detail`
--

INSERT INTO `user_detail` (`uuid`, `userUuid`, `firstName`, `lastName`, `created`, `updated`) VALUES
(0x11ec9bcabc54e7a884bdd25807c60349, 0x11ec9bcabc50431a9648d25807c60349, 'Natanael', 'Pop', '2022-03-04 14:52:38', '2022-03-04 14:52:38');

-- --------------------------------------------------------

--
-- Table structure for table `user_reset_password`
--

CREATE TABLE `user_reset_password` (
  `uuid` binary(16) NOT NULL,
  `userUuid` binary(16) DEFAULT NULL,
  `hash` varchar(100) NOT NULL,
  `status` enum('completed','requested') NOT NULL DEFAULT 'requested',
  `expires` timestamp NULL DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `uuid` binary(16) NOT NULL,
  `name` varchar(150) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`uuid`, `name`, `created`, `updated`) VALUES
(0x11eaf2a3d994f820b7ee001aa006c7d1, 'admin', '2020-09-09 13:53:33', NULL),
(0x11eaf2a3d995e5aa9788001aa006c7d1, 'user', '2020-09-09 13:53:33', NULL),
(0x11eaf2a3d995e78a83c0001aa006c7d1, 'guest', '2020-09-09 13:53:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `userUuid` binary(16) NOT NULL,
  `roleUuid` binary(16) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`userUuid`, `roleUuid`, `created`, `updated`) VALUES
(0x11ec9bcabc50431a9648d25807c60349, 0x11eaf2a3d995e5aa9788001aa006c7d1, '2022-03-04 14:52:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `uuid` binary(16) NOT NULL,
  `userUuid` binary(16) NOT NULL,
  `value` text NOT NULL,
  `expireAt` datetime NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `year`
--

CREATE TABLE `year` (
  `uuid` binary(16) NOT NULL,
  `year` varchar(4) COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('active','deleted') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'active',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `year`
--

INSERT INTO `year` (`uuid`, `year`, `status`, `created`, `updated`) VALUES
(0x11eca539a8a3e466a563f65e98372cfb, '2', 'active', '2022-03-16 14:59:20', '2022-03-16 14:59:20'),
(0x11eca539dbfd428a8e39f65e98372cfb, '2', 'active', '2022-03-16 15:00:46', '2022-03-16 15:00:46'),
(0x11eca53ececb5f16aa42f65e98372cfb, '2', 'active', '2022-03-16 15:36:11', '2022-03-16 15:36:11'),
(0x11eca541936d701ea5d8f65e98372cfb, '2', 'active', '2022-03-16 15:56:00', '2022-03-16 15:56:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `identity` (`identity`);

--
-- Indexes for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`userUuid`,`roleUuid`),
  ADD KEY `roleUuid` (`roleUuid`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `name` (`name`),
  ADD KEY `class_ibfk_1` (`year`),
  ADD KEY `name_2` (`name`);

--
-- Indexes for table `contact_message`
--
ALTER TABLE `contact_message`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `grade_ibfk_1` (`studentId`),
  ADD KEY `classId` (`classId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `students_class`
--
ALTER TABLE `students_class`
  ADD UNIQUE KEY `student_class` (`class_uuid`,`student_uuid`),
  ADD KEY `student_uuid` (`student_uuid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `identity` (`identity`);

--
-- Indexes for table `user_avatar`
--
ALTER TABLE `user_avatar`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `userUuid` (`userUuid`);

--
-- Indexes for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `userUuid` (`userUuid`);

--
-- Indexes for table `user_reset_password`
--
ALTER TABLE `user_reset_password`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `hash` (`hash`),
  ADD KEY `userUuid` (`userUuid`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`userUuid`,`roleUuid`),
  ADD KEY `roleUuid` (`roleUuid`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `userUuid` (`userUuid`);

--
-- Indexes for table `year`
--
ALTER TABLE `year`
  ADD PRIMARY KEY (`uuid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD CONSTRAINT `admin_roles_ibfk_1` FOREIGN KEY (`userUuid`) REFERENCES `admin` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_roles_ibfk_2` FOREIGN KEY (`roleUuid`) REFERENCES `admin_role` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`year`) REFERENCES `year` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `user` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`classId`) REFERENCES `class` (`uuid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `students_class`
--
ALTER TABLE `students_class`
  ADD CONSTRAINT `students_class_ibfk_1` FOREIGN KEY (`student_uuid`) REFERENCES `user` (`uuid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `students_class_ibfk_2` FOREIGN KEY (`class_uuid`) REFERENCES `class` (`uuid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `user_avatar`
--
ALTER TABLE `user_avatar`
  ADD CONSTRAINT `user_avatar_ibfk_1` FOREIGN KEY (`userUuid`) REFERENCES `user` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD CONSTRAINT `user_detail_ibfk_1` FOREIGN KEY (`userUuid`) REFERENCES `user` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_reset_password`
--
ALTER TABLE `user_reset_password`
  ADD CONSTRAINT `user_reset_password_ibfk_1` FOREIGN KEY (`userUuid`) REFERENCES `user` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`userUuid`) REFERENCES `user` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`roleUuid`) REFERENCES `user_role` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_token`
--
ALTER TABLE `user_token`
  ADD CONSTRAINT `user_token_ibfk_1` FOREIGN KEY (`userUuid`) REFERENCES `user` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
