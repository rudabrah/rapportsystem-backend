-- MySQL Script generated by MySQL Workbench
-- Mon Feb 12 20:48:57 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Disa_report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disa_report` (
  `reportId` INT NOT NULL AUTO_INCREMENT,
  `Shift` VARCHAR(45) NOT NULL,
  `date_and_time` DATETIME NOT NULL,
  `amt_formed` INT NOT NULL,
  `amt_cast` INT NOT NULL,
  `comment` VARCHAR(250) NULL,
  `model_number` INT NOT NULL,
  PRIMARY KEY (`reportId`),
  UNIQUE INDEX `reportId_UNIQUE` (`reportId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`drill_and_curve_test`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`drill_and_curve_test` (
  `test_id` INT NOT NULL AUTO_INCREMENT,
  `part_type` VARCHAR(45) NOT NULL,
  `stove` VARCHAR(45) NOT NULL,
  `catalog_number` INT NULL,
  `test_amount` INT NULL,
  `ordrer_number` VARCHAR(45) NOT NULL,
  `approved` TINYINT NOT NULL COMMENT '\n',
  `date` DATE NOT NULL,
  `time` TIME NOT NULL,
  `sign` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`test_id`),
  UNIQUE INDEX `test_id_UNIQUE` (`test_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`melt_report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`melt_report` (
  `melt_report_id` INT NOT NULL AUTO_INCREMENT,
  `furnace_number` INT NOT NULL,
  `date` DATE NOT NULL,
  `time` TIME NOT NULL,
  `kg_returns` FLOAT NOT NULL,
  `kg_scrap_metal` FLOAT NOT NULL,
  `total_weight_melt` FLOAT GENERATED ALWAYS AS (kg_returns + kg_scrap_metal) VIRTUAL,
  `kg_carbon` FLOAT NOT NULL,
  `kg_ore` FLOAT NOT NULL,
  `kg_fesi` FLOAT NOT NULL,
  `kg_fep` FLOAT NOT NULL,
  `kwh_pre_melt` DOUBLE NOT NULL,
  `kwh_post_melt` DOUBLE NOT NULL,
  `sum_kwh_used` DOUBLE GENERATED ALWAYS AS (kwh_pre_melt + kwh_post_melt) VIRTUAL,
  PRIMARY KEY (`melt_report_id`),
  UNIQUE INDEX `melt_report_id_UNIQUE` (`melt_report_id` ASC) VISIBLE)
ENGINE = InnoDB
KEY_BLOCK_SIZE = 16;


-- -----------------------------------------------------
-- Table `mydb`.`sand_analysis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sand_analysis` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `time` TIME NOT NULL,
  `moisture` DECIMAL NOT NULL,
  `pressure_strengt` DECIMAL NOT NULL,
  `packing_degree` DECIMAL NOT NULL,
  `burn_out` DECIMAL NOT NULL,
  `shear_strength` DECIMAL NOT NULL,
  `active_bentonie` DECIMAL NOT NULL,
  `sludge_content` DECIMAL NOT NULL,
  `sieve_analysis` DECIMAL NOT NULL,
  `compressibility` DECIMAL NOT NULL,
  `sand_temp` DECIMAL NOT NULL,
  `signature` VARCHAR(20) CHARACTER SET 'utf16' NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `ID_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`scrap`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`scrap` (
  `scrap_id` INT NOT NULL AUTO_INCREMENT,
  `catalog_number` INT NOT NULL,
  `amount_ordered` INT NOT NULL,
  `amount_lacking` INT NOT NULL,
  `price_pr_piece` FLOAT NULL,
  `sum_price` FLOAT GENERATED ALWAYS AS (Antall_manko * Pris_Pr_del) VIRTUAL,
  PRIMARY KEY (`scrap_id`),
  UNIQUE INDEX `scrap_id_UNIQUE` (`scrap_id` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
