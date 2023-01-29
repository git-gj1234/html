-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2023 at 09:00 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `OID` int(11) DEFAULT NULL,
  `PID` varchar(10) DEFAULT NULL,
  `quan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `bills`
--
DELIMITER $$
CREATE TRIGGER `reduce_quantity` AFTER INSERT ON `bills` FOR EACH ROW update store_inv 
set quan = quan-(new.quan)
where pid = new.PID
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boizz`
--

CREATE TABLE `delivery_boizz` (
  `DID` int(11) NOT NULL,
  `Delivery_name` varchar(50) DEFAULT NULL,
  `current_status` varchar(20) DEFAULT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  `License_number` int(11) DEFAULT NULL,
  `password` int(11) DEFAULT NULL,
  `aadhaar` bigint(20) DEFAULT NULL
) ;

--
-- Dumping data for table `delivery_boizz`
--

INSERT INTO `delivery_boizz` (`DID`, `Delivery_name`, `current_status`, `phone_number`, `License_number`, `password`, `aadhaar`) VALUES
(3213, 'slave 1', 'free', 1234567890, 483295, 124623, 45322),
(3214, 'slave 45', 'on delivery', 1233661190, 483293, 2345642, 78965),
(3215, 'slave 14', 'on delivery', 1849603925, 483298, 3456, 77899);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OID` int(11) NOT NULL,
  `UID` int(11) DEFAULT NULL,
  `DID` int(11) DEFAULT NULL,
  `current_status` varchar(20) DEFAULT NULL,
  `Date_of_order` date DEFAULT NULL,
  `Date_of_delivery` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OID`, `UID`, `DID`, `current_status`, `Date_of_order`, `Date_of_delivery`) VALUES
(1221, 1, 3213, 'dispatched', '2022-12-28', '2023-01-05'),
(1222, 2, 3214, 'delivered', '2022-12-28', '2023-01-03'),
(1223, 3, 3215, 'dispatched', '2022-12-30', '2023-01-09');

-- --------------------------------------------------------

--
-- Table structure for table `store_inv`
--

