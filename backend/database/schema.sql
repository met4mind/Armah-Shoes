-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2024 at 12:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `shoes`
--
DROP DATABASE IF EXISTS `shoes`;
CREATE DATABASE IF NOT EXISTS `shoes` DEFAULT CHARACTER SET utf8 COLLATE utf8_persian_ci;
USE `shoes`;

-- --------------------------------------------------------

--
-- Table structure for table `shoes`
--

CREATE TABLE `shoes` (
  `id` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `thumbnail` varchar(70) NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL,
  `publisher` varchar(70) NOT NULL,
  `breaking` tinyint(1) NOT NULL DEFAULT 0,
  `publishDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `shoesText` text NOT NULL,
  `shoesShortText` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(50) NOT NULL,
  `incremental` int(11) NOT NULL DEFAULT 0,
  `registerDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastLogin` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` enum('user','jornal','admin','owner') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `shoes`
--
ALTER TABLE `shoes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `email_2` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `shoes`
--
ALTER TABLE `shoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata for table shoes
--

--
-- Metadata for table users
--

--
-- Metadata for database shoes
--

--
-- Dumping data for table `pma__relation`
--

INSERT INTO `pma__relation` (`master_db`, `master_table`, `master_field`, `foreign_db`, `foreign_table`, `foreign_field`) VALUES
('shoes', 'shoes', 'author', 'shoes', 'users', 'id');
COMMIT;
