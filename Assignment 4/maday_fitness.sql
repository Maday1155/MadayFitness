-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 14, 2022 at 08:00 PM
-- Server version: 8.0.28
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
-- Database: `maday_fitness`
--

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `id` int NOT NULL,
  `Username` varchar(50) NOT NULL,
  `PASSWORD` varchar(16) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`id`, `Username`, `PASSWORD`, `FirstName`, `LastName`) VALUES
(1, 'Zawarkhan22', 'hELLO', 'Zawar', 'Bay'),
(2, 'maday', 'Maday1234.', 'Maday', 'Cohen'),
(3, 'd.Trump', 'DonaldTrump22', 'Donald', 'Trump'),
(4, 'HelloWorld', 'Maday1234.', 'Hello', 'World');

-- --------------------------------------------------------

--
-- Table structure for table `UserRole`
--

CREATE TABLE `UserRole` (
  `Username` varchar(50) NOT NULL,
  `Rolename` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `UserRole`
--

INSERT INTO `UserRole` (`Username`, `Rolename`) VALUES
('maday', 'programmer'),
('ZawarKhan22', 'service');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `UserRole`
--
ALTER TABLE `UserRole`
  ADD PRIMARY KEY (`Username`,`Rolename`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
