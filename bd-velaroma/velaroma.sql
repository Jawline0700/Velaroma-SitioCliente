-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-07-2022 a las 03:35:27
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `velaroma`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_pedidos` (IN `nombre` VARCHAR(25), IN `apellido` VARCHAR(25), IN `correo` VARCHAR(30), IN `numero1` VARCHAR(20), IN `numero2` VARCHAR(20), IN `direccion` VARCHAR(50), IN `monto` FLOAT, IN `id_estado` INT(11), IN `id_tipopedido` INT(11), IN `descripcion` MEDIUMTEXT)  BEGIN

DECLARE idcliente int ;
DECLARE idpedido int;

INSERT INTO cliente(cliente.nombre,cliente.apellido,cliente.correo,cliente.numero1,cliente.numero2,cliente.direccion)
VALUES(nombre,apellido,correo,numero1,numero2,direccion);

SET @idcliente = LAST_INSERT_ID();

INSERT INTO pedido(pedido.fecha_pedido,pedido.descripcion,pedido.Monto,pedido.id_estado,pedido.id_tipopedido)
VALUES(CURRENT_DATE(),descripcion,monto,id_estado,id_tipopedido);

SET @idpedido = LAST_INSERT_ID();

INSERT INTO clientexpedido(clientexpedido.id_cliente,clientexpedido.n_pedido)
VALUES(@idcliente,@idpedido);

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `numero1` varchar(20) NOT NULL,
  `numero2` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `apellido`, `correo`, `numero1`, `numero2`, `direccion`) VALUES
(1, 'Wencers', 'Castillo', 'wencerscastillo40@gamil.com', '63194033', '63194033', 'Arraijan,Panama'),
(3, 'Ru', 'Paul', 'rupaul@gmail.com', '666666', '777777', 'USA'),
(4, 'Matt', 'Castillo', 'mathewscastillo40@gmail.com', '66666', '1234', 'Panama'),
(5, 'Jostin', 'Gamboa', 'jostingamboa@gmail.com', '66666', '1234', 'Panama'),
(6, 'Wino', 'Tia', 'wino@gmail.com', '1223', '1234', 'Colon'),
(7, 'Mama', 'Eliecer', 'mamaeliecer@gmail.com', '66666', '1234', 'Panama'),
(8, 'Daniel', 'Campos', 'danielcampos@gmail.com', '345', '567', 'Panama'),
(9, 'Jeff', 'Ramirez', 'jefframirez@gmail.com', '234', '3434', 'Tumba Muerto'),
(10, 'Made', 'Castillo', 'madecastillo', '1223', '567', 'Panama');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientexpedido`
--

