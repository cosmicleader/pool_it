-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: May 09, 2023 at 10:09 AM
-- Server version: 8.0.32
-- PHP Version: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pool_it`
--

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `profile_id` int NOT NULL,
  `rating` float NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`profile_id`, `rating`, `name`, `contact`, `email`, `password`) VALUES
(1, 5, 'Arun', '7833825596', 'arun123@gmail.com', 'Arun@123'),
(100, 3, 'Arun', '9747072557', 'arun@gmail.com', 'Arun@123'),
(101, 3.5, 'Vishnu', '8547635320', 'vishnuhari@gmail.com', 'Vishnu@8547'),
(102, 4.5, 'Athira', '7994099538', 'athiraathi@gmail.com', 'Athi@9747'),
(103, 2.5, 'Varsha', '7510253435', 'varsha124@gmail.com', 'Varsha@789'),
(104, 4, 'Rani', '8590633525', 'Rani2000@gmail.com', 'Rani@8590'),
(105, 5, 'saheed', '07654325421', 'example@email.com', '1234567890iy'),
(107, 5, 'saheed', '07654325421', 'exampvvle@email.com', '1234567890iy');

-- --------------------------------------------------------

--
-- Table structure for table `routematch`
--

CREATE TABLE `routematch` (
  `id` int NOT NULL,
  `location` varchar(255) NOT NULL,
  `driver_name` varchar(255) NOT NULL,
  `journey_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `routematch`
--

INSERT INTO `routematch` (`id`, `location`, `driver_name`, `journey_date`) VALUES
(1, 'Los Angeles', 'Sarah Johnson', '2022-01-01'),
(2, 'New York City', 'Mark Smith', '2022-01-02'),
(3, 'San Francisco', 'Anna Lee', '2022-01-03'),
(4, 'Chicago', 'James Lee', '2022-01-04'),
(5, 'Seattle', 'Jessica Brown', '2022-01-05'),
(6, 'Austin', 'Emily Davis', '2022-01-06'),
(7, 'Miami', 'Michael Jones', '2022-01-07'),
(8, 'Philadelphia', 'William Kim', '2022-01-08'),
(9, 'Atlanta', 'Melissa Lee', '2022-01-09'),
(10, 'Boston', 'Richard Lee', '2022-01-10'),
(11, 'Denver', 'Rachel Kim', '2022-01-11'),
(12, 'San Diego', 'Anthony Lee', '2022-01-12'),
(13, 'Dallas', 'Elizabeth Kim', '2022-01-13'),
(14, 'Washington DC', 'Matthew Lee', '2022-01-14'),
(15, 'Houston', 'Andrew Kim', '2022-01-15'),
(16, 'Portland', 'Madison Lee', '2022-01-16'),
(17, 'Phoenix', 'Ashley Kim', '2022-01-17'),
(18, 'Charlotte', 'Christopher Lee', '2022-01-18'),
(19, 'San Antonio', 'Olivia Kim', '2022-01-19'),
(20, 'Las Vegas', 'David Lee', '2022-01-20'),
(21, 'Minneapolis', 'Sophia Kim', '2022-01-21'),
(22, 'New Orleans', 'Michael Lee', '2022-01-22'),
(23, 'Orlando', 'Grace Kim', '2022-01-23'),
(24, 'Salt Lake City', 'John Lee', '2022-01-24'),
(25, 'Nashville', 'Avery Kim', '2022-01-25'),
(26, 'Kansas City', 'Victoria Lee', '2022-01-26'),
(27, 'Tucson', 'Ethan Kim', '2022-01-27'),
(28, 'St. Louis', 'Natalie Lee', '2022-01-28'),
(29, 'Raleigh', 'Isaac Kim', '2022-01-29'),
(30, 'Pittsburgh', 'Emma Lee', '2022-01-30'),
(31, 'Cincinnati', 'Daniel Kim', '2022-01-31'),
(32, 'Tampa', 'Sophie Lee', '2022-02-01'),
(33, 'Oakland', 'Dylan Kim', '2022-02-02'),
(34, 'Baltimore', 'Lily Lee', '2022-02-03'),
(35, 'Milwaukee', 'Joshua Kim', '2022-02-04'),
(36, 'Sacramento', 'Audrey Lee', '2022-02-05'),
(37, 'San Jose', 'Elijah Kim', '2022-02-06'),
(38, 'Memphis', 'Charlotte Lee', '2022-02-07'),
(39, 'Oklahoma City', 'Levi Kim', '2022-02-08'),
(40, 'Louisville', 'Hannah Lee', '2022-02-09'),
(41, 'Austin', 'Noah Kim', '2022-02-10');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `departure_date` date NOT NULL,
  `return_date` date NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `title`, `description`, `departure_date`, `return_date`, `price`) VALUES
