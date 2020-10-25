-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-10-2020 a las 03:44:57
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comidas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cli_codigocliente` int(10) NOT NULL,
  `cli_nombre` varchar(255) NOT NULL,
  `cli_apellido` varchar(255) NOT NULL,
  `cli_email` varchar(255) NOT NULL,
  `cli_telefono` int(10) NOT NULL,
  `cli_celular` int(10) NOT NULL,
  `cli_direccion` varchar(255) NOT NULL,
  `cli_codigopostal` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen_producto`
--

CREATE TABLE `imagen_producto` (
  `img_codigoimagen` int(10) NOT NULL,
  `img_imagen` varchar(255) NOT NULL,
  `img_titulo` varchar(255) NOT NULL,
  `img_descripcion` varchar(255) NOT NULL,
  `pro_codigoproducto` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea_pedido`
--

CREATE TABLE `linea_pedido` (
  `lin_codigolinea` int(10) NOT NULL,
  `lin_unidad` int(10) NOT NULL,
  `ped_codigopedido` int(10) NOT NULL,
  `pro_codigoproducto` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `ped_codigopedido` int(10) NOT NULL,
  `ped_fecha` varchar(20) NOT NULL,
  `ped_estado` varchar(20) NOT NULL,
  `cli_codigocliente` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `pro_codigoproducto` int(10) NOT NULL,
  `pro_nombre` varchar(100) NOT NULL,
  `pro_precio` decimal(12,3) NOT NULL,
  `pro_existencias` int(10) NOT NULL,
  `pro_descripcion` varchar(255) NOT NULL,
  `pro_activado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `tip_codigotipouser` int(10) NOT NULL,
  `tip_tipo_usuario` varchar(50) NOT NULL,
  `cli_codigocliente` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usu_codigo` int(10) NOT NULL,
  `usu_nombre` varchar(55) NOT NULL,
  `usu_usuario` varchar(55) NOT NULL,
  `usu_contrasena` varchar(55) NOT NULL,
  `tip_codigotipouser` int(10) NOT NULL,
  `cli_codigocliente` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cli_codigocliente`);

--
-- Indices de la tabla `imagen_producto`
--
ALTER TABLE `imagen_producto`
  ADD PRIMARY KEY (`img_codigoimagen`),
  ADD KEY `pro_codigoproducto` (`pro_codigoproducto`);

--
-- Indices de la tabla `linea_pedido`
--
ALTER TABLE `linea_pedido`
  ADD PRIMARY KEY (`lin_codigolinea`),
  ADD KEY `ped_codigopedido` (`ped_codigopedido`),
  ADD KEY `pro_codigoproducto` (`pro_codigoproducto`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`ped_codigopedido`),
  ADD KEY `cli_codigocliente` (`cli_codigocliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`pro_codigoproducto`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`tip_codigotipouser`),
  ADD KEY `cli_codigocliente` (`cli_codigocliente`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usu_codigo`),
  ADD KEY `tip_codigotipouser` (`tip_codigotipouser`),
  ADD KEY `cli_codigocliente` (`cli_codigocliente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `imagen_producto`
--
ALTER TABLE `imagen_producto`
  ADD CONSTRAINT `imagen_producto_ibfk_1` FOREIGN KEY (`pro_codigoproducto`) REFERENCES `producto` (`pro_codigoproducto`);

--
-- Filtros para la tabla `linea_pedido`
--
ALTER TABLE `linea_pedido`
  ADD CONSTRAINT `linea_pedido_ibfk_1` FOREIGN KEY (`ped_codigopedido`) REFERENCES `pedido` (`ped_codigopedido`),
  ADD CONSTRAINT `linea_pedido_ibfk_2` FOREIGN KEY (`pro_codigoproducto`) REFERENCES `producto` (`pro_codigoproducto`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`cli_codigocliente`) REFERENCES `cliente` (`cli_codigocliente`);

--
-- Filtros para la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD CONSTRAINT `tipo_usuario_ibfk_1` FOREIGN KEY (`cli_codigocliente`) REFERENCES `cliente` (`cli_codigocliente`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`tip_codigotipouser`) REFERENCES `tipo_usuario` (`tip_codigotipouser`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`cli_codigocliente`) REFERENCES `cliente` (`cli_codigocliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