CREATE TABLE `clientexpedido` (
  `id_cliente` int(11) NOT NULL,
  `n_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientexpedido`
--

INSERT INTO `clientexpedido` (`id_cliente`, `n_pedido`) VALUES
(3, 2),
(4, 3),
(5, 4),
(6, 5),
(7, 6),
(8, 7),
(9, 8),
(10, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `id_contacto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `numero` varchar(100) NOT NULL,
  `Mensaje` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`id_contacto`, `nombre`, `correo`, `numero`, `Mensaje`) VALUES
(1, 'Mathews Castillo', 'mathewscastillo@gmail.com', '1223', 'Reclamo'),
(2, 'Mathews Castillo', 'wencerscastillo@gmail.com', '1246', 'Queja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pedido`
--

CREATE TABLE `estado_pedido` (
  `id_estado` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado_pedido`
--

INSERT INTO `estado_pedido` (`id_estado`, `estado`) VALUES
(1, 'Pendiente'),
(2, 'Aprobado'),
(3, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_transaccion`
--

CREATE TABLE `estado_transaccion` (
  `id_estadotransaccion` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `imagen` text DEFAULT NULL,
  `descripcion` mediumtext NOT NULL,
  `precio` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_tipoprod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_producto`, `nombre`, `imagen`, `descripcion`, `precio`, `cantidad`, `id_tipoprod`) VALUES
(1, 'Vela  Decorativa', 'oferta1.jpg', 'Este tipo de vela es para lo mas curiosos y con una personalidad única ', 3.99, 50, 4),
(2, 'Vela Estandar', 'oferta2.jpg', 'Vela con aroma de manzanilla', 2.99, 100, 4),
(3, 'Vela Catcus', 'oferta3.jpg', 'Vela cactus ideal para arreglo de regalos', 7.99, 200, 4),
(4, 'Incienso Felicidad', 'incienso1.jpg', 'Incienso de Prosperidad(AMBAR)\r\nAtrae la prosperidad en su vida ', 11.99, 120, 2),
(5, 'Incienso Almizcle', 'incienso2.jpg', 'Incienso enfocado especificamente a limpiar y purificar ', 15.99, 350, 2),
(6, 'Incienso Aloe Vera', 'incienso3.jpg', 'Este incienso se caracteriza para concretar proyectos, para que todos las metas se materialicen ', 9.99, 400, 2),
(7, 'Incienso Canela', 'incienso4.jpg', 'Se utiliza para aclarar ideas y así tomar una mejor decisión ', 5.99, 500, 2),
(8, 'Incienso Clavel', 'incienso5.jpg', 'Es bueno para estudiar y reforzar el conocimiento ', 10.99, 700, 2),
(9, 'Incienso Cereza', 'incienso6.jpg', 'Este tipo de incienso se utiliza para atraer y estimular el amor ', 7.99, 200, 2),
(10, 'Vela Estandar ', 'Vela1.jpeg', 'Si estas buscando una Vela con aroma tropical esta tipo de vela es perfecta para ti con aroma a coco', 11.99, 450, 3),
(11, 'Vela Estandar', 'Vela2.jpeg', 'Si lo que buscas es atraer la abundancia a tu hogar este tipo de vela es perfecta para ti , aroma a canela', 15.99, 700, 3),
(12, 'Vela Nube', 'Vela3.jpeg', 'Esta vela esta diseñada para los mas divertidos y con un estilo único llama la atención con aroma a fresa viene a endulzar tus días ', 9.99, 200, 3),
(13, 'Vela Frasco', 'Vela4.jpeg', 'Este tipo de vela se utiliza para aromatizar cualquier habitacion con un exquisito aroma ', 5.99, 200, 3),
(14, 'Vela Estandar ', 'Vela5.jpeg', 'Si te gusta el campo esta vela es perfecta para ti ,su aroma es de tierra mojada ', 10.99, 100, 3),
(15, 'Vela Infinita', 'Vela6.jpg', 'Esta vela es decorativa sin añadidos ,sin aroma,ni aceite ', 7.99, 200, 3),
(16, 'Incienso Decorativo', 'oferta4.jpg', 'Incienso con fines decorativos', 0.99, 10, 4),
(17, 'Incienso Canela', 'oferta5.jpg', 'Este incienso atrae la prosperidad', 1.99, 20, 4),
(18, 'Ticket Descuento', 'minipost.gif', 'Obtén 15% de descuento al comprar este ticket puedes utilizarlo en kekimarket o velaroma', 15.99, 10, 4),
(19, 'Diseño Estrella', 'diseno1.jpg', 'Vela diseño Estrella', 1.99, 300, 5),
(20, 'Diseño Luna', 'diseno2.jpg', 'Diseño de luna', 2.99, 300, 5),
(21, 'Diseño Almeja', 'diseno3.jpg', 'Vela almeja', 0.99, 300, 5),
(22, 'Diseño Estatua', 'diseno4.jpg', 'Vela Estatua', 3.99, 300, 5),
(23, 'Diseño Mano', 'diseno5.jpg', 'Vela Mano', 1.99, 300, 5),
(24, 'Aroma Jazmin', NULL, 'Fragancia de Jazmin', 0.99, 10, 6),
(25, 'Aroma Canela', NULL, 'Fragancia de Canela', 1.99, 10, 6),
(26, 'Aroma Lavanda', NULL, 'Fragancia de lavanda', 0.99, 10, 6),
(27, 'Aroma Gardenia', NULL, 'Fragancia de Gardenia', 0.99, 10, 6),
(28, 'Aroma Vainilla', NULL, 'Fragancia de Vainilla', 0.99, 10, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `n_pedido` int(11) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `Monto` float NOT NULL,
  `id_estado` int(11) NOT NULL DEFAULT 1,
  `id_tipopedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`n_pedido`, `fecha_pedido`, `descripcion`, `Monto`, `id_estado`, `id_tipopedido`) VALUES
(2, '2022-07-12', 'Vela Decorativa 1', 1000, 1, 1),
(3, '2022-07-13', '-Nombre: Vela  Decorativa-Cantidad: 1', 4.27, 1, 3),
(4, '2022-07-13', '-Nombre: Vela  Decorativa-Cantidad: 2', 8.54, 1, 3),
(5, '2022-07-13', '-Nombre: Vela Estandar-Cantidad: 1-Nombre: Vela Catcus-Cantidad: 1', 11.75, 1, 3),
(6, '2022-07-13', '-Nombre: Vela Estandar-Cantidad: 1', 3.2, 1, 3),
(7, '2022-07-13', '-Nombre: Vela  Decorativa-Cantidad: 1', 4.27, 1, 1),
(8, '2022-07-13', '-Nombre: Vela  Decorativa-Cantidad: 1', 4.27, 1, 3),
(9, '2022-07-13', '-Nombre: Vela  Decorativa-Cantidad: 2', 8.54, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_insumo`
--

CREATE TABLE `tipo_insumo` (
  `id_insumo` int(11) NOT NULL,
  `tipo_insumo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_insumo`
--

INSERT INTO `tipo_insumo` (`id_insumo`, `tipo_insumo`) VALUES
(1, 'Producto'),
(2, 'Aceite'),
(3, 'Cera'),
(4, 'Fragancia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pedido`
--

CREATE TABLE `tipo_pedido` (
  `id_tipopedido` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_pedido`
--

INSERT INTO `tipo_pedido` (`id_tipopedido`, `tipo`) VALUES
(1, 'Estandar'),
(3, 'Arreglo de Regalo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `id_tipoprod` int(11) NOT NULL,
  `tipo_producto` varchar(100) NOT NULL,
  `tipo_insumo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`id_tipoprod`, `tipo_producto`, `tipo_insumo`) VALUES
(2, 'Incienso', 1),
(3, 'Vela', 1),
(4, 'Oferta', 1),
(5, 'Personalizado', 1),
(6, 'Insumo/Fragancia', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_tipouser` int(11) NOT NULL,
  `tipouser` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `id_transaccion` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `estado_transaccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_tipouser` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `clientexpedido`
--
ALTER TABLE `clientexpedido`
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `n_pedido` (`n_pedido`);

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`id_contacto`);

--
-- Indices de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `estado_transaccion`
--
ALTER TABLE `estado_transaccion`
  ADD PRIMARY KEY (`id_estadotransaccion`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_tipoprod` (`id_tipoprod`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`n_pedido`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_tipopedido` (`id_tipopedido`);

--
-- Indices de la tabla `tipo_insumo`
--
ALTER TABLE `tipo_insumo`
  ADD PRIMARY KEY (`id_insumo`);

--
-- Indices de la tabla `tipo_pedido`
--
ALTER TABLE `tipo_pedido`
  ADD PRIMARY KEY (`id_tipopedido`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`id_tipoprod`),
  ADD KEY `tipo_insumo` (`tipo_insumo`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_tipouser`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`id_transaccion`),
  ADD KEY `estado_transaccion` (`estado_transaccion`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_tipouser` (`id_tipouser`),
  ADD KEY `id_producto` (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `id_contacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado_transaccion`
--
ALTER TABLE `estado_transaccion`
  MODIFY `id_estadotransaccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `n_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tipo_insumo`
--
ALTER TABLE `tipo_insumo`
  MODIFY `id_insumo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_pedido`
--
ALTER TABLE `tipo_pedido`
  MODIFY `id_tipopedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `id_tipoprod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id_tipouser` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `id_transaccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientexpedido`
--
ALTER TABLE `clientexpedido`
  ADD CONSTRAINT `clientexpedido_ibfk_1` FOREIGN KEY (`n_pedido`) REFERENCES `pedido` (`n_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientexpedido_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_tipoprod`) REFERENCES `tipo_producto` (`id_tipoprod`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado_pedido` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_tipopedido`) REFERENCES `tipo_pedido` (`id_tipopedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD CONSTRAINT `tipo_producto_ibfk_1` FOREIGN KEY (`tipo_insumo`) REFERENCES `tipo_insumo` (`id_insumo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transacciones_ibfk_2` FOREIGN KEY (`estado_transaccion`) REFERENCES `estado_transaccion` (`id_estadotransaccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transacciones_ibfk_3` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`n_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `inventario` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_tipouser`) REFERENCES `tipo_usuario` (`id_tipouser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`n_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
