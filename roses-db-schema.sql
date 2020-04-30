-- -----------------------------------------------------
-- Table `roses-db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `users` (
    `user_id` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `name` VARCHAR(50) UNIQUE NOT NULL,
    `email` VARCHAR(255) UNIQUE NOT NULL,
    `photo` VARCHAR(255) NULL,
    `password` VARCHAR(255) NOT NULL,
    `password_changed_at` BIGINT(20) NULL,
    `password_reset_token` VARCHAR(255) NULL,
    `password_reset_expires` BIGINT(20) NULL,
    PRIMARY KEY (`user_id`)
);

-- -----------------------------------------------------
-- Table `roses-db`.`roses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `roses` (
    `id` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `name` VARCHAR(255) NOT NULL UNIQUE,
    `photo` VARCHAR(255) NULL,
    `price` REAL NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `roses-db`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orders` (
    `id` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `quantity` INT NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `place` VARCHAR(50) NOT NULL,
    `user_id` INT NOT NULL,
    `rose_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_orders_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT `fk_orders_rose` FOREIGN KEY (`rose_id`) REFERENCES `roses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB;