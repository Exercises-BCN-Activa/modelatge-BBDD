-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-04-2020 a las 17:09:17
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vueling_ex1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avions`
--

CREATE TABLE `avions` (
  `id_avio` int(10) NOT NULL,
  `capacitar` int(4) NOT NULL,
  `model` varchar(15) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seients`
--

CREATE TABLE `seients` (
  `id_seient` int(15) NOT NULL,
  `avio_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `avions`
--
ALTER TABLE `avions`
  ADD PRIMARY KEY (`id_avio`),
  ADD UNIQUE KEY `id_avio` (`id_avio`);

--
-- Indices de la tabla `seients`
--
ALTER TABLE `seients`
  ADD PRIMARY KEY (`id_seient`),
  ADD UNIQUE KEY `id_seient` (`id_seient`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
