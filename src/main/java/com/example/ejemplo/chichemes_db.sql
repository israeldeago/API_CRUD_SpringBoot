/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE IF NOT EXISTS `chichemes` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `chichemes`;

DROP PROCEDURE IF EXISTS `ActualizarProducto`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProducto`(
	IN `pid` INT,
	IN `n` VARCHAR(50),
	IN `p` FLOAT,
	IN `c` INT,
	IN `f` VARCHAR(150),
	IN `fp` VARCHAR(50),
	IN `fe` VARCHAR(50)
)
BEGIN
	UPDATE productos SET 
	productos.nombre = n,
	productos.precio = p,
	productos.categoria_id = c,
	productos.fotoUrl = f,
	productos.fecha_preparacion = fp,
	productos.fecha_expiracion = fe
	
	WHERE productos.id = pid;
END//
DELIMITER ;

DROP TABLE IF EXISTS `carrito`;
CREATE TABLE IF NOT EXISTS `carrito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_persona_carrito` (`persona_id`),
  KEY `FK_producto_carrito` (`producto_id`),
  CONSTRAINT `FK_persona_carrito` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  CONSTRAINT `FK_producto_carrito` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='productos anadido al carrito de compra por un usuario';

/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` (`id`, `producto_id`, `persona_id`, `cantidad`, `created_at`, `updated_at`) VALUES
	(6, 12, 5, 1, '2021-10-06 10:43:07', '2021-10-06 10:43:07'),
	(7, 3, 5, 1, '2021-10-06 10:43:16', '2021-10-06 10:43:16'),
	(8, 8, 5, 1, '2021-10-06 10:43:22', '2021-10-06 10:43:22'),
	(9, 9, 5, 1, '2021-10-06 13:50:14', '2021-10-06 13:50:14');
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
	(1, 'Frituras', '2021-06-21 13:07:11', '2021-06-21 13:07:11'),
	(2, 'Bebidas', '2021-06-21 13:07:17', '2021-06-21 13:07:17'),
	(3, 'Asados', '2021-06-21 13:07:43', '2021-06-21 13:07:43'),
	(4, 'Postres', '2021-06-21 13:08:26', '2021-06-21 13:08:26'),
	(5, 'Frituras', '2022-06-27 09:11:39', '2022-06-27 09:11:39');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE IF NOT EXISTS `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(1500) DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_comentario_persona` (`persona_id`),
  KEY `FK_comentario_producto` (`producto_id`),
  CONSTRAINT `FK_comentario_persona` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  CONSTRAINT `FK_comentario_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` (`id`, `comentario`, `persona_id`, `producto_id`, `created_at`, `updated_at`) VALUES
	(1, 'estaba en bomba ese chicheme', 5, 8, '2021-06-23 14:31:40', '2021-06-23 14:31:40'),
	(2, 'el coco taba muy dulce', 5, 7, '2021-06-23 14:32:53', '2021-06-23 14:32:53'),
	(3, 'el aceite donde se frieron esas empanadas estaba viejo, como que habian freido pescado', 5, 3, '2021-06-23 14:47:32', '2021-06-23 14:47:32'),
	(4, 'que raro, xuzo, mis empanadas si estaban de alante', 8, 3, '2021-06-23 14:48:16', '2021-06-23 14:48:16');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;

DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` int(11) DEFAULT NULL,
  `fecha` varchar(50) DEFAULT curdate(),
  `total` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` (`id`, `persona_id`, `fecha`, `total`, `created_at`, `updated_at`) VALUES
	(1, 5, '2021-07-07', 22.25, '2021-07-07 15:17:51', '2021-07-07 15:17:51'),
	(2, 5, '2021-07-07', 22.25, '2021-07-07 15:18:31', '2021-07-07 15:18:31'),
	(3, 5, '2021-07-07', 22.25, '2021-07-07 15:19:01', '2021-07-07 15:19:01'),
	(4, 5, '2021-07-07', 22.25, '2021-07-07 15:19:49', '2021-07-07 15:19:49'),
	(5, 5, '2021-07-07', 22.25, '2021-07-07 15:20:13', '2021-07-07 15:20:13'),
	(6, 5, '2021-07-07', 22.25, '2021-07-07 15:22:01', '2021-07-07 15:22:01');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;

