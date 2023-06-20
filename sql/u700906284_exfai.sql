-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 12, 2023 at 03:49 PM
-- Server version: 10.6.12-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u700906284_islam2`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_usersid` int(11) NOT NULL,
  `address_name` varchar(255) NOT NULL,
  `address_city` varchar(255) NOT NULL,
  `address_street` varchar(255) NOT NULL,
  `address_lat` double NOT NULL,
  `address_long` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `admin_phone` int(30) NOT NULL,
  `admin_verifycode` varchar(30) NOT NULL,
  `admin_approve` tinyint(4) NOT NULL DEFAULT 0,
  `admin_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_usersid` int(11) NOT NULL,
  `cart_itemsid` int(11) NOT NULL,
  `cart_orders` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_usersid`, `cart_itemsid`, `cart_orders`) VALUES
(63, 126, 1, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cartview`
-- (See below for the actual view)
--
CREATE TABLE `cartview` (
`itemsprice` double
,`countitems` bigint(21)
,`cart_id` int(11)
,`cart_usersid` int(11)
,`cart_itemsid` int(11)
,`cart_orders` int(11)
,`items_id` int(11)
,`items_name` varchar(255)
,`items_name_ar` varchar(255)
,`items_desc` varchar(500)
,`items_desc_ar` varchar(500)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(255) NOT NULL,
  `categories_name_ar` varchar(255) NOT NULL,
  `categories_image` varchar(255) NOT NULL,
  `categories_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_name_ar`, `categories_image`, `categories_datetime`) VALUES
(2, 'laptop', 'لابتوب', 'laptop.svg', '2023-05-07 14:35:38'),
(3, 'camera', 'كاميرا', 'camera.svg', '2023-05-07 14:35:38'),
(4, 'mobile', 'موبايل', 'mobile.svg', '2023-05-07 14:37:52'),
(5, 'shoes', 'احذيه', 'shoes.svg', '2023-05-07 14:37:52'),
(6, 'dress', 'فستان', 'dress.svg', '2023-05-07 14:38:41'),
(8, 'decor', 'ديكور', 'decor.svg', '2023-05-25 19:42:37');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_name` varchar(255) NOT NULL,
  `coupon_count` int(11) NOT NULL,
  `coupon_discount` smallint(6) NOT NULL,
  `coupon_expiredate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `coupon_name`, `coupon_count`, `coupon_discount`, `coupon_expiredate`) VALUES
