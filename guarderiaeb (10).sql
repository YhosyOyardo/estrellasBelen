-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2024 a las 18:19:48
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `guarderiaeb`
--
CREATE DATABASE IF NOT EXISTS `guarderiaeb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `guarderiaeb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administracion`
--

CREATE TABLE `administracion` (
  `CI_Adm` varchar(20) NOT NULL,
  `Nombre_Adm` varchar(50) DEFAULT NULL,
  `Apellido_PAdm` varchar(50) DEFAULT NULL,
  `Apellido_MAdm` varchar(50) DEFAULT NULL,
  `Direccion_Adm` varchar(100) DEFAULT NULL,
  `Genero_Adm` enum('M','F') DEFAULT NULL,
  `Tipo_Usu` enum('Directora','Secretaria','Profesora') DEFAULT 'Directora',
  `Contrasena_Adm` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administracion`
--

INSERT INTO `administracion` (`CI_Adm`, `Nombre_Adm`, `Apellido_PAdm`, `Apellido_MAdm`, `Direccion_Adm`, `Genero_Adm`, `Tipo_Usu`, `Contrasena_Adm`) VALUES
('10905567', 'Sheyla Kamila', 'Mayta Alvarez', 'Ortega', 'Av.Ventilla', 'F', 'Secretaria', '$2y$10$vwKoxjDVIcrw/UiCamVcGOGJFxAM4.lp2HCIdZbLnLJu.6iXXwiou'),
('10905568', 'Karina', 'Flores', 'Choque', 'Av Puente Bolivia', 'M', 'Directora', '$2y$10$dPoY7EROHk2Xkif3Vc/MAuCTwjB/GQs7H0MyVRQ8ALw5jrIwiA4vS'),
('10905569', 'Norma', 'Saavedra', 'Mentoca', 'Av Puente Vela', 'F', 'Profesora', '10905569'),
('13579', 'sonia', 'aliagas', 'choque', 'alto', 'F', 'Profesora', '$2y$10$cJF68gy0Z7c/3GbR/1gM1eg2dVYypZ9pIdcEilfYuZ.od.YPUjihS'),
('4444', 'sheyla', 'condori ', 'apaza', 'senkata 66', 'F', 'Directora', '$2y$10$7y.HeDYeIj7sYiv..fv6iOQ1645xmG2XRuZhe3l9DPM2FP/dATok6'),
('478596215', 'deymar', 'gutierrez', 'rojas', 'av ojos del salado', 'M', 'Secretaria', 'Deymar14'),
('5146416', 'maria', 'llagua', 'quispe', 'puente bolivia', 'F', 'Profesora', '$2y$10$ozubCgACqQSHNpJXFcnN5eH7tk/2p2F3cDec3xWBm/JvhBJ.UnTqa');

--
-- Disparadores `administracion`
--
DELIMITER $$
CREATE TRIGGER `insertar_en_profesora` AFTER INSERT ON `administracion` FOR EACH ROW BEGIN
    IF NEW.Tipo_Usu = 'profesora' THEN
        INSERT INTO profesora (CI_Prof, Nombre_Prof, Apellido_PProf, Apellido_MProf)
        VALUES (NEW.CI_Adm, NEW.Nombre_Adm, NEW.Apellido_PAdm, NEW.Apellido_MAdm);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `CI_N` varchar(20) NOT NULL,
  `Nombre_N` varchar(50) DEFAULT NULL,
  `Apellido_PN` varchar(50) DEFAULT NULL,
  `Apellido_MN` varchar(50) DEFAULT NULL,
  `Fecha_Asist` date NOT NULL,
  `Estado` enum('Presente','Ausente') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`CI_N`, `Nombre_N`, `Apellido_PN`, `Apellido_MN`, `Fecha_Asist`, `Estado`) VALUES
