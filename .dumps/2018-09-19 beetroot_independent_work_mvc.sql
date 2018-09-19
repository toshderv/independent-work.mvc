-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 19 2018 г., 18:10
-- Версия сервера: 5.7.20
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `beetroot_independent_work_mvc`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Pricing`
--

CREATE TABLE `Pricing` (
  `id` int(11) NOT NULL,
  `section` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `features` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Pricing`
--

INSERT INTO `Pricing` (`id`, `section`, `price`, `rate`, `category`, `features`) VALUES
(1, 1, 12, 'Basic', 'Freelancer', 'a:5:{i:0;s:16:\"1000 lorem ipsum\";i:1;s:12:\"Normal speed\";i:2;s:18:\"500 dolor sit amet\";i:3;s:22:\"300MB to save projects\";i:4;s:20:\"750 hours of support\";}'),
(2, 1, 35, 'Ultimate', 'Best value', 'a:5:{i:0;s:16:\"3000 lorem ipsum\";i:1;s:8:\"2x speed\";i:2;s:19:\"2000 dolor sit amet\";i:3;s:22:\"500MB to save projects\";i:4;s:20:\"900 hours of support\";}'),
(3, 1, 75, 'Platinum', 'Big company', 'a:5:{i:0;s:16:\"5000 lorem ipsum\";i:1;s:8:\"4x speed\";i:2;s:19:\"4000 dolor sit amet\";i:3;s:22:\"900MB to save projects\";i:4;s:21:\"1200 hours of support\";}'),
(4, 2, 12, 'Basic', 'Freelancer', 'a:5:{i:0;s:16:\"1000 lorem ipsum\";i:1;s:12:\"Normal speed\";i:2;s:18:\"500 dolor sit amet\";i:3;s:22:\"300MB to save projects\";i:4;s:20:\"750 hours of support\";}'),
(5, 2, 35, 'Ultimate', 'Best value', 'a:5:{i:0;s:16:\"3000 lorem ipsum\";i:1;s:8:\"2x speed\";i:2;s:19:\"2000 dolor sit amet\";i:3;s:22:\"500MB to save projects\";i:4;s:20:\"900 hours of support\";}'),
(6, 2, 75, 'Platinum', 'Big company', 'a:5:{i:0;s:16:\"5000 lorem ipsum\";i:1;s:8:\"4x speed\";i:2;s:19:\"4000 dolor sit amet\";i:3;s:22:\"900MB to save projects\";i:4;s:21:\"1200 hours of support\";}'),
(7, 2, 120, 'Gold', 'Bigger company', 'a:5:{i:0;s:16:\"7000 lorem ipsum\";i:1;s:8:\"6x speed\";i:2;s:19:\"6000 dolor sit amet\";i:3;s:20:\"2GB to save projects\";i:4;s:21:\"1500 hours of support\";}');

-- --------------------------------------------------------

--
-- Структура таблицы `Sendmail`
--

CREATE TABLE `Sendmail` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Sendmail`
--

INSERT INTO `Sendmail` (`id`, `name`, `email`, `subject`, `message`) VALUES
(1, 'Антон', 'toshderv@gmail.com', 'Order', 'Hello world!'),
(2, 'Василий', 'anton.derevyanko@yandex.ru', NULL, 'Того же, что и прошлый!');

-- --------------------------------------------------------

--
-- Структура таблицы `Slider`
--

CREATE TABLE `Slider` (
  `id` int(11) NOT NULL,
  `img_thumb` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Slider`
--

INSERT INTO `Slider` (`id`, `img_thumb`, `img`, `caption`) VALUES
(1, '/public/img/slider/1.jpg', '/public/img/slider/1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.'),
(2, '/public/img/slider/2.jpg', '/public/img/slider/2.jpg', 'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.'),
(3, '/public/img/slider/3.jpg', '/public/img/slider/3.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur.'),
(4, '/public/img/slider/4.jpg', '/public/img/slider/4.jpg', 'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.');

-- --------------------------------------------------------

--
-- Структура таблицы `Subscribe`
--

CREATE TABLE `Subscribe` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Subscribe`
--

INSERT INTO `Subscribe` (`id`, `email`) VALUES
(3, 'anton.derevyanko@yandex.ru'),
(4, 'anton.derevyanko@yandex.ru'),
(5, 'anton.derevyanko@yandex.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `Testimonials`
--

CREATE TABLE `Testimonials` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Testimonials`
--

INSERT INTO `Testimonials` (`id`, `name`, `job`, `review`, `image`) VALUES
(1, 'Lorem Ipsum', 'dolor.co.uk', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur', '/public/img/testimonials/1.jpg'),
(2, 'Minim Veniam', 'nostrud.com', 'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat', '/public/img/testimonials/2.jpg'),
(3, 'Lorem Ipsum', 'dolor.co.uk', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur', '/public/img/testimonials/3.jpg'),
(4, 'Minim Veniam', 'nostrud.com', 'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat', '/public/img/testimonials/1.jpg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Pricing`
--
ALTER TABLE `Pricing`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Sendmail`
--
ALTER TABLE `Sendmail`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Slider`
--
ALTER TABLE `Slider`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Subscribe`
--
ALTER TABLE `Subscribe`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Testimonials`
--
ALTER TABLE `Testimonials`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Pricing`
--
ALTER TABLE `Pricing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `Sendmail`
--
ALTER TABLE `Sendmail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Slider`
--
ALTER TABLE `Slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Subscribe`
--
ALTER TABLE `Subscribe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `Testimonials`
--
ALTER TABLE `Testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
