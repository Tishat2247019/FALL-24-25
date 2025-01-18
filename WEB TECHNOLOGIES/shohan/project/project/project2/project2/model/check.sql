-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2025 at 06:50 PM
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
-- Database: `check`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ad_title` varchar(255) NOT NULL,
  `ad_description` mediumtext NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `ad_photo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `user_id`, `ad_title`, `ad_description`, `phone`, `email`, `price`, `ad_photo`) VALUES
(1, 11, 'selling Tv', 'I am selling a fresh tv', '0188239843', 'rafiul@gmail.com', 45000, 'tv1.png'),
(2, 20, 'selling new tv', 'I am selling a fresh tv I am selling a fresh tv I am selling a fresh tv I am selling a fresh tv', '01882324332', 'towsif1528@gmail.com', 10000, 'tv2.png'),
(3, 18, 'selling Fridge', ' selling new condition firdge selling new condition firdge selling new condition firdge selling new condition firdge', '0172983423', 'tishat@gmail.com', 72000, 'fridge.jpeg'),
(4, 13, 'I am Selling Iphone ', 'I am selling a fresh Iphone 13 pro max I am selling a fresh Iphone 13 pro max I am selling a fresh Iphone 13 pro max.Price is not negotiable', '0177234234', 'opi@gmail.com', 47018, 'iphone_1.jpeg'),
(6, 19, 'iphone 14 pro max', 'asdfasdf asdfasdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf\r\nasdf \r\nasdf\r\n asd\r\nf a\r\nsdf\r\n asdf\r\n a\r\nsdf\r\nas dfasdf ', '01772245237', 'towsif1528@gmail.com', 0, 'kSUXaLsWD6dMQuXrSRYMKg-480-80.jpg'),
(7, 13, 'Selling a Home', 'I am Selling a home of 120000 sq feet.\r\nDiscover your dream home! This expansive property offers 120,000 sq. ft. of premium space, perfect for residential, commercial, or investment purposes. With modern architecture, spacious interiors, and lush outdoor surroundings, this property is a rare gem in the real estate market.', '01839487392', 'home@gmail.com', 100000, 'home.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `profile_pic` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `profile_pic`, `password`, `user_id`, `email`, `type`, `status`) VALUES
('admin', 'admin_pic.jpg', '110918', 1, 'towsif1528@gmail.com', 'Admin', ''),
('Tishat', '', '1234', 7, 'tishattawsif@gmail.com', 'Admin', ''),
('', 'profile_pic3.png', '12345678', 9, 'rafiul@gmail.com', 'User', 'Active'),
('Md. Samim', 'profile_pic4.png\r\n', '12', 10, 'asdf@dsf', 'User', 'Active'),
('rafiul hassan', 'profile_pic1.png', '123456', 11, 'rafiul@gmail.com', 'Advertiser', ''),
('tawsif', '', '1234', 12, 'tawsif@gmail.com', 'Admin', ''),
('farjana', 'opi_pic.jpg', '1103', 13, 'farjan@gmail.com', 'Advertiser', 'Active'),
('Towsif', 'towsif_pic.jpg', '11', 15, 'towsif1528@gmail.com', 'User', 'Active'),
('tishatt', 'profile_pic1.png', '12', 16, 'tishat@gmail.com', 'User', 'Inactive'),
('Shohan', 'shohan.jpeg', '12345', 18, 'advertiser2@gmail.com', 'Advertiser', 'Inactive'),
('Advertiser3', 'profile_pic3.png', '12345', 19, 'advertiser3@gmail.com', 'Advertiser', 'Active'),
('rafiul', 'profile_pic1.png', '123456', 20, 'rafiul@gmail.com', 'Advertiser', ''),
('', '', 'ff', 21, 'f@gmail.co', 'User', ''),
('bishal', '', '123456', 22, 'asdf@dsf.com', 'User', 'Active'),
('Mobile', '', '110918', 23, 'Samim@gmail.com', 'User', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
