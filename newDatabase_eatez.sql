-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 04, 2024 at 02:04 PM
-- Server version: 8.0.36-cll-lve
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cqfzvzkv_eatez`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_dish`
--

CREATE TABLE `category_dish` (
  `cid` int NOT NULL,
  `cname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_dish`
--

INSERT INTO `category_dish` (`cid`, `cname`) VALUES
(1, 'Món chính'),
(2, 'Món khai vị'),
(3, 'Món tráng miệng'),
(4, 'Salad'),
(5, 'Mì xào'),
(6, 'Canh chua'),
(7, 'Nước trái cây'),
(8, 'Bánh mì'),
(9, 'Chè'),
(10, 'Hải sản'),
(11, 'Món chính'),
(12, 'Món khai vị'),
(13, 'Món tráng miệng'),
(14, 'Salad'),
(15, 'Mì xào'),
(16, 'Canh chua'),
(17, 'Nước trái cây'),
(18, 'Bánh mì'),
(19, 'Chè'),
(20, 'Hải sản');

-- --------------------------------------------------------

--
-- Table structure for table `comment_post`
--

CREATE TABLE `comment_post` (
  `cmt_id` int NOT NULL,
  `userid` int NOT NULL,
  `post_id` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dish`
--

CREATE TABLE `dish` (
  `dish_id` int NOT NULL,
  `dish_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dish_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dish_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cid` int NOT NULL,
  `res_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dish`
--

INSERT INTO `dish` (`dish_id`, `dish_name`, `dish_desc`, `dish_image`, `cid`, `res_id`) VALUES
(1, 'Mì Quảng', 'Món ăn đặc sản của miền Trung Việt Nam.', 'mi-quang.jpg', 1, 1),
(2, 'Bún Riêu', 'Một món ăn ngon với nước dùng đậm đà.', 'bun-rieu.jpg', 1, 1),
(3, 'Gỏi cuốn', 'Món ăn tráng miệng phổ biến với rau sống và thịt.', 'goi-cuon.jpg', 2, 1),
(4, 'Bánh mì thịt', 'Một món bánh mì phổ biến với thịt heo và rau sống.', 'banh-mi-thit.jpg', 3, 2),
(5, 'Mì Quảng', 'Món ăn đặc sản của miền Trung Việt Nam.', 'mi-quang.jpg', 1, 1),
(6, 'Bún Riêu', 'Một món ăn ngon với nước dùng đậm đà.', 'bun-rieu.jpg', 1, 1),
(7, 'Gỏi cuốn', 'Món ăn tráng miệng phổ biến với rau sống và thịt.', 'goi-cuon.jpg', 2, 1),
(8, 'Bánh mì thịt', 'Một món bánh mì phổ biến với thịt heo và rau sống.', 'banh-mi-thit.jpg', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `favourite_food`
--

CREATE TABLE `favourite_food` (
  `favourite_id` int NOT NULL,
  `post_id` int NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int NOT NULL,
  `dish_id` int NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `thumbnail_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `dish_id`, `title`, `content`, `thumbnail_image`, `date`) VALUES
(1, 1, 'Món Spaghetti Bolognese ngon tuyệt', 'Hãy thưởng thức món Spaghetti Bolognese ngon tuyệt tại nhà hàng chúng tôi.', 'spaghetti_thumbnail.jpg', '2024-04-01 09:00:00'),
(2, 2, 'Salad Caesar tươi mát', 'Thưởng thức một tô salad Caesar tươi mát và bổ dưỡng cùng gia vị đặc trưng.', 'caesar_salad_thumbnail.jpg', '2024-04-01 09:30:00'),
(3, 3, 'Tiramisu hấp dẫn', 'Một món tiramisu hấp dẫn với hương vị đặc trưng của cà phê và mascarpone.', 'tiramisu_thumbnail.jpg', '2024-04-01 10:00:00'),
(4, 1, 'Mì Quảng tuyệt vời', 'Hôm nay tôi đã thưởng thức một tô Mì Quảng thật ngon.', 'mi-quang-thumbnail.jpg', '2024-04-03 08:00:00'),
(5, 2, 'Bún Riêu ngon tuyệt', 'Bún Riêu ở đây thật sự ngon và thơm.', 'bun-rieu-thumbnail.jpg', '2024-04-03 09:00:00'),
(6, 3, 'Gỏi cuốn tươi mát', 'Gỏi cuốn với rau tươi và thịt thật là một lựa chọn tuyệt vời.', 'goi-cuon-thumbnail.jpg', '2024-04-03 10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL,
  `res_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `res_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `res_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `res_phone` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`res_id`, `res_name`, `res_address`, `res_image`, `res_phone`) VALUES
(1, 'Nhà hàng A', '123 Đường ABC, Thành phố XYZ', 'nhahang1.jpg', 123456789),
(2, 'Nhà hàng B', '456 Đường DEF, Thành phố XYZ', 'nhahang2.jpg', 987654321);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int NOT NULL,
  `fullName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `fullName`, `email`, `password`, `avatar_image`) VALUES
(1, 'Nguyễn Văn A', 'nguyenvana@example.com', 'password123', 'avatar1.jpg'),
(2, 'Trần Thị B', 'tranthib@example.com', 'password456', 'avatar2.jpg'),
(3, 'Lê Văn C', 'levanc@example.com', 'password789', 'avatar3.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_dish`
--
ALTER TABLE `category_dish`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `comment_post`
--
ALTER TABLE `comment_post`
  ADD PRIMARY KEY (`cmt_id`),
  ADD KEY `Id` (`cmt_id`,`userid`,`post_id`),
  ADD KEY `cmt_id` (`cmt_id`),
  ADD KEY `fk_comment_post` (`post_id`),
  ADD KEY `fk_comment_user` (`userid`);

--
-- Indexes for table `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`dish_id`),
  ADD KEY `dish_id` (`dish_id`,`cid`,`res_id`),
  ADD KEY `fk_dish_category` (`cid`),
  ADD KEY `fk_dish_restaurant` (`res_id`);

--
-- Indexes for table `favourite_food`
--
ALTER TABLE `favourite_food`
  ADD PRIMARY KEY (`favourite_id`),
  ADD KEY `Id` (`favourite_id`,`post_id`,`date`),
  ADD KEY `fk_favourite_post` (`post_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `Id` (`post_id`,`dish_id`),
  ADD KEY `post_id` (`post_id`,`dish_id`),
  ADD KEY `fk_post_dish` (`dish_id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`res_id`),
  ADD KEY `Id` (`res_id`),
  ADD KEY `Id_2` (`res_id`),
  ADD KEY `res_id` (`res_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `Id` (`userid`),
  ADD KEY `userid` (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_dish`
--
ALTER TABLE `category_dish`
  MODIFY `cid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `comment_post`
--
ALTER TABLE `comment_post`
  MODIFY `cmt_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dish`
--
ALTER TABLE `dish`
  MODIFY `dish_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `favourite_food`
--
ALTER TABLE `favourite_food`
  MODIFY `favourite_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `res_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment_post`
--
ALTER TABLE `comment_post`
  ADD CONSTRAINT `fk_comment_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  ADD CONSTRAINT `fk_comment_user` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `fk_dish_category` FOREIGN KEY (`cid`) REFERENCES `category_dish` (`cid`),
  ADD CONSTRAINT `fk_dish_restaurant` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`);

--
-- Constraints for table `favourite_food`
--
ALTER TABLE `favourite_food`
  ADD CONSTRAINT `fk_favourite_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_post_dish` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`dish_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
