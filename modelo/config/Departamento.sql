-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-10-2013 a las 21:55:47
-- Versión del servidor: 5.5.33
-- Versión de PHP: 5.4.20

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bdhospital`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Departamento`
--

CREATE TABLE IF NOT EXISTS `Departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `Departamento`
--

INSERT INTO `Departamento` (`id`, `departamento`) VALUES
(1, 'Guatemala'),
(2, 'Progreso'),
(3, 'Sacatepéquez'),
(4, 'Chimaltenango'),
(5, 'Escuintla'),
(6, 'Santa Rosa'),
(7, 'Sololá'),
(8, 'Totonicapán'),
(9, 'Quetzaltenango'),
(10, 'Suchitepéquez'),
(11, 'Retalhuleu'),
(12, 'San Marcos'),
(13, 'Huehuetenango'),
(14, 'Quiché'),
(15, 'Baja Verapaz'),
(16, 'Alta Verapaz'),
(17, 'Petén'),
(18, 'Izabal'),
(19, 'Zacapa'),
(20, 'Chiquimula'),
(21, 'Jalapa'),
(22, 'Jutiapa');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
