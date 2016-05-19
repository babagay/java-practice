

CREATE TABLE IF NOT EXISTS certificate (
  id  integer  PRIMARY KEY NOT NULL,
  image_id integer  NOT NULL REFERENCES image(id),
  user_id int  NOT NULL REFERENCES user_social(id),
  title varchar(120) DEFAULT NULL,
  getting_date date DEFAULT NULL
);


CREATE TABLE extra_course (
  id INTEGER  CONSTRAINT no_null NOT NULL PRIMARY KEY ,
  user_id int   NOT NULL REFERENCES user_social(id),
  title varchar(120) DEFAULT NULL,
  start date DEFAULT NULL,
  end_date date DEFAULT NULL,
  certificate_id INTEGER DEFAULT NULL REFERENCES certificate(id)
);

CREATE TABLE education (
  id INTEGER NOT NULL PRIMARY KEY NOT NULL,
  user_id INTEGER NOT NULL REFERENCES user_social(id),
  start date DEFAULT NULL,
  end_date date DEFAULT NULL
) ;

CREATE TABLE extra_info (
  id int NOT NULL PRIMARY KEY ,
  user_id int NOT NULL REFERENCES user_social(id),
  title varchar(250) DEFAULT NULL
) ;

CREATE TABLE  hobbi (
  id int  NOT NULL PRIMARY KEY ,
  title varchar(100) DEFAULT NULL,
  icon varchar(120) DEFAULT NULL
) ;


CREATE TABLE image (
  id int NOT NULL PRIMARY KEY ,
  user_id int NOT NULL REFERENCES user_social(id),
  title varchar(120) DEFAULT NULL,
  url int DEFAULT NULL
);


CREATE TABLE lang (
  id int NOT NULL PRIMARY KEY ,
  title varchar(50) DEFAULT NULL,
  abbr varchar(10) DEFAULT NULL
) ;


CREATE TABLE skill (
  id int NOT NULL PRIMARY KEY ,
  user_id int NOT NULL REFERENCES user_social(id),
  title varchar(200) DEFAULT NULL
) ;

CREATE TABLE tag (
  id int NOT NULL PRIMARY KEY ,
  title varchar(120) DEFAULT NULL,
  entity varchar(40) DEFAULT NULL
) ;

CREATE TABLE user_social (
  id int NOT NULL PRIMARY KEY ,
  uid VARCHAR(120) UNIQUE NOT NULL ,
  name varchar(50) DEFAULT NULL,
  surname varchar(60) DEFAULT NULL,
  login varchar(40) DEFAULT NULL,
  password varchar(60) DEFAULT NULL,
  avatar VARCHAR(100) DEFAULT NULL,
  avatar_sm VARCHAR(100) DEFAULT NULL
) ;

CREATE TABLE user_details (
  id int NOT NULL PRIMARY KEY ,
  user_id int NOT NULL CHECK (user_id > 0) REFERENCES user_social(id) UNIQUE ,
  objective text,
  phone varchar(25) DEFAULT NULL,
  email varchar(100) DEFAULT NULL,
  skype varchar(100) DEFAULT NULL,
  vk varchar(100) DEFAULT NULL,
  facebook varchar(100) DEFAULT NULL,
  linkedin varchar(150) DEFAULT NULL,
  github varchar(100) DEFAULT NULL,
  stackoverflow varchar(100) DEFAULT NULL,
  country varchar(60) DEFAULT NULL,
  city varchar(60) DEFAULT NULL,
  birth date DEFAULT NULL,
  hobbi VARCHAR(250) DEFAULT NULL ,
  lang VARCHAR(200) DEFAULT NULL ,
  tag VARCHAR(300) DEFAULT  NULL
);

CREATE TABLE work (
  id int NOT NULL PRIMARY KEY ,
  user_id int NOT NULL REFERENCES user_social(id),
  start date DEFAULT NULL,
  end_date date DEFAULT NULL,
  description text
) ;

-- REMOVE
CREATE TABLE user_to_tag (
  tag_id int  NOT NULL REFERENCES tag(id),
  user_id int NOT NULL REFERENCES user_social(id),
  CONSTRAINT user_tag PRIMARY KEY(user_id,tag_id)
) ;

-- REMOVE
CREATE TABLE user_to_hobbi (
  user_id int  NOT NULL,
  hobbi_id int NOT NULL,
  CONSTRAINT user_hobbi PRIMARY KEY(user_id,hobbi_id)
) ;


-- REMOVE
CREATE TABLE user_to_lang (
  user_id int NOT NULL,
  lang_id int NOT NULL,
  CONSTRAINT user_lang PRIMARY KEY(user_id,lang_id)
);





ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `extra_info`
--
ALTER TABLE `extra_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `hobbi`
--
ALTER TABLE `hobbi`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `lang`
--
ALTER TABLE `lang`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tag_to_user`
--
ALTER TABLE `tag_to_user`
  ADD PRIMARY KEY (`tag_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Индексы таблицы `user_details`
--
ALTER TABLE `user_details`
  ADD FULLTEXT KEY `objective` (`objective`);

--
-- Индексы таблицы `user_to_hobbi`
--
ALTER TABLE `user_to_hobbi`
  ADD PRIMARY KEY (`user_id`,`hobbi_id`),
  ADD KEY `user_to_hobbi_ibfk_2` (`hobbi_id`);

--
-- Индексы таблицы `user_to_lang`
--
ALTER TABLE `user_to_lang`
  ADD PRIMARY KEY (`user_id`,`lang_id`),
  ADD KEY `lang_id` (`lang_id`);

--
-- Индексы таблицы `work`
--
ALTER TABLE `work`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD FULLTEXT KEY `description` (`description`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `education`
--
ALTER TABLE `education`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `extra_info`
--
ALTER TABLE `extra_info`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `hobbi`
--
ALTER TABLE `hobbi`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `lang`
--
ALTER TABLE `lang`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `work`
--
ALTER TABLE `work`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `education`
--
ALTER TABLE `education`
  ADD CONSTRAINT `education_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `extra_info`
--
ALTER TABLE `extra_info`
  ADD CONSTRAINT `extra_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tag_to_user`
--
ALTER TABLE `tag_to_user`
  ADD CONSTRAINT `tag_to_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tag_to_user_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_to_hobbi`
--
ALTER TABLE `user_to_hobbi`
  ADD CONSTRAINT `user_to_hobbi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_to_hobbi_ibfk_2` FOREIGN KEY (`hobbi_id`) REFERENCES `hobbi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_to_lang`
--
ALTER TABLE `user_to_lang`
  ADD CONSTRAINT `user_to_lang_ibfk_1` FOREIGN KEY (`lang_id`) REFERENCES `lang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_to_lang_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `work`
--
ALTER TABLE `work`
  ADD CONSTRAINT `work_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
