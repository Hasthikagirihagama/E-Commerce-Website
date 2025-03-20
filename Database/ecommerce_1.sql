-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2023 at 09:30 PM
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
-- Database: `ecommerce_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

CREATE TABLE `admin_table` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(200) NOT NULL,
  `admin_image` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_table`
--

INSERT INTO `admin_table` (`admin_id`, `admin_name`, `admin_email`, `admin_image`, `admin_password`) VALUES
(1, 'Hasthika', 'girihagamahasthika@gmail.com', 'M9_C10_A0_P0.png', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Nike'),
(2, 'Adidas'),
(3, 'Tommy Hilfiger'),
(4, 'Calvin Klein'),
(5, 'Tartle'),
(6, 'Carnage'),
(7, 'Chanel'),
(8, 'Levis'),
(9, 'Zara'),
(10, 'Ralph Lauren'),
(13, 'H&M');

-- --------------------------------------------------------

--
-- Table structure for table `card_details`
--

CREATE TABLE `card_details` (
  `product_id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `quantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_title`) VALUES
(3, 'Food'),
(4, 'Clothes'),
(6, 'Electronics'),
(7, 'Accessories');

-- --------------------------------------------------------

--
-- Table structure for table `orders_pending`
--

CREATE TABLE `orders_pending` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `invoice_number` int(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(255) NOT NULL,
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_pending`
--

INSERT INTO `orders_pending` (`order_id`, `user_id`, `invoice_number`, `product_id`, `quantity`, `order_status`) VALUES
(1, 1, 312346784, 1, 3, 'pending'),
(2, 1, 312346784, 2, 1, 'pending'),
(3, 1, 312346784, 4, 1, 'pending'),
(4, 1, 1918753782, 3, 2, 'pending'),
(5, 1, 351837813, 1, 2, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_title` varchar(120) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_keywords` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_image_one` varchar(255) NOT NULL,
  `product_image_two` varchar(255) NOT NULL,
  `product_image_three` varchar(255) NOT NULL,
  `product_price` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(100) NOT NULL,
  `shop_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--
INSERT INTO `products` (`product_id`, `product_title`, `product_description`, `product_keywords`, `category_id`, `brand_id`, `product_image_one`, `product_image_two`, `product_image_three`, `product_price`, `date`, `status`, `shop_id`) VALUES
(1, 'Nike Dri-FIT Crew Training T-Shirt', 'The Nike Dri-FIT Mens T-Shirt delivers a soft feel, sweat-wicking performance and great range of motion to get you through your workout in total comfort.', 'Sports, Clothes', 4, 1, 'nike1.png', 'nike2.png', 'nike3.png', 50, '2025-02-20 16:29:33', 'true', 1),
(2, 'Adidas Originals Trefoil Hoodie', 'The Adidas Originals Trefoil Hoodie is a classic piece that combines comfort and style. Made from soft cotton, it features the iconic Trefoil logo on the chest.', 'Sports, Clothes', 4, 2, 'adidas1.png', 'adidas2.png', 'adidas3.png', 70, '2025-02-20 16:31:31', 'true', 1),
(3, 'Tommy Hilfiger Essential Polo', 'The Tommy Hilfiger Essential Polo is a timeless piece that is perfect for any occasion. Made from high-quality cotton, it features the signature Tommy Hilfiger logo on the chest.', 'Casual, Clothes', 4, 3, 'tommy1.png', 'tommy2.png', 'tommy3.png', 80, '2025-02-20 16:33:31', 'true', 2),
(4, 'Calvin Klein Modern Cotton Bralette', 'The Calvin Klein Modern Cotton Bralette is a comfortable and stylish piece that is perfect for everyday wear. Made from a soft cotton blend, it features the iconic Calvin Klein logo on the band.', 'Underwear, Clothes', 4, 4, 'ck1.png', 'ck2.png', 'ck3.png', 40, '2025-02-20 16:39:31', 'true', 2),
(5, 'H&M Slim Fit Jeans', 'The H&M Slim Fit Jeans are a versatile piece that can be dressed up or down. Made from high-quality denim, they feature a slim fit and classic five-pocket styling.', 'Casual, Clothes', 4, 5, 'hm1.png', 'hm2.png', 'hm3.png', 60, '2025-02-20 16:41:31', 'true', 2),
(6, 'Zara Basic T-Shirt', 'The Zara Basic T-Shirt is a wardrobe essential that is perfect for layering or wearing on its own. Made from soft cotton, it features a classic crew neck and short sleeves.', 'Casual, Clothes', 4, 6, 'zara1.png', 'zara2.png', 'zara3.png', 20, '2025-02-20 16:41:31', 'true', 3),
(7, 'Ralph Lauren Polo Shirt', 'The Ralph Lauren Polo Shirt is a classic piece that is perfect for any occasion. Made from high-quality cotton, it features the signature Ralph Lauren logo on the chest.', 'Casual, Clothes', 4, 7, 'ralph1.png', 'ralph2.png', 'ralph3.png', 90, '2025-02-20 16:41:31', 'true', 3),
(8, 'Levis 501 Original Fit Jeans', 'The Levis 501 Original Fit Jeans are a timeless piece that is perfect for any wardrobe. Made from high-quality denim, they feature a classic straight fit and five-pocket styling.', 'Casual, Clothes', 4, 8, 'levis1.png', 'levis2.png', 'levis3.png', 100, '2025-02-20 16:41:31', 'true', 3);

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `shop_id` int(11) NOT NULL,
  `shop_name` varchar(100) NOT NULL,
  `shop_description` varchar(255) NOT NULL,
  `shop_owner` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`shop_id`, `shop_name`, `shop_description`, `shop_owner`) VALUES
(1, 'Shop A', 'Description for Shop A', 'Owner A'),
(2, 'Shop B', 'Description for Shop B', 'Owner B'),
(3, 'Shop C', 'Description for Shop C', 'Owner C');

-- --------------------------------------------------------

--
-- Table structure for table `user_orders`
--

CREATE TABLE `user_orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount_due` int(255) NOT NULL,
  `invoice_number` int(255) NOT NULL,
  `total_products` int(255) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_status` varchar(255) NOT NULL,
  `shop_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_orders`
--

INSERT INTO `user_orders` (`order_id`, `user_id`, `amount_due`, `invoice_number`, `total_products`, `order_date`, `order_status`, `shop_id`) VALUES
(1, 1, 1160, 312346784, 3, '2023-10-22 15:31:20', 'paid', 1),
(2, 1, 760, 1918753782, 1, '2023-10-24 00:25:10', 'pending', 2),
(3, 1, 240, 351837813, 1, '2023-10-24 18:41:02', 'pending', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_payments`
--

CREATE TABLE `user_payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `invoice_number` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_payments`
--

INSERT INTO `user_payments` (`payment_id`, `order_id`, `invoice_number`, `amount`, `payment_method`, `payment_date`) VALUES
(1, 1, 312346784, 1160, 'paypal', '2023-10-24 00:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_image` varchar(255) NOT NULL,
  `user_ip` varchar(100) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_mobile` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `username`, `user_email`, `user_password`, `user_image`, `user_ip`, `user_address`, `user_mobile`) VALUES
(1, 'Hasthika', 'girihagamahasthika@gmail.com', '1234', 'M9_C10_A0_P0.png', '::1', 'SriLanka', '123456789');

--
-- Table structure for table `shop_product_orders`
--

CREATE TABLE shop_product_orders (
    shop_name VARCHAR(100),
    product_title VARCHAR(120),
    total_orders INT
);

-- Populate shop_product_orders table with data from orders_pending
INSERT INTO shop_product_orders (shop_name, product_title, total_orders)
SELECT 
    s.shop_name,
    p.product_title,
    SUM(op.quantity) AS total_orders
FROM 
    orders_pending op
JOIN 
    products p ON op.product_id = p.product_id
JOIN 
    shops s ON p.shop_id = s.shop_id
GROUP BY 
    s.shop_name, p.product_title
ORDER BY 
    s.shop_name, p.product_title;

-- Populate shop_product_orders table with data from user_orders
INSERT INTO shop_product_orders (shop_name, product_title, total_orders)
SELECT 
    s.shop_name,
    p.product_title,
    SUM(uo.total_products) AS total_orders
FROM 
    user_orders uo
JOIN 
    products p ON uo.shop_id = p.shop_id
JOIN 
    shops s ON p.shop_id = s.shop_id
GROUP BY 
    s.shop_name, p.product_title
ORDER BY 
    s.shop_name, p.product_title;

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_table`
--
ALTER TABLE `admin_table`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `card_details`
--
ALTER TABLE `card_details`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orders_pending`
--
ALTER TABLE `orders_pending`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `user_payments`
--
ALTER TABLE `user_payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_table`
--
ALTER TABLE `admin_table`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders_pending`
--
ALTER TABLE `orders_pending`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `shop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_orders`
--
ALTER TABLE `user_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_payments`
--
ALTER TABLE `user_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
