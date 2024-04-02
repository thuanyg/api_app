-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2024 at 04:38 AM
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
-- Database: `dbdaapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_dish`
--

CREATE TABLE `category_dish` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_dish`
--

INSERT INTO `category_dish` (`Id`, `Name`) VALUES
(1, 'Main Course'),
(2, 'Appetizers'),
(3, 'Desserts');

-- --------------------------------------------------------

--
-- Table structure for table `comment_dish`
--

CREATE TABLE `comment_dish` (
  `Id` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `DishId` int(11) NOT NULL,
  `Content` text NOT NULL,
  `Time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment_dish`
--

INSERT INTO `comment_dish` (`Id`, `UserId`, `DishId`, `Content`, `Time`) VALUES
(1, 1, 1, 'Great dish!', '2024-04-01 12:00:00'),
(2, 2, 1, 'I love it!', '2024-04-01 12:30:00'),
(3, 1, 2, 'Delicious!', '2024-04-01 13:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `comment_post`
--

CREATE TABLE `comment_post` (
  `Id` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `PostId` int(11) NOT NULL,
  `Content` text NOT NULL,
  `Time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment_post`
--

INSERT INTO `comment_post` (`Id`, `UserId`, `PostId`, `Content`, `Time`) VALUES
(1, 1, 1, 'Great post!', '2024-04-01 10:00:00'),
(2, 2, 1, 'Interesting!', '2024-04-01 10:30:00'),
(3, 1, 2, 'Nice photo!', '2024-04-01 11:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `dish`
--

CREATE TABLE `dish` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Image` text NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `resID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dish`
--

INSERT INTO `dish` (`Id`, `Name`, `Description`, `Image`, `CategoryId`, `resID`) VALUES
(1, 'Spaghetti Bolognese', 'Classic Italian pasta dish with meat sauce.', 'spaghetti.jpg', 1, 1),
(2, 'Caesar Salad', 'Fresh salad with romaine lettuce, croutons, and Caesar dressing.', 'caesar_salad.jpg', 2, 1),
(3, 'Tiramisu', 'Italian dessert made with ladyfingers, coffee, mascarpone cheese, and cocoa.', 'tiramisu.jpg', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `favourite_food`
--

CREATE TABLE `favourite_food` (
  `Id` int(11) NOT NULL,
  `DishId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favourite_food`
--

INSERT INTO `favourite_food` (`Id`, `DishId`, `UserId`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `Id` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Content` text NOT NULL,
  `Image` text NOT NULL,
  `Time` datetime NOT NULL,
  `dishID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`Id`, `UserId`, `Content`, `Image`, `Time`, `dishID`) VALUES
(1, 1, 'Check out this delicious spaghetti!', 'post_image.jpg', '2024-04-01 09:00:00', 1),
(2, 2, 'Enjoying a tasty Caesar salad!', 'post_image.jpg', '2024-04-01 09:30:00', 2),
(3, 1, 'Indulging in some tiramisu!', 'post_image.jpg', '2024-04-01 10:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` text NOT NULL,
  `Image` text NOT NULL,
  `Phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`Id`, `Name`, `Address`, `Image`, `Phone`) VALUES
(1, 'Italiano Restaurant', '123 Main Street, Cityville', 'restaurant_image.jpg', 1234567890),
(2, 'Bella Cucina', '456 Elm Street, Townsville', 'restaurant_image.jpg', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_dish`
--

CREATE TABLE `restaurant_dish` (
  `Id` int(11) NOT NULL,
  `RestaurantId` int(11) NOT NULL,
  `DishId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant_dish`
--

INSERT INTO `restaurant_dish` (`Id`, `RestaurantId`, `DishId`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Image` text NOT NULL,
  `IsAdmin` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id`, `Name`, `Email`, `Password`, `Image`, `IsAdmin`) VALUES
(1, 'John Doe', 'john@example.com', 'password', 'user_image.jpg', 0),
(2, 'Jane Smith', 'jane@example.com', 'password', 'user_image.jpg', 0),
(3, 'Admin User', 'admin@example.com', 'password', 'admin_image.jpg', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_dish`
--
ALTER TABLE `category_dish`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`),
  ADD KEY `Id_2` (`Id`);

--
-- Indexes for table `comment_dish`
--
ALTER TABLE `comment_dish`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`,`UserId`,`DishId`);

--
-- Indexes for table `comment_post`
--
ALTER TABLE `comment_post`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`,`UserId`,`PostId`);

--
-- Indexes for table `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`);

--
-- Indexes for table `favourite_food`
--
ALTER TABLE `favourite_food`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`,`DishId`,`UserId`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`,`UserId`),
  ADD KEY `dishID` (`dishID`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`),
  ADD KEY `Id_2` (`Id`);

--
-- Indexes for table `restaurant_dish`
--
ALTER TABLE `restaurant_dish`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`,`RestaurantId`,`DishId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
