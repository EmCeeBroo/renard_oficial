-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-04-2025 a las 07:27:51
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `renard_db`
--
CREATE DATABASE IF NOT EXISTS `renard_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `renard_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_menu`
--

CREATE TABLE IF NOT EXISTS `categoria_menu` (
  `id_categoria_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_categoria_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `categoria_menu`
--

TRUNCATE TABLE `categoria_menu`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_mesa`
--

CREATE TABLE IF NOT EXISTS `estado_mesa` (
  `id_estado_mesa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_estado_mesa`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `estado_mesa`
--

TRUNCATE TABLE `estado_mesa`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_reservacion`
--

CREATE TABLE IF NOT EXISTS `estado_reservacion` (
  `id_estado_reservacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_estado_reservacion`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `estado_reservacion`
--

TRUNCATE TABLE `estado_reservacion`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_usuario`
--

CREATE TABLE IF NOT EXISTS `estado_usuario` (
  `id_estado_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_estado_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `estado_usuario`
--

TRUNCATE TABLE `estado_usuario`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_reservacion`
--

CREATE TABLE IF NOT EXISTS `historial_reservacion` (
  `id_historial_reservacion` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_cambio_estado` varchar(50) NOT NULL,
  `reservacion_fk` int(11) NOT NULL,
  PRIMARY KEY (`id_historial_reservacion`),
  KEY `reservacion_fk` (`reservacion_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `historial_reservacion`
--

TRUNCATE TABLE `historial_reservacion`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `categoria_menu_fk` int(11) NOT NULL,
  `restaurante_fk` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_menu`),
  KEY `categoria_menu_fk` (`categoria_menu_fk`),
  KEY `restaurante_fk` (`restaurante_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `menu`
--

TRUNCATE TABLE `menu`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE IF NOT EXISTS `mesa` (
  `id_mesa` int(11) NOT NULL AUTO_INCREMENT,
  `zona_fk` int(11) NOT NULL,
  `estado_mesa_fk` int(11) NOT NULL,
  `restaurante_fk` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_mesa`),
  KEY `zona_fk` (`zona_fk`),
  KEY `estado_mesa_fk` (`estado_mesa_fk`),
  KEY `restaurante_fk` (`restaurante_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `mesa`
--

TRUNCATE TABLE `mesa`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE IF NOT EXISTS `modulo` (
  `id_modulo` int(11) NOT NULL AUTO_INCREMENT,
  `ruta` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_modulo`),
  UNIQUE KEY `ruta` (`ruta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `modulo`
--

TRUNCATE TABLE `modulo`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo_rol`
--

CREATE TABLE IF NOT EXISTS `modulo_rol` (
  `id_modulo_rol` int(11) NOT NULL AUTO_INCREMENT,
  `modulo_fk` int(11) NOT NULL,
  `rol_fk` int(11) NOT NULL,
  PRIMARY KEY (`id_modulo_rol`),
  KEY `modulo_fk` (`modulo_fk`),
  KEY `rol_fk` (`rol_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `modulo_rol`
--

TRUNCATE TABLE `modulo_rol`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `usuario_fk` int(11) NOT NULL,
  `tipo_documento_fk` int(11) NOT NULL,
  `numero_documento` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_perfil`),
  UNIQUE KEY `direccion` (`direccion`),
  UNIQUE KEY `correo` (`correo`),
  KEY `usuario_fk` (`usuario_fk`),
  KEY `tipo_documento_fk` (`tipo_documento_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `perfil`
--

TRUNCATE TABLE `perfil`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE IF NOT EXISTS `permisos` (
  `id_permisos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_permisos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `permisos`
--

TRUNCATE TABLE `permisos`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_modulo_rol`
--

CREATE TABLE IF NOT EXISTS `permisos_modulo_rol` (
  `id_permisos_modulo_rol` int(11) NOT NULL AUTO_INCREMENT,
  `modulo_rol_fk` int(11) NOT NULL,
  `permisos_fk` int(11) NOT NULL,
  PRIMARY KEY (`id_permisos_modulo_rol`),
  KEY `modulo_rol_fk` (`modulo_rol_fk`),
  KEY `permisos_fk` (`permisos_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `permisos_modulo_rol`
--

TRUNCATE TABLE `permisos_modulo_rol`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `tipo_producto_fk` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_producto`),
  KEY `tipo_producto_fk` (`tipo_producto_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `producto`
--

TRUNCATE TABLE `producto`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_menu`
--

CREATE TABLE IF NOT EXISTS `producto_menu` (
  `id_producto_menu` int(11) NOT NULL AUTO_INCREMENT,
  `producto_fk` int(11) NOT NULL,
  `menu_fk` int(11) NOT NULL,
  PRIMARY KEY (`id_producto_menu`),
  KEY `producto_fk` (`producto_fk`),
  KEY `menu_fk` (`menu_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `producto_menu`
--

TRUNCATE TABLE `producto_menu`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `qr_menu`
--

CREATE TABLE IF NOT EXISTS `qr_menu` (
  `id_qr_menu` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `codigo_qr` varchar(255) NOT NULL,
  `restaurante_fk` int(11) NOT NULL,
  `menu_fk` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_qr_menu`),
  KEY `restaurante_fk` (`restaurante_fk`),
  KEY `menu_fk` (`menu_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `qr_menu`
--

TRUNCATE TABLE `qr_menu`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservacion`
--

CREATE TABLE IF NOT EXISTS `reservacion` (
  `id_reservacion` int(11) NOT NULL AUTO_INCREMENT,
  `numero_personas` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario_fk` int(11) NOT NULL,
  `estado_reservacion` int(11) NOT NULL,
  `restaurante_fk` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `anotaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_reservacion`),
  KEY `usuario_fk` (`usuario_fk`),
  KEY `estado_reservacion` (`estado_reservacion`),
  KEY `restaurante_fk` (`restaurante_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `reservacion`
--

TRUNCATE TABLE `reservacion`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurante`
--

CREATE TABLE IF NOT EXISTS `restaurante` (
  `id_restaurante` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `url_menu` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_restaurante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `restaurante`
--

TRUNCATE TABLE `restaurante`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `rol`
--

TRUNCATE TABLE `rol`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_tipo_documento`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `tipo_documento`
--

TRUNCATE TABLE `tipo_documento`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE IF NOT EXISTS `tipo_producto` (
  `id_tipo_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_tipo_producto`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `tipo_producto`
--

TRUNCATE TABLE `tipo_producto`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE IF NOT EXISTS `ubicacion` (
  `id_ubicacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `ciudad` varchar(60) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `restaurante_fk` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_ubicacion`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `direccion` (`direccion`),
  KEY `restaurante_fk` (`restaurante_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `ubicacion`
--

TRUNCATE TABLE `ubicacion`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `estado_usuario_fk` int(11) NOT NULL,
  `rol_fk` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_usuario`),
  KEY `estado_usuario_fk` (`estado_usuario_fk`),
  KEY `rol_fk` (`rol_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `usuario`
--

TRUNCATE TABLE `usuario`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_api`
--

CREATE TABLE IF NOT EXISTS `usuarios_api` (
  `usuario_api_id` int(11) NOT NULL,
  `usuario_api` varchar(60) NOT NULL,
  `contraseña_api` varchar(255) NOT NULL,
  `rol_api` enum('Admin','Read-only') NOT NULL,
  `estado_api` enum('Active','Inactive') NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `usuarios_api`
--

TRUNCATE TABLE `usuarios_api`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona`
--

CREATE TABLE IF NOT EXISTS `zona` (
  `id_zona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_zona`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncar tablas antes de insertar `zona`
--

TRUNCATE TABLE `zona`;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historial_reservacion`
--
ALTER TABLE `historial_reservacion`
  ADD CONSTRAINT `historial_reservacion_ibfk_1` FOREIGN KEY (`reservacion_fk`) REFERENCES `reservacion` (`id_reservacion`);

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`categoria_menu_fk`) REFERENCES `categoria_menu` (`id_categoria_menu`),
  ADD CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`restaurante_fk`) REFERENCES `restaurante` (`id_restaurante`);

--
-- Filtros para la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD CONSTRAINT `mesa_ibfk_1` FOREIGN KEY (`zona_fk`) REFERENCES `zona` (`id_zona`),
  ADD CONSTRAINT `mesa_ibfk_2` FOREIGN KEY (`estado_mesa_fk`) REFERENCES `estado_mesa` (`id_estado_mesa`),
  ADD CONSTRAINT `mesa_ibfk_3` FOREIGN KEY (`restaurante_fk`) REFERENCES `restaurante` (`id_restaurante`);

--
-- Filtros para la tabla `modulo_rol`
--
ALTER TABLE `modulo_rol`
  ADD CONSTRAINT `modulo_rol_ibfk_1` FOREIGN KEY (`modulo_fk`) REFERENCES `modulo` (`id_modulo`),
  ADD CONSTRAINT `modulo_rol_ibfk_2` FOREIGN KEY (`rol_fk`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD CONSTRAINT `perfil_ibfk_1` FOREIGN KEY (`usuario_fk`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `perfil_ibfk_2` FOREIGN KEY (`tipo_documento_fk`) REFERENCES `tipo_documento` (`id_tipo_documento`);

--
-- Filtros para la tabla `permisos_modulo_rol`
--
ALTER TABLE `permisos_modulo_rol`
  ADD CONSTRAINT `permisos_modulo_rol_ibfk_1` FOREIGN KEY (`modulo_rol_fk`) REFERENCES `modulo_rol` (`id_modulo_rol`),
  ADD CONSTRAINT `permisos_modulo_rol_ibfk_2` FOREIGN KEY (`permisos_fk`) REFERENCES `permisos` (`id_permisos`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`tipo_producto_fk`) REFERENCES `tipo_producto` (`id_tipo_producto`);

--
-- Filtros para la tabla `producto_menu`
--
ALTER TABLE `producto_menu`
  ADD CONSTRAINT `producto_menu_ibfk_1` FOREIGN KEY (`producto_fk`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `producto_menu_ibfk_2` FOREIGN KEY (`menu_fk`) REFERENCES `menu` (`id_menu`);

--
-- Filtros para la tabla `qr_menu`
--
ALTER TABLE `qr_menu`
  ADD CONSTRAINT `qr_menu_ibfk_1` FOREIGN KEY (`restaurante_fk`) REFERENCES `restaurante` (`id_restaurante`),
  ADD CONSTRAINT `qr_menu_ibfk_2` FOREIGN KEY (`menu_fk`) REFERENCES `menu` (`id_menu`);

--
-- Filtros para la tabla `reservacion`
--
ALTER TABLE `reservacion`
  ADD CONSTRAINT `reservacion_ibfk_1` FOREIGN KEY (`usuario_fk`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `reservacion_ibfk_2` FOREIGN KEY (`estado_reservacion`) REFERENCES `estado_reservacion` (`id_estado_reservacion`),
  ADD CONSTRAINT `reservacion_ibfk_3` FOREIGN KEY (`restaurante_fk`) REFERENCES `restaurante` (`id_restaurante`);

--
-- Filtros para la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD CONSTRAINT `ubicacion_ibfk_1` FOREIGN KEY (`restaurante_fk`) REFERENCES `restaurante` (`id_restaurante`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`estado_usuario_fk`) REFERENCES `estado_usuario` (`id_estado_usuario`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`rol_fk`) REFERENCES `rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
