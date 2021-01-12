-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-01-2021 a las 21:08:29
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `my_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurants`
--

CREATE TABLE `restaurants` (
  `id_restaurant` varchar(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(40) NOT NULL,
  `lat` varchar(11) NOT NULL,
  `lng` varchar(11) NOT NULL,
  `king_food` set('Mexicana','Vegetariano','Mediterraneo') NOT NULL,
  `photo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `restaurants`
--

INSERT INTO `restaurants` (`id_restaurant`, `name`, `address`, `lat`, `lng`, `king_food`, `photo`) VALUES
('1', 'Tequila Cantina Mexicana', 'Carrer de Bilbao 13, 08005, Barcelona', '41.40086400', '2.20624000', 'Mexicana', 'img/tcm.jpg'),
('10', '2Y Restaurante Macrobiótico y ', 'Passatge de Batlló, 4, 08036 Barcelona', '41.38846383', '2.151392728', 'Vegetariano', 'img/rmv.jpg'),
('2', 'Obon', 'Plaza de Maragall 13, 08027, Barcelona', '41.42063000', '2.18108500', 'Mexicana,Vegetariano,Mediterraneo', 'img/obon.jpg'),
('3', 'Restaurant L\'Ona', 'Carretera Km. 638, 5, N-II', '41.49176700', '2.36899800', 'Vegetariano,Mediterraneo', 'img/lona.jpg'),
('4', 'La Chula Cervecería Mexicana', 'La Chula Cervecería Mexicana', '41.40745347', '2.175724371', 'Mexicana', 'img/lcm.jpg'),
('5', 'Buena morena', 'Carrer d\'Aragó, 122, 08015 Barcelona', '41.38453139', '2.154953928', 'Mexicana', 'img/bmorena.jpg'),
('6', 'Brisa Sin Prisa', 'Rambla del Poblenou, 59, 08005 Barcelona', '41.40110482', '2.201691949', 'Mediterraneo', 'img/bsp.jpg'),
('7', 'La Marimba', 'Carrer de Pau Claris, 128, 08009 Barcelo', '41.39312442', '2.1669903', 'Mediterraneo', 'img/lmarimba.jpg'),
('8', 'Gilda by Belgious', 'Carrer Ample, 34, 08002 Barcelona', '41.38086805', '2.180313644', 'Mediterraneo', 'img/gbb.jpg'),
('9', 'All you eat is love', 'Carrer de la Marina, 52, 08005 Barcelona', '41.39180623', '2.191427442', 'Vegetariano', 'img/aye.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id_restaurant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
