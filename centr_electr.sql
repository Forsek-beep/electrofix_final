-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 02 2023 г., 20:23
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `centr_electr`
--

-- --------------------------------------------------------

--
-- Структура таблицы `device_type`
--

CREATE TABLE `device_type` (
  `ID_Device_type` int NOT NULL,
  `type_device` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `device_type`
--

INSERT INTO `device_type` (`ID_Device_type`, `type_device`) VALUES
(1, 'Телефон'),
(2, 'Ноутбук'),
(3, 'Планшет'),
(4, 'Бытовая техника'),
(5, 'Телевизор'),
(6, 'Ноутбук'),
(11, 'Смартфон'),
(13, 'Макбук');

-- --------------------------------------------------------

--
-- Структура таблицы `engineers`
--

CREATE TABLE `engineers` (
  `ID_Engineer` int NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `surname` varchar(30) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `engineers`
--

INSERT INTO `engineers` (`ID_Engineer`, `name`, `surname`) VALUES
(1, 'Михаил', 'Игорев'),
(3, 'Дмитрий', 'Шпеков');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `ID_Order` int NOT NULL,
  `ID_Status_repair` int NOT NULL,
  `ID_Engineer` int DEFAULT NULL,
  `ID_User` int NOT NULL,
  `ID_Device_type` int NOT NULL,
  `start_date` date NOT NULL,
  `completion_date` date DEFAULT NULL,
  `component` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `warranty` date DEFAULT NULL,
  `manufacturer` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(200) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`ID_Order`, `ID_Status_repair`, `ID_Engineer`, `ID_User`, `ID_Device_type`, `start_date`, `completion_date`, `component`, `warranty`, `manufacturer`, `model`) VALUES
(2, 2, 3, 67, 1, '2023-06-19', '0000-00-00', 'sdf', '0000-00-00', 'sdf', 'sdf'),
(3, 2, 3, 67, 1, '2023-06-19', '2023-06-29', 'sdf', '2023-07-09', 'sdf', 'sdf'),
(4, 3, 1, 67, 1, '2023-06-19', '2023-06-29', 'sdf', '2025-05-29', 'sdf', 'sdf'),
(5, 2, 1, 67, 1, '2023-06-20', '0000-00-00', 'dfg', '0000-00-00', 'dfg', 'dfg'),
(6, 1, 3, 68, 2, '2023-06-19', '2023-06-23', 'Матрица', '2030-06-05', 'Samsung', 'A1000000'),
(8, 1, 1, 67, 3, '2023-06-21', '2023-06-30', 'Экран', '2026-02-21', 'Samsung', 'A52'),
(9, 1, 3, 69, 1, '2023-06-21', '2023-06-30', 'Экран', '2026-10-14', 'Samsung', 'A52'),
(12, 2, NULL, 93, 1, '2023-07-02', NULL, 'Матрица', NULL, 'Samsung', '13221');

-- --------------------------------------------------------

--
-- Структура таблицы `status_repair`
--

CREATE TABLE `status_repair` (
  `ID_Status_repair` int NOT NULL,
  `status_repair` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `status_repair`
--

INSERT INTO `status_repair` (`ID_Status_repair`, `status_repair`) VALUES
(1, 'Готов'),
(2, 'В работе'),
(3, 'Отменен');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `ID_User` int NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `surname` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL,
  `isAdmin` int NOT NULL,
  `hash` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL,
  `email_confirmed` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`ID_User`, `email`, `name`, `surname`, `password`, `isAdmin`, `hash`, `email_confirmed`) VALUES
(67, '12@gmail.com', 'Савелий', 'Шпеков', '4297f44b13955235245b2497399d7a93', 1, '', 0),
(68, 'iii123@mail.ru', 'Максим', 'Пастухов', '4297f44b13955235245b2497399d7a93', 0, '', 0),
(69, '22@gmail.com', 'Роман', 'Филиппов', 'eae8dac2935380308f4c03918b9dc21b', 1, '', 0),
(72, '2@gmail.ru', 'Роман', 'Швец', '4297f44b13955235245b2497399d7a93', 1, '', 0),
(76, 'lada3954xy@gmail.com', 'Лада', 'Ионина', '4297f44b13955235245b2497399d7a93', 0, '96ce2c53c3b285e22c8fa2387de6bf7f', 0),
(77, 'romanionin000@gmail.com', 'Роман', 'Ионин', '4297f44b13955235245b2497399d7a93', 0, '05fc3db5e3d9a8e18fe434705c944873', 0),
(78, '2324@mail.ru', 'Роман', 'Швец', '4297f44b13955235245b2497399d7a93', 0, '73d84c086d7d71463eb17789ebdcd8a0', 0),
(79, 'romanionin0345@gmail.com', 'Роман', 'Ионин', '4297f44b13955235245b2497399d7a93', 0, '7049f6e73b2f85b853bffd05325c2b27', 0),
(81, 'rosdfsdf075@gmail.com', 'Роман', 'Ионин', '4297f44b13955235245b2497399d7a93', 0, '619b12c6a9004d236c4e5818c6a11151', 0),
(82, 'dfgdfgawswer@gmail.com', 'Роман', 'Ионин', '4297f44b13955235245b2497399d7a93', 0, '9b75251976ffc66d2c7959f27f10d131', 0),
(83, 'sdfshfgh@gmail.com', 'Роман', 'Ионин', '4297f44b13955235245b2497399d7a93', 0, '1425b950c03275dfd43e9763f49dffc4', 0),
(84, 'dfgdfgdfswer@gmail.com', 'Роман', 'Ионин', '4297f44b13955235245b2497399d7a93', 0, '1f7a2e04db1e152a745525dc9eabf4fa', 0),
(85, 'sddsfseqwer5@gmail.com', 'Роман', 'Ионин', '4297f44b13955235245b2497399d7a93', 0, '658bd8efefd93cdb60c1a0879628f237', 0),
(86, 'sdfsdfsqwqw5@gmail.com', 'Роман', 'Ионин', '4297f44b13955235245b2497399d7a93', 0, '4b90223d6cff7e36a1b803d27065a1ee', 0),
(90, 'romanioninsdkfshikujd@gmail.com', 'Роман', 'Ионин', '4297f44b13955235245b2497399d7a93', 0, 'f3c941413df3df0eb07a59f36e916842', 0),
(91, 'romanioninskdjfskldj@gmail.com', 'Роман', 'Ионин', '4297f44b13955235245b2497399d7a93', 0, 'b45f1b49e128992fab1475744fd9fe74', 0),
(93, 'romanionin075@gmail.com', 'Роман', 'Ионин', '4297f44b13955235245b2497399d7a93', 0, '4cda0c1566eb00460bc50a63ebbda958', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users_2`
--

CREATE TABLE `users_2` (
  `ID_User_2` int NOT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `status_call` tinyint(1) NOT NULL,
  `curr_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users_2`
--

INSERT INTO `users_2` (`ID_User_2`, `telephone`, `name`, `status_call`, `curr_datetime`) VALUES
(29, '+7(999)999-99-99', 'сергей', 0, NULL),
(30, '+7(900)999-99-99', 'Рома', 0, NULL),
(33, '+7(999)999-99-99', 'Маша', 0, NULL),
(34, '+7(999)999-99-99', 'Рома', 0, NULL),
(38, '+7(999)999-99-99', 'Рома', 0, NULL),
(43, '+7(999)999-99-99', 'Ромчик', 0, '2023-07-02 11:59:06');

--
-- Триггеры `users_2`
--
DELIMITER $$
CREATE TRIGGER `set_curr_datetime` BEFORE INSERT ON `users_2` FOR EACH ROW BEGIN
    IF NEW.status_call = 1 THEN
        SET NEW.curr_datetime = CURRENT_TIMESTAMP;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_curr_datetime` BEFORE UPDATE ON `users_2` FOR EACH ROW BEGIN
    IF NEW.status_call = 1 THEN
        SET NEW.curr_datetime = CURRENT_TIMESTAMP;
    END IF;
END
$$
DELIMITER ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `device_type`
--
ALTER TABLE `device_type`
  ADD PRIMARY KEY (`ID_Device_type`);

--
-- Индексы таблицы `engineers`
--
ALTER TABLE `engineers`
  ADD PRIMARY KEY (`ID_Engineer`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID_Order`),
  ADD KEY `orders_ibfk_1` (`ID_Device_type`),
  ADD KEY `orders_ibfk_2` (`ID_Engineer`),
  ADD KEY `orders_ibfk_3` (`ID_Status_repair`),
  ADD KEY `orders_ibfk_4` (`ID_User`);

--
-- Индексы таблицы `status_repair`
--
ALTER TABLE `status_repair`
  ADD PRIMARY KEY (`ID_Status_repair`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID_User`);

--
-- Индексы таблицы `users_2`
--
ALTER TABLE `users_2`
  ADD PRIMARY KEY (`ID_User_2`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `device_type`
--
ALTER TABLE `device_type`
  MODIFY `ID_Device_type` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `engineers`
--
ALTER TABLE `engineers`
  MODIFY `ID_Engineer` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `ID_Order` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `status_repair`
--
ALTER TABLE `status_repair`
  MODIFY `ID_Status_repair` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `ID_User` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT для таблицы `users_2`
--
ALTER TABLE `users_2`
  MODIFY `ID_User_2` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ID_Device_type`) REFERENCES `device_type` (`ID_Device_type`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`ID_Engineer`) REFERENCES `engineers` (`ID_Engineer`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`ID_Status_repair`) REFERENCES `status_repair` (`ID_Status_repair`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`ID_User`) REFERENCES `users` (`ID_User`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
