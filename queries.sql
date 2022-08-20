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


-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `date_reg`, `email`, `name`, `password`, `contact`) VALUES
(1, '2022-08-12 15:04:28', 'sergey@mail.ru', 'Сергей', '123456789', 'тел. 8-916-111-22-33, fb Sergey Ivanov'),
(2, '2022-08-12 15:05:44', 'ivan@ivan.com', 'Иван', '987654321', 'wa 89036565656, e-mail ivan@ivan.com'),
(3, '2022-08-12 15:08:11', 'summer@pochta.ru', 'Светлана', '5555555', 'тел, ватсап 1234561233');

--

-- Запросы для действий

-- получить все категории

select category from categories;


-- получить самые новые, открытые лоты. Каждый лот должен включать название, стартовую цену, ссылку на изображение, цену, название категории

-- еще вывела date_create, чтобы сортировку было видно

SELECT date_create, name, price_start, image, MAX(rates.price) AS price, categories.category FROM lots
LEFT JOIN rates ON lots.id = rates.lot_id
JOIN categories ON lots.category_id = categories.id
WHERE winner_id = 0 AND date_fin > CURRENT_DATE
GROUP BY lots.id
ORDER BY lots.date_create DESC;



-- показать лот по его ID. Получите также название категории, к которой принадлежит лот
-- не совсем понятно, какие поля лота нужно показать, вывела несколько

SELECT lots.id, date_create, name, `description`, `image`, `price_start`, `date_fin`, `step`, categories.category FROM lots
JOIN categories ON lots.category_id = categories.id WHERE lots.id = 3;

-- обновить название лота по его идентификатору

UPDATE lots
SET `name` = "Ботинки для сноуборда DC Mutiny Charocal NEW5"
WHERE id = 4;

-- получить список ставок для лота по его идентификатору с сортировкой по дате

SELECT price FROM rates WHERE lot_id = 6 ORDER BY date DESC;

