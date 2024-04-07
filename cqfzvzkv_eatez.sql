-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 07, 2024 at 01:06 PM
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
  `cname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cimage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_dish`
--

INSERT INTO `category_dish` (`cid`, `cname`, `cimage`) VALUES
(1, 'Rice', 'https://htthuan.id.vn/images/categories/category_rice.png'),
(2, 'Breakfast', 'https://htthuan.id.vn/images/categories/category_breakfast.png'),
(3, 'Noodles', 'https://htthuan.id.vn/images/categories/category_noodles.png'),
(4, 'Salad/Healthy', 'https://htthuan.id.vn/images/categories/category_saladhealthy.png'),
(5, 'Drink', 'https://htthuan.id.vn/images/categories/category_drink.png'),
(6, 'Seafood', 'https://htthuan.id.vn/images/categories/category_seafood.png'),
(7, 'Fruit Juice', 'https://htthuan.id.vn/images/categories/category_juice.png'),
(8, 'Bread', 'https://htthuan.id.vn/images/categories/category_bread.png');

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
(8, 'Bánh mì thịt', 'Một món bánh mì phổ biến với thịt heo và rau sống.', 'banh-mi-thit.jpg', 3, 2),
(9, 'Nem nướng Nha Trang', 'Nem nướng Nha Trang vô cùng tuyệt vời ...', '', 4, 1),
(10, 'Bánh mì thịt nướng', 'Bánh mì thịt nướng với rau sống, sốt me...', '', 1, 1),
(11, 'Phở bò', 'Phở bò nóng hổi, thơm phức, với nước dùng đậm đà...', '', 2, 1),
(12, 'Bún chả Hà Nội', 'Bún chả Hà Nội với chả nướng và bún thơm lừng...', '', 3, 1),
(13, 'Cơm gà Hải Nam', 'Cơm gà Hải Nam thơm ngon với gà luộc và cơm trắng...', '', 5, 1),
(14, 'Bún riêu cua', 'Bún riêu cua nổi tiếng với hương vị đặc trưng...', '', 6, 1),
(15, 'Bún bò Huế', 'Bún bò Huế thơm ngon, cay nồng với nước dùng đậm đà...', '', 7, 1),
(16, 'Gỏi cuốn', 'Gỏi cuốn tươi mát với rau sống, tôm, thịt bò hoặc thịt gà...', '', 8, 1),
(17, 'Bánh xèo', 'Bánh xèo giòn tan với nhân thịt heo, tôm và rau sống...', '', 5, 1),
(18, 'Bún thịt nướng', 'Bún thịt nướng với thịt nướng, rau sống và nước mắm...', '', 4, 1),
(19, 'Cơm tấm Sài Gòn', 'Cơm tấm Sài Gòn với cơm dẻo, thịt heo nướng, trứng ốp la...', '', 7, 1);

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
(6, 3, 'Gỏi cuốn tươi ngon', 'Gỏi cuốn với rau tươi và thịt thật là một lựa chọn tuyệt vời.', 'goi-cuon-thumbnail.jpg', '2024-04-03 10:00:00'),
(7, 1, 'Món ngon bánh mì thịt nướng', 'Hôm nay chúng ta sẽ cùng khám phá món ngon bánh mì thịt nướng. Đây là một món ăn truyền thống của Việt Nam, thường được chế biến từ thịt nướng, rau sống, sốt me và bánh mì.', 'thumbnail1.jpg', '2024-04-07 13:04:36'),
(8, 2, 'Khám phá hương vị phở bò', 'Món phở bò nổi tiếng với hương vị đậm đà của nước dùng, sự mềm mại của thịt bò và sự thơm phức của gia vị. Hãy cùng nhau thưởng thức và khám phá hương vị tuyệt vời của món ăn này.', 'thumbnail2.jpg', '2024-04-07 13:04:36'),
(9, 3, 'Bún chả Hà Nội - Hương vị truyền thống', 'Bún chả Hà Nội là một món ăn đặc trưng của miền Bắc Việt Nam. Nó bao gồm chả nướng, bún và rau sống, thường được ăn kèm với nước mắm pha chua ngọt.', 'thumbnail3.jpg', '2024-04-07 13:04:36'),
(10, 4, 'Nem nướng Nha Trang - Một hương vị đặc biệt', 'Nem nướng Nha Trang là một món ăn ngon và độc đáo của miền Trung Việt Nam. Với hương vị đặc trưng và cách chế biến độc đáo, món này sẽ chinh phục vị giác của bạn.', 'thumbnail4.jpg', '2024-04-07 13:04:36'),
(11, 5, 'Cơm gà Hải Nam - Hòa quyện hương vị', 'Cơm gà Hải Nam là một món ăn truyền thống của đảo Hải Nam, Trung Quốc. Hương vị thơm ngon của gà, cơm và nước mắm sẽ khiến bạn phải mê mẩn.', 'thumbnail5.jpg', '2024-04-07 13:04:36'),
(12, 6, 'Bún riêu cua - Hương vị đặc biệt', 'Bún riêu cua là một món ăn phổ biến ở miền Nam Việt Nam. Với nước dùng đậm đà, chả cua và rau sống, món này chắc chắn sẽ khiến bạn thích thú.', 'thumbnail6.jpg', '2024-04-07 13:04:36'),
(13, 7, 'Bún bò Huế - Hương vị cay nồng', 'Bún bò Huế là một món ăn ngon và đặc trưng của miền Trung Việt Nam. Với hương vị cay nồng của nước dùng và hỗn hợp gia vị, món này sẽ khiến bạn không thể quên.', 'thumbnail7.jpg', '2024-04-07 13:04:36'),
(14, 8, 'Gỏi cuốn - Món ngon mát lạnh', 'Gỏi cuốn là một món ăn tươi mát và lạ miệng. Với những lá rau sống, tôm, thịt bò hoặc thịt gà, và bánh tráng mỏng, món này sẽ làm hài lòng mọi thực khách.', 'thumbnail8.jpg', '2024-04-07 13:04:36'),
(15, 9, 'Bánh xèo - Hương vị giòn tan', 'Bánh xèo là một món ăn truyền thống của miền Nam Việt Nam. Với lớp vỏ giòn tan và nhân thịt heo, tôm và rau sống, món này sẽ khiến bạn không thể cưỡng lại.', 'thumbnail9.jpg', '2024-04-07 13:04:36'),
(16, 10, 'Bún thịt nướng - Hương vị đặc biệt', 'Bún thịt nướng là một món ăn phổ biến và ngon miệng của Việt Nam. Với thịt nướng, bún và rau sống, món này chắc chắn sẽ làm hài lòng bạn.', 'thumbnail10.jpg', '2024-04-07 13:04:36');

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
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `sid` int NOT NULL,
  `sname` varchar(50) NOT NULL,
  `simage` varchar(255) NOT NULL,
  `slink` varchar(255) NOT NULL,
  `sdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`sid`, `sname`, `simage`, `slink`, `sdate`) VALUES
(1, 'Ads_1', 'https://htthuan.id.vn/images/sliders/sliderhome_img3.jpg', 'https://www.grab.com/vn/', '2024-04-07 11:00:14'),
(2, 'Ads_2', 'https://htthuan.id.vn/images/sliders/sliderhome_img1.jpg', 'https://www.grab.com/vn/', '2024-04-07 11:00:14'),
(3, 'Ads_3', 'https://htthuan.id.vn/images/sliders/sliderhome_img2.jpg', 'https://www.grab.com/vn/', '2024-04-07 11:01:50'),
(4, 'Ads_4', 'https://htthuan.id.vn/images/sliders/9978584.jpg', 'https://www.grab.com/vn/', '2024-04-07 11:36:32'),
(5, 'Ads_5', 'https://htthuan.id.vn/images/sliders/sliderhome_img5.jpg', 'https://htthuan.id.vn/images/sliders/sliderhome_img5.jpg', '2024-04-07 11:41:18'),
(6, 'Ads_6', 'https://htthuan.id.vn/images/sliders/sliderhome_img6.jpg', 'https://htthuan.id.vn/images/sliders/sliderhome_img5.jpg', '2024-04-07 11:41:18');

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
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `sid` (`sid`);

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
  MODIFY `dish_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `favourite_food`
--
ALTER TABLE `favourite_food`
  MODIFY `favourite_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `res_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `sid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
