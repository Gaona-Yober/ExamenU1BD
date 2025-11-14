-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 14-11-2025 a las 14:18:03
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
-- Base de datos: `tienda_tecnologica_v3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `codigo` varchar(10) NOT NULL,
  `codigo_inventario` varchar(10) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`codigo`, `codigo_inventario`, `precio`, `descripcion`, `marca`, `modelo`, `img_url`) VALUES
('ART001', 'INV001', 250.00, 'Computadora portátil Lenovo', 'Lenovo', 'IdeaPad3', 'https://example.com/lenovo.jpg'),
('ART002', 'INV002', 30.50, 'Mouse inalámbrico Logitech', 'Logitech', 'M185', 'https://example.com/mouse.jpg'),
('ART003', 'INV003', 899.99, 'Teléfono Samsung Galaxy', 'Samsung', 'S23', 'https://example.com/samsung.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_oferta`
--

CREATE TABLE `detalle_oferta` (
  `id` int(11) NOT NULL,
  `id_oferta` int(11) NOT NULL,
  `codigo_articulo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_oferta`
--

INSERT INTO `detalle_oferta` (`id`, `id_oferta`, `codigo_articulo`) VALUES
(1, 1, 'ART001'),
(2, 2, 'ART003'),
(3, 3, 'ART002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL,
  `id_pedido` varchar(10) DEFAULT NULL,
  `N_articulos` int(11) NOT NULL,
  `id_articulo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `id_pedido`, `N_articulos`, `id_articulo`) VALUES
(1, 'PED001', 2, 'ART001'),
(2, 'PED002', 1, 'ART003'),
(3, 'PED003', 3, 'ART002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id` int(11) NOT NULL,
  `dni_usuario` varchar(10) DEFAULT NULL,
  `calle_primaria` varchar(100) NOT NULL,
  `calle_secundaria` varchar(100) NOT NULL,
  `referencia` varchar(250) NOT NULL,
  `ciudad` varchar(25) NOT NULL,
  `N_casa` varchar(10) DEFAULT NULL,
  `provincia` varchar(25) DEFAULT NULL,
  `cod_postal` varchar(6) NOT NULL,
  `pais` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id`, `dni_usuario`, `calle_primaria`, `calle_secundaria`, `referencia`, `ciudad`, `N_casa`, `provincia`, `cod_postal`, `pais`) VALUES
(1, '1102345678', 'Av. Loja', 'Calle Sucre', 'Cerca del parque central', 'Loja', '120', 'Loja', '110101', 'Ecuador'),
(2, '1109876543', 'Calle Quito', 'Calle Bolívar', 'Frente al supermercado', 'Cuenca', '45', 'Azuay', '010203', 'Ecuador'),
(3, '1104567890', 'Av. Universitaria', 'Calle 10 de Agosto', 'Edificio azul', 'Quito', '300', 'Pichincha', '170505', 'Ecuador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `num_factura` varchar(10) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`num_factura`, `fecha`) VALUES
('FAC001', '2025-11-10'),
('FAC002', '2025-11-11'),
('FAC003', '2025-11-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `codigo` varchar(10) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`codigo`, `cantidad`) VALUES
('INV001', 50),
('INV002', 120),
('INV003', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta`
--

CREATE TABLE `oferta` (
  `id_oferta` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `tipo` varchar(60) NOT NULL,
  `valor` decimal(9,2) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `oferta`
--

INSERT INTO `oferta` (`id_oferta`, `nombre`, `tipo`, `valor`, `fecha_inicio`, `fecha_fin`) VALUES
(1, 'Descuento Primavera', 'porcentaje', 10.00, '2025-09-01', '2025-09-30'),
(2, 'Black Friday', 'monto', 100.00, '2025-11-25', '2025-11-30'),
(3, 'Navidad 2x1', 'promocion', 0.00, '2025-12-15', '2025-12-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `codigo` varchar(10) NOT NULL,
  `metodo_pago` varchar(25) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`codigo`, `metodo_pago`, `estado`) VALUES
('PAG001', 'Tarjeta', 'Completado'),
('PAG002', 'Efectivo', 'Pendiente'),
('PAG003', 'Transferencia', 'Completado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `N_pedido` varchar(10) NOT NULL,
  `dni_usuario` varchar(10) NOT NULL,
  `codigo_pago` varchar(10) NOT NULL,
  `num_factura` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`N_pedido`, `dni_usuario`, `codigo_pago`, `num_factura`) VALUES
('PED001', '1102345678', 'PAG001', 'FAC001'),
('PED002', '1109876543', 'PAG002', 'FAC002'),
('PED003', '1104567890', 'PAG003', 'FAC003');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `N_tarjeta` varchar(16) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `cvc` varchar(3) NOT NULL,
  `fecha_venc` varchar(7) NOT NULL,
  `dni_usuario` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarjeta`
--

INSERT INTO `tarjeta` (`N_tarjeta`, `tipo`, `cvc`, `fecha_venc`, `dni_usuario`) VALUES
('4029123411112222', 'VISA', '789', '2028-11', '1104567890'),
('4539123412341234', 'VISA', '123', '2027-08', '1102345678'),
('5123987654329876', 'MASTERCARD', '456', '2026-05', '1109876543');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `DNI` varchar(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `rol` varchar(25) NOT NULL,
  `correo` varchar(350) NOT NULL,
  `contrasenia` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`DNI`, `nombre`, `apellido`, `rol`, `correo`, `contrasenia`) VALUES
('1102345678', 'Carlos', 'Pérez', 'cliente', 'carlos.perez@gmail.com', '12345abc'),
('1104567890', 'José', 'Ruiz', 'cliente', 'jose.ruiz@hotmail.com', 'ruiz2025'),
('1109876543', 'María', 'Gómez', 'admin', 'maria.gomez@gmail.com', 'admin2025');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo_inventario` (`codigo_inventario`);

--
-- Indices de la tabla `detalle_oferta`
--
ALTER TABLE `detalle_oferta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_oferta` (`id_oferta`),
  ADD KEY `codigo_articulo` (`codigo_articulo`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_articulo` (`id_articulo`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dni_usuario` (`dni_usuario`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`num_factura`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `oferta`
--
ALTER TABLE `oferta`
  ADD PRIMARY KEY (`id_oferta`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`N_pedido`),
  ADD KEY `dni_usuario` (`dni_usuario`),
  ADD KEY `codigo_pago` (`codigo_pago`),
  ADD KEY `num_factura` (`num_factura`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`N_tarjeta`),
  ADD KEY `dni_usuario` (`dni_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`DNI`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_oferta`
--
ALTER TABLE `detalle_oferta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `oferta`
--
ALTER TABLE `oferta`
  MODIFY `id_oferta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `articulo_ibfk_1` FOREIGN KEY (`codigo_inventario`) REFERENCES `inventario` (`codigo`);

--
-- Filtros para la tabla `detalle_oferta`
--
ALTER TABLE `detalle_oferta`
  ADD CONSTRAINT `detalle_oferta_ibfk_1` FOREIGN KEY (`id_oferta`) REFERENCES `oferta` (`id_oferta`),
  ADD CONSTRAINT `detalle_oferta_ibfk_2` FOREIGN KEY (`codigo_articulo`) REFERENCES `articulo` (`codigo`);

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`N_pedido`),
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_articulo`) REFERENCES `articulo` (`codigo`);

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`dni_usuario`) REFERENCES `usuario` (`DNI`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`dni_usuario`) REFERENCES `usuario` (`DNI`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`codigo_pago`) REFERENCES `pago` (`codigo`),
  ADD CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`num_factura`) REFERENCES `factura` (`num_factura`);

--
-- Filtros para la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD CONSTRAINT `tarjeta_ibfk_1` FOREIGN KEY (`dni_usuario`) REFERENCES `usuario` (`DNI`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