DROP TABLE IF EXISTS `compra_detalles`;
CREATE TABLE IF NOT EXISTS `compra_detalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compra_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `compra_detalles` DISABLE KEYS */;
INSERT INTO `compra_detalles` (`id`, `compra_id`, `producto_id`, `cantidad`, `created_at`, `updated_at`) VALUES
	(1, 1, 3, 6, '2021-07-07 15:17:51', '2021-07-07 15:17:51'),
	(2, 1, 1, 1, '2021-07-07 15:17:51', '2021-07-07 15:17:51'),
	(3, 1, 6, 2, '2021-07-07 15:17:51', '2021-07-07 15:17:51'),
	(4, 1, 6, 4, '2021-07-07 15:17:51', '2021-07-07 15:17:51'),
	(5, 1, 8, 5, '2021-07-07 15:17:51', '2021-07-07 15:17:51'),
	(6, 2, 3, 6, '2021-07-07 15:18:31', '2021-07-07 15:18:31'),
	(7, 2, 1, 1, '2021-07-07 15:18:31', '2021-07-07 15:18:31'),
	(8, 2, 6, 2, '2021-07-07 15:18:31', '2021-07-07 15:18:31'),
	(9, 2, 6, 4, '2021-07-07 15:18:31', '2021-07-07 15:18:31'),
	(10, 2, 8, 5, '2021-07-07 15:18:31', '2021-07-07 15:18:31'),
	(11, 3, 3, 6, '2021-07-07 15:19:01', '2021-07-07 15:19:01'),
	(12, 3, 1, 1, '2021-07-07 15:19:01', '2021-07-07 15:19:01'),
	(13, 3, 6, 2, '2021-07-07 15:19:01', '2021-07-07 15:19:01'),
	(14, 3, 6, 4, '2021-07-07 15:19:01', '2021-07-07 15:19:01'),
	(15, 3, 8, 5, '2021-07-07 15:19:01', '2021-07-07 15:19:01'),
	(16, 4, 3, 6, '2021-07-07 15:19:49', '2021-07-07 15:19:49'),
	(17, 4, 1, 1, '2021-07-07 15:19:49', '2021-07-07 15:19:49'),
	(18, 4, 6, 2, '2021-07-07 15:19:49', '2021-07-07 15:19:49'),
	(19, 4, 6, 4, '2021-07-07 15:19:49', '2021-07-07 15:19:49'),
	(20, 4, 8, 5, '2021-07-07 15:19:49', '2021-07-07 15:19:49'),
	(21, 5, 3, 6, '2021-07-07 15:20:13', '2021-07-07 15:20:13'),
	(22, 5, 1, 1, '2021-07-07 15:20:13', '2021-07-07 15:20:13'),
	(23, 5, 6, 2, '2021-07-07 15:20:13', '2021-07-07 15:20:13'),
	(24, 5, 6, 4, '2021-07-07 15:20:13', '2021-07-07 15:20:13'),
	(25, 5, 8, 5, '2021-07-07 15:20:13', '2021-07-07 15:20:13'),
	(26, 6, 3, 6, '2021-07-07 15:22:01', '2021-07-07 15:22:01'),
	(27, 6, 1, 1, '2021-07-07 15:22:01', '2021-07-07 15:22:01'),
	(28, 6, 6, 2, '2021-07-07 15:22:01', '2021-07-07 15:22:01'),
	(29, 6, 6, 4, '2021-07-07 15:22:01', '2021-07-07 15:22:01'),
	(30, 6, 8, 5, '2021-07-07 15:22:01', '2021-07-07 15:22:01');
/*!40000 ALTER TABLE `compra_detalles` ENABLE KEYS */;

DROP PROCEDURE IF EXISTS `EliminarCarritoXCompra`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCarritoXCompra`(
	IN `prid` INT
)
BEGIN
	DELETE FROM carrito WHERE carrito.persona_id = prid;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `EliminarProducto`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarProducto`(
	IN `pid` INT
)
BEGIN
	DELETE FROM productos
	WHERE productos.id = pid;
END//
DELIMITER ;

DROP TABLE IF EXISTS `ingredientes`;
CREATE TABLE IF NOT EXISTS `ingredientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `porcion` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_productos_ingredientes` (`producto_id`),
  CONSTRAINT `FK_productos_ingredientes` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='se guardan los ingredientes de cada producto';

/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` (`id`, `nombre`, `porcion`, `producto_id`, `created_at`, `updated_at`) VALUES
	(1, 'leche', 1, 1, '2021-06-23 13:28:15', '2021-06-23 13:28:16'),
	(2, 'maiz', 2, 1, '2021-06-23 13:28:30', '2021-06-23 13:28:30'),
	(3, 'maizena', 1, 1, '2021-06-23 13:28:46', '2021-06-23 13:28:52'),
	(4, 'leche', 2, 2, '2021-06-23 13:28:15', '2021-06-23 13:29:07'),
	(5, 'maiz', 3, 2, '2021-06-23 13:28:30', '2021-06-23 13:28:30'),
	(6, 'maizena', 2, 2, '2021-06-23 13:28:46', '2021-06-23 13:28:52'),
	(7, 'Hallaca', 200, 5, '2022-06-28 16:33:16', '2022-06-28 16:33:16');
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;

