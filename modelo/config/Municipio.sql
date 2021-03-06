-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-10-2013 a las 21:55:34
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
-- Estructura de tabla para la tabla `Municipio`
--

CREATE TABLE IF NOT EXISTS `Municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `municipio` varchar(45) DEFAULT NULL,
  `Departamento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Municipio_Departamento1_idx` (`Departamento_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=331 ;

--
-- Volcado de datos para la tabla `Municipio`
--

INSERT INTO `Municipio` (`id`, `municipio`, `Departamento_id`) VALUES
(1, 'Municipio de Guatemala', 1),
(2, 'Santa Catarina Pinula', 1),
(3, 'San José Pinula', 1),
(4, 'San José del Golfo', 1),
(5, 'Palencia', 1),
(6, 'Chinautla', 1),
(7, 'San Pedro Ayampuc', 1),
(8, 'Mixco', 1),
(9, 'San Pedro Sacatepéquez', 1),
(10, 'San Juan Sacatepéquez', 1),
(11, 'San Raimundo', 1),
(12, 'Chuarrancho', 1),
(13, 'Fraijanes', 1),
(14, 'Amatitlán', 1),
(15, 'Villa Nueva', 1),
(16, 'Villa Canales', 1),
(17, 'Petapa', 1),
(18, 'Guastatoya', 2),
(19, 'Morazán', 2),
(20, 'San Agustín Acasaguastlán', 2),
(21, 'San Cristobal Acasaguastlán', 2),
(22, 'El Jícaro', 2),
(23, 'Sansare', 2),
(24, 'Sanarate', 2),
(25, 'San Antonio La Paz', 2),
(26, 'Antigua Guatemala', 3),
(27, 'Jocotenango', 3),
(28, 'Pastores', 3),
(29, 'Sumpango', 3),
(30, 'Santo Domingo Xenacoj', 3),
(31, 'Santiago Sacatepéquez', 3),
(32, 'San Bartolomé Milpas Altas', 3),
(33, 'San Lucas Sacatepéquez', 3),
(34, 'Santa Lucia Milpas Altas', 3),
(35, 'Magdalena Milpas Altas', 3),
(36, 'Santa María de Jesus', 3),
(37, 'Ciudad Vieja', 3),
(38, 'San Miguel Dueñas', 3),
(39, 'Alotenango', 3),
(40, 'San Antonio Aguas Calientes', 3),
(41, 'Santa Catalina Barahona', 3),
(42, 'Chimaltenango', 4),
(43, 'San José Poaquil', 4),
(44, 'San MartÍn Jilotepeque', 4),
(45, 'Comalapa', 4),
(46, 'Santa Apolonia', 4),
(47, 'Tecpan', 4),
(48, 'Patzun', 4),
(49, 'Pochuta', 4),
(50, 'Patzicía', 4),
(51, 'Santa Cruz Balanya', 4),
(52, 'Acatenango', 4),
(53, 'Yepocapa', 4),
(54, 'San Andrés Itzapa', 4),
(55, 'Parramos', 4),
(56, 'Zaragoza', 4),
(57, 'El Tejar', 4),
(58, 'Escuintla', 5),
(59, 'Santa Lucía Cotzumalguapa', 5),
(60, 'La Democracia', 5),
(61, 'Siquinala', 5),
(62, 'Masagua', 5),
(63, 'Tiquisate', 5),
(64, 'La Gomera', 5),
(65, 'Guanagazapa', 5),
(66, 'San José', 5),
(67, 'Iztapa', 5),
(68, 'Palín', 5),
(69, 'San Vicente Pacaya', 5),
(70, 'Nueva Concepción', 5),
(71, 'Cuilapa', 6),
(72, 'Barberena', 6),
(73, 'Santa Rosa De Lima', 6),
(74, 'Casillas', 6),
(75, 'San Rafael Las Flores', 6),
(76, 'Oratorio', 6),
(77, 'San Juan Tecuaco', 6),
(78, 'Chiquimulilla', 6),
(79, 'Taxisco', 6),
(80, 'Santa María Ixhuatan', 6),
(81, 'Guazacapan', 6),
(82, 'Santa Cruz Naranjo', 6),
(83, 'Pueblo Nuevo Viñas', 6),
(84, 'Nueva Santa Rosa', 6),
(85, 'Sololá', 7),
(86, 'San José Chacayá', 7),
(87, 'Santa María Visitación', 7),
(88, 'Santa Lucía Utatlan', 7),
(89, 'Nahuala', 7),
(90, 'Santa Catarina Ixtahuacan', 7),
(91, 'Santa Clara La Laguna', 7),
(92, 'Concepción', 7),
(93, 'San Andrés Semetabaj', 7),
(94, 'Panajachel', 7),
(95, 'Santa Catarina Palopó', 7),
(96, 'San Antonio Palopó', 7),
(97, 'San Lucas Tolimán', 7),
(98, 'Santa Cruz La Laguna', 7),
(99, 'San Pablo La Laguna', 7),
(100, 'San Marcos La Laguna', 7),
(101, 'San Juan La Laguna', 7),
(102, 'San Pedro La Laguna', 7),
(103, 'Santiago Atitlán', 7),
(104, 'Totonicapán', 8),
(105, 'San Cristóbal Totonicapan', 8),
(106, 'San Francisco El Alto', 8),
(107, 'San Andrés Xecul', 8),
(108, 'Momostenango', 8),
(109, 'Santa María Chiquimula', 8),
(110, 'Santa Lucía La Reforma', 8),
(111, 'San Bartolo', 8),
(112, 'Quetzaltenango', 9),
(113, 'Salcajá', 9),
(114, 'Olintepeque', 9),
(115, 'San Carlos Sija', 9),
(116, 'Sibilia', 9),
(117, 'Cabricán', 9),
(118, 'Cajolá', 9),
(119, 'San Miguel Siguilá', 9),
(120, 'Ostuncalco', 9),
(121, 'San Mateo', 9),
(122, 'Concepción Chiquirichapa', 9),
(123, 'San Martín Sacatepéquez', 9),
(124, 'Almolonga', 9),
(125, 'Cantel', 9),
(126, 'Huitán', 9),
(127, 'Zunil', 9),
(128, 'Colomba', 9),
(129, 'San Francisco La Unión', 9),
(130, 'El Palmar', 9),
(131, 'Coatepeque', 9),
(132, 'Génova', 9),
(133, 'Flores Costa Cuca', 9),
(134, 'La Esperanza', 9),
(135, 'Palestina de Los Altos', 9),
(136, 'Mazatenango', 10),
(137, 'Cuyotenango', 10),
(138, 'San Francisco Zapotitlán', 10),
(139, 'San Bernardino', 10),
(140, 'San José El Idolo', 10),
(141, 'Santo Domingo Suchitepéquez', 10),
(142, 'San Lorenzo', 10),
(143, 'Samayac', 10),
(144, 'San Pablo Jocopilas', 10),
(145, 'San Antonio Suchitepéquez', 10),
(146, 'San Miguel Panán', 10),
(147, 'San Gabriel', 10),
(148, 'Chicacao', 10),
(149, 'Patulul', 10),
(150, 'Santa Barbara', 10),
(151, 'San Juan Bautista', 10),
(152, 'Santo Tomßs La Unión', 10),
(153, 'Zunilito', 10),
(154, 'Pueblo Nuevo', 10),
(155, 'Río Bravo', 10),
(156, 'Retalhuleu', 11),
(157, 'San Sebastián', 11),
(158, 'Santa Cruz Muluá', 11),
(159, 'San Martín Zapotitlán', 11),
(160, 'San Felipe', 11),
(161, 'Champerico', 11),
(162, 'Nuevo San Carlos', 11),
(163, 'El Asintal', 11),
(164, 'San Marcos', 12),
(165, 'San Pedro Sacatepéquez', 12),
(166, 'San Antonio Sacatepéquez', 12),
(167, 'Comitancillo', 12),
(168, 'San Miguel Ixtahuacán', 12),
(169, 'Concepción Tutuapa', 12),
(170, 'Tacaná', 12),
(171, 'Sibinal', 12),
(172, 'Tajumulco', 12),
(173, 'Tejutla', 12),
(174, 'San Rafael Pie De La Cuesta', 12),
(175, 'Nuevo Progreso', 12),
(176, 'El Tumbador', 12),
(177, 'El Rodeo', 12),
(178, 'Malacatán', 12),
(179, 'Catarina', 12),
(180, 'Ayutla', 12),
(181, 'Ocós', 12),
(182, 'San Pablo', 12),
(183, 'El Quetzal', 12),
(184, 'La Reforma', 12),
(185, 'Pajapita', 12),
(186, 'Ixchiguán', 12),
(187, 'San José Ojetenam', 12),
(188, 'San Cristóbal Cucho', 12),
(189, 'Sipacapa', 12),
(190, 'Esquipulas Palo Gordo', 12),
(191, 'Río Blanco', 12),
(192, 'San Lorenzo', 12),
(193, 'Huehuetenango', 13),
(194, 'Chiantla', 13),
(195, 'Malacatancito', 13),
(196, 'Cuilco', 13),
(197, 'Nentón', 13),
(198, 'San Pedro Necta', 13),
(199, 'Jacaltenango', 13),
(200, 'Soloma', 13),
(201, 'Ixtahuacán', 13),
(202, 'Santa Bárbara', 13),
(203, 'La Libertad', 13),
(204, 'La Democracia', 13),
(205, 'San Miguel Acatán', 13),
(206, 'San Rafael La Independencia', 13),
(207, 'Todos Santos Cuchumatánes', 13),
(208, 'San Juan Atitán', 13),
(209, 'Santa Eulalia', 13),
(210, 'San Mateo Ixtatán', 13),
(211, 'Colotenango', 13),
(212, 'San Sebastián Huehetenango', 13),
(213, 'Tectitán', 13),
(214, 'Concepción Huista', 13),
(215, 'San Juan Ixcoy', 13),
(216, 'San Antonio Huista', 13),
(217, 'San Sebastián Coatán', 13),
(218, 'Barillas', 13),
(219, 'Aguacatán', 13),
(220, 'San Rafael Petzal', 13),
(221, 'San Gaspar Ixchil', 13),
(222, 'Santiago Chimaltenango', 13),
(223, 'Santa Ana Huista', 13),
(224, 'Santa Cruz del Quiché', 14),
(225, 'Chiché', 14),
(226, 'Chinique', 14),
(227, 'Zacualpa', 14),
(228, 'Chajul', 14),
(229, 'Chichicastenango', 14),
(230, 'Patzité', 14),
(231, 'San Antonio Ilotenango', 14),
(232, 'San Pedro Jocopilas', 14),
(233, 'Cunén', 14),
(234, 'San Juan Cotzal', 14),
(235, 'Joyabaj', 14),
(236, 'Nebaj', 14),
(237, 'San Andrés Sajcabajá', 14),
(238, 'Uspantán', 14),
(239, 'Sacapulas', 14),
(240, 'San Bartolomé Jocotenango', 14),
(241, 'Canillá', 14),
(242, 'Chicamán', 14),
(243, 'Ixcán', 14),
(244, 'Pachalum', 14),
(245, 'Salamá', 15),
(246, 'San Miguel Chicaj', 15),
(247, 'Rabinal', 15),
(248, 'Cubulco', 15),
(249, 'Granados', 15),
(250, 'El Chol', 15),
(251, 'San Jerónimo', 15),
(252, 'Purulhß', 15),
(253, 'Cobán', 16),
(254, 'Santa Cruz Verapaz', 16),
(255, 'San Cristóbal Verapaz', 16),
(256, 'Tactic', 16),
(257, 'Tamahù', 16),
(258, 'Tucurú', 16),
(259, 'Panzós', 16),
(260, 'Senahú', 16),
(261, 'San Pedro Carchá', 16),
(262, 'San Juan Chamelco', 16),
(263, 'Lanquín', 16),
(264, 'Cahabón', 16),
(265, 'Chisec', 16),
(266, 'Chahal', 16),
(267, 'Fray Bartolomé de Las Casas', 16),
(268, 'Flores', 17),
(269, 'San José', 17),
(270, 'San Benito', 17),
(271, 'San Andrés', 17),
(272, 'La Libertad', 17),
(273, '1706', 17),
(274, 'San Francisco', 17),
(275, 'Santa Ana', 17),
(276, 'Dolores', 17),
(277, 'San Luis', 17),
(278, 'Sayaxché', 17),
(279, 'Melchor De Mencos', 17),
(280, 'Poptún', 17),
(281, 'Puerto Barrios', 18),
(282, 'Lívingston', 18),
(283, 'El Estor', 18),
(284, 'Morales', 18),
(285, 'Los Amates', 18),
(286, 'Zacapa', 19),
(287, 'Estanzuela', 19),
(288, 'Río Hondo', 19),
(289, 'Gualán', 19),
(290, 'Teculután', 19),
(291, 'Usumatlán', 19),
(292, 'Cabañas', 19),
(293, 'San Diego', 19),
(294, 'La Unión', 19),
(295, 'Huité', 19),
(296, 'Chiquimula', 20),
(297, 'San José La Arada', 20),
(298, 'San Juan Ermita', 20),
(299, 'Jocotán', 20),
(300, 'Camotán', 20),
(301, 'Olopa', 20),
(302, 'Esquipulas', 20),
(303, 'Concepción Las Minas', 20),
(304, 'Quetzaltepeque', 20),
(305, 'San Jacinto', 20),
(306, 'Ipala', 20),
(307, 'Jalapa', 21),
(308, 'San Pedro Pinula', 21),
(309, 'San Luis Jilotepeque', 21),
(310, 'San Manuel Chaparrón', 21),
(311, 'San Carlos Alzatate', 21),
(312, 'Monjas', 21),
(313, 'Mataquescuintla', 21),
(314, 'Jutiapa', 22),
(315, 'El Progreso', 22),
(316, 'Santa Catarina Mita', 22),
(317, 'Agua Blanca', 22),
(318, 'Asunción Mita', 22),
(319, 'Yupiltepeque', 22),
(320, 'Atescatempa', 22),
(321, 'Jerez', 22),
(322, 'El Adelanto', 22),
(323, 'Zapotitlán', 22),
(324, 'Comapa', 22),
(325, 'Jalpatagua', 22),
(326, 'Conguaco', 22),
(327, 'Moyuta', 22),
(328, 'Pasaco', 22),
(329, 'San José Acatempa', 22),
(330, 'Quesada', 22);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Municipio`
--
ALTER TABLE `Municipio`
  ADD CONSTRAINT `fk_Municipio_Departamento1` FOREIGN KEY (`Departamento_id`) REFERENCES `Departamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
