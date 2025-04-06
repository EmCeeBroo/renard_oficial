--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-04-2025 a las 03:05:24
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_menu`
--

CREATE TABLE `categoria_menu` (
  `id_categoria_menu` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_mesa`
--

CREATE TABLE `estado_mesa` (
  `id_estado_mesa` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_reservacion`
--

CREATE TABLE `estado_reservacion` (
  `id_estado_reservacion` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_usuario`
--

CREATE TABLE `estado_usuario` (
  `id_estado_usuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_reservacion`
--

CREATE TABLE `historial_reservacion` (
  `id_historial_reservacion` int(11) NOT NULL,
  `fecha_cambio_estado` varchar(50) NOT NULL,
  `reservacion_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `categoria_menu_fk` int(11) NOT NULL,
  `restaurante_fk` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `id_mesa` int(11) NOT NULL,
  `zona_fk` int(11) NOT NULL,
  `estado_mesa_fk` int(11) NOT NULL,
  `restaurante_fk` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `id_modulo` int(11) NOT NULL,
  `ruta` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo_rol`
--

CREATE TABLE `modulo_rol` (
  `id_modulo_rol` int(11) NOT NULL,
  `modulo_fk` int(11) NOT NULL,
  `rol_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `usuario_fk` int(11) NOT NULL,
  `tipo_documento_fk` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_permisos` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_modulo_rol`
--

CREATE TABLE `permisos_modulo_rol` (
  `id_permisos_modulo_rol` int(11) NOT NULL,
  `modulo_rol_fk` int(11) NOT NULL,
  `permisos_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `tipo_producto_fk` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_menu`
--

CREATE TABLE `producto_menu` (
  `id_producto_menu` int(11) NOT NULL,
  `producto_fk` int(11) NOT NULL,
  `menu_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `qr_menu`
--

CREATE TABLE `qr_menu` (
  `id_qr_menu` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `codigo_qr` varchar(255) NOT NULL,
  `restaurante_fk` int(11) NOT NULL,
  `menu_fk` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservacion`
--

CREATE TABLE `reservacion` (
  `id_reservacion` int(11) NOT NULL,
  `numero_personas` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario_fk` int(11) NOT NULL,
  `estado_reservacion` int(11) NOT NULL,
  `restaurante_fk` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurante`
--

CREATE TABLE `restaurante` (
  `id_restaurante` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `url_menu` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id_tipo_documento` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `id_tipo_producto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id_ubicacion` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `ciudad` varchar(60) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `restaurante_fk` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `estado_usuario_fk` int(11) NOT NULL,
  `rol_fk` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_api`
--

CREATE TABLE `usuarios_api` (
  `usuario_api_id` int(11) NOT NULL,
  `usuario_api` varchar(60) NOT NULL,
  `contraseña_api` varchar(255) NOT NULL,
  `rol_api` enum('Admin','Read-only') NOT NULL,
  `estado_api` enum('Active','Inactive') NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona`
--

CREATE TABLE `zona` (
  `id_zona` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria_menu`
--
ALTER TABLE `categoria_menu`
  ADD PRIMARY KEY (`id_categoria_menu`);

--
-- Indices de la tabla `estado_mesa`
--
ALTER TABLE `estado_mesa`
  ADD PRIMARY KEY (`id_estado_mesa`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `estado_reservacion`
--
ALTER TABLE `estado_reservacion`
  ADD PRIMARY KEY (`id_estado_reservacion`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  ADD PRIMARY KEY (`id_estado_usuario`);

--
-- Indices de la tabla `historial_reservacion`
--
ALTER TABLE `historial_reservacion`
  ADD PRIMARY KEY (`id_historial_reservacion`),
  ADD KEY `reservacion_fk` (`reservacion_fk`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `categoria_menu_fk` (`categoria_menu_fk`),
  ADD KEY `restaurante_fk` (`restaurante_fk`);

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`id_mesa`),
  ADD KEY `zona_fk` (`zona_fk`),
  ADD KEY `estado_mesa_fk` (`estado_mesa_fk`),
  ADD KEY `restaurante_fk` (`restaurante_fk`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id_modulo`),
  ADD UNIQUE KEY `ruta` (`ruta`);

--
-- Indices de la tabla `modulo_rol`
--
ALTER TABLE `modulo_rol`
  ADD PRIMARY KEY (`id_modulo_rol`),
  ADD KEY `modulo_fk` (`modulo_fk`),
  ADD KEY `rol_fk` (`rol_fk`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`),
  ADD UNIQUE KEY `direccion` (`direccion`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `usuario_fk` (`usuario_fk`),
  ADD KEY `tipo_documento_fk` (`tipo_documento_fk`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_permisos`);

--
-- Indices de la tabla `permisos_modulo_rol`
--
ALTER TABLE `permisos_modulo_rol`
  ADD PRIMARY KEY (`id_permisos_modulo_rol`),
  ADD KEY `modulo_rol_fk` (`modulo_rol_fk`),
  ADD KEY `permisos_fk` (`permisos_fk`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `tipo_producto_fk` (`tipo_producto_fk`);

--
-- Indices de la tabla `producto_menu`
--
ALTER TABLE `producto_menu`
  ADD PRIMARY KEY (`id_producto_menu`),
  ADD KEY `producto_fk` (`producto_fk`),
  ADD KEY `menu_fk` (`menu_fk`);

--
-- Indices de la tabla `qr_menu`
--
ALTER TABLE `qr_menu`
  ADD PRIMARY KEY (`id_qr_menu`),
  ADD KEY `restaurante_fk` (`restaurante_fk`),
  ADD KEY `menu_fk` (`menu_fk`);

--
-- Indices de la tabla `reservacion`
--
ALTER TABLE `reservacion`
  ADD PRIMARY KEY (`id_reservacion`),
  ADD KEY `usuario_fk` (`usuario_fk`),
  ADD KEY `estado_reservacion` (`estado_reservacion`),
  ADD KEY `restaurante_fk` (`restaurante_fk`);

--
-- Indices de la tabla `restaurante`
--
ALTER TABLE `restaurante`
  ADD PRIMARY KEY (`id_restaurante`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id_tipo_documento`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`id_tipo_producto`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id_ubicacion`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `direccion` (`direccion`),
  ADD KEY `restaurante_fk` (`restaurante_fk`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `estado_usuario_fk` (`estado_usuario_fk`),
  ADD KEY `rol_fk` (`rol_fk`);

--
-- Indices de la tabla `zona`
--
ALTER TABLE `zona`
  ADD PRIMARY KEY (`id_zona`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria_menu`
--
ALTER TABLE `categoria_menu`
  MODIFY `id_categoria_menu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_mesa`
--
ALTER TABLE `estado_mesa`
  MODIFY `id_estado_mesa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_reservacion`
--
ALTER TABLE `estado_reservacion`
  MODIFY `id_estado_reservacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_usuario`
--
ALTER TABLE `estado_usuario`
  MODIFY `id_estado_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_reservacion`
--
ALTER TABLE `historial_reservacion`
  MODIFY `id_historial_reservacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mesa`
--
ALTER TABLE `mesa`
  MODIFY `id_mesa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id_modulo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modulo_rol`
--
ALTER TABLE `modulo_rol`
  MODIFY `id_modulo_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permisos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos_modulo_rol`
--
ALTER TABLE `permisos_modulo_rol`
  MODIFY `id_permisos_modulo_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto_menu`
--
ALTER TABLE `producto_menu`
  MODIFY `id_producto_menu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `qr_menu`
--
ALTER TABLE `qr_menu`
  MODIFY `id_qr_menu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reservacion`
--
ALTER TABLE `reservacion`
  MODIFY `id_reservacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `restaurante`
--
ALTER TABLE `restaurante`
  MODIFY `id_restaurante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `id_tipo_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id_ubicacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `zona`
--
ALTER TABLE `zona`
  MODIFY `id_zona` int(11) NOT NULL AUTO_INCREMENT;

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
