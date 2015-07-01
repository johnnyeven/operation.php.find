-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema profzone_find
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `profzone_find` ;

-- -----------------------------------------------------
-- Schema profzone_find
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `profzone_find` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `profzone_find` ;

-- -----------------------------------------------------
-- Table `profzone_find`.`find_account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profzone_find`.`find_account` ;

CREATE TABLE IF NOT EXISTS `profzone_find`.`find_account` (
  `uid` CHAR(32) NOT NULL,
  `ucenter_token` CHAR(32) NOT NULL,
  `token_expired` INT NOT NULL,
  `school` VARCHAR(32) NULL,
  `school_grade` CHAR(8) NULL,
  `school_profession` VARCHAR(32) NULL,
  `realname` CHAR(8) NULL,
  `identifier` CHAR(16) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE INDEX `ucenter_token_UNIQUE` (`ucenter_token` ASC),
  UNIQUE INDEX `identifier_UNIQUE` (`identifier` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profzone_find`.`find_project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profzone_find`.`find_project` ;

CREATE TABLE IF NOT EXISTS `profzone_find`.`find_project` (
  `id` CHAR(32) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `is_public` INT NOT NULL DEFAULT 1,
  `identifier` VARCHAR(32) NOT NULL,
  `wiki_start_page_id` CHAR(32) NOT NULL,
  `uid` CHAR(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UN` (`identifier` ASC, `uid` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profzone_find`.`find_workflow`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profzone_find`.`find_workflow` ;

CREATE TABLE IF NOT EXISTS `profzone_find`.`find_workflow` (
  `id` CHAR(32) NOT NULL,
  `number` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  `track_id` INT NOT NULL COMMENT '1=需求\n2=模块\n3=任务\n4=bug',
  `parrent_id` CHAR(32) NULL,
  `createtime` INT NOT NULL,
  `updatetime` INT NOT NULL,
  `status` INT NOT NULL COMMENT '0=新建 1=处理中 2=已解决 3=反馈 -1=已关闭',
  `priority` INT NOT NULL COMMENT '0=普通 1=高 2=紧急',
  `assign_to_id` CHAR(32) NULL,
  `release_id` CHAR(32) NULL,
  `starttime` INT NOT NULL,
  `endtime` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `number` USING BTREE (`number` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profzone_find`.`find_project_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profzone_find`.`find_project_role` ;

CREATE TABLE IF NOT EXISTS `profzone_find`.`find_project_role` (
  `role_id` CHAR(32) NOT NULL,
  `role_name` VARCHAR(32) NOT NULL,
  `permission` TEXT NOT NULL,
  `project_id` CHAR(32) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profzone_find`.`find_project_member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profzone_find`.`find_project_member` ;

CREATE TABLE IF NOT EXISTS `profzone_find`.`find_project_member` (
  `project_id` CHAR(32) NOT NULL,
  `role_id` CHAR(32) NOT NULL,
  `uid` CHAR(32) NOT NULL,
  PRIMARY KEY (`project_id`, `uid`, `role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profzone_find`.`find_project_notice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profzone_find`.`find_project_notice` ;

CREATE TABLE IF NOT EXISTS `profzone_find`.`find_project_notice` (
  `id` CHAR(32) NOT NULL,
  `uid` CHAR(32) NOT NULL,
  `type` INT NOT NULL,
  `account_identifier` CHAR(16) NOT NULL,
  `account_realname` CHAR(8) NOT NULL,
  `project_id` CHAR(32) NULL,
  `project_identifier` CHAR(32) NULL,
  `project_name` VARCHAR(45) NULL,
  `project_extends` TEXT NULL,
  `workflow_id` CHAR(32) NULL,
  `workflow_number` INT NULL,
  `workflow_title` VARCHAR(45) NULL,
  `workflow_extends` TEXT NULL,
  `description` TEXT NULL,
  `createtime` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profzone_find`.`find_project_wiki`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profzone_find`.`find_project_wiki` ;

CREATE TABLE IF NOT EXISTS `profzone_find`.`find_project_wiki` (
  `id` CHAR(32) NOT NULL,
  `project_id` CHAR(32) NOT NULL,
  `author_id` CHAR(32) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `version` INT NOT NULL,
  `createtime` INT NOT NULL,
  `updatetime` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UN` (`project_id` ASC, `title` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profzone_find`.`find_project_release`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profzone_find`.`find_project_release` ;

CREATE TABLE IF NOT EXISTS `profzone_find`.`find_project_release` (
  `id` CHAR(32) NOT NULL,
  `release_name` VARCHAR(255) NOT NULL,
  `version` VARCHAR(16) NOT NULL,
  `createtime` INT NOT NULL,
  `updatetime` INT NOT NULL,
  `publishtime` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profzone_find`.`find_project_document`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profzone_find`.`find_project_document` ;

CREATE TABLE IF NOT EXISTS `profzone_find`.`find_project_document` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `filepath` VARCHAR(255) NOT NULL,
  `size` INT NOT NULL,
  `createtime` INT NOT NULL,
  `updatetime` INT NOT NULL,
  `version` INT NOT NULL,
  `author_id` CHAR(32) NOT NULL,
  `workflow_id` CHAR(32) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10000;


-- -----------------------------------------------------
-- Table `profzone_find`.`find_project_star`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profzone_find`.`find_project_star` ;

CREATE TABLE IF NOT EXISTS `profzone_find`.`find_project_star` (
  `project_id` CHAR(32) NOT NULL,
  `uid` CHAR(32) NOT NULL,
  PRIMARY KEY (`project_id`, `uid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profzone_find`.`find_keys`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profzone_find`.`find_keys` ;

CREATE TABLE IF NOT EXISTS `profzone_find`.`find_keys` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uid` CHAR(32) NOT NULL,
  `createtime` INT NOT NULL,
  `updatetime` INT NOT NULL,
  `key` TEXT NOT NULL,
  `title` VARCHAR(32) NULL,
  `fingerprint` VARCHAR(64) NULL,
  `public` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profzone_find`.`find_deploy_key_project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profzone_find`.`find_deploy_key_project` ;

CREATE TABLE IF NOT EXISTS `profzone_find`.`find_deploy_key_project` (
  `key_id` INT NOT NULL,
  `project_id` CHAR(32) NOT NULL,
  `createtime` INT NOT NULL,
  `updatetime` INT NOT NULL,
  PRIMARY KEY (`key_id`, `project_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
