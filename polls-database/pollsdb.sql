CREATE DATABASE  `poll` ;

CREATE TABLE `poll`.`user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(50) NULL DEFAULT NULL,
  `lastName` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL,
  `passwordHash` VARCHAR(32) NOT NULL,
  `host` TINYINT(1) NOT NULL DEFAULT 0,
  `registeredAt` DATETIME NOT NULL,
  `lastLogin` DATETIME NULL DEFAULT NULL,
  `intro` TINYTEXT NULL DEFAULT NULL,
  `displayName` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `poll`.`poll` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `surveyHostId` BIGINT NOT NULL,
  `title` VARCHAR(75) NOT NULL,
  `metaTitle` VARCHAR(100) NULL,
  `summary` TINYTEXT NULL,
  `type` SMALLINT(6) NOT NULL DEFAULT 0,
  `published` TINYINT(1) NOT NULL DEFAULT 0,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  `publishedAt` DATETIME NULL DEFAULT NULL,
  `startsAt` DATETIME NULL DEFAULT NULL,
  `endsAt` DATETIME NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_poll_host`
    FOREIGN KEY (`surveyHostId`)
    REFERENCES `poll`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `poll`.`poll_meta` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `pollId` BIGINT NOT NULL,
  `key` VARCHAR(50) NOT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_meta_poll` (`pollId` ASC),
  UNIQUE INDEX `uq_poll_meta` (`pollId` ASC, `key` ASC),
  CONSTRAINT `fk_meta_poll`
    FOREIGN KEY (`pollId`)
    REFERENCES `poll`.`poll` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `poll`.`poll_question` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `pollId` BIGINT NOT NULL,
  `type` VARCHAR(50) NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 0,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_question_poll` (`pollId` ASC),
  CONSTRAINT `fk_question_poll`
    FOREIGN KEY (`pollId`)
    REFERENCES `poll`.`poll` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `poll`.`poll_answer` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `pollId` BIGINT NOT NULL,
  `questionId` BIGINT NOT NULL,
  `active` TINYINT(1) NOT NULL DEFAULT 0,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_answer_poll` (`pollId` ASC),
  CONSTRAINT `fk_answer_poll`
    FOREIGN KEY (`pollId`)
    REFERENCES `poll`.`poll` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


ALTER TABLE `poll`.`poll_answer` 
ADD INDEX `idx_answer_question` (`questionId` ASC);
ALTER TABLE `poll`.`poll_answer` 
ADD CONSTRAINT `fk_answer_question`
  FOREIGN KEY (`questionId`)
  REFERENCES `poll`.`poll_question` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
