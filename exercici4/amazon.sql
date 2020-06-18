-- MySQL Script generated by MySQL Workbench
-- Thu Jun 18 21:16:12 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema amazon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema amazon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `amazon` DEFAULT CHARACTER SET utf8 ;
USE `amazon` ;

-- -----------------------------------------------------
-- Table `amazon`.`autor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amazon`.`autor` ;

CREATE TABLE IF NOT EXISTS `amazon`.`autor` (
  `id_autor` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `direccio` VARCHAR(200) NOT NULL,
  `llibres_publicats` INT UNSIGNED NULL,
  PRIMARY KEY (`id_autor`),
  UNIQUE INDEX `id_autor_UNIQUE` (`id_autor` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amazon`.`cataleg`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amazon`.`cataleg` ;

CREATE TABLE IF NOT EXISTS `amazon`.`cataleg` (
  `id_llibre` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantitat_destoc` INT NULL,
  `preu` DECIMAL(10,2) NULL,
  `autor_id_autor` INT NOT NULL,
  PRIMARY KEY (`id_llibre`),
  INDEX `fk_cataleg_autor_idx` (`autor_id_autor` ASC) VISIBLE,
  UNIQUE INDEX `id_llibre_UNIQUE` (`id_llibre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amazon`.`usuari`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amazon`.`usuari` ;

CREATE TABLE IF NOT EXISTS `amazon`.`usuari` (
  `id_usuari` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom_usuari` VARCHAR(45) NOT NULL,
  `email` VARCHAR(200) NOT NULL,
  `contrasenya` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_usuari`),
  UNIQUE INDEX `id_usuari_UNIQUE` (`id_usuari` ASC) VISIBLE,
  UNIQUE INDEX `nom_usuari_UNIQUE` (`nom_usuari` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amazon`.`factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amazon`.`factura` ;

CREATE TABLE IF NOT EXISTS `amazon`.`factura` (
  `id_factura` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `total_itens` INT NULL,
  `valor_total` DECIMAL(10,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_factura`),
  UNIQUE INDEX `id_table_UNIQUE` (`id_factura` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amazon`.`carrito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amazon`.`carrito` ;

CREATE TABLE IF NOT EXISTS `amazon`.`carrito` (
  `usuari_id_usuari` INT UNSIGNED NOT NULL,
  `factura_id_factura` INT UNSIGNED NOT NULL,
  `llibre` INT UNSIGNED NOT NULL,
  `quantitat` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`usuari_id_usuari`, `factura_id_factura`),
  INDEX `fk_usuari_has_factura_factura1_idx` (`factura_id_factura` ASC) VISIBLE,
  INDEX `fk_usuari_has_factura_usuari1_idx` (`usuari_id_usuari` ASC) VISIBLE,
  UNIQUE INDEX `iten_llibre_UNIQUE` (`llibre` ASC) VISIBLE,
  CONSTRAINT `fk_usuari_has_factura_usuari1`
    FOREIGN KEY (`usuari_id_usuari`)
    REFERENCES `amazon`.`usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuari_has_factura_factura1`
    FOREIGN KEY (`factura_id_factura`)
    REFERENCES `amazon`.`factura` (`id_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carrito_cataleg1`
    FOREIGN KEY (`llibre`)
    REFERENCES `amazon`.`cataleg` (`id_llibre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