(1, 'islam', 94, 10, '2023-05-31 18:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `delivery_name` varchar(255) NOT NULL,
  `delivery_email` varchar(255) NOT NULL,
  `delivery_phone` int(30) NOT NULL,
  `delivery_verifycode` varchar(30) NOT NULL DEFAULT '0',
  `delivery_approve` tinyint(4) NOT NULL,
  `delivery_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `delivery_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL,
  `favorite_usersid` int(11) NOT NULL,
  `favorite_itemsid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`favorite_id`, `favorite_usersid`, `favorite_itemsid`) VALUES
(30, 126, 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `items_id` int(11) NOT NULL,
  `items_name` varchar(255) NOT NULL,
  `items_name_ar` varchar(255) NOT NULL,
  `items_desc` varchar(500) NOT NULL,
  `items_desc_ar` varchar(500) NOT NULL,
  `items_image` varchar(255) NOT NULL,
  `items_count` int(11) NOT NULL,
  `items_active` tinyint(4) NOT NULL DEFAULT 1,
  `items_price` float NOT NULL,
  `items_discount` smallint(6) NOT NULL,
  `items_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `items_cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`items_id`, `items_name`, `items_name_ar`, `items_desc`, `items_desc_ar`, `items_image`, `items_count`, `items_active`, `items_price`, `items_discount`, `items_date`, `items_cat`) VALUES
(1, 'Your ', 'يحتوي ', 'Your flutter ', ' باستخدام', 'laptop.png', 6, 1, 300, 0, '2023-05-09 15:42:08', 2),
(8, 'decor', 'ديكور', 'decor', 'ديكور', '1.jpg', 60, 1, 350, 10, '2023-05-25 19:51:56', 8),
(9, 'decor', 'ديكور', 'decor', 'ديكور', '2.jpg', 35, 1, 350, 10, '2023-05-25 19:51:56', 8);

-- --------------------------------------------------------

--
-- Stand-in structure for view `items1view`
-- (See below for the actual view)
--
CREATE TABLE `items1view` (
`items_id` int(11)
,`items_name` varchar(255)
,`items_name_ar` varchar(255)
,`items_desc` varchar(500)
,`items_desc_ar` varchar(500)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
,`categories_id` int(11)
,`categories_name` varchar(255)
,`categories_name_ar` varchar(255)
,`categories_image` varchar(255)
,`categories_datetime` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemstopselling`
-- (See below for the actual view)
--
CREATE TABLE `itemstopselling` (
`countitems` bigint(21)
,`cart_id` int(11)
,`cart_usersid` int(11)
,`cart_itemsid` int(11)
,`cart_orders` int(11)
,`items_id` int(11)
,`items_name` varchar(255)
,`items_name_ar` varchar(255)
,`items_desc` varchar(500)
,`items_desc_ar` varchar(500)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
,`itemspricedisount` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `myfavorite`
-- (See below for the actual view)
--
CREATE TABLE `myfavorite` (
`favorite_id` int(11)
,`favorite_usersid` int(11)
,`favorite_itemsid` int(11)
,`items_id` int(11)
,`items_name` varchar(255)
,`items_name_ar` varchar(255)
,`items_desc` varchar(500)
,`items_desc_ar` varchar(500)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
,`users_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `notification_title` varchar(255) NOT NULL,
  `notification_body` varchar(255) NOT NULL,
  `notification_userid` int(11) NOT NULL,
  `notification_datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `orders_usersid` int(11) NOT NULL,
  `orders_address` int(11) NOT NULL,
  `orders_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 => delivery ; 1 => recive ',
  `orders_pricedelivery` int(11) NOT NULL DEFAULT 0,
  `orders_price` int(11) NOT NULL,
  `orders_coupon` int(11) NOT NULL DEFAULT 0,
  `orders_rating` tinyint(4) NOT NULL DEFAULT 0,
  `orders_noterating` varchar(255) NOT NULL DEFAULT 'none',
  `orders_paymentmethod` tinyint(11) NOT NULL DEFAULT 0 COMMENT '0 => cash ; 1 => paymentcard',
  `orders_status` tinyint(4) NOT NULL DEFAULT 0,
  `orders_datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersdetailsview`
-- (See below for the actual view)
--
CREATE TABLE `ordersdetailsview` (
`itemsprice` double
,`countitems` bigint(21)
,`cart_id` int(11)
,`cart_usersid` int(11)
,`cart_itemsid` int(11)
,`cart_orders` int(11)
,`items_id` int(11)
,`items_name` varchar(255)
,`items_name_ar` varchar(255)
,`items_desc` varchar(500)
,`items_desc_ar` varchar(500)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` timestamp
,`items_cat` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersview`
-- (See below for the actual view)
--
CREATE TABLE `ordersview` (
`orders_id` int(11)
,`orders_usersid` int(11)
,`orders_address` int(11)
,`orders_type` tinyint(4)
,`orders_pricedelivery` int(11)
,`orders_price` int(11)
,`orders_coupon` int(11)
,`orders_rating` tinyint(4)
,`orders_noterating` varchar(255)
,`orders_paymentmethod` tinyint(11)
,`orders_status` tinyint(4)
,`orders_datetime` datetime
,`address_id` int(11)
,`address_usersid` int(11)
,`address_name` varchar(255)
,`address_city` varchar(255)
,`address_street` varchar(255)
,`address_lat` double
,`address_long` double
);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL,
  `settings_titleome` varchar(255) NOT NULL,
  `settings_bodyhome` varchar(255) NOT NULL,
  `settings_deliverytime` int(11) NOT NULL DEFAULT 30
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `settings_titleome`, `settings_bodyhome`, `settings_deliverytime`) VALUES
(1, 'A summer surprise', 'Cashback 50%', 30);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `users_name` varchar(255) NOT NULL,
  `users_email` varchar(255) NOT NULL,
  `users_verifycode` varchar(30) NOT NULL,
  `users_approve` tinyint(4) NOT NULL DEFAULT 1,
  `users_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `users_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `users_name`, `users_email`, `users_verifycode`, `users_approve`, `users_create`, `users_password`) VALUES
(126, 'islam', 'islam@gmail.com', '66224', 1, '2023-06-10 16:08:49', '0f315d32ad05a7148f0eb1aaf054599c1712198f'),
(205, 'fefef', 'fefef@gmail.com', '78124', 1, '2023-06-12 14:59:57', '56b411ba17d7418bdad32b8c4b1c411ddd71a818'),
(206, 'cdacac', 'cscsc@gmail.com', '12519', 1, '2023-06-12 15:01:15', 'f882c069c594211fb92ce3b59756e5a8db8de8c7');

-- --------------------------------------------------------

--
-- Structure for view `cartview`
--
DROP TABLE IF EXISTS `cartview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u700906284_islam2`@`127.0.0.1` SQL SECURITY DEFINER VIEW `cartview`  AS SELECT sum(`items`.`items_price` - `items`.`items_price` * `items`.`items_discount` / 100) AS `itemsprice`, count(`cart`.`cart_itemsid`) AS `countitems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat` FROM (`cart` join `items` on(`items`.`items_id` = `cart`.`cart_itemsid`)) WHERE `cart`.`cart_orders` = 0 GROUP BY `cart`.`cart_itemsid`, `cart`.`cart_usersid`, `cart`.`cart_orders` ;

-- --------------------------------------------------------

--
-- Structure for view `items1view`
--
DROP TABLE IF EXISTS `items1view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u700906284_islam2`@`127.0.0.1` SQL SECURITY DEFINER VIEW `items1view`  AS SELECT `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `categories`.`categories_id` AS `categories_id`, `categories`.`categories_name` AS `categories_name`, `categories`.`categories_name_ar` AS `categories_name_ar`, `categories`.`categories_image` AS `categories_image`, `categories`.`categories_datetime` AS `categories_datetime` FROM (`items` join `categories` on(`items`.`items_cat` = `categories`.`categories_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `itemstopselling`
--
DROP TABLE IF EXISTS `itemstopselling`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u700906284_islam2`@`127.0.0.1` SQL SECURITY DEFINER VIEW `itemstopselling`  AS SELECT count(`cart`.`cart_id`) AS `countitems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `items`.`items_price`- `items`.`items_price` * `items`.`items_discount` / 100 AS `itemspricedisount` FROM (`cart` join `items` on(`items`.`items_id` = `cart`.`cart_itemsid`)) WHERE `cart`.`cart_orders` <> 0 GROUP BY `cart`.`cart_itemsid` ;

-- --------------------------------------------------------

--
-- Structure for view `myfavorite`
--
DROP TABLE IF EXISTS `myfavorite`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u700906284_islam2`@`127.0.0.1` SQL SECURITY DEFINER VIEW `myfavorite`  AS SELECT `favorite`.`favorite_id` AS `favorite_id`, `favorite`.`favorite_usersid` AS `favorite_usersid`, `favorite`.`favorite_itemsid` AS `favorite_itemsid`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `users`.`users_id` AS `users_id` FROM ((`favorite` join `users` on(`users`.`users_id` = `favorite`.`favorite_usersid`)) join `items` on(`items`.`items_id` = `favorite`.`favorite_itemsid`)) ;

-- --------------------------------------------------------

--
-- Structure for view `ordersdetailsview`
--
DROP TABLE IF EXISTS `ordersdetailsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u700906284_islam2`@`127.0.0.1` SQL SECURITY DEFINER VIEW `ordersdetailsview`  AS SELECT sum(`items`.`items_price` - `items`.`items_price` * `items`.`items_discount` / 100) AS `itemsprice`, count(`cart`.`cart_itemsid`) AS `countitems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat` FROM (`cart` join `items` on(`items`.`items_id` = `cart`.`cart_itemsid`)) WHERE `cart`.`cart_orders` <> 0 GROUP BY `cart`.`cart_itemsid`, `cart`.`cart_usersid`, `cart`.`cart_orders` ;

-- --------------------------------------------------------

--
-- Structure for view `ordersview`
--
DROP TABLE IF EXISTS `ordersview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u700906284_islam2`@`127.0.0.1` SQL SECURITY DEFINER VIEW `ordersview`  AS SELECT `orders`.`orders_id` AS `orders_id`, `orders`.`orders_usersid` AS `orders_usersid`, `orders`.`orders_address` AS `orders_address`, `orders`.`orders_type` AS `orders_type`, `orders`.`orders_pricedelivery` AS `orders_pricedelivery`, `orders`.`orders_price` AS `orders_price`, `orders`.`orders_coupon` AS `orders_coupon`, `orders`.`orders_rating` AS `orders_rating`, `orders`.`orders_noterating` AS `orders_noterating`, `orders`.`orders_paymentmethod` AS `orders_paymentmethod`, `orders`.`orders_status` AS `orders_status`, `orders`.`orders_datetime` AS `orders_datetime`, `address`.`address_id` AS `address_id`, `address`.`address_usersid` AS `address_usersid`, `address`.`address_name` AS `address_name`, `address`.`address_city` AS `address_city`, `address`.`address_street` AS `address_street`, `address`.`address_lat` AS `address_lat`, `address`.`address_long` AS `address_long` FROM (`orders` left join `address` on(`address`.`address_id` = `orders`.`orders_address`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `address_usersid` (`address_usersid`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_usersid` (`cart_usersid`),
  ADD KEY `cart_itemsid` (`cart_itemsid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `coupon_name` (`coupon_name`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `favorite_itemsid` (`favorite_itemsid`),
  ADD KEY `favorite_usersid` (`favorite_usersid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`items_id`),
  ADD KEY `users_cat` (`items_cat`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settings_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`),
  ADD UNIQUE KEY `users_verfiycode` (`users_verifycode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`address_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cart_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_itemsid`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`favorite_itemsid`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`favorite_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`items_cat`) REFERENCES `categories` (`categories_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
