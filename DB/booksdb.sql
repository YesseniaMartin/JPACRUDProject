-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema myfavoritebooks
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `myfavoritebooks` ;

-- -----------------------------------------------------
-- Schema myfavoritebooks
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `myfavoritebooks` DEFAULT CHARACTER SET utf8 ;
USE `myfavoritebooks` ;

-- -----------------------------------------------------
-- Table `books`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books` ;

CREATE TABLE IF NOT EXISTS `books` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `book_title` VARCHAR(100) NOT NULL,
  `author` VARCHAR(100) NOT NULL,
  `genre` VARCHAR(100) NULL,
  `year-of` YEAR NULL,
  PRIMARY KEY (`book_id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS favoritebooks@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'favoritebooks'@'localhost' IDENTIFIED BY 'favoritebooks';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'favoritebooks'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `books`
-- -----------------------------------------------------
START TRANSACTION;
USE `myfavoritebooks`;
INSERT INTO `books` (`book_id`, `book_title`, `author`, `genre`, `year-of`) VALUES (1, 'Percy Jackson The Lightning Thief', 'Rick Riordan', 'Action & Adventure', 2005);
INSERT INTO `books` (`book_id`, `book_title`, `author`, `genre`, `year-of`) VALUES (2, 'Harry Potter', 'J.K Rowling', 'Action & Adventure', 2015);

COMMIT;

