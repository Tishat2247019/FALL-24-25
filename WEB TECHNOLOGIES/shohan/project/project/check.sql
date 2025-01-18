-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2025 at 06:12 PM
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
  `ad_photo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `user_id`, `ad_title`, `ad_description`, `phone`, `email`, `price`, `ad_photo`, `category`) VALUES
(3, 18, 'selling Fridge', ' selling new condition firdge selling new condition firdge selling new condition firdge selling new condition firdge', '0172983423', 'tishat@gmail.com', 72000, 'fridge.jpeg', 'Electronics'),
(4, 13, 'I am Selling Iphone ', 'I am selling a fresh Iphone 13 pro max I am selling a fresh Iphone 13 pro max I am selling a fresh Iphone 13 pro max.Price is not negotiable', '0177234234', 'opi@gmail.com', 47018, 'iphone_1.jpeg', 'Mobile'),
(6, 19, 'iphone 14 pro max', 'asdfasdf asdfasdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf\r\nasdf \r\nasdf\r\n asd\r\nf a\r\nsdf\r\n asdf\r\n a\r\nsdf\r\nas dfasdf ', '01772245237', 'towsif1528@gmail.com', 0, 'kSUXaLsWD6dMQuXrSRYMKg-480-80.jpg', 'Mobile'),
(8, 24, 'seeling fruits', 'ajkl;sdlkjfklasdfljk;a;klsjdf asdlkfjaklsdjflajsdl;kjf asdf', '01839487392', 'shohan@gmail.com', 0, 'fruits.jpg', 'Diverse'),
(9, 24, 'selling home', 'seliing home seliing home seliing home seliing home seliing home seliing home seliing home seliing home fridge', '0182934111', 'aasdf@gmail.com', 0, 'home.jpg', 'Property'),
(10, 78, 'Need a Totor?', 'contact us for a tutor contact us for a tutor contact us for a tutor contact us for a tutor contact us for a tutor contact us for a tutorcontact us for a tutor contact us for a tutor', '018828312123', 'tutor@gmail.com', 4000, 'tutor.png', 'Education');

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
('rafiul hassan', 'profile_pic1.png', '123456', 11, 'rafiul@gmail.com', 'Advertiser', ''),
('tawsif', '', '1234', 12, 'tawsif@gmail.com', 'Admin', ''),
('farjana', 'opi_pic.jpg', '1103', 13, 'farjan@gmail.com', 'Advertiser', 'Active'),
('Shohan', 'shohan.jpeg', '12345', 18, 'advertiser2@gmail.com', 'Advertiser', 'Inactive'),
('Advertiser3', 'profile_pic3.png', '12345', 19, 'advertiser3@gmail.com', 'Advertiser', 'Active'),
('rafiul', 'profile_pic1.png', '123456', 20, 'rafiul@gmail.com', 'Advertiser', ''),
('towsif_adv', 'towsif_pic.jpg', '1234', 24, 'towsifadv@gmail.com', 'Advertiser', 'Active'),
('OpiFarjan', 'opi_pic.jpg\r\n', '123456', 25, 'farjana@gmail.com', 'User', 'Active'),
('JaneSmith', 'profile_pic3.png', 'mypassword1', 40, 'janesmith@example.com', 'Admin', 'Active'),
('SophiaGreen', 'profile_pic6.png', 'sophia2025', 43, 'sophiagreen@gmail.com', 'Admin', 'Inactive'),
('OliviaBlack', 'profile_pic10.png', 'olivia789', 47, 'oliviablack@gmail.com', 'Admin', 'Inactive'),
('MiaOrange', 'profile_pic14.png', 'miapassword2025', 51, 'miaorange@yahoo.com', 'Admin', 'Inactive'),
('ZoeBrown', 'profile_pic16.png', 'zoepassword21', 53, 'zoebrown@aol.com', 'Admin', 'Inactive'),
('JacksonGrey', 'profile_pic19.png', 'jacksonpass789', 56, 'jasongrey@aol.com', 'Admin', 'Active'),
('user1', 'profile_pic1.png', 'password1', 58, 'user1@example.com', 'User', 'Active'),
('user2', 'profile_pic2.png', 'password2', 59, 'user2@example.com', 'Admin', 'Inactive'),
('user3', 'profile_pic3.png', 'password3', 60, 'user3@example.com', 'User', 'Active'),
('user5', 'profile_pic5.png', 'password5', 62, 'user5@example.com', 'Admin', 'Inactive'),
('user6', 'profile_pic1.png', 'password6', 63, 'user6@example.com', 'User', 'Active'),
('useruser', 'profile_pic3.png', 'password8', 65, 'user8@example.com', 'User', 'Inactive'),
('user9', 'profile_pic4.png', 'password9', 66, 'user9@example.com', 'Admin', 'Inactive'),
('user11', 'profile_pic1.png', 'password11', 68, 'user11@example.com', 'Admin', 'Active'),
('user13', 'profile_pic3.png', 'password13', 70, 'user13@example.com', 'Admin', 'Active'),
('user16', 'profile_pic1.png', 'password16', 73, 'user16@example.com', 'Admin', 'Inactive'),
('user19', 'profile_pic4.png', 'password19', 76, 'user19@example.com', 'Admin', 'Active'),
('tutor', 'profile_pic2.png', '110918', 78, 'tutor@gmail.com', 'Advertiser', 'Active');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
