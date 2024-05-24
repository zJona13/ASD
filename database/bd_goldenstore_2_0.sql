-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 17-05-2024 a las 22:11:52
-- Versión del servidor: 8.0.36-0ubuntu0.22.04.1
-- Versión de PHP: 8.1.2-1ubuntu2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_goldenstore`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Banco_Usuario`
--

CREATE TABLE `Banco_Usuario` (
  `id_BancoUsuario` bigint NOT NULL,
  `numeroTarjeta` int NOT NULL,
  `fechaMes` date NOT NULL,
  `fechaAño` date NOT NULL,
  `cvv` char(3) COLLATE utf8mb4_general_ci NOT NULL,
  `tipoCuenta` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tatus` tinyint NOT NULL,
  `id_Usuario` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Carrito`
--

CREATE TABLE `Carrito` (
  `id_Carrito` bigint NOT NULL,
  `id_Usuario` bigint NOT NULL,
  `id_Producto` bigint NOT NULL,
  `descuento` decimal(9,2) DEFAULT NULL,
  `igv` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Carrito_Item`
--

CREATE TABLE `Carrito_Item` (
  `id_CarritoItem` bigint NOT NULL,
  `monto` decimal(9,2) NOT NULL,
  `descuento` decimal(9,2) DEFAULT NULL,
  `cantidad` int NOT NULL,
  `monto_total` int NOT NULL,
  `id_Carrito` bigint NOT NULL,
  `id_Usuario` bigint NOT NULL,
  `id_Producto` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categoria`
--

CREATE TABLE `Categoria` (
  `id_Categoria` int NOT NULL,
  `nombreCategoria` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Categoria`
--

INSERT INTO `Categoria` (`id_Categoria`, `nombreCategoria`) VALUES
(1, 'Estilo Casual'),
(2, 'Estilo Clasico'),
(3, 'Estilo Vintage'),
(4, 'Estilo Rockero'),
(5, 'Estilo Deportivo'),
(6, 'Estilo Minimalista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Direccion`
--

CREATE TABLE `Direccion` (
  `id_Direccion` bigint NOT NULL,
  `pais` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `departamento` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `ciudad` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `codigoPostal` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `referencia` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_Usuario` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Envio`
--

CREATE TABLE `Envio` (
  `id_Envio` bigint NOT NULL,
  `fechaEnvio` date NOT NULL,
  `pais` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `departamento` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `ciudad` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `codigoPostal` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `referencia` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Inventario`
--

CREATE TABLE `Inventario` (
  `id_Inventario` bigint NOT NULL,
  `stock` int NOT NULL,
  `fechaCreacion` int NOT NULL,
  `fechaActualizacion` datetime NOT NULL,
  `status` tinyint NOT NULL,
  `id_Producto` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Login`
--

CREATE TABLE `Login` (
  `id_Login` bigint NOT NULL,
  `usuario` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `contraseña` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `id_TipoUsuario` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pago`
--

CREATE TABLE `Pago` (
  `id_Pago` bigint NOT NULL,
  `fechaPago` date NOT NULL,
  `metodoPago` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `monto` decimal(9,2) NOT NULL,
  `id_BancoUsuario` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pago_Pedido`
--

CREATE TABLE `Pago_Pedido` (
  `id_Pago` bigint NOT NULL,
  `id_Pedido` bigint NOT NULL,
  `id_DetallePedido` bigint NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pedido`
--

CREATE TABLE `Pedido` (
  `id_Pedido` bigint NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `fechaPedido` date NOT NULL,
  `monto_total` decimal(9,2) NOT NULL,
  `subTotal` decimal(9,2) NOT NULL,
  `descuento` decimal(9,2) NOT NULL,
  `igv` decimal(9,2) NOT NULL,
  `status` tinyint NOT NULL,
  `id_Carrito` bigint NOT NULL,
  `id_Usuario` bigint NOT NULL,
  `id_Producto` bigint NOT NULL,
  `id_Envio` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Producto`
--

CREATE TABLE `Producto` (
  `id_Producto` bigint NOT NULL,
  `imagen` longblob NOT NULL,
  `nombreProducto` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `talla` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `monto` decimal(9,2) NOT NULL,
  `descuento` decimal(9,2) DEFAULT NULL,
  `monto_total` decimal(9,2) NOT NULL,
  `status` tinyint NOT NULL,
  `id_Categoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Producto`
--

INSERT INTO `Producto` (`id_Producto`, `imagen`, `nombreProducto`, `descripcion`, `talla`, `monto`, `descuento`, `monto_total`, `status`, `id_Categoria`) VALUES
(2, 0x352e77656270, 'Pro1', 'Polito', 'M', '41.05', '1.20', '55.40', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tipo_Documento`
--

CREATE TABLE `Tipo_Documento` (
  `id_TipoDocumento` bigint NOT NULL,
  `nomTipoDocumento` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Tipo_Documento`
--

INSERT INTO `Tipo_Documento` (`id_TipoDocumento`, `nomTipoDocumento`) VALUES
(1, 'DNI'),
(2, 'RUC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tipo_Usuario`
--

CREATE TABLE `Tipo_Usuario` (
  `id_TipoUsuario` bigint NOT NULL,
  `nomTipoUsuario` varchar(45) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Tipo_Usuario`
--

INSERT INTO `Tipo_Usuario` (`id_TipoUsuario`, `nomTipoUsuario`) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `id_Usuario` bigint NOT NULL,
  `avatar` longblob,
  `numeroDocumento` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `nombres` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `usuario` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `contraseña` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` char(9) COLLATE utf8mb4_general_ci NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `fechaCreación` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint NOT NULL,
  `id_TipoDocumento` bigint NOT NULL,
  `id_TipoUsuario` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`id_Usuario`, `avatar`, `numeroDocumento`, `nombres`, `apellidos`, `usuario`, `email`, `contraseña`, `telefono`, `fechaNacimiento`, `fechaCreación`, `status`, `id_TipoDocumento`, `id_TipoUsuario`) VALUES
(2, NULL, '1234567', 'Pepillo', 'Malillo', 'Malilpillo', 'malpi@gmail.com', '123456', '123456789', '2010-10-10', '2024-05-17 15:58:56', 1, 1, 1),
(13, NULL, '11111111111', 'Pepillo', 'Malillo', 'HablaCau', 'jajajaj@gmial.com', '1111111', '12345678', '2010-10-02', '2024-05-17 16:05:13', 1, 2, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Banco_Usuario`
--
ALTER TABLE `Banco_Usuario`
  ADD PRIMARY KEY (`id_BancoUsuario`),
  ADD UNIQUE KEY `numeroTarjeta` (`numeroTarjeta`),
  ADD KEY `FKBanco_Usua460724` (`id_Usuario`);

--
-- Indices de la tabla `Carrito`
--
ALTER TABLE `Carrito`
  ADD PRIMARY KEY (`id_Carrito`,`id_Usuario`,`id_Producto`),
  ADD KEY `FKCarrito816057` (`id_Usuario`),
  ADD KEY `FKCarrito960677` (`id_Producto`);

--
-- Indices de la tabla `Carrito_Item`
--
ALTER TABLE `Carrito_Item`
  ADD PRIMARY KEY (`id_CarritoItem`),
  ADD KEY `FKCarrito_It725452` (`id_Carrito`,`id_Usuario`,`id_Producto`);

--
-- Indices de la tabla `Categoria`
--
ALTER TABLE `Categoria`
  ADD PRIMARY KEY (`id_Categoria`);

--
-- Indices de la tabla `Direccion`
--
ALTER TABLE `Direccion`
  ADD PRIMARY KEY (`id_Direccion`),
  ADD UNIQUE KEY `pais` (`pais`),
  ADD KEY `FKDireccion960873` (`id_Usuario`);

--
-- Indices de la tabla `Envio`
--
ALTER TABLE `Envio`
  ADD PRIMARY KEY (`id_Envio`);

--
-- Indices de la tabla `Inventario`
--
ALTER TABLE `Inventario`
  ADD PRIMARY KEY (`id_Inventario`),
  ADD KEY `FKInventario157` (`id_Producto`);

--
-- Indices de la tabla `Login`
--
ALTER TABLE `Login`
  ADD PRIMARY KEY (`id_Login`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `FKLogin225065` (`id_TipoUsuario`);

--
-- Indices de la tabla `Pago`
--
ALTER TABLE `Pago`
  ADD PRIMARY KEY (`id_Pago`),
  ADD KEY `FKPago892421` (`id_BancoUsuario`);

--
-- Indices de la tabla `Pago_Pedido`
--
ALTER TABLE `Pago_Pedido`
  ADD PRIMARY KEY (`id_Pago`,`id_Pedido`,`id_DetallePedido`),
  ADD KEY `FKPago_Pedid251375` (`id_Pedido`);

--
-- Indices de la tabla `Pedido`
--
ALTER TABLE `Pedido`
  ADD PRIMARY KEY (`id_Pedido`),
  ADD KEY `FKPedido949992` (`id_Carrito`,`id_Usuario`,`id_Producto`),
  ADD KEY `FKPedido674200` (`id_Envio`);

--
-- Indices de la tabla `Producto`
--
ALTER TABLE `Producto`
  ADD PRIMARY KEY (`id_Producto`),
  ADD KEY `FKProducto105040` (`id_Categoria`);

--
-- Indices de la tabla `Tipo_Documento`
--
ALTER TABLE `Tipo_Documento`
  ADD PRIMARY KEY (`id_TipoDocumento`);

--
-- Indices de la tabla `Tipo_Usuario`
--
ALTER TABLE `Tipo_Usuario`
  ADD PRIMARY KEY (`id_TipoUsuario`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id_Usuario`),
  ADD UNIQUE KEY `numeroDocumento` (`numeroDocumento`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `telefono` (`telefono`),
  ADD KEY `FKUsuario250236` (`id_TipoDocumento`),
  ADD KEY `fk_TipoUsuario` (`id_TipoUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Banco_Usuario`
--
ALTER TABLE `Banco_Usuario`
  MODIFY `id_BancoUsuario` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Carrito_Item`
--
ALTER TABLE `Carrito_Item`
  MODIFY `id_CarritoItem` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Categoria`
--
ALTER TABLE `Categoria`
  MODIFY `id_Categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Direccion`
--
ALTER TABLE `Direccion`
  MODIFY `id_Direccion` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Envio`
--
ALTER TABLE `Envio`
  MODIFY `id_Envio` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Inventario`
--
ALTER TABLE `Inventario`
  MODIFY `id_Inventario` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Pago`
--
ALTER TABLE `Pago`
  MODIFY `id_Pago` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Pedido`
--
ALTER TABLE `Pedido`
  MODIFY `id_Pedido` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Producto`
--
ALTER TABLE `Producto`
  MODIFY `id_Producto` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Tipo_Documento`
--
ALTER TABLE `Tipo_Documento`
  MODIFY `id_TipoDocumento` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `id_Usuario` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Banco_Usuario`
--
ALTER TABLE `Banco_Usuario`
  ADD CONSTRAINT `FKBanco_Usua460724` FOREIGN KEY (`id_Usuario`) REFERENCES `Usuario` (`id_Usuario`);

--
-- Filtros para la tabla `Carrito`
--
ALTER TABLE `Carrito`
  ADD CONSTRAINT `FKCarrito816057` FOREIGN KEY (`id_Usuario`) REFERENCES `Usuario` (`id_Usuario`),
  ADD CONSTRAINT `FKCarrito960677` FOREIGN KEY (`id_Producto`) REFERENCES `Producto` (`id_Producto`);

--
-- Filtros para la tabla `Carrito_Item`
--
ALTER TABLE `Carrito_Item`
  ADD CONSTRAINT `FKCarrito_It725452` FOREIGN KEY (`id_Carrito`,`id_Usuario`,`id_Producto`) REFERENCES `Carrito` (`id_Carrito`, `id_Usuario`, `id_Producto`);

--
-- Filtros para la tabla `Direccion`
--
ALTER TABLE `Direccion`
  ADD CONSTRAINT `FKDireccion960873` FOREIGN KEY (`id_Usuario`) REFERENCES `Usuario` (`id_Usuario`);

--
-- Filtros para la tabla `Inventario`
--
ALTER TABLE `Inventario`
  ADD CONSTRAINT `FKInventario157` FOREIGN KEY (`id_Producto`) REFERENCES `Producto` (`id_Producto`);

--
-- Filtros para la tabla `Login`
--
ALTER TABLE `Login`
  ADD CONSTRAINT `FKLogin225065` FOREIGN KEY (`id_TipoUsuario`) REFERENCES `Tipo_Usuario` (`id_TipoUsuario`);

--
-- Filtros para la tabla `Pago`
--
ALTER TABLE `Pago`
  ADD CONSTRAINT `FKPago892421` FOREIGN KEY (`id_BancoUsuario`) REFERENCES `Banco_Usuario` (`id_BancoUsuario`);

--
-- Filtros para la tabla `Pago_Pedido`
--
ALTER TABLE `Pago_Pedido`
  ADD CONSTRAINT `FKPago_Pedid251375` FOREIGN KEY (`id_Pedido`) REFERENCES `Pedido` (`id_Pedido`),
  ADD CONSTRAINT `FKPago_Pedid781681` FOREIGN KEY (`id_Pago`) REFERENCES `Pago` (`id_Pago`);

--
-- Filtros para la tabla `Pedido`
--
ALTER TABLE `Pedido`
  ADD CONSTRAINT `FKPedido674200` FOREIGN KEY (`id_Envio`) REFERENCES `Envio` (`id_Envio`),
  ADD CONSTRAINT `FKPedido949992` FOREIGN KEY (`id_Carrito`,`id_Usuario`,`id_Producto`) REFERENCES `Carrito` (`id_Carrito`, `id_Usuario`, `id_Producto`);

--
-- Filtros para la tabla `Producto`
--
ALTER TABLE `Producto`
  ADD CONSTRAINT `FKProducto105040` FOREIGN KEY (`id_Categoria`) REFERENCES `Categoria` (`id_Categoria`);

--
-- Filtros para la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `fk_TipoUsuario` FOREIGN KEY (`id_TipoUsuario`) REFERENCES `Tipo_Usuario` (`id_TipoUsuario`),
  ADD CONSTRAINT `FKUsuario250236` FOREIGN KEY (`id_TipoDocumento`) REFERENCES `Tipo_Documento` (`id_TipoDocumento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
