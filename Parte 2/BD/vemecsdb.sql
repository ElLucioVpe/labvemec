-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-07-2020 a las 21:36:40
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vemecsdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones_medicas`
--

CREATE TABLE `acciones_medicas` (
  `id` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `nivel_riesgo` varchar(10) NOT NULL,
  `medicacion` varchar(200) DEFAULT NULL,
  `descripcion` varchar(200) NOT NULL,
  `id_vemec` int(11) DEFAULT NULL,
  `medico_tratante` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `id` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Info_contacto` varchar(30) NOT NULL,
  `esPaciente` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `CI` varchar(11) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Sexo` varchar(10) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Nacionalidad` varchar(20) NOT NULL,
  `Lugar_Residencia` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Coordenadas` varchar(100) NOT NULL,
  `Antecedentes_Clinicos` varchar(200) NOT NULL,
  `Nivel_Riesgo` varchar(10) NOT NULL,
  `Defuncion` tinyint(1) NOT NULL,
  `id_vemec` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `CI`, `Nombre`, `Sexo`, `Edad`, `Nacionalidad`, `Lugar_Residencia`, `Direccion`, `Coordenadas`, `Antecedentes_Clinicos`, `Nivel_Riesgo`, `Defuncion`, `id_vemec`) VALUES
(1, '1.111.111-1', 'Andres Olivera', 'Masculino', 27, 'Paraguayo', 'Canelones, Uruguay', 'Direccion33', 'Coordenadas del pentagono', '5 tipos diferentes de cancer.', 'Muy Grave', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `slaves`
--

CREATE TABLE `slaves` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Intervalo_Envio` int(11) NOT NULL,
  `Intervalo_Emergencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `slaves`
--

INSERT INTO `slaves` (`id`, `Nombre`, `Intervalo_Envio`, `Intervalo_Emergencia`) VALUES
(1, 'Pacientes en Domicilio', 10, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vemecs`
--

CREATE TABLE `vemecs` (
  `Id` int(11) NOT NULL,
  `Marca` varchar(30) NOT NULL,
  `Modelo` varchar(30) NOT NULL,
  `Ubicacion` varchar(30) NOT NULL,
  `id_slave` int(11) NOT NULL,
  `id_paciente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vemecs`
--

INSERT INTO `vemecs` (`Id`, `Marca`, `Modelo`, `Ubicacion`, `id_slave`, `id_paciente`) VALUES
(1, 'Marca', 'Modelo', 'Ubicacion', 1, 1),
(2, 'Marca', 'Modelo', 'Ubicacion', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vemecs_data`
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
  `Pulsaciones` int(11) NOT NULL,
  `Conectado_Corriente` tinyint(1) NOT NULL,
  `Energia` int(11) DEFAULT NULL,
  `id_paciente` int(11) NOT NULL,
  `Timestamp_Data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vemecs_data`
--

INSERT INTO `vemecs_data` (`Id_Data`, `Id_Vemec`, `Presion_Maxima`, `Presion_Minima`, `Gas`, `Frecuencia`, `Mezcla`, `Humedad`, `Temperatura_Entrada`, `Temperatura_Salida`, `Presion_Entrada`, `Presion_Salida`, `Pulsaciones`, `Conectado_Corriente`, `Energia`, `id_paciente`, `Timestamp_Data`) VALUES
(1, 1, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 0, 1, 100, 1, '2020-07-06 01:08:27'),
(15, 2, 16, 21, 18, 26, 23, 24, 35, 21, 27, 22, 0, 1, 100, 1, '2020-07-01 01:08:38'),
(16, 2, 24, 21, 26, 26, 32, 34, 31, 20, 20, 30, 0, 1, 100, 1, '2020-07-01 01:08:42'),
(17, 2, 15, 17, 25, 17, 18, 15, 18, 31, 27, 15, 0, 1, 100, 1, '2020-07-29 01:08:45');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acciones_medicas`
--
ALTER TABLE `acciones_medicas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_vemec` (`id_vemec`);

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_vemec` (`id_vemec`);

--
-- Indices de la tabla `slaves`
--
ALTER TABLE `slaves`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vemecs`
--
ALTER TABLE `vemecs`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `id_slave` (`id_slave`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indices de la tabla `vemecs_data`
--
ALTER TABLE `vemecs_data`
  ADD PRIMARY KEY (`Id_Data`,`Id_Vemec`),
  ADD KEY `Id_Vemec` (`Id_Vemec`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acciones_medicas`
--
ALTER TABLE `acciones_medicas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `slaves`
--
ALTER TABLE `slaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `vemecs`
--
ALTER TABLE `vemecs`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vemecs_data`
--
ALTER TABLE `vemecs_data`
  MODIFY `Id_Data` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acciones_medicas`
--
ALTER TABLE `acciones_medicas`
  ADD CONSTRAINT `acciones_medicas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id`),
  ADD CONSTRAINT `acciones_medicas_ibfk_2` FOREIGN KEY (`id_vemec`) REFERENCES `vemecs` (`Id`);

--
-- Filtros para la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD CONSTRAINT `contactos_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id`);

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`id_vemec`) REFERENCES `vemecs` (`Id`);

--
-- Filtros para la tabla `vemecs`
--
ALTER TABLE `vemecs`
  ADD CONSTRAINT `vemecs_ibfk_1` FOREIGN KEY (`id_slave`) REFERENCES `slaves` (`id`),
  ADD CONSTRAINT `vemecs_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id`);

--
-- Filtros para la tabla `vemecs_data`
--
ALTER TABLE `vemecs_data`
  ADD CONSTRAINT `vemecs_data_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