CREATE TABLE `store_inv` (
  `PID` varchar(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `quan` int(11) DEFAULT 0,
  `price` float NOT NULL,
  `category` varchar(20) DEFAULT NULL,
  `link` varchar(15000) DEFAULT NULL,
  `info` varchar(50) DEFAULT NULL
) ;

--
-- Dumping data for table `store_inv`
--

INSERT INTO `store_inv` (`PID`, `Name`, `quan`, `price`, `category`, `link`, `info`) VALUES
('d01', 'GoodLife Toned Milk (1L)', 5, 62, 'dairy', 'images/milk.jpg', 'Fresh and Toned Cow Milk from Good life'),
('d02', 'Taaza Toned Milk (1L)', 10, 70, 'dairy', 'images/taaza_milk.jpg', NULL),
('d03', 'Curd Ndandini (500g)', 10, 17, 'dairy', 'images/curd.jpg', NULL),
('d04', 'Milky Mist Paneer (500g)', 12, 281, 'dairy', 'images/paneer.jpg', NULL),
('d05', 'D\'lecta Natural Cheddar Cheese(200g)', 34, 387, 'dairy', 'images/cheese.jpg', NULL),
('f01', 'Shimla Apple (1 kg)', 20, 62, 'fruits', 'images/apple.jpg', NULL),
('f02', 'Robusta Banana (4 pc)', 50, 58, 'fruits', 'images/banana.jpg', NULL),
('f03', 'Thai Guava (1 kg)', 40, 47, 'fruits', 'images/guava.jpg', NULL),
('f04', 'Imported Blueberries (120 g)', 60, 184, 'fruits', 'images/blueberry.jpg', NULL),
('f05', 'Semiripe Avacado (1 pc)', 67, 109, 'fruits', 'images/avacado.jpg', NULL),
('f06', 'Pineapple (Ananas) (1 pc)', 45, 52, 'fruits', 'images/pineapple.jpg', NULL),
('f07', 'Green Kiwi (3 pc)', 23, 85, 'fruits', 'images/kiwi.jpg', NULL),
('f08', 'Figs(Anjurada Hannu (250 g)', 34, 50, 'fruits', 'images/fig.jpg', NULL),
('f09', 'Kinnow Orange(Kithale) (500 g)', 54, 43, 'fruits', 'images/orange.jpg', NULL),
('f10', 'Fresh Tender Coconut (1 pc)', 65, 113, 'fruits', 'images/coconut.jpg', NULL),
('f11', 'Pomegranate (500 g)', 76, 93, 'fruits', 'images/pomogrenate.jpg', NULL),
('f12', 'Green Pear(500 g)', 87, 67, 'fruits', 'images/pear.jpg', NULL),
('f13', 'Pinky Strawberry(1 pack)', 45, 62, 'fruits', 'images/strawberry.jpg', NULL),
('f14', 'Green Grapes(Dhraakshi) (500 g)', 89, 53, 'fruits', 'images/grapes.jpg', NULL),
('f15', 'Cherry Tomato (200 g)', 20, 20, 'fruits', 'images/tomato.jpg', NULL),
('p01', 'Toor Dal-Supreme Harvest(1 kg)', 26, 145, 'pulses', 'images/toor_dal.jpg', NULL),
('p02', 'Moong Dal-Supreme Harvest(1 kg)', 56, 146, 'pulses', 'images/moong_dal.jpg', NULL),
('p03', 'Moong Chilka-Supreme Harvest(500 g)', 78, 74, 'pulses', 'images/moong_chilka.jpg', NULL),
('p04', 'Urad Dal Split-Supreme Harvest(1 kg)', 92, 149, 'pulses', 'images/urad_dal_split.jpg', NULL),
('p05', 'Urad Dal Whole-Supreme Harvest(1 kg)', 69, 145, 'pulses', 'images/urad_dal_whole.jpg', NULL),
('v01', 'Onion(1 kg)', 22, 31, 'vegetables', 'images/onion.jpg', NULL),
('v02', 'Potato(1 kg)', 8, 41, 'vegetables', 'images/potato.jpg', NULL),
('v03', 'Red Carrot(1 kg)', 28, 26, 'vegetables', 'images/carrot.jpg', NULL),
('v04', 'Cauliflower (1 pc)', 32, 31, 'vegetables', 'images/cauliflower.jpg', NULL),
('v05', 'Arugula(1 kg)', 120, 78, 'vegetables', 'images/arugula.jpg', NULL),
('v06', 'Lettuce(1 kg)', 120, 38, 'vegetables', 'images/lettuce.jpg', NULL),
('v07', 'Mustard greens(1 kg)', 210, 71, 'vegetables', 'images/mustard.jpg', NULL),
('v08', 'Bok choy(1 kg)', 30, 90, 'vegetables', 'images/bok_choy.jpg', NULL),
('v09', 'Horseradish(1 kg)', 40, 33, 'vegetables', 'images/raddish.jpg', NULL),
('v10', 'Sugar beet(1 kg)', 45, 21, 'vegetables', 'images/beetroot.jpg', NULL),
('v11', 'Celeriac(1 kg)', 60, 13, 'vegetables', 'images/celeriac.jpg', NULL),
('v12', 'Daikon(1 kg)', 45, 17, 'vegetables', 'images/daikon.jpg', NULL),
('v13', 'Celery(1 kg)', 35, 62, 'vegetables', 'images/celery.jpg', NULL),
('v14', 'Turnip(1 kg)', 67, 67, 'vegetables', 'images/turnip.jpg', NULL),
('v15', 'Kohlrabi(1 kg)', 56, 45, 'vegetables', 'images/kohlrabi.jpg', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `total`
-- (See below for the actual view)
--
CREATE TABLE `total` (
`oid` int(11)
,`total_amount` double
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UID` int(11) NOT NULL,
  `User_name` varchar(50) DEFAULT NULL,
  `House_no` varchar(10) DEFAULT NULL,
  `street_building` varchar(30) DEFAULT NULL,
  `Locality` varchar(50) DEFAULT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UID`, `User_name`, `House_no`, `street_building`, `Locality`, `phone_number`, `email`, `password`) VALUES
(1, 'Adithya', '4', 'aq1', 'jpnagar', 7818239203, 'a@gmail.com', 102345),
(2, 'Amal', '6', 'we4', 'Basvanagudi', 2135829032, 'am@gmail.com', 123456),
(3, 'chetna', '9', 'cdr5', 'this locality', 3853298567, 'c@gmail.com', 456246);

-- --------------------------------------------------------

--
-- Structure for view `total`
--
DROP TABLE IF EXISTS `total`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `total`  AS SELECT `b`.`OID` AS `oid`, sum(`s`.`price` * `b`.`quan`) AS `total_amount` FROM (`bills` `b` join `store_inv` `s`) WHERE `s`.`PID` = `b`.`PID` GROUP BY `b`.`OID` ORDER BY sum(`s`.`price` * `b`.`quan`) AS `DESCdesc` ASC  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD KEY `OID` (`OID`),
  ADD KEY `PID` (`PID`);

--
-- Indexes for table `delivery_boizz`
--
ALTER TABLE `delivery_boizz`
  ADD PRIMARY KEY (`DID`),
  ADD UNIQUE KEY `License_number` (`License_number`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OID`),
  ADD KEY `DID` (`DID`),
  ADD KEY `UID` (`UID`);

--
-- Indexes for table `store_inv`
--
ALTER TABLE `store_inv`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`OID`) REFERENCES `orders` (`OID`),
  ADD CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `store_inv` (`PID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`DID`) REFERENCES `delivery_boizz` (`DID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
