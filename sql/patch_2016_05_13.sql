ALTER TABLE `user_details` ADD UNIQUE(`user_id`);

ALTER TABLE `user_details` CHANGE `user_id` `user_id` INT(11) UNSIGNED NOT NULL;

ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `user` ADD `avatar` INT(11) UNSIGNED NULL DEFAULT NULL AFTER `password`,
  ADD `certificates` VARCHAR(50) NULL DEFAULT NULL AFTER `avatar`,
  ADD `hobbi` VARCHAR(50) NULL DEFAULT NULL AFTER `certificates`,
  ADD `lang` VARCHAR(50) NULL DEFAULT NULL AFTER `hobbi`,
  ADD `tag` VARCHAR(100) NULL DEFAULT NULL AFTER `lang`,
  ADD UNIQUE `avatar_idx` (`avatar`);

ALTER TABLE `extra_info` ADD UNIQUE(`user_id`);