('12345678', NULL, NULL, NULL, '2024-02-01', 'Presente'),
('12345678', NULL, NULL, NULL, '2024-02-14', 'Presente'),
('14478956', NULL, NULL, NULL, '2024-02-01', 'Ausente'),
('14478956', NULL, NULL, NULL, '2024-02-14', 'Ausente'),
('147586952', NULL, NULL, NULL, '2024-02-01', 'Presente'),
('147586952', NULL, NULL, NULL, '2024-02-14', 'Presente'),
('14785236', NULL, NULL, NULL, '2024-02-01', 'Presente'),
('14785236', NULL, NULL, NULL, '2024-02-14', 'Presente'),
('2222', NULL, NULL, NULL, '2024-02-01', 'Presente'),
('2222', NULL, NULL, NULL, '2024-02-14', 'Presente'),
('25478693', NULL, NULL, NULL, '2024-02-01', 'Presente'),
('25478693', NULL, NULL, NULL, '2024-02-14', 'Presente'),
('2547896352', NULL, NULL, NULL, '2024-02-01', 'Presente'),
('2547896352', NULL, NULL, NULL, '2024-02-14', 'Presente'),
('2558451', NULL, NULL, NULL, '2024-02-01', 'Presente'),
('2558451', NULL, NULL, NULL, '2024-02-14', 'Presente'),
('454545', 'saul gutierrez', 'chalco', 'quisbert', '2024-11-06', 'Presente'),
('47852169', NULL, NULL, NULL, '2024-02-01', 'Presente'),
('47852169', NULL, NULL, NULL, '2024-02-14', 'Presente'),
('547826532', NULL, NULL, NULL, '2024-02-01', 'Ausente'),
('547826532', NULL, NULL, NULL, '2024-02-14', 'Ausente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `CI_N` varchar(20) NOT NULL,
  `CI_Adm` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensualidad`
--

CREATE TABLE `mensualidad` (
  `ID_M` int(11) NOT NULL,
  `CI_T` varchar(20) DEFAULT NULL,
  `CI_N` varchar(20) NOT NULL,
  `Nombre_N` varchar(50) DEFAULT NULL,
  `Apellido_PN` varchar(50) DEFAULT NULL,
  `Apellido_MN` varchar(50) DEFAULT NULL,
  `Cantidad` decimal(10,2) DEFAULT NULL,
  `FechaPago` date DEFAULT NULL,
  `Usuario` int(10) DEFAULT NULL,
  `Tipo_usuario` enum('Directora','Secretaria') DEFAULT 'Directora'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mensualidad`
--

INSERT INTO `mensualidad` (`ID_M`, `CI_T`, `CI_N`, `Nombre_N`, `Apellido_PN`, `Apellido_MN`, `Cantidad`, `FechaPago`, `Usuario`, `Tipo_usuario`) VALUES
(1, '', '12345678', 'juan', 'perez', 'canaza', 300.00, '2024-04-01', NULL, 'Directora'),
(2, '', '147586952', 'jorge ', 'gutierres', 'prado', 300.00, '2024-12-05', 10905568, 'Secretaria'),
(3, '', '2222', 'maria juana', 'quispe', 'beltran', 300.00, '2024-12-11', 10905568, 'Secretaria'),
(4, NULL, '12345678', 'juan', 'perez', 'canaza', 300.00, '2024-05-08', 10905568, 'Secretaria'),
(5, NULL, '12345678', 'juan', 'perez', 'canaza', 300.00, '2024-11-07', 10905568, 'Secretaria'),
(6, NULL, '12345678', 'juan', 'perez', 'canaza', 300.00, '2024-11-07', 10905568, 'Secretaria'),
(7, NULL, '12345678', 'juan', 'perez', 'canaza', 300.00, '2024-11-07', 10905568, 'Secretaria'),
(8, NULL, '12345678', 'juan', 'perez', 'canaza', 300.00, '2024-11-07', 10905568, 'Secretaria'),
(9, NULL, '2222', 'maria juana', 'quispe', 'beltran', 300.00, '2024-11-08', 10905568, 'Secretaria'),
(10, NULL, '2222', 'maria juana', 'quispe', 'beltran', 300.00, '2024-11-07', 10905568, 'Secretaria'),
(11, NULL, '2222', 'maria juana', 'quispe', 'beltran', 300.00, '2024-11-07', 10905568, 'Secretaria'),
(12, NULL, '454545', 'saul gutierrez', 'chalco', 'quisbert', 300.00, '2024-11-14', 10905568, 'Secretaria'),
(13, NULL, '2222', 'maria juana', 'quispe', 'beltran', 300.00, '2024-11-07', 10905568, 'Secretaria'),
(14, NULL, '2222', 'maria juana', 'quispe', 'beltran', 300.00, '2024-10-17', 10905568, 'Secretaria'),
(15, NULL, '2558451', 'eliza ', 'canaviri', 'laura', 300.00, '2024-11-07', 10905568, 'Secretaria'),
(16, NULL, '2222', 'maria juana', 'quispe', 'beltran', 300.00, '2024-11-07', 10905568, 'Secretaria'),
(17, NULL, '2222', 'maria juana', 'quispe', 'beltran', 300.00, '2024-12-07', 10905568, 'Secretaria'),
(18, NULL, '2222', 'maria juana', 'quispe', 'beltran', 300.00, '2024-11-13', 10905568, 'Secretaria'),
(19, NULL, '5887458852', 'luz alejandra', 'beldero', 'huanaco', 300.00, '2024-11-22', 10905568, 'Secretaria'),
(20, NULL, '2222', 'maria juana', 'quispe', 'beltran', 300.00, '2024-10-29', 10905568, 'Secretaria'),
(21, NULL, '2222', 'maria juana', 'quispe', 'beltran', 300.00, '2024-11-29', 10905568, 'Secretaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ninos`
--

CREATE TABLE `ninos` (
  `CI_N` varchar(20) NOT NULL,
  `Nombre_N` varchar(50) DEFAULT NULL,
  `Apellido_PN` varchar(50) DEFAULT NULL,
  `Apellido_MN` varchar(50) DEFAULT NULL,
  `Fecha_Nac` date DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  `Genero` enum('M','F') DEFAULT NULL,
  `Fecha_Insc` date DEFAULT NULL,
  `Foto` blob DEFAULT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `fecha_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ninos`
--

INSERT INTO `ninos` (`CI_N`, `Nombre_N`, `Apellido_PN`, `Apellido_MN`, `Fecha_Nac`, `Edad`, `Genero`, `Fecha_Insc`, `Foto`, `estado`, `fecha_baja`) VALUES
('12345678', 'juan alberto', 'perez', 'canaza', '2024-03-05', 1, 'M', '2023-05-02', 0x323032345f30385f33315f31365f32315f30326a6176617363726970742e706e67, 'activo', NULL),
('14478956', 'soledad mary', 'cuellar', 'chuquimia', '2022-04-01', 2, 'F', '2024-11-10', 0x576861747341707020496d61676520323032342d30352d30352061742031372e32302e30362e6a706567, 'activo', NULL),
('147586952', 'jorge ', 'gutierres', 'prado', '2023-07-01', 1, 'M', '2024-05-01', 0x576861747341707020496d61676520323032342d30392d32382061742030302e35322e34332e6a706567, 'activo', NULL),
('14785236', 'alfredo', 'huanca', 'quispe', '2022-02-01', 2, '', '2024-11-11', 0x64657363617267612e6a666966, 'activo', NULL),
('2222', 'maria juana', 'quispe', 'beltran', '2024-10-18', 2, 'F', '2024-10-10', 0x64657363617267612e6a666966, 'activo', NULL),
('25478693', 'jhonathan willi', 'lucas', 'villanueva', '2022-05-04', 2, 'M', '2025-02-14', 0x576861747341707020496d61676520323032342d31302d32302061742031382e33372e35362e6a706567, 'activo', NULL),
('2547896352', 'jhon abdiel', 'quispe', 'solares', '2022-04-04', 2, 'M', '2024-12-01', 0x576861747341707020496d61676520323032342d31302d32372061742032302e33322e31322e6a706567, 'activo', NULL),
('2558451', 'eliza ', 'canaviri', 'laura', '2022-08-05', 2, 'F', '2024-11-02', 0x323032345f30385f33315f31365f32315f30326a6176617363726970742e706e67, 'activo', NULL),
('454545', 'saul gutierrez', 'chalco', 'quisbert', '2019-10-17', 5, 'M', '2024-11-06', 0x696d6167656e5f323032342d31312d30365f3230323030343936372e706e67, 'activo', NULL),
('47852169', 'abel sadamm', 'tola', 'phatko', '2023-02-14', 1, 'M', '2024-12-04', 0x576861747341707020496d61676520323032342d31302d32312061742032322e32382e34332e6a706567, 'activo', NULL),
('547826532', 'sara', 'trujillo', 'suana', '2022-05-04', 22, 'F', '2025-09-04', 0x576861747341707020496d61676520323032342d31302d32372061742032302e33322e31322e6a706567, 'activo', NULL),
('5887458852', 'luz alejandra', 'beldero', 'huanaco', '2021-07-04', 3, 'F', '2024-11-01', 0x576861747341707020496d61676520323032342d31302d32312061742032322e32382e3433202831292e6a706567, 'activo', NULL),
('784523695', 'vanessa', 'fernandez', 'santiago', '2021-03-11', 3, 'F', '2023-01-04', 0x576861747341707020496d61676520323032342d31302d32312061742032322e32382e3433202831292e6a706567, 'activo', NULL),
('987655', 'miguel', 'mayta', 'gomez', '2022-12-05', 2, 'M', '2024-11-05', 0x323032345f30385f33315f31365f32315f33386a6176617363726970742e706e67, 'activo', NULL),
('987655400', 'gabriel', 'mayta', 'gomez', '2022-12-05', 2, '', '2024-11-05', 0x323032345f30385f33315f31365f32315f33386a6176617363726970742e706e67, 'activo', NULL);

--
-- Disparadores `ninos`
--
DELIMITER $$
CREATE TRIGGER `registrar_asistencia` AFTER INSERT ON `ninos` FOR EACH ROW BEGIN
    -- Insertar automáticamente en la tabla asistencia
    INSERT INTO asistencia (CI_N, Nombre_N, Apellido_PN, Apellido_MN, Fecha_Asist, Estado)
    VALUES (NEW.CI_N, NEW.Nombre_N, NEW.Apellido_PN, NEW.Apellido_MN, CURDATE(), 'Presente');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesora`
--

CREATE TABLE `profesora` (
  `CI_Prof` varchar(20) NOT NULL,
  `Nombre_Prof` varchar(50) DEFAULT NULL,
  `Apellido_PProf` varchar(50) DEFAULT NULL,
  `Apellido_MProf` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesora`
--

INSERT INTO `profesora` (`CI_Prof`, `Nombre_Prof`, `Apellido_PProf`, `Apellido_MProf`) VALUES
('10905569', 'Norma', 'Saavedra', 'Mentoca'),
('13579', 'sonia', 'aliagas', 'choque');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `id` int(11) NOT NULL,
  `CI_N` varchar(20) NOT NULL,
  `Nombre_N` varchar(25) DEFAULT NULL,
  `Apellido_NP` varchar(25) DEFAULT NULL,
  `Apellido_NM` varchar(25) DEFAULT NULL,
  `CI_Prof` varchar(20) NOT NULL,
  `Nombre_Prof` varchar(25) DEFAULT NULL,
  `TipoConducta` varchar(100) DEFAULT NULL,
  `Detalles` text NOT NULL,
  `FechaRep` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`id`, `CI_N`, `Nombre_N`, `Apellido_NP`, `Apellido_NM`, `CI_Prof`, `Nombre_Prof`, `TipoConducta`, `Detalles`, `FechaRep`) VALUES
(1, '12345678', 'juan', 'perez', 'canaza', '10905569', 'Norma', 'Excelente', 'Un infante que desarrollo el poder escribir de buena manera y con buenos valores', '2024-05-12'),
(2, '25478693', 'jhonathan willi', 'lucas', 'villanueva', '10905569', 'Norma', 'Bueno', 'El niño se comporto de forma excelente estos dias', '2024-11-06'),
(3, '2547896352', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'El niño demostro responsabilidad en sus tareas', '2024-11-08'),
(4, '47852169', NULL, NULL, NULL, '10905569', NULL, 'Bueno', 'Es un buen niño', '2024-11-07'),
(5, '547826532', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'Fue un excelente niño', '2024-11-16'),
(6, '547826532', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'Fue un excelente niño', '2024-12-01'),
(7, '547826532', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'Fue un excelente niño', '2024-12-15'),
(8, '547826532', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'Fue un excelente niño', '2024-12-29'),
(9, '547826532', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'Fue un excelente niño', '2025-02-19'),
(10, '2222', NULL, NULL, NULL, '10905569', NULL, 'Bueno', 'Se comporto de buena forma', '2024-11-21'),
(11, '2222', NULL, NULL, NULL, '10905569', NULL, 'Bueno', 'Fue bueno', '2024-11-06'),
(12, '2222', NULL, NULL, NULL, '10905569', NULL, 'Bueno', 'Fue bueno', '2024-11-14'),
(13, '12345678', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'El niño se comporto de buena forma', '2024-11-21'),
(15, '12345678', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'El niño se comporto de buena forma', '2024-11-14'),
(16, '12345678', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'El niño se comporto de buena forma', '2024-11-28'),
(17, '12345678', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'El niño se comporto de buena forma', '2024-12-05'),
(19, '12345678', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'El niño se comporto de buena forma', '2024-12-12'),
(20, '12345678', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'El niño se comporto de buena forma', '2024-12-20'),
(21, '25478693', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'El niño se comporto de buena forma', '2024-12-20'),
(22, '25478693', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'El niño se comporto de buena forma', '2024-12-01'),
(23, '25478693', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'El niño se comporto de buena forma', '2025-04-18'),
(24, '25478693', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'El niño se comporto de buena forma', '2025-05-02'),
(25, '25478693', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'El niño se comporto de buena forma', '2025-04-25'),
(26, '25478693', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'El niño se comporto de buena forma', '2025-07-26'),
(27, '14478956', NULL, NULL, NULL, '10905569', NULL, 'Bueno', 'Bueno', '2024-11-21'),
(28, '14478956', NULL, NULL, NULL, '10905569', NULL, 'Bueno', 'Bueno', '2024-09-19'),
(29, '14478956', NULL, NULL, NULL, '10905569', NULL, 'Bueno', 'Bueno', '2024-07-25'),
(30, '12345678', NULL, NULL, NULL, '10905569', NULL, 'Malo', 'Hizo algunas travesuras', '2024-11-07'),
(31, '14478956', NULL, NULL, NULL, '10905569', NULL, 'Malo', 'Fue travieso', '2024-11-07'),
(32, '147586952', NULL, NULL, NULL, '10905569', NULL, 'Malo', 'Se porto de buena manera', '0000-00-00'),
(33, '147586952', NULL, NULL, NULL, '10905569', NULL, 'Malo', 'Se porto de buena manera', '2024-11-21'),
(34, '147586952', NULL, NULL, NULL, '10905569', NULL, 'Malo', 'Se porto de buena manera', '2024-11-29'),
(35, '2222', NULL, NULL, NULL, '10905569', NULL, '', 'Fue un buen estudiante', '2025-03-12'),
(36, '2222', NULL, NULL, NULL, '10905569', NULL, 'Malo', 'Se comporto de buena forma', '2023-09-07'),
(37, '2222', NULL, NULL, NULL, '10905569', NULL, 'Malo', 'Se comporto de buena forma', '2023-09-21'),
(38, '2222', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'ASDF', '2024-11-02'),
(39, '2222', NULL, NULL, NULL, '10905569', NULL, 'Excelente', 'ASDF', '2024-11-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutores`
--

CREATE TABLE `tutores` (
  `CI_T` varchar(20) NOT NULL,
  `Nombre_T` varchar(50) DEFAULT NULL,
  `Apellido_PT` varchar(50) DEFAULT NULL,
  `Apellido_MT` varchar(50) DEFAULT NULL,
  `Fecha_NacT` date DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  `GeneroT` enum('M','F') DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Celular1` varchar(20) DEFAULT NULL,
  `Contrasena_T` varchar(100) DEFAULT NULL,
  `Foto_T` blob DEFAULT NULL,
  `CI_N` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tutores`
--

INSERT INTO `tutores` (`CI_T`, `Nombre_T`, `Apellido_PT`, `Apellido_MT`, `Fecha_NacT`, `Edad`, `GeneroT`, `Direccion`, `Celular1`, `Contrasena_T`, `Foto_T`, `CI_N`) VALUES
('12457896', 'daniel alonso', 'puig', 'jaaik', '1980-02-01', 44, 'M', 'Av MKLN', '12478', NULL, 0x64657363617267612e6a666966, '12345678'),
('12664939', 'joel', 'yampara', 'yampara', '2001-09-15', 23, 'M', 'Av Trujillo 099', '21478963', 'yutimdmdj', 0x696d616765732e6a666966, '147586952'),
('145896523', 'adriana ', 'mamani', 'ticona', '2000-05-14', 24, 'F', 'AV Aroma', '45782165', 'Wifi2345', 0x696d616765732e6a666966, '14478956'),
('74915147', 'margarita', 'solares', 'mamani', '1984-12-10', 40, 'F', 'Av chijimarca', '67100189', 'Magi1984', 0x323032345f30385f33315f31365f32315f33386a6176617363726970742e706e67, '12345678');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administracion`
--
ALTER TABLE `administracion`
  ADD PRIMARY KEY (`CI_Adm`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`CI_N`,`Fecha_Asist`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`CI_N`,`CI_Adm`),
  ADD KEY `CI_Adm` (`CI_Adm`);

--
-- Indices de la tabla `mensualidad`
--
ALTER TABLE `mensualidad`
  ADD PRIMARY KEY (`ID_M`),
  ADD KEY `CI_N` (`CI_N`);

--
-- Indices de la tabla `ninos`
--
ALTER TABLE `ninos`
  ADD PRIMARY KEY (`CI_N`);

--
-- Indices de la tabla `profesora`
--
ALTER TABLE `profesora`
  ADD PRIMARY KEY (`CI_Prof`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_reporte` (`CI_N`,`FechaRep`),
  ADD KEY `CI_Prof` (`CI_Prof`);

--
-- Indices de la tabla `tutores`
--
ALTER TABLE `tutores`
  ADD PRIMARY KEY (`CI_T`),
  ADD KEY `CI_N` (`CI_N`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mensualidad`
--
ALTER TABLE `mensualidad`
  MODIFY `ID_M` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`CI_N`) REFERENCES `ninos` (`CI_N`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `inscripcion_ibfk_1` FOREIGN KEY (`CI_N`) REFERENCES `ninos` (`CI_N`),
  ADD CONSTRAINT `inscripcion_ibfk_2` FOREIGN KEY (`CI_Adm`) REFERENCES `administracion` (`CI_Adm`);

--
-- Filtros para la tabla `mensualidad`
--
ALTER TABLE `mensualidad`
  ADD CONSTRAINT `mensualidad_ibfk_1` FOREIGN KEY (`CI_N`) REFERENCES `ninos` (`CI_N`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`CI_N`) REFERENCES `ninos` (`CI_N`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reportes_ibfk_2` FOREIGN KEY (`CI_Prof`) REFERENCES `profesora` (`CI_Prof`);

--
-- Filtros para la tabla `tutores`
--
ALTER TABLE `tutores`
  ADD CONSTRAINT `tutores_ibfk_1` FOREIGN KEY (`CI_N`) REFERENCES `ninos` (`CI_N`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
