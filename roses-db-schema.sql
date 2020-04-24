-- MySQL Workbench Forward Engineering
SET
    @OLD_UNIQUE_CHECKS = @ @UNIQUE_CHECKS,
    UNIQUE_CHECKS = 0;

SET
    @OLD_FOREIGN_KEY_CHECKS = @ @FOREIGN_KEY_CHECKS,
    FOREIGN_KEY_CHECKS = 0;

SET
    @OLD_SQL_MODE = @ @SQL_MODE,
    SQL_MODE = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema roses-db
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema roses-db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `roses-db` DEFAULT CHARACTER SET utf8;

USE `roses-db`;

-- -----------------------------------------------------
-- Table `roses-db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roses-db`.`users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) UNIQUE NOT NULL,
    `email` VARCHAR(255) UNIQUE NOT NULL,
    `photo` VARCHAR(255) NULL,
    `password` VARCHAR(255) NOT NULL,
    `password_changed_at` BIGINT(20) NULL,
    `password_reset_token` VARCHAR(255) NULL,
    `password_reset_expires` BIGINT(20) NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE
);

-- -----------------------------------------------------
-- Table `roses-db`.`roses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roses-db`.`roses` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `photo` VARCHAR(255) NULL,
    `price` REAL NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
    UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `roses-db`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roses-db`.`orders` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `quantity` INT NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `place` VARCHAR(50) NOT NULL,
    `user_id` INT NOT NULL,
    `rose_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
    INDEX `fk_orders_users_idx` (`user_id` ASC) VISIBLE,
    INDEX `fk_orders_roses1_idx` (`rose_id` ASC) VISIBLE,
    CONSTRAINT `fk_orders_user` FOREIGN KEY (`user_id`) REFERENCES `roses-db`.`users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT `fk_orders_rose` FOREIGN KEY (`rose_id`) REFERENCES `roses-db`.`roses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB;

SET
    SQL_MODE = @OLD_SQL_MODE;

SET
    FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;

SET
    UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;