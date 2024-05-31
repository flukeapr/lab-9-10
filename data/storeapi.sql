-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2024 at 12:27 PM
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
-- Database: `storeapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `product` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`product`)),
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `price` float NOT NULL,
  `description` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `price`, `description`, `image`, `category`) VALUES
(1, 'Annamarie', 51, 'Ocular pain, unspecified eye', 'http://dummyimage.com/219x100.png/5fa2dd/ffffff', 'Masonry'),
(2, 'Sandy', 69, 'Subluxation of proximal interphalangeal joint of oth finger', 'http://dummyimage.com/116x100.png/dddddd/000000', 'Epoxy Flooring'),
(3, 'Christine', 28, 'Alcohol abuse with intoxication, unspecified', 'http://dummyimage.com/213x100.png/5fa2dd/ffffff', 'Fire Sprinkler System'),
(4, 'Hynda', 22, 'Nondisp pilon fx right tibia, init for opn fx type 3A/B/C', 'http://dummyimage.com/208x100.png/ff4444/ffffff', 'Wall Protection'),
(5, 'Mina', 89, 'Inj oth blood vessels at lower leg level, unsp leg, subs', 'http://dummyimage.com/247x100.png/5fa2dd/ffffff', 'Retaining Wall and Brick Pavers'),
(6, 'Flossi', 48, 'Superficial foreign body of hip', 'http://dummyimage.com/209x100.png/cc0000/ffffff', 'Waterproofing & Caulking'),
(7, 'Leonora', 20, 'Toxic effect of chromium and its compounds, assault, init', 'http://dummyimage.com/232x100.png/5fa2dd/ffffff', 'Framing (Steel)'),
(8, 'Normy', 51, 'Cutaneous abscess of left hand', 'http://dummyimage.com/146x100.png/dddddd/000000', 'Overhead Doors'),
(9, 'Christye', 35, 'Idiopathic gout, left knee', 'http://dummyimage.com/126x100.png/5fa2dd/ffffff', 'Roofing (Metal)'),
(10, 'Adore', 37, 'Dislocation of interphalangeal joint of unsp great toe, subs', 'http://dummyimage.com/162x100.png/ff4444/ffffff', 'Elevator'),
(24, 'dog', 29, 'A cat', 'cat.png', 'Animal');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `image` varchar(100) NOT NULL,
  `role` varchar(10) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `image`, `role`, `createdAt`) VALUES
(1, 'admin', 'admin@gmail.com', '123456', '', 'admin', '2024-05-31 10:14:49'),
(2, 'user', 'user@gmail.com', '123456', '', 'user', '2024-05-31 10:14:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `userid` FOREIGN KEY (`userID`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
