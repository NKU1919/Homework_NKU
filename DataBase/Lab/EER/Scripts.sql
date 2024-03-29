-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Shop_Customers
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Shop_Customers
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Shop_Customers` DEFAULT CHARACTER SET utf8 ;
USE `Shop_Customers` ;

-- -----------------------------------------------------
-- Table `Shop_Customers`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shop_Customers`.`Customer` (
  `Customer_number` VARCHAR(20) NOT NULL,
  `Customer_name` VARCHAR(30) NOT NULL,
  `Customer_id` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`Customer_number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shop_Customers`.`Card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shop_Customers`.`Card` (
  `Customer_number` VARCHAR(20) NOT NULL,
  `Customer_level` INT NOT NULL DEFAULT 0,
  `Customer_credits` INT NOT NULL DEFAULT 0,
  INDEX `fk_Card_Customer1_idx` (`Customer_number` ASC) VISIBLE,
  PRIMARY KEY (`Customer_number`),
  CONSTRAINT `fk_Card_Customer1`
    FOREIGN KEY (`Customer_number`)
    REFERENCES `Shop_Customers`.`Customer` (`Customer_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shop_Customers`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shop_Customers`.`Address` (
  `Customer_number` VARCHAR(20) NOT NULL,
  `Provience` VARCHAR(30) NOT NULL,
  `City` VARCHAR(30) NOT NULL,
  `District` VARCHAR(30) NOT NULL,
  `Street` VARCHAR(30) NOT NULL,
  `Detail` VARCHAR(90) NOT NULL,
  INDEX `fk_Address_Customer1_idx` (`Customer_number` ASC) VISIBLE,
  CONSTRAINT `fk_Address_Customer1`
    FOREIGN KEY (`Customer_number`)
    REFERENCES `Shop_Customers`.`Customer` (`Customer_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Shop_Customers`.`Telephone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shop_Customers`.`Telephone` (
  `Customer_number` VARCHAR(20) NOT NULL,
  `Area_code` VARCHAR(4) NULL DEFAULT 0,
  `Telephone_number` VARCHAR(13) NOT NULL,
  INDEX `fk_Telephone_Customer1_idx` (`Customer_number` ASC) VISIBLE,
  CONSTRAINT `fk_Telephone_Customer1`
    FOREIGN KEY (`Customer_number`)
    REFERENCES `Shop_Customers`.`Customer` (`Customer_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
