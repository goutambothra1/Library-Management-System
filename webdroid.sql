-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2023 at 09:54 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webdroid`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `cpassword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `full_name`, `email`, `password`, `cpassword`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$eA9I2YbB9.o2GmVP231pHu1a.gw72qPQTLSiUtN0doq9xoejYCA1m', '$2y$10$eA9I2YbB9.o2GmVP231pHu1a.gw72qPQTLSiUtN0doq9xoejYCA1m');

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(255) NOT NULL,
  `author_name` varchar(255) NOT NULL,
  `admin_id` int(255) DEFAULT NULL,
  `faculty_id` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `author_name`, `admin_id`, `faculty_id`) VALUES
(1, 'Pankaj Jalote', 1, NULL),
(2, 'D.P.Acharjiya', 1, NULL),
(3, 'Abraham Silberschatz', 1, NULL),
(4, 'Herbert Schildt', 1, NULL),
(5, 'Richard F. Gilberg', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `isbn` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author_id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `course_id` bigint(11) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `semester` int(255) NOT NULL,
  `faculty_id` int(255) DEFAULT NULL,
  `admin_id` int(255) DEFAULT NULL,
  `cover` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `status` text NOT NULL,
  `student_id` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `isbn`, `title`, `author_id`, `description`, `course_id`, `branch_id`, `semester`, `faculty_id`, `admin_id`, `cover`, `file`, `status`, `student_id`) VALUES
(1, 10002130, 'A Concise Introduction to Software Engineering-2nd Edition', 1, 'An introductory course on Software Engineering remains one of the hardest\r\nsubjects to teach largely because of the wide range of topics the area encompasses.', 1, 2, 1, 1, NULL, '63fe0b5b5d95c5.37988754.png', '63fe0a1ba37f69.53030954.pdf', 'Approved', NULL),
(2, 10002131, 'Fundamental approach to discrete mathematics-2nd Edition', 2, 'A discrete mathematics course has many objectives that students should learn the\r\nessentials of mathematics and how to think mathematically. To achieve these objectives,\r\nwe emphasized on mathematical reasoning and problem solving techniques in this book.\r\n', 4, 1, 1, 2, NULL, '64078a485f9e37.91487075.png', '64078a485fdbb0.11569133.pdf', 'Rejected', NULL),
(3, 10002132, 'Java The Complete Reference,12th Edition', 4, 'A key reason for Java’s success is its agility. Since its original 1.0 release, Java has \r\ncontinually adapted to changes in the programming environment and to changes in the \r\nway that programmers program', 4, 1, 2, 1, NULL, '64303d53399596.01151896.jpg', '64303d5339f853.96228301.pdf', 'Pending', NULL),
(4, 10002134, 'C++ The Complete Reference-4th Edition', 4, 'This is the fourth edition of C++: The Complete Reference. It fully describes and\r\ndemonstrates the keywords, syntax, functions, classes, and features that define the C++\r\nlanguage. More specifically, this book fully describes Standard C++.', 4, 1, 1, NULL, 1, '6443836f3ae756.71068142.jpg', '6443836f3b1c76.83685967.pdf', 'Approved', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branch_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `branch_name` varchar(255) NOT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `course_id`, `branch_name`, `admin_id`) VALUES
(1, 4, 'MCA', 1),
(2, 1, 'Computer Science', 1),
(3, 1, 'Information Technology', 1),
(4, 1, 'Networking', 1),
(5, 2, 'Computer Science', 1),
(6, 2, 'Civil Engineering', 1),
(7, 2, 'Chemical Engineering', 1),
(8, 2, 'Mechanical Engineering', 1),
(9, 3, 'Mathematics', 1),
(10, 3, 'Physics', 1),
(11, 2, 'Data Science & Engineering', 1),
(12, 2, 'Electronic & Communication Engineering', 1),
(13, 2, 'Biotechnology', 1),
(14, 2, 'Automobile Engineering', 1);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` bigint(11) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `admin_id` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `admin_id`) VALUES
(1, 'M-tech', 1),
(2, 'B-tech', 1),
(3, 'MSc', 1),
(4, 'MCA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `regno` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cpassword` varchar(255) NOT NULL,
  `phone` bigint(12) NOT NULL,
  `profile_type` varchar(255) NOT NULL,
  `dept` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `tokenexpire` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `name`, `regno`, `email`, `password`, `cpassword`, `phone`, `profile_type`, `dept`, `token`, `tokenexpire`) VALUES
(1, 'Kaushik M R', 230094391, 'kaushikmendon65@gmail.com', '$2y$10$IbruUmnzGrZW7.5NAVSu7Ot4V/BoEFKJodb39JOCRiH7X97V7Qfeu', '$2y$10$IbruUmnzGrZW7.5NAVSu7Ot4V/BoEFKJodb39JOCRiH7X97V7Qfeu', 8496038431, 'Faculty', 'DS&CA', 'fc19b7d05fb4e320d9e41e796356590c', '2023-04-23'),
(2, 'Gautham', 230094392, 'jaingautam28@gmail.com', '$2y$10$xevWGy1GCNudX7DkAbn2x.drN0JfPe5/aKU9oR9t9EVkzOjRP1foe', '$2y$10$NimLgbuoMLjhPeXHILNktOcoKB8RmVJwjvJJLk0xPuuGAcbjwi2h6', 0, 'Faculty', 'DS&CA', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `regno` bigint(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cpassword` varchar(255) NOT NULL,
  `phone` bigint(12) NOT NULL,
  `profile_type` varchar(255) NOT NULL,
  `course` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `tokenexpire` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `regno`, `password`, `cpassword`, `phone`, `profile_type`, `course`, `token`, `tokenexpire`) VALUES
(1, 'Rohan Kamath', 'rkamath391@gmail.com', 220970001, '$2y$10$an2vAw3vLpDw0wJgOuUrZ.Aipd2WBN1QEKW85G92oneSbmcIe3/Pe', '$2y$10$OVnBF18mQG7DttHF9TivTO13w091qBcYRNq1rMO3ra0CRlp3JVGfe', 8496038431, 'Student', 'MCA', '77f1a11c710153d4c7e02661dad65cb5', '2023-04-23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`),
  ADD KEY `admin_author` (`admin_id`),
  ADD KEY `faculty_author` (`faculty_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `isbn` (`isbn`),
  ADD KEY `branchTest2` (`branch_id`),
  ADD KEY `courseTest2` (`course_id`),
  ADD KEY `AuthorTest` (`author_id`),
  ADD KEY `faculty_book` (`faculty_id`),
  ADD KEY `admin_book` (`admin_id`),
  ADD KEY `student_book` (`student_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `courseTest` (`course_id`),
  ADD KEY `admin_branch` (`admin_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `admin_courses` (`admin_id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `regno` (`regno`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `regno` (`regno`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `author`
--
ALTER TABLE `author`
  ADD CONSTRAINT `admin_author` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `faculty_author` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `AuthorTest` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_book` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `branchTest2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `courseTest2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faculty_book` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `student_book` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `admin_branch` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `courseTest` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `admin_courses` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
