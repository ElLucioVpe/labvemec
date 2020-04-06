-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2020 at 04:23 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vemecs_data`
--
ALTER TABLE `vemecs_data`
  MODIFY `Id_Vemec` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vemecs_data`
--
ALTER TABLE `vemecs_data`
  ADD CONSTRAINT `vemecs_data_ibfk_1` FOREIGN KEY (`Id_Vemec`) REFERENCES `vemecs` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
