-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-07-2020 a las 22:36:28
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

--
-- Volcado de datos para la tabla `acciones_medicas`
--

INSERT INTO `acciones_medicas` (`id`, `id_paciente`, `fecha_hora`, `nivel_riesgo`, `medicacion`, `descripcion`, `id_vemec`, `medico_tratante`) VALUES
(1, 1, '2020-07-01 01:21:36', 'Alto', '123', '123', NULL, '123'),
(3, 1, '2020-07-11 02:36:23', 'Medio', 'tryrty', 'rtyrt', 1, 'tryrtyrt'),
(4, 1, '2020-07-11 02:38:06', 'Medio', NULL, 'grtggg fgggggggg ggg gggggggggggggg gggggggg gggggg ggggggggggg ggggggggggggggg ggggggggggggggg gggggggg ggg', 1, 'tryrtyrt'),
(6, 1, '2020-07-11 02:48:29', 'Medio', 'tryrty', 'rtyrt', 1, 'tryrtyrt'),
(7, 1, '2020-07-11 03:06:54', 'Medio', 'tryrty', 'rtyrt', NULL, 'tryrtyrt'),
(8, 1, '2020-07-11 03:12:38', 'Medio', 'tryrty', 'rtyrt', NULL, 'tryrtyrt'),
(9, 1, '2020-07-11 04:39:33', 'Bajo', '123', '123', NULL, '123'),
(10, 1, '2020-07-11 04:43:49', 'Bajo', '123', '123', NULL, '123'),
(11, 1, '2020-07-11 04:44:15', 'Bajo', '123', '123', NULL, '123'),
(12, 1, '2020-07-11 04:45:20', 'Bajo', '123', '123', NULL, '123');

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

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`id`, `id_paciente`, `Nombre`, `Info_contacto`, `esPaciente`) VALUES
(7, 13, 'Personal', '09944243', 1);

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
(1, '1.111.111-1', 'Andres Olivera', 'Masculino', 27, 'Paraguayo', 'Canelones, Uruguay', 'Direccion33', 'Coordenadas del pentagono', '5 tipos diferentes de cancer.', 'Muy Grave', 0, 1),
(3, '2222222', '2222222', '2222', 2222222, '2222222', '22222', '2222', '2222222', '222222222', 'Bajo', 0, 2),
(5, '33333333', '333', 'Masculino', 333, '333', '333', '333', '333', '333', 'Bajo', 0, NULL),
(7, '5.555.555-5', '555', 'Femenino', 52, '55', '444', '55', '55', '4442', 'Muy Grave', 0, 3),
(8, '22222222', '12', 'Femenino', 12, '12', '12', '12', '12', '1234', 'Bajo', 0, NULL),
(9, '3.333.333.3', '345', 'Femenino', 347, '345', '345', '45', '', '34534', 'Bajo', 0, NULL),
(13, '4.444.444.4', '234', 'Femenino', 234, '234', '234', '234', '423', '234', 'Bajo', 0, NULL),
(32, '6.666.666.6', '345', 'Femenino', 345, '345', '435', '345', '', '', 'Bajo', 0, NULL);

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
(1, 'Pacientes en Domicilio', 10, 0),
(2, 'Seccion2', 0, 0);

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
(2, 'Marca', 'Modelo', 'Ubicacion', 1, 3),
(3, '323', '2323', '2323', 1, 7);

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
(23, 1, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 88, 1, 100, 1, '2020-07-30 03:20:26'),
(24, 2, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 33, 0, 88, 3, '2020-07-09 03:21:04');

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
  ADD UNIQUE KEY `CI` (`CI`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `slaves`
--
ALTER TABLE `slaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vemecs`
--
ALTER TABLE `vemecs`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `vemecs_data`
--
ALTER TABLE `vemecs_data`
  MODIFY `Id_Data` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
