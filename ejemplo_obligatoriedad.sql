-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-08-2023 a las 05:20:53
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejemplo_obligatoriedad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `Id_ciudad` int(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `poblacion` int(50) NOT NULL,
  `idioma_principal` varchar(50) NOT NULL,
  `Id_empresa_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`Id_ciudad`, `nombre`, `departamento`, `poblacion`, `idioma_principal`, `Id_empresa_fk`) VALUES
(1, 'Bogota', 'Cundinamarca', 8000000, 'Espa?ol', 1),
(2, 'Medell?n', 'Antioquia', 2500000, 'Espa?ol', 2),
(3, 'Cali', 'Valle del Cauca', 2500000, 'Espa?ol', 3),
(4, 'Barranquilla', 'Atlantico', 1500000, 'Espa?ol', 4),
(5, 'Cartagena', 'Bolivar', 1000000, 'Espa?ol', 1),
(6, 'Pereira', 'Risaralda', 600000, 'Espa?ol', 2),
(7, 'Bucaramanga', 'Santander', 700000, 'Espa?ol', 3),
(8, 'Cucuta', 'Norte de Santander', 600000, 'Espa?ol', 4),
(9, 'Popayan', 'Cauca', 350000, 'Espa?ol', 9),
(10, 'Manizales', 'Caldas', 400000, 'Espa?ol', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Id_cliente` int(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Id_cliente`, `nombre`, `direccion`, `telefono`) VALUES
(1, 'Juan P?rez', 'Calle 123, Bogot?', '1234567890'),
(2, 'Mar?a Garc?a', 'Avenida XYZ, Medell?n', '9876543210'),
(3, 'Carlos Rodr?guez', 'Carrera ABC, Cali', '5678901234'),
(4, 'Ana Mart?nez', 'Calle 456, Barranquilla', '2345678901'),
(5, 'Luis S?nchez', 'Carrera DEF, Bogot?', '6789012345'),
(6, 'Laura Vargas', 'Avenida UVW, Medell?n', '3456789012'),
(7, 'Pedro L?pez', 'Calle 789, Cali', '8901234567'),
(8, 'Sof?a Gonz?lez', 'Carrera GHI, Barranquilla', '4567890123'),
(9, 'Diego Ram?rez', 'Avenida JKL, Bogot?', '9012345678'),
(10, 'Valentina Mendoza', 'Calle 1011, Medell?n', '5678901234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `Id_empresas` int(50) NOT NULL,
  `nit` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `Id_producto_fk` int(11) DEFAULT NULL,
  `Id_proveedor_fk` int(11) DEFAULT NULL,
  `Id_cliente_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`Id_empresas`, `nit`, `nombre`, `direccion`, `telefono`, `Id_producto_fk`, `Id_proveedor_fk`, `Id_cliente_fk`) VALUES
(1, '900123456-1', 'Empresa A', 'Calle 123, Bogot?', '1234567890', 1, 1, 1),
(2, '800987654-2', 'Empresa B', 'Avenida XYZ, Medell?n', '9876543210', 2, 2, 2),
(3, '700567890-3', 'Empresa C', 'Carrera ABC, Cali', '5678901234', 2, 2, 2),
(4, '600234567-4', 'Empresa D', 'Calle 456, Barranquilla', '2345678901', 1, 2, 1),
(5, '500678901-5', 'Empresa E', 'Carrera DEF, Bogot?', '6789012345', 3, 4, 5),
(6, '400345678-6', 'Empresa F', 'Avenida UVW, Medell?n', '3456789012', 6, 6, 6),
(7, '300890123-7', 'Empresa G', 'Calle 789, Cali', '8901234567', 4, 7, 6),
(8, '200456789-8', 'Empresa H', 'Carrera GHI, Barranquilla', '4567890123', 8, 8, 8),
(9, '100901234-9', 'Empresa I', 'Avenida JKL, Bogot?', '9012345678', 8, 9, 9),
(10, '000567890-0', 'Empresa J', 'Calle 1011, Medell?n', '5678901234', 10, 10, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Id_producto` int(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `precio` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Id_producto`, `nombre`, `descripcion`, `marca`, `precio`) VALUES
(1, 'Producto 1', 'Descripci?n del producto 1', 'Marca A', 1000),
(2, 'Producto 2', 'Descripci?n del producto 2', 'Marca B', 1500),
(3, 'Producto 3', 'Descripci?n del producto 3', 'Marca C', 2000),
(4, 'Producto 4', 'Descripci?n del producto 4', 'Marca A', 800),
(5, 'Producto 5', 'Descripci?n del producto 5', 'Marca B', 1200),
(6, 'Producto 6', 'Descripci?n del producto 6', 'Marca C', 1800),
(7, 'Producto 7', 'Descripci?n del producto 7', 'Marca A', 950),
(8, 'Producto 8', 'Descripci?n del producto 8', 'Marca B', 1300),
(9, 'Producto 9', 'Descripci?n del producto 9', 'Marca C', 1700),
(10, 'Producto 10', 'Descripci?n del producto 10', 'Marca A', 1100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `Id_proveedor` int(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`Id_proveedor`, `nombre`, `direccion`, `telefono`) VALUES
(1, 'Proveedor A', 'Calle 123, Bogot?', '1234567890'),
(2, 'Proveedor B', 'Avenida XYZ, Medell?n', '9876543210'),
(3, 'Proveedor C', 'Carrera ABC, Cali', '5678901234'),
(4, 'Proveedor D', 'Calle 456, Barranquilla', '2345678901'),
(5, 'Proveedor E', 'Carrera DEF, Bogot?', '6789012345'),
(6, 'Proveedor F', 'Avenida UVW, Medell?n', '3456789012'),
(7, 'Proveedor G', 'Calle 789, Cali', '8901234567'),
(8, 'Proveedor H', 'Carrera GHI, Barranquilla', '4567890123'),
(9, 'Proveedor I', 'Avenida JKL, Bogot?', '9012345678'),
(10, 'Proveedor J', 'Calle 1011, Medell?n', '5678901234');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`Id_ciudad`),
  ADD KEY `Id_empresa_fk` (`Id_empresa_fk`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Id_cliente`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`Id_empresas`),
  ADD KEY `Id_producto_fk` (`Id_producto_fk`),
  ADD KEY `Id_proveedor_fk` (`Id_proveedor_fk`),
  ADD KEY `Id_cliente_fk` (`Id_cliente_fk`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Id_producto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`Id_proveedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `Id_ciudad` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Id_cliente` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `Id_empresas` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Id_producto` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `Id_proveedor` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD CONSTRAINT `ciudades_ibfk_1` FOREIGN KEY (`Id_empresa_fk`) REFERENCES `empresas` (`Id_empresas`);

--
-- Filtros para la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_ibfk_1` FOREIGN KEY (`Id_producto_fk`) REFERENCES `productos` (`Id_producto`),
  ADD CONSTRAINT `empresas_ibfk_2` FOREIGN KEY (`Id_proveedor_fk`) REFERENCES `proveedores` (`Id_proveedor`),
  ADD CONSTRAINT `empresas_ibfk_3` FOREIGN KEY (`Id_cliente_fk`) REFERENCES `clientes` (`Id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