DROP PROCEDURE IF EXISTS `InsertarComentario`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarComentario`(
	IN `c` VARCHAR(500),
	IN `pid` INT,
	IN `prid` INT
)
BEGIN
	INSERT INTO comentarios(comentario,producto_id,persona_id)
	VALUES (c,pid,prid);
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `InsertarCompra`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCompra`(
	IN `prid` INT,
	IN `t` FLOAT
)
BEGIN
	INSERT INTO compras (persona_id,total)
	VALUES(prid,t);
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `InsertarDetalleCompra`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDetalleCompra`(
	IN `cid` INT,
	IN `pid` INT,
	IN `c` INT
)
BEGIN
	INSERT INTO compra_detalles(compra_id,producto_id,cantidad)
	VALUES(cid,pid,c);
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `InsertarFavoritoProductoPersona`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarFavoritoProductoPersona`(
	IN `pid` INT,
	IN `prid` INT
)
BEGIN
	INSERT INTO productos_favoritos_persona (producto_id,persona_id)
	VALUES(pid,prid);
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `InsertarProducto`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProducto`(
	IN `n` VARCHAR(50),
	IN `p` FLOAT,
	IN `c` INT,
	IN `u` VARCHAR(150),
	IN `fp` VARCHAR(50),
	IN `fe` VARCHAR(50)
)
BEGIN
	INSERT INTO productos (nombre,precio,categoria_id,fotoUrl,fecha_preparacion,fecha_expiracion)
	VALUES (n,p,c,u,fp,fe);
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `InsertarProductoCarrito`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProductoCarrito`(
	IN `pid` INT,
	IN `prid` INT,
	IN `c` INT
)
BEGIN
	INSERT INTO carrito(producto_id,persona_id,cantidad)
	VALUES (pid,prid,c);
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `ObtenerComentariosProducto`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerComentariosProducto`(
	IN `pid` INT
)
BEGIN
	SELECT 
		comentarios.comentario,
		comentarios.created_at,
		CONCAT(personas.nombre,' ',personas.apellido) AS persona
	FROM comentarios
	INNER JOIN personas ON personas.id = comentarios.persona_id
	WHERE producto_id = pid
	ORDER BY comentarios.id DESC;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `ObtenerCompraByPid`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCompraByPid`(
	IN `prid` INT
)
BEGIN
	SELECT 
		compras.fecha,
		compras.total,
		CONCAT(personas.nombre," ",personas.apellido) AS cliente,
		personas.correo,
		personas.telefono 
	FROM compras
	INNER JOIN personas ON personas.id = compras.persona_id
	WHERE compras.persona_id = prid;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `ObtenerDetalleCompraById`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDetalleCompraById`(
	IN `cid` INT
)
BEGIN
	SELECT 
		compra_detalles.cantidad,
		 productos.nombre AS producto,
		 productos.precio
	FROM compra_detalles
	INNER JOIN productos ON productos.id = compra_detalles.producto_id
	WHERE compra_detalles.compra_id = cid;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `ObtenerIngredientesProducto`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerIngredientesProducto`(
	IN `pid` INT
)
BEGIN
	SELECT ingredientes.nombre AS nombre_ingrediente, ingredientes.porcion
	FROM ingredientes
	WHERE ingredientes.producto_id = pid;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `ObtenerProductoInfo`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProductoInfo`(
	IN `pid` INT
)
BEGIN
	SELECT productos.nombre,productos.precio,productos.fotoUrl AS foto, productos.fecha_expiracion,categorias.nombre AS categoria
	FROM productos
	INNER JOIN categorias ON categorias.id = productos.categoria_id
	WHERE productos.id = pid;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `ObtenerProductosCarrito`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProductosCarrito`(
	IN `prid` INT
)
BEGIN
	SELECT
		carrito.id AS carritoId,
		productos.id AS productoId,
		productos.fotoUrl AS foto,
		productos.nombre AS nombreProducto,
		categorias.nombre AS categoria,
		carrito.cantidad,
		productos.precio
	FROM carrito
	INNER JOIN productos ON productos.id = carrito.producto_id
	INNER JOIN categorias ON categorias.id = productos.categoria_id
	WHERE persona_id = prid;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `ObtenerProductosPorConcidencia`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProductosPorConcidencia`(
	IN `ref` VARCHAR(50)
)
BEGIN
	SELECT 
		productos.id,
		productos.nombre,
		productos.precio,
		categorias.nombre AS categoria,
		productos.fotoUrl AS foto,
		productos.fecha_expiracion
	FROM productos
	INNER JOIN categorias ON categorias.id = productos.categoria_id
	WHERE productos.nombre LIKE CONCAT('%',ref,'%')
	ORDER BY productos.nombre DESC;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `ObtenerTodosLosProductos`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerTodosLosProductos`(
	IN `prid` INT
)
BEGIN
	SELECT 
	DISTINCT
	productos.id,
	productos.nombre,
	productos.precio,
	categorias.nombre AS categoria,
	productos.fotoUrl AS foto,
	productos.fecha_expiracion,
	IFNULL(pfp.producto_id,0) AS fav
	FROM productos
	INNER JOIN categorias ON categorias.id = productos.categoria_id
	LEFT JOIN productos_favoritos_persona AS pfp ON pfp.producto_id = productos.id AND pfp.persona_id = prid
	ORDER BY productos.nombre DESC;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS `ObtenerTotalProductosCarrito`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerTotalProductosCarrito`(
	IN `prid` INT
)
BEGIN
	SELECT COUNT(producto_id) AS total FROM carrito
	WHERE persona_id = prid;
END//
DELIMITER ;

DROP TABLE IF EXISTS `personas`;
CREATE TABLE IF NOT EXISTS `personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` (`id`, `nombre`, `apellido`, `edad`, `correo`, `telefono`, `created_at`, `updated_at`) VALUES
	(5, 'Vegeta', 'Ramirez', 25, 'correo@correo.comass', '999-9999', '2021-06-16 14:32:20', '2022-07-04 21:17:39'),
	(8, 'Juan Antonio', 'Arosemena', 123, 'juan.zamora@utp.ac.pa', '3056004912', '2021-06-16 14:42:50', '2021-06-16 14:42:50'),
	(9, 'Hallaca', 'Vega', 25, 'correo@correo.comas', '999-9999', '2022-07-04 21:11:46', '2022-07-04 21:11:46');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `fotoUrl` varchar(150) DEFAULT NULL,
  `fecha_preparacion` varchar(50) DEFAULT NULL,
  `fecha_expiracion` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_productos_categorias` (`categoria_id`),
  CONSTRAINT `FK_productos_categorias` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`id`, `nombre`, `precio`, `categoria_id`, `fotoUrl`, `fecha_preparacion`, `fecha_expiracion`, `created_at`, `updated_at`) VALUES
	(1, 'Chicheme Chorrerano 16oz', 1.75, 2, 'https://www.recetaspanama.com/base/stock/Recipe/135-image/135-image_web.jpg', '2021-06-19', '2021-06-23', '2021-06-21 13:09:55', '2021-06-21 13:09:55'),
	(2, 'Chicheme Chorrerano 1 lt', 10.5, 2, 'http://4.bp.blogspot.com/-C3Y5ApTqcNI/U0sm3RLa0vI/AAAAAAAAANU/6gbwCgVW4_Y/s1600/P1010079.JPG', '2021-06-19', '2021-06-23', '2021-06-21 13:09:55', '2021-06-21 13:11:30'),
	(3, 'Empanada de Maiz', 0.75, 1, 'https://i.pinimg.com/originals/4e/cc/91/4ecc916128109d45806af4db739d337b.jpg', '2021-06-19', '2021-06-23', '2021-06-21 13:09:55', '2021-06-21 13:13:41'),
	(5, 'Empanada de Harina', 0.8, 3, 'https://t1.rg.ltmcdn.com/es/images/8/5/5/empanadas_al_horno_34558_orig.jpg', '2021-06-19', '2021-06-23', '2021-06-21 13:09:55', '2021-06-21 13:14:25'),
	(6, 'Muslos de pavos', 1.5, 2, 'URL FOTO', '12/12/2022', '12/12/2030', '2021-06-21 13:09:55', '2022-11-15 20:59:44'),
	(7, 'Bollo de Coco Dulce', 1.25, 4, 'https://www.recetas-nicaragua.com/base/stock/Recipe/24-image/24-image_web.jpg', '2021-06-19', '2021-06-23', '2021-06-21 13:09:55', '2021-06-21 13:16:24'),
	(8, 'Manjar blanco 10oz', 2, 4, 'https://recetasdemicolombia.com/wp-content/uploads/2020/02/manjar-blanco-500x375.jpg', '2021-06-19', '2021-06-23', '2021-06-21 13:09:55', '2021-06-21 13:17:07'),
	(9, 'Chicha Melocoton 16oz', 1.75, 2, 'http://2.bp.blogspot.com/_lkNcUWsFm6k/TM6YfvS1I4I/AAAAAAAAAS0/RI0fgBRExfE/s1600/P1200710.jpg', '2021-06-19', '2021-06-23', '2021-06-21 13:09:55', '2021-06-21 13:17:50'),
	(11, 'Carimanola', 0.65, 1, 'https://media-cdn.tripadvisor.com/media/photo-s/10/7d/03/7f/fried-yuca-rolls-stuffed.jpg', 'null', '2021-06-23', '2021-06-21 13:09:55', '2021-07-05 14:02:38'),
	(12, 'Platanito', 0.75, 1, 'https://st3.depositphotos.com/7198202/14274/i/600/depositphotos_142743213-stock-photo-fried-plantain-slices.jpg', 'null', '2022-01-30', '2021-06-30 14:02:56', '2021-10-06 13:51:06'),
	(15, 'OTro producto', 1.5, 2, 'URL FOTO', '12/12/2022', '12/12/2030', '2022-11-15 20:48:35', '2022-11-15 20:48:35');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

