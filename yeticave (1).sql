-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 20 2022 г., 19:38
-- Версия сервера: 5.7.33
-- Версия PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yeticave`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `symbol_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `category`, `symbol_code`) VALUES
(1, 'Доски и лыжи', 'boards'),
(2, 'Крепления', 'attachment'),
(3, 'Ботинки', 'boots'),
(4, 'Одежда', 'clothing'),
(5, 'Инструменты', 'tools'),
(6, 'Разное', 'other');

-- --------------------------------------------------------

--
-- Структура таблицы `lots`
--

CREATE TABLE `lots` (
  `id` int(11) NOT NULL,
  `date_create` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price_start` int(11) NOT NULL,
  `date_fin` datetime NOT NULL,
  `step` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `winner_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `lots`
--

INSERT INTO `lots` (`id`, `date_create`, `name`, `description`, `image`, `price_start`, `date_fin`, `step`, `user_id`, `category_id`, `winner_id`) VALUES
(1, '2022-08-12 14:10:15', '2014 Rossignol District Snowboard', 'Доска в хорошем состоянии', 'img/lot-1.jpg', 10999, '2022-08-30 14:09:42', 1000, 1, 1, 2),
(2, '2022-08-12 14:08:42', 'DC Ply Mens 2016/2017 Snowboard', 'Отличный сноуборд, использовался пару сезонов', 'img/lot-2.jpg', 159999, '2022-08-28 14:08:42', 1500, 3, 1, 0),
(3, '2022-08-12 14:14:59', 'Крепления Union Contact Pro 2015 года размер L/XL', 'Крепления Union Contact Pro', 'img/lot-3.jpg', 8000, '2022-09-12 14:14:59', 500, 3, 2, 1),
(4, '2022-08-12 15:10:59', 'Ботинки для сноуборда DC Mutiny Charocal NEW5', 'Очень удобные', 'img/lot-4.jpg', 10999, '2022-09-05 16:05:59', 700, 2, 3, 0),
(5, '2022-08-12 13:17:29', 'Куртка для сноуборда DC Mutiny Charocal', 'Легкая, теплая. Небольшие потертости, остальное норм.', 'img/lot-5.jpg', 7500, '2022-08-19 12:37:29', 1200, 4, 4, 0),
(6, '2022-08-12 14:17:29', 'Маска Oakley Canopy', 'Очень удобная, без видимых дефектов', 'img/lot-6.jpg', 5400, '2022-09-17 14:17:29', 400, 2, 6, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `rates`
--

CREATE TABLE `rates` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `price` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lot_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `rates`
--

INSERT INTO `rates` (`id`, `date`, `price`, `user_id`, `lot_id`) VALUES
(1, '2022-08-11 00:00:00', 8500, 3, 3),
(2, '2022-08-12 00:00:00', 7500, 4, 5),
(3, '2022-08-10 00:00:00', 6200, 2, 6),
(4, '2022-08-09 00:00:00', 5800, 3, 6),
(5, '2022-08-17 22:46:01', 8200, 4, 3),
(6, '2022-08-17 22:46:01', 11500, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `date_reg` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `date_reg`, `email`, `name`, `password`, `contact`) VALUES
(1, '2022-08-12 15:04:28', 'sergey@mail.ru', 'Сергей', '123456789', 'тел. 8-916-111-22-33, fb Sergey Ivanov'),
(2, '2022-08-12 15:05:44', 'ivan@ivan.com', 'Иван', '987654321', 'wa 89036565656, e-mail ivan@ivan.com'),
(3, '2022-08-12 15:08:11', 'summer@pochta.ru', 'Светлана', '5555555', 'тел, ватсап 1234561233');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `lots`
--
ALTER TABLE `lots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `category_id_2` (`category_id`),
  ADD KEY `category_id_3` (`category_id`);

--
-- Индексы таблицы `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `lots`
--
ALTER TABLE `lots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
