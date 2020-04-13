-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2020 at 03:06 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vemecsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `vemecs`
--

CREATE TABLE `vemecs` (
  `Id` int(11) NOT NULL,
  `Marca` varchar(30) NOT NULL,
  `Modelo` varchar(30) NOT NULL,
  `Ubicacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vemecs`
--

INSERT INTO `vemecs` (`Id`, `Marca`, `Modelo`, `Ubicacion`) VALUES
(1, 'Marca', 'Modelo', 'Ubicacion'),
(2, 'Marca', 'Modelo', 'Ubicacion');

-- --------------------------------------------------------

--
-- Table structure for table `vemecs_data`
--

CREATE TABLE `vemecs_data` (
  `Id_Data` int(11) NOT NULL,
  `Id_Vemec` int(11) NOT NULL,
  `Presion_Maxima` float DEFAULT NULL,
  `Presion_Minima` float DEFAULT NULL,
  `Gas` float DEFAULT NULL,
  `Frecuencia` float DEFAULT NULL,
  `Mezcla` float DEFAULT NULL,
  `Humedad` float DEFAULT NULL,
  `Temperatura_Entrada` float DEFAULT NULL,
  `Temperatura_Salida` float DEFAULT NULL,
  `Presion_Entrada` float DEFAULT NULL,
  `Presion_Salida` float DEFAULT NULL,
  `Timestamp_Data` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vemecs_data`
--

INSERT INTO `vemecs_data` (`Id_Data`, `Id_Vemec`, `Presion_Maxima`, `Presion_Minima`, `Gas`, `Frecuencia`, `Mezcla`, `Humedad`, `Temperatura_Entrada`, `Temperatura_Salida`, `Presion_Entrada`, `Presion_Salida`, `Timestamp_Data`) VALUES
(1, 1, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, '2020-04-12 20:00:36'),
(14, 2, 18, 28, 25, 22, 19, 15, 20, 23, 16, 24, '2020-03-12 21:55:19'),
(15, 2, 16, 21, 18, 26, 23, 24, 35, 21, 27, 22, '2020-03-12 22:00:20'),
(16, 2, 24, 21, 26, 26, 32, 34, 31, 20, 20, 30, '2020-03-12 22:00:23'),
(17, 2, 15, 17, 25, 17, 18, 15, 18, 31, 27, 15, '2020-03-12 22:00:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `vemecs`
--
ALTER TABLE `vemecs`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `vemecs_data`
--
ALTER TABLE `vemecs_data`
  ADD PRIMARY KEY (`Id_Data`,`Id_Vemec`),
  ADD KEY `Id_Vemec` (`Id_Vemec`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `vemecs`
--
ALTER TABLE `vemecs`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vemecs_data`
--
ALTER TABLE `vemecs_data`
  MODIFY `Id_Data` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