DROP TABLE IF EXISTS `productos_favoritos_persona`;
CREATE TABLE IF NOT EXISTS `productos_favoritos_persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_favoritos_persona` (`persona_id`),
  KEY `fk_favoritos_productos` (`producto_id`),
  CONSTRAINT `fk_favoritos_persona` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`),
  CONSTRAINT `fk_favoritos_productos` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='se guardan los productos marcados como favorito por un usuiario segun el id de la persona';

/*!40000 ALTER TABLE `productos_favoritos_persona` DISABLE KEYS */;
INSERT INTO `productos_favoritos_persona` (`id`, `producto_id`, `persona_id`, `created_at`, `updated_at`) VALUES
	(1, 6, 5, '2021-06-21 14:16:56', '2021-06-21 14:16:56'),
	(2, 9, 8, '2021-06-21 14:16:56', '2021-06-21 14:21:07'),
	(4, 8, 8, '2021-06-23 14:51:20', '2021-06-23 14:51:20'),
	(5, 8, 5, '2021-10-06 10:43:47', '2021-10-06 10:43:47'),
	(6, 12, 5, '2021-10-06 10:43:54', '2021-10-06 10:43:54'),
	(7, 5, 5, '2021-10-06 13:50:42', '2021-10-06 13:50:42');
/*!40000 ALTER TABLE `productos_favoritos_persona` ENABLE KEYS */;

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) DEFAULT NULL,
  `contrasena` varchar(50) DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_usuariopersona` (`persona_id`),
  CONSTRAINT `FK_usuariopersona` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `usuario`, `contrasena`, `persona_id`, `created_at`, `updated_at`) VALUES
	(1, 'kakaroto', '252525', 5, '2021-06-16 14:32:20', '2021-06-16 14:32:20'),
	(4, 'cristhian', '252525', 8, '2021-06-16 14:42:50', '2021-06-16 14:42:50');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

DROP PROCEDURE IF EXISTS `ValidarUsuario`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidarUsuario`(
	IN `u` VARCHAR(50),
	IN `p` VARCHAR(50)
)
    COMMENT 'valida usuario en base al usuario y la contrasena '
BEGIN
	SELECT 
		personas.id,
		personas.nombre,
		personas.apellido,
		personas.correo,
		usuarios.usuario
	FROM personas
	INNER JOIN usuarios ON usuarios.persona_id = personas.id
	WHERE usuarios.usuario = u AND contrasena = p;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
