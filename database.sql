-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: 10.19.5.25:3307
-- Время создания: Янв 06 2023 г., 22:15
-- Версия сервера: 10.5.17-MariaDB-1:10.5.17+maria~deb10-log
-- Версия PHP: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `c55140_diplom_vn_developer_ru`
--

-- --------------------------------------------------------

--
-- Структура таблицы `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `date_of_creation` datetime DEFAULT current_timestamp(),
  `first_id` int(11) NOT NULL,
  `second_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `chats`
--

INSERT INTO `chats` (`id`, `date_of_creation`, `first_id`, `second_id`) VALUES
(8, '2022-05-31 20:13:28', 62, 59),
(9, '2022-05-31 20:35:36', 62, 61),
(10, '2022-06-06 20:08:45', 62, 63),
(11, '2022-06-06 20:11:51', 63, 59),
(12, '2022-06-07 01:47:19', 65, 62),
(13, '2022-06-13 16:27:03', 67, 58),
(14, '2022-06-16 20:18:02', 68, 62),
(15, '2022-06-16 20:18:11', 68, 58),
(16, '2022-06-18 16:50:18', 70, 69),
(17, '2022-06-18 17:06:26', 71, 70),
(18, '2022-06-18 22:21:52', 62, 70),
(19, '2022-06-19 00:45:10', 70, 66),
(20, '2022-06-19 02:54:58', 70, 68),
(21, '2022-06-19 02:57:05', 70, 58),
(22, '2022-06-19 02:58:35', 70, 60),
(23, '2022-06-19 12:21:23', 71, 65),
(24, '2022-06-19 12:21:49', 71, 62),
(25, '2022-06-20 00:34:58', 76, 71),
(26, '2022-06-20 08:17:05', 77, 65),
(27, '2022-06-20 08:17:40', 77, 69),
(28, '2022-06-20 08:22:09', 77, 78),
(29, '2022-06-22 08:27:11', 79, 59),
(30, '2022-06-22 11:29:59', 80, 70);

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`text`)),
  `from_user_id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `text`, `from_user_id`, `chat_id`) VALUES
(259, '{\"message\": \"Шалом!\"}', 62, 8),
(260, '{\"message\": \"Как дела?\"}', 62, 8),
(261, '{\"message\": \"Привет, всё круто!\"}', 59, 8),
(262, '{\"message\": \"У меня тоже\"}', 62, 8),
(263, '{\"message\": \"Что завтра делаешь?\"}', 62, 8),
(264, '{\"message\": \"Может прогуляемся?\"}', 62, 8),
(265, '{\"message\": \"к\"}', 62, 8),
(266, '{\"message\": \"и \"}', 62, 8),
(267, '{\"message\": \"Салам\"}', 63, 10),
(268, '{\"message\": \"Шалом! Как сам?\"}', 62, 10),
(269, '{\"message\": \"Да с кайфом, брат\"}', 63, 10),
(270, '{\"message\": \"Это хорошо\"}', 62, 10),
(292, '{\"message\": \"Привет, друг! Сейчас картинку скину\"}', 62, 10),
(293, '{\"image\": \"/Uploads/ChatImages/Yks5SW1pQTVMdmNwYmlHZ0xtR3lHeXFKRGZoeG40bHA2Mkk5UHdyNk9tbTZrLmpwZw=.png\", \"message\": \"Смотри ржака какая\"}', 62, 10),
(294, '{\"message\": \"Вна2ре \"}', 63, 10),
(295, '{\"message\": \"Смотри\"}', 63, 10),
(296, '{\"image\": \"/Uploads/ChatImages/dFRmemRLMURLeEpEem1Hb2tRNEZMNnZMRjV3eG9jZkw2M2I2cHV2d3RNbm1Zc3psbWxjWHFzS0xkblNHZ3BCVXVCWGwzS2cxaUtKLUhYMnBqVy1LOUp2X1NITUtnbF9HanNySzhpMURxekNhdGxkeDdLWkI2M0k0U2suanBn.png\"}', 63, 10),
(299, '{\"message\": \"Как сам?\"}', 65, 12),
(300, '{\"message\": \"Да вроде хорошо, ты?\"}', 62, 12),
(301, '{\"image\": \"/Uploads/ChatImages/SmpoZ1BQdVREUTVPUTlicFUycDl0TnkzVkpTYlJHcG02NW5laWdoYm91cmhvb2QuanBn.png\", \"message\": \"Вот так\"}', 65, 12),
(305, '{\"image\": \"/Uploads/ChatImages/SmpoZ1BQdVREUTVPUTlicFUycDl0TnkzVkpTYlJHcG02NW5laWdoYm91cmhvb2QuanBn.png\", \"message\": \"Вот так\"}', 62, 8),
(306, '{\"message\":\"ghbdtn\"}', 70, 16),
(307, '{\"message\":\"привет\"}', 69, 16),
(308, '{\"message\":\"ываыва\"}', 69, 16),
(310, '{\"message\":\"вава\"}', 70, 16),
(311, '{\"message\":\"ываыва\"}', 69, 16),
(312, '{\"message\":\"ghbdtn\"}', 71, 17),
(313, '{\"message\":\" ghbdtn\"}', 71, 17),
(314, '{\"message\":\"привет\"}', 70, 17),
(315, '{\"message\":\"ываыва\"}', 70, 17),
(316, '{\"message\":\"какд\"}', 71, 17),
(317, '{\"message\":\" оатоаштё\"}', 71, 17),
(318, '{\"message\":\"фотка\",\"image\":\"/Uploads/ChatImages/V2F3YjlVRVRWVDQ0NDBmMmVESEtadVV1dDgydk9QVVg3MENhcHR1cmUwMDEucG5n.png\"}', 70, 17),
(319, '{\"image\":\"/Uploads/ChatImages/djRSOE5SMWxOS0NabDk0NllVV2tmeWtsdzZRcGdCYms3MdCR0LXQtyDQvdCw0LfQstCw0L3QuNGPLmpwZWc.png\"}', 71, 17),
(320, '{\"message\":\"пващзхплвапдлджвап\"}', 70, 17),
(321, '{\"message\":\"вапвапв\"}', 70, 17),
(322, '{\"message\":\"ап\"}', 70, 17),
(323, '{\"message\":\"вап\"}', 70, 17),
(324, '{\"message\":\"ва\"}', 70, 17),
(325, '{\"message\":\"пв\"}', 70, 17),
(326, '{\"message\":\"ап\"}', 70, 17),
(327, '{\"message\":\"вап\"}', 70, 17),
(328, '{\"message\":\"отё\"}', 71, 17),
(329, '{\"message\":\"и та\"}', 71, 17),
(330, '{\"message\":\"пит\"}', 71, 17),
(331, '{\"message\":\"апи\"}', 71, 17),
(332, '{\"message\":\"пи\"}', 71, 17),
(333, '{\"message\":\"п\"}', 71, 17),
(334, '{\"message\":\"т\"}', 71, 17),
(335, '{\"message\":\"ап\"}', 71, 17),
(336, '{\"message\":\"т\"}', 71, 17),
(337, '{\"message\":\"ап\"}', 71, 17),
(338, '{\"message\":\"т\"}', 71, 17),
(339, '{\"message\":\"п\"}', 71, 17),
(340, '{\"message\":\"ип\"}', 71, 17),
(341, '{\"message\":\"аип\"}', 71, 17),
(342, '{\"message\":\"в\"}', 71, 17),
(343, '{\"message\":\"и\"}', 71, 17),
(344, '{\"message\":\"ап\"}', 71, 17),
(345, '{\"message\":\"тенеь\"}', 71, 17),
(346, '{\"message\":\"лшб\"}', 71, 17),
(347, '{\"message\":\"нт\"}', 71, 17),
(348, '{\"message\":\"и\"}', 71, 17),
(349, '{\"message\":\"ам\"}', 71, 17),
(350, '{\"message\":\"ус\"}', 71, 17),
(351, '{\"message\":\"уампиретоногьелг\"}', 71, 17),
(352, '{\"message\":\"ь\"}', 71, 17),
(353, '{\"message\":\"оьт\"}', 71, 17),
(354, '{\"message\":\"рпи\"}', 71, 17),
(355, '{\"message\":\"ма\"}', 71, 17),
(356, '{\"message\":\"????????привет \"}', 70, 17),
(357, '{\"message\":\"здравствуйте \"}', 70, 17),
(358, '{\"message\":\"варвапр\"}', 71, 17),
(359, '{\"message\":\"ппп\"}', 70, 17),
(360, '{\"message\":\"стена\",\"image\":\"/Uploads/ChatImages/Rm8wc2doeDlDOFh0Y2Y1V2F0SDJpSklMckZpWkFZYnc3MDg4NjkxMkE0LTU0OUMtNERCOS04QjA4LUYzMTI2NDc4NzExRC5qcGVn.png\"}', 70, 17),
(361, '{\"message\":\"Педро\"}', 69, 16),
(362, '{\"message\":\"сам такой\"}', 70, 16),
(363, '{\"message\":\"стена\",\"image\":\"/Uploads/ChatImages/MWNCSHVERVVpNGFQckZXV1VRcFkzTW54THh5aFA1VWU3MDk2QkM3MUNDLUU1QUEtNDBGNS05MTkwLUNCREI2MTZGRUE3QS5qcGVn.png\"}', 70, 16),
(364, '{\"image\":\"/Uploads/ChatImages/UUwzVjlUV2pOVHNtRjlhU05rakRBOUw0OVlSb1hnc0Y2OTE0NTM3RTg0LUY4RDctNEE0NC1CNUFDLTk5RUM0MjJFNkM5Qi5qcGVn.png\"}', 69, 16),
(365, '{\"message\":\"Поо\"}', 71, 17),
(366, '{\"message\":\"Рлл\"}', 71, 17),
(367, '{\"message\":\"а как ты тут появился?\"}', 70, 18),
(368, '{\"message\":\"Это я создал чат\"}', 62, 18),
(369, '{\"message\":\"Пхпхп\"}', 62, 18),
(370, '{\"message\":\"бля\"}', 70, 18),
(371, '{\"message\":\"очень сранно\"}', 70, 18),
(372, '{\"message\":\"сидеть тут\"}', 70, 18),
(373, '{\"message\":\"+++\"}', 62, 18),
(374, '{\"message\":\"не обычно\"}', 70, 18),
(375, '{\"message\":\"Вообще пиздяо\"}', 62, 18),
(376, '{\"message\":\"Ахахах\"}', 62, 18),
(377, '{\"message\":\"бля мне даже нравиться\"}', 70, 18),
(378, '{\"message\":\"Сглы\"}', 62, 18),
(379, '{\"message\":\"Вообще супер\"}', 62, 18),
(380, '{\"message\":\"какой-то новый опыт\"}', 70, 18),
(381, '{\"message\":\"привет\"}', 70, 17),
(382, '{\"image\":\"/Uploads/ChatImages/WmJ5NjNxQjFCSEhJMlBVSnRqTERZTmxlYkhkSjBVTEE2MnVubmFtZWQuanBn.png\"}', 62, 18),
(383, '{\"message\":\"хахаха\"}', 70, 18),
(384, '{\"message\":\"Вот новый опыт\"}', 62, 18),
(385, '{\"message\":\"скоро новые фишки\"}', 70, 18),
(386, '{\"message\":\"в виде скрилла\"}', 70, 18),
(387, '{\"message\":\"и загрузок\"}', 70, 18),
(388, '{\"message\":\"Жду скролл\"}', 62, 18),
(389, '{\"message\":\"А то неудобно \"}', 62, 18),
(390, '{\"message\":\"Пугает кстати\",\"image\":\"/Uploads/ChatImages/U2NJVWx1UXA0U29JWUVCSDRFZ1ZMUEdpQXF3UXZYN082MtCh0L3QuNC80L7QuiDRjdC60YDQsNC90LAgMjAyMi0wNi0xOSAwMTA5MTEucG5n.png\"}', 62, 18),
(391, '{\"message\":\"уберу\"}', 70, 18),
(392, '{\"message\":\"это для отладки\"}', 70, 18),
(393, '{\"message\":\"Ок-с\"}', 62, 18),
(394, '{\"message\":\"Всё, я поешл, если еще надо будет зови\"}', 62, 18),
(395, '{\"message\":\"Жду апдейт скролла\"}', 62, 18),
(396, '{\"message\":\"окс\"}', 70, 18),
(397, '{\"message\":\"SDF\"}', 70, 17),
(398, '{\"message\":\"SDF\"}', 70, 17),
(399, '{\"message\":\"sdf\"}', 70, 17),
(400, '{\"message\":\"sdf\"}', 70, 17),
(401, '{\"message\":\"sdf\"}', 70, 17),
(402, '{\"message\":\"sdfsdf\"}', 70, 17),
(403, '{\"message\":\"dasda\"}', 69, 16),
(404, '{\"message\":\"dsfsdf\"}', 69, 16),
(405, '{\"message\":\"sdfsdfssdfsdfsdf\"}', 69, 16),
(406, '{\"message\":\"sdfsdf\"}', 69, 16),
(407, '{\"message\":\"sdfsdf\"}', 70, 16),
(408, '{\"message\":\"sdfsdf\"}', 70, 16),
(409, '{\"message\":\"sdfsdf\"}', 70, 16),
(410, '{\"message\":\"asdasd\"}', 70, 16),
(411, '{\"message\":\"asdasd\"}', 70, 16),
(412, '{\"message\":\"sdfsdf\"}', 70, 16),
(413, '{\"message\":\"sdfsdf\"}', 69, 16),
(414, '{\"message\":\"sdfsdf\"}', 69, 16),
(415, '{\"message\":\"sdfsdf\"}', 70, 16),
(416, '{\"message\":\"sdfsdf\"}', 70, 16),
(417, '{\"message\":\"sdfsdf\"}', 70, 16),
(418, '{\"message\":\"sdfsdf\"}', 70, 16),
(419, '{\"message\":\"sdfsdf\"}', 70, 16),
(420, '{\"message\":\"sdfssdf\"}', 70, 16),
(421, '{\"message\":\"sdfsdf\"}', 70, 16),
(422, '{\"message\":\"asdasd\"}', 70, 16),
(423, '{\"message\":\"asdasd\"}', 69, 16),
(424, '{\"message\":\"asdasd\"}', 69, 16),
(425, '{\"message\":\"sdfsdf\"}', 69, 16),
(426, '{\"message\":\"sdfsdf\"}', 70, 16),
(427, '{\"message\":\"sdfsdf\"}', 70, 16),
(428, '{\"message\":\"sdfsdf\"}', 70, 16),
(429, '{\"message\":\"sdfsdf\"}', 70, 16),
(430, '{\"message\":\"sdfsdf\"}', 70, 16),
(431, '{\"message\":\"sdfsdf\"}', 70, 16),
(432, '{\"message\":\"sdfsdf\"}', 70, 16),
(433, '{\"message\":\"sdfsdf\"}', 70, 16),
(434, '{\"message\":\"dfgdfg\"}', 70, 16),
(435, '{\"message\":\"sdfsdf\"}', 70, 16),
(436, '{\"message\":\"sdfsdf\"}', 70, 16),
(437, '{\"message\":\"123123\"}', 70, 16),
(438, '{\"message\":\"123123\"}', 70, 16),
(439, '{\"message\":\"123123\"}', 70, 16),
(440, '{\"message\":\"sdfsdf\"}', 70, 16),
(441, '{\"message\":\"sdfsdf\"}', 70, 16),
(442, '{\"message\":\"sdfsdf\"}', 70, 16),
(443, '{\"message\":\"0000\"}', 70, 16),
(444, '{\"message\":\"sdfsdf\"}', 70, 16),
(445, '{\"message\":\"dfgdfg\"}', 70, 16),
(446, '{\"message\":\"sdfsdfsdfsdfsdf\"}', 70, 16),
(447, '{\"message\":\"sdfsdf\"}', 70, 16),
(448, '{\"message\":\"123123123\"}', 70, 16),
(449, '{\"message\":\"123123\"}', 70, 16),
(450, '{\"message\":\"sdfsdf\"}', 70, 16),
(451, '{\"message\":\"sdfsdf\"}', 70, 16),
(452, '{\"message\":\"sdfsdf\"}', 70, 16),
(453, '{\"message\":\"123123123123\"}', 70, 16),
(454, '{\"message\":\"123123123\"}', 70, 16),
(455, '{\"message\":\"asdasdasdasdasdasd\"}', 70, 16),
(456, '{\"message\":\"asdasd\"}', 70, 16),
(457, '{\"message\":\"asdasd\"}', 70, 16),
(458, '{\"message\":\"asdasd\"}', 70, 16),
(459, '{\"message\":\"sdfsdf\"}', 70, 16),
(460, '{\"message\":\"sdfsdf\"}', 70, 16),
(461, '{\"message\":\"sdfsdfsdf\"}', 70, 16),
(462, '{\"message\":\"asdasd\"}', 70, 16),
(463, '{\"message\":\"123123123\"}', 70, 16),
(464, '{\"message\":\"123123\"}', 70, 16),
(465, '{\"message\":\"123123\"}', 70, 16),
(466, '{\"message\":\"sdfsdfsdf\"}', 70, 16),
(467, '{\"message\":\"sdfsdfsdf\"}', 70, 16),
(468, '{\"message\":\"sdfsdf\"}', 70, 16),
(469, '{\"message\":\"sdfsdf\"}', 69, 16),
(470, '{\"message\":\"sdfsdf\"}', 69, 16),
(471, '{\"message\":\"sdfsdf\"}', 69, 16),
(472, '{\"message\":\"sdfsdf\"}', 69, 16),
(473, '{\"message\":\"sdfsdf\"}', 69, 16),
(474, '{\"message\":\"sdfsdf\"}', 69, 16),
(475, '{\"message\":\"123123123\"}', 69, 16),
(476, '{\"message\":\"123123\"}', 70, 16),
(477, '{\"message\":\"123123\"}', 70, 16),
(478, '{\"message\":\"123123\"}', 70, 16),
(479, '{\"message\":\"123123\"}', 70, 16),
(480, '{\"message\":\"asdasd\"}', 70, 16),
(481, '{\"message\":\"asdasd\"}', 70, 16),
(482, '{\"message\":\"asdasd\"}', 70, 16),
(483, '{\"message\":\"sdfsdf\"}', 70, 16),
(484, '{\"message\":\"sdfsdf\"}', 70, 16),
(485, '{\"message\":\"sdfsdf\"}', 69, 16),
(486, '{\"message\":\"sdfsdf\"}', 69, 16),
(487, '{\"message\":\"asdasd\"}', 69, 16),
(488, '{\"message\":\"asdasd\"}', 69, 16),
(489, '{\"message\":\"asdasd\"}', 69, 16),
(490, '{\"message\":\"asdasd\"}', 70, 16),
(491, '{\"message\":\"asdasd\"}', 70, 16),
(492, '{\"message\":\"asdasd\"}', 70, 16),
(493, '{\"message\":\"asdasd\"}', 70, 16),
(494, '{\"message\":\"asd\"}', 70, 16),
(495, '{\"message\":\"asd\"}', 70, 16),
(496, '{\"message\":\"as\"}', 70, 16),
(497, '{\"message\":\"das\"}', 70, 16),
(498, '{\"message\":\"da\"}', 70, 16),
(499, '{\"message\":\"sd\"}', 70, 16),
(500, '{\"message\":\"asd\"}', 70, 16),
(501, '{\"message\":\"as\"}', 70, 16),
(502, '{\"message\":\"d\"}', 70, 16),
(503, '{\"message\":\"asdas\"}', 70, 16),
(504, '{\"message\":\"da\"}', 70, 16),
(505, '{\"message\":\"sd\"}', 70, 16),
(506, '{\"message\":\"asd\"}', 70, 16),
(507, '{\"message\":\"as\"}', 70, 16),
(508, '{\"message\":\"da\"}', 70, 16),
(509, '{\"message\":\"sd\"}', 70, 16),
(510, '{\"message\":\"asda\"}', 70, 16),
(511, '{\"message\":\"sd\"}', 70, 16),
(512, '{\"message\":\"уии\"}', 70, 18),
(513, '{\"message\":\"Я сейчас скрольнуль наверх\"}', 62, 18),
(514, '{\"message\":\"Секнуд через 5-7 напиши\"}', 62, 18),
(515, '{\"message\":\"соси\"}', 70, 18),
(516, '{\"message\":\"О\"}', 62, 18),
(517, '{\"message\":\"Ого\"}', 62, 18),
(518, '{\"message\":\"Круть\"}', 62, 18),
(519, '{\"message\":\"ага\"}', 70, 18),
(520, '{\"message\":\"я вщ с мобилки сижу)\"}', 70, 18),
(521, '{\"message\":\"Ахаахх\"}', 62, 18),
(522, '{\"message\":\"Гений\"}', 62, 18),
(523, '{\"message\":\"Я нашел баг системы \"}', 62, 18),
(524, '{\"image\":\"/Uploads/ChatImages/WERmcXg2b3RHQ3ozcVBMZHlJb3A1ZzFkTFBNenROdW82Mjg0RDE5NDRGLTgxNzAtNEQ4Ri05OTVDLUM1REQwQ0FFMzg0Ny5wbmc.png\"}', 62, 18),
(525, '{\"image\":\"/Uploads/ChatImages/dFl2YjJiSENkRnJnSjJHSGxKTDJKRXJXa0NQYnppS2g3MENhcHR1cmUwMDEucG5n.png\"}', 70, 17),
(526, '{\"image\":\"/Uploads/ChatImages/WUFPTlVaOUNJUWlnb0VGVUwxeGc2NkJkVnhING53N1Q3MENhcHR1cmUwMDEucG5n.png\"}', 70, 17),
(527, '{\"message\":\"приветь\"}', 70, 17),
(528, '{\"message\":\"мой скриншотик\",\"image\":\"/Uploads/ChatImages/S01Zc0hWRjZVZVhtdkpyVkpkM0VsUE9NUGhkNnpyUkk3MNCh0L3QuNC80L7QuiDRjdC60YDQsNC90LAgMjAyMi0wNi0xOSAwMjAyNDYucG5n.png\"}', 70, 20),
(529, '{\"message\":\"п\"}', 70, 16),
(530, '{\"message\":\"ерш\",\"image\":\"/Uploads/ChatImages/Y0J5Q2JOWHFHOXJLWG5MOHdUSW1MVTc5b2VJVVg0VkE3MDc2N0IwRTFELTlDMEYtNDgwMC1BOUNDLUExQkE1OUU3QUMyRC5qcGVn.png\"}', 70, 16),
(531, '{\"message\":\"hgie\"}', 71, 17),
(532, '{\"message\":\"rjrjftghjk\",\"image\":\"/Uploads/ChatImages/bTJVa1hiYnFLMkowaDRIc1Z1MEtPUm9MNEl3bGJUNzA3MUtvYWxhLmpwZw=.png\"}', 71, 17),
(533, '{\"message\":\"привет\"}', 71, 23),
(534, '{\"message\":\"влад\"}', 71, 23),
(535, '{\"message\":\"привет\"}', 71, 24),
(536, '{\"message\":\"привет\",\"image\":\"/Uploads/ChatImages/TThxUmR0NEgzZVNJSlJIdUdRNTRYOTQ2YjJ1RjNWczI3MEY3N0VBNTlELTY4NzItNEVGRi1CRDA0LTkwNEM5MjAxNjgxOC5qcGVn.png\"}', 70, 17),
(537, '{\"message\":\"sdfsdf\"}', 69, 16),
(538, '{\"message\":\"sdfsdf\"}', 69, 16),
(539, '{\"message\":\"123123\"}', 69, 16),
(540, '{\"message\":\"это вот картинка такая\",\"image\":\"/Uploads/ChatImages/UmpTYzJwd1U1NFl3bDV4YVhQZVk2NnUwWU9BUjhZekk3MDkyNWYzZTZlMjEzZWJlMGJjMTk2ZDM3OWE3MjgxZWU4LmpwZw=.png\"}', 70, 16),
(541, '{\"message\":\"123\"}', 70, 17),
(542, '{\"image\":\"/Uploads/ChatImages/YmpqNVByZURXNW83TFp3bWZZS1NPQWp1Y3J0VU9SMlU2MkE0Mjc4OTQ5LUM3OTItNDQ1Ri04MzdDLTAzMTU0Q0FGRDI0MS5qcGVn.png\"}', 62, 18),
(543, '{\"message\":\"Privet\"}', 62, 24),
(544, '{\"message\":\"Привет\"}', 76, 25),
(545, '{\"message\":\"фото\",\"image\":\"/Uploads/ChatImages/cjM1ZFlkY2NQNXlBWkUwQWZHZWsydGY3N3NmMHhEY2g3NjkyNWYzZTZlMjEzZWJlMGJjMTk2ZDM3OWE3MjgxZWU4LmpwZw=.png\"}', 76, 25),
(546, '{\"message\":\"hello\"}', 70, 18),
(547, '{\"message\":\"Hhhd\"}', 62, 18),
(548, '{\"image\":\"/Uploads/ChatImages/Sm9CRWt1SzVSUjNTV241YkU5aHFMaHBpcVpRdjdPQlE2MkJFRDY5RTgxLTgxMjAtNEVFNC1BNUFCLUExREE5NzlGQzU0Ri5qcGVn.png\"}', 62, 18),
(549, '{\"message\":\"foto\",\"image\":\"/Uploads/ChatImages/dko4YWRucDhPcVBvTFhwVjNmZ2ZHaGFKRXY0WEF2TW83MEU0QTMwNzI3LTJFMDYtNDk2NS04NzQ2LTY0Q0Y3NEM1RUM2MC5qcGVn.png\"}', 70, 18),
(550, '{\"message\":\"Сообщение\"}', 78, 28),
(551, '{\"message\":\"Здравствуйте \"}', 77, 28),
(552, '{\"message\":\"... каритнка\",\"image\":\"/Uploads/ChatImages/WFFibmlVdHRRdWxDMnVpeEdFZVNJbEhaMmNiMlhQcno3N9CR0LXQtyDQvdCw0LfQstCw0L3QuNGPICgxKS5qcGc.png\"}', 77, 28),
(557, '{\"message\":\"Привет\",\"image\":\"/Uploads/ChatImages/NHdscnpEblBrMElKQ3F3anpvamFHb1RDOTJBM1RMQjU3MHBob3RvMTY0ODEzODk0MC5qcGVn.png\"}', 70, 30),
(558, '{\"message\":\"123\"}', 70, 30),
(561, '{\"message\":\"ккк\",\"image\":\"/Uploads/ChatImages/b0VUdkVxbEJzbDBkSVNTY3ZsZFA4VGlLSjlBeHNyS0U3MNCR0LXQtyDQvdCw0LfQstCw0L3QuNGPLmpwZWc.png\"}', 70, 30),
(563, '{\"message\":\"лалк\",\"image\":\"/Uploads/ChatImages/ZTVzaFVzaHBjZFNIZ0JRUVB0eHFWM2IwYkpmcjZvb1Y3MDI4MzcxMjEwLTkwODUtNEVGQS1BODE5LTBFN0FCNTZDN0UyMy5wbmc.png\"}', 70, 30),
(564, '{\"message\":\"Jdhed\"}', 70, 17),
(565, '{\"message\":\"Jdje\"}', 70, 17),
(566, '{\"message\":\"Ff\"}', 70, 17),
(567, '{\"message\":\"хихихих\"}', 62, 8),
(568, '{\"message\":\"п\"}', 70, 18),
(569, '{\"image\":\"/Uploads/ChatImages/T1h5dFYycGFRaDdBRWo4QnJMSEduY0t2eUFRTFQxclg3MNCh0L3QuNC80L7QuiDRjdC60YDQsNC90LAgMjAyMi0xMC0yMyAyMTI1MDYucG5n.png\"}', 70, 18),
(570, '{\"message\":\"ппхпхпхпх\"}', 62, 18),
(571, '{\"message\":\"пришло\"}', 62, 18),
(572, '{\"message\":\"ахуеть\"}', 70, 18),
(573, '{\"message\":\"Кайф\"}', 62, 18),
(574, '{\"message\":\"Пхпхппх\"}', 62, 18),
(575, '{\"message\":\"опять эта срака\"}', 70, 18),
(576, '{\"image\":\"/Uploads/ChatImages/QTFCcUxPQzVYeWtxRFJ2RU84ZzdTU01UNDdFZjRtUjE2MjI3ODhkZjAyYWI5OWE5YWYyYzFlNGNjNWM2YWRlYTA3LmpwZw=.png\"}', 62, 18),
(577, '{\"message\":\"бля допили чтоле его\"}', 70, 18),
(578, '{\"message\":\"ой\"}', 70, 18),
(579, '{\"message\":\"допилить*\"}', 70, 18),
(580, '{\"message\":\"*КОРПОРОТИВНЫЙ ЧАТ COFFEE MODS*\"}', 62, 18),
(581, '{\"message\":\"+\"}', 70, 18),
(582, '{\"message\":\"Кстати, сейчас проверку на пенис сделаю\"}', 62, 18),
(583, '{\"message\":\"<b>Хуй</b>\"}', 62, 18),
(584, '{\"message\":\"Блин\"}', 62, 18),
(585, '{\"message\":\"Не работает\"}', 62, 18),
(586, '{\"message\":\"хихи\"}', 70, 18),
(587, '{\"message\":\"Ладно\"}', 62, 18),
(588, '{\"image\":\"/Uploads/ChatImages/Q2VhQWhScG9ha29FSnljWGsxdXA4MWZFYmc0MEFlS2M3MNCh0L3QuNC80L7QuiDRjdC60YDQsNC90LAgMjAyMi0xMS0wNyAyMzQ4MTgucG5n.png\"}', 70, 18),
(589, '{\"message\":\"Думаю обратно в тг можно пойти\"}', 62, 18),
(590, '{\"message\":\"+\"}', 70, 18),
(591, '{\"message\":\"Jopa \"}', 70, 18),
(592, '{\"message\":\"Penis\"}', 62, 18),
(593, '{\"message\":\"Hui\"}', 76, 25),
(594, '{\"message\":\"Jopa\"}', 70, 25),
(595, '{\"image\":\"/Uploads/ChatImages/SjFLYW8zZ2ZDRVBTdDMxd1VYeWM4RVJPRGNuOGpmR1I2MkJCNTVBN0FDLThERkItNDEyNi05MUM4LTgyMkEyM0M5NUU5Ni5qcGVn.png\"}', 62, 26),
(596, '{\"image\":\"/Uploads/ChatImages/dE9hbThKbWpGcGlYZ3o4NzFnR1V5RTV3VU9yYW5QdlE3MDEwOEQ4RTRCLThEOTctNDNDMS1BNTk3LUJGMzA1Qjk2RTZBRi5qcGVn.png\"}', 70, 25),
(597, '{\"message\":\"Itsoypys\"}', 62, 26),
(598, '{\"message\":\"Ffggggg\"}', 62, 18);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `profile_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `profile_picture`, `phone`) VALUES
(58, 'test', '4297f44b13955235245b2497399d7a93', NULL, '+7 (123) 123-12-31'),
(59, 'Максим Ромазанов', '7fded2590fd9fe9fd2e7b9cf86910dfc', NULL, '+7 (982) 275-61-33'),
(60, 'NewUser', '4297f44b13955235245b2497399d7a93', NULL, '+7 (800) 555-35-35'),
(61, 'vladik', '4297f44b13955235245b2497399d7a93', NULL, '+7 (111) 111-11-11'),
(62, 'casper', '$2a$15$cm7XzrsMGqCl/hSy62X.auFTz0v0mWMK2Sv1kh5/vstfxtnGhbcy2', '/Uploads/ProfilePictures/62.png', '+7 (922) 230-41-10'),
(63, 'etocasper', '$2a$15$wvAv/IddVF6b4HcN27StgOQYlZ9zCipo/4UKec8FmqzzOiEqQyqmm', '/Uploads/ProfilePictures/63.png', '+7 (922) 230-41-11'),
(64, 'Cringeman', '$2a$15$xzcQQhicCpfELD9FRsJtY.ZbDwwfTpx3WE4EZ6/NFJsoxTCwU1U5q', NULL, '+7 (922) 230-41-12'),
(65, 'denisiv', '$2a$15$09fHYVeYEi6oJUTXqbDwreciODA5vRIDTkfkCFZrn4Pp4fTylzBv2', '/Uploads/ProfilePictures/65.png', '+7 (945) 968-18-69'),
(66, 'Debil', '$2a$15$7zzpre2lItW54CWCu09meOYQIN9sI5CwM4TNHamYd8FVpnrmAVl2y', NULL, '+7 (896) 541-32-54'),
(67, 'TestTest', '$2a$15$Avq0TaHWUGjzczuzkzh.muSUetqYVPhcWPG.mTtctT.ekobWbfhvi', NULL, '+7 (123) 123-12-39'),
(68, 'ya', '$2a$15$6LBm0LnwdIfqLf3UfqFaOewtf/bkxkM.mezRSYOyiLH5Td5bFJg0u', NULL, '+7 (800) 555-35-36'),
(69, 'hello2', '$2a$15$8mQ2VWTO1AVeQ0SVmea29OCtGtoSwhhgq9F28XN/Hx0wXkhCB/P7a', '/Uploads/ProfilePictures/69.png', '+7 (800) 555-13-13'),
(70, 'hello', '$2a$15$EkUQhz/XN1ym7fjau/YiKO55LJ1kqgp3KBy/vd42Q2RW2Wu1.IM2.', '/Uploads/ProfilePictures/70.png', '+7 (800) 555-30-30'),
(71, 'irina', '$2a$15$/R4Qj5yeEO6FbZqF0RRb9OXBIn5cLZIJ9rT3qSgm8dPIMlcL0HsHa', '/Uploads/ProfilePictures/71.png', '+7 (951) 127-41-50'),
(73, 'test123123123123', '$2a$15$II2NNM8sUyV6stvsgIVJFOQmWSR2e75Dxec8KoNEwOraIQ4ZTuHq.', NULL, '+7 (123) 123-12-3_'),
(74, '123123', '$2a$15$9y4BLRHDjuk5ZQG3nl0vEOoBMzo9pWLgylA3s/D8u9EtA0Z3tLhLa', NULL, '+7 (123) 123-12-32'),
(75, '123123123123', '$2a$15$a0fO7sEtu9KN/jrshfbD7.beUFYyJoaJMAIYD4UAAvMlO9zN5pJ8C', NULL, '+7 (121) 231-23-12'),
(76, 'Login', '$2a$15$PnpzDbaJ6P9gMgbLdm/KdeFvM/C9H2q8UUIbbu.qjvbDDwQefT.gG', '/Uploads/ProfilePictures/76.png', '+7 (800) 333-12-12'),
(77, 'login123', '$2a$15$WtABo3wwHyftSk/PpXqWyuwfdxDfh4qx.9zlbf7umh0j9eyDq4Imi', '/Uploads/ProfilePictures/77.png', '+7 (800) 123-45-45'),
(78, 'aleksmir', '$2a$15$xp8GZum1utIdq7KghFJ5WuDerZDU3s6MQlTqhlUf7rFww0t4h/4Ru', NULL, '+7 (908) 053-44-11'),
(79, 'orenji369', '$2a$15$gUuOM2bSv2zFvxOQ0RJRkOFChetox9yoebd8wrpNCSdItHgrj32na', NULL, '+7 (904) 811-77-69'),
(80, 'petrov', '$2a$15$UMgcUjB7RAq20KhK3JTzYeXHo3DxDEJG.aAIfeDw.JF1EH7cKoYoK', '/Uploads/ProfilePictures/80.png', '+7 (963) 461-61-69');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `first_id` (`first_id`),
  ADD KEY `second_id` (`second_id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_user_id` (`from_user_id`),
  ADD KEY `chat_id` (`chat_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=599;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`first_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`second_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