(1, 'Europe Trip', 'A trip to Europe is a great way to experience different cultures and see some of the most beautiful scenery in the world. You can visit historical landmarks, explore ancient ruins, and enjoy the many different cuisines.', '2023-06-01', '2023-06-15', 1000.00),
(2, 'Asia Trip', 'An Asia trip is a great way to experience the diversity of this vast continent. You can visit bustling cities, ancient temples, and stunning natural wonders.', '2023-07-01', '2023-07-15', 1500.00),
(3, 'Africa Trip', 'An Africa trip is a great way to experience the beauty and wildlife of this continent. You can go on safari, visit ancient ruins, and enjoy the many different cultures.', '2023-08-01', '2023-08-15', 2000.00),
(4, 'South America Trip', 'A South America trip is a great way to experience the diversity of this continent. You can visit the Amazon rainforest, Machu Picchu, and the many different cultures.', '2023-09-01', '2023-09-15', 2500.00),
(5, 'North America Trip', 'A North America trip is a great way to experience the diversity of this continent. You can visit the Grand Canyon, Niagara Falls, and the many different cultures.', '2023-10-01', '2023-10-15', 3000.00),
(6, 'Australia Trip', 'An Australia trip is a great way to experience the beauty and wildlife of this continent. You can go on a kangaroo tour, visit the Sydney Opera House, and enjoy the many different cultures.', '2023-11-01', '2023-11-15', 3500.00),
(7, 'New Zealand Trip', 'A New Zealand trip is a great way to experience the beauty and wildlife of this country. You can go on a hike in the mountains, visit Hobbiton, and enjoy the many different cultures.', '2023-12-01', '2023-12-15', 4000.00),
(8, 'Alaska Trip', 'An Alaska trip is a great way to experience the beauty and wildlife of this state. You can go on a whale watching tour, visit Denali National Park, and enjoy the many different cultures.', '2024-01-01', '2024-01-15', 4500.00),
(9, 'Hawaii Trip', 'A Hawaii trip is a great way to experience the beauty and culture of this state. You can go on a surfing lesson, visit Pearl Harbor, and enjoy the many different beaches.', '2024-02-01', '2024-02-15', 5000.00),
(10, 'Caribbean Trip', 'A Caribbean trip is a great way to experience the beauty and culture of this region. You can go on a snorkeling trip, visit a tropical island, and enjoy the many different beaches.', '2024-03-01', '2024-03-15', 5500.00);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `email`, `password`) VALUES
(1, 'kevin@kevin.com', ''),
(2, 'lisa@lisa.com', ''),
(3, 'arturo@arturo.com', ''),
(4, 'Sobham@sobhan.com', ''),
(5, 'email@email.com', '$2a$10$yHdQ3cBZVaiNGlHZTpkGqOPx7fGkBnO3jLyHCI0VNLO8YjiaPAXVm');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `routematch`
--
ALTER TABLE `routematch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `profile_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `routematch`
--
ALTER TABLE `routematch`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
