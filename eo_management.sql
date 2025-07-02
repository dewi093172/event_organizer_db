-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2025 at 08:10 AM
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
-- Database: `eo_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendees`
--

CREATE TABLE `attendees` (
  `attendee_id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendees`
--

INSERT INTO `attendees` (`attendee_id`, `name`, `email`, `phone`) VALUES
('ATD401', 'Harry James Potter', 'suheri@gmail.com', '081234567890'),
('ATD402', 'Hermione Granger', 'hermanican@gmail.com', '081234567891'),
('ATD403', 'Draco Malfoy', 'bankmalpoy@gmail.com', '081234567892');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` varchar(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `date` date NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `user_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `title`, `description`, `date`, `location`, `user_id`) VALUES
('EVT201', 'Seminar AI', 'Seminar tentang kecerdasan buatan dan implementasinya di industri.', '2025-03-15', 'Aula Kampus A', 'USR111'),
('EVT202', 'Workshop UI/UX', 'Pelatihan intensif desain antarmuka dan pengalaman pengguna.', '2025-05-01', 'Lab Multimedia', 'USR102'),
('EVT203', 'Job Fair 2025', 'Pameran karier dan rekrutmen oleh berbagai perusahaan nasional.', '2025-01-10', 'Gedung Serba Guna', 'USR173');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` varchar(10) NOT NULL,
  `attendee_id` varchar(10) NOT NULL,
  `ticket_id` varchar(10) NOT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `attendee_id`, `ticket_id`, `order_date`, `quantity`) VALUES
('ORD501', 'ATD401', 'TKT301', '2025-06-30 08:52:46', 2),
('ORD502', 'ATD402', 'TKT302', '2025-06-30 08:52:46', 1),
('ORD503', 'ATD403', 'TKT303', '2025-06-30 08:52:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` varchar(10) NOT NULL,
  `event_id` varchar(10) NOT NULL,
  `ticket_type` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `quota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`ticket_id`, `event_id`, `ticket_type`, `price`, `quota`) VALUES
('TKT301', 'EVT201', 'Reguler', 50000.00, 100),
('TKT302', 'EVT201', 'VIP', 100000.00, 30),
('TKT303', 'EVT202', 'Reguler', 75000.00, 50),
('TKT304', 'EVT203', 'Reguler', 0.00, 200);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`) VALUES
('USR102', 'Severus Snape', 'omsnape@gmail.com', 'alwaYslilY'),
('USR111', 'Albus Dumbledore', 'masteralbus@gmail.com', 'passantijeb0l'),
('USR173', 'Sirius Black', 'blacky@gmail.com', 'tahaNanabad1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendees`
--
ALTER TABLE `attendees`
  ADD PRIMARY KEY (`attendee_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `attendee_id` (`attendee_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`attendee_id`) REFERENCES `attendees` (`attendee_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
