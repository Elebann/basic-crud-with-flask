-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-09-2023 a las 18:51:06
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crud_flask`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add` (IN `in_name` VARCHAR(36), IN `in_lastName` VARCHAR(36), IN `in_phone` INT, IN `in_address` VARCHAR(200))   BEGIN
    INSERT INTO employees (id, name, lastName, phone, address)
    VALUES (null, in_name, in_lastName, in_phone, in_address);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete` (IN `in_id` INT)   BEGIN
    DELETE FROM employees WHERE id = in_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_selectAll` ()   BEGIN
    SELECT * FROM employees;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_selectById` (IN `in_id` INT)   BEGIN
select * from employees where id = in_id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update` (IN `in_name` VARCHAR(36), IN `in_lastName` VARCHAR(36), IN `in_phone` INT, IN `in_address` VARCHAR(200), IN `in_id` INT)   BEGIN
    UPDATE employees SET 
    name = in_name,
    lastName = in_lastName,
    phone = in_phone,
    address = in_address
    WHERE id = in_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(36) NOT NULL,
  `lastName` varchar(36) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`id`, `name`, `lastName`, `phone`, `address`) VALUES
(1, 'John', 'Doe', 2147483647, '123 Main St'),
(2, 'Alice', 'Smith', 2147483647, '456 Elm St'),
(3, 'Bob', 'Johnson', 2147483647, '789 Oak St'),
(4, 'Emily', 'Brown', 2147483647, '234 Pine St'),
(5, 'Michael', 'Davis', 2147483647, '567 Cedar St'),
(6, 'Sarah', 'Wilson', 2147483647, '890 Birch St'),
(7, 'David', 'Taylor', 2147483647, '345 Redwood St'),
(8, 'Olivia', 'Miller', 2147483647, '678 Maple St'),
(9, 'James', 'Anderson', 2147483647, '901 Walnut St'),
(10, 'Sophia', 'Martinez', 2147483647, '123 Cherry St'),
(11, 'Henry', 'Donlon', 2147483647, '534 Forest St');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
