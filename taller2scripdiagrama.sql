-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema taller2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema taller2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `taller2` DEFAULT CHARACTER SET utf8 ;
USE `taller2` ;

-- -----------------------------------------------------
-- Table `taller2`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taller2`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nombre` VARCHAR(50) NULL,
  `Edad` INT NULL,
  `Telefono` INT NULL,
  `Rut` VARCHAR(50) NULL,
  `Email` VARCHAR(50) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taller2`.`Compañia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taller2`.`Compañia` (
  `idCompañia` INT NOT NULL,
  `Nombre` VARCHAR(50) NULL,
  `Direccion` VARCHAR(50) NULL,
  `Telefono` INT NULL,
  `Run` VARCHAR(50) NULL,
  PRIMARY KEY (`idCompañia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taller2`.`Origen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taller2`.`Origen` (
  `idOrigen` INT NOT NULL,
  `nAeropuerto` VARCHAR(50) NULL,
  `Ciudad` VARCHAR(50) NULL,
  `codCiudad` VARCHAR(50) NULL,
  PRIMARY KEY (`idOrigen`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taller2`.`Destino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taller2`.`Destino` (
  `idDestino` INT NOT NULL,
  `nAeropuerto` VARCHAR(50) NULL,
  `Ciudad` VARCHAR(50) NULL,
  `codCiudad` VARCHAR(50) NULL,
  PRIMARY KEY (`idDestino`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taller2`.`Itinerario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taller2`.`Itinerario` (
  `idItinerario` INT NOT NULL,
  `Hora` TIME NULL,
  `Fecha` VARCHAR(50) NULL,
  `Origen_idOrigen` INT NOT NULL,
  `Destino_idDestino` INT NOT NULL,
  PRIMARY KEY (`idItinerario`),
  INDEX `fk_Itinerario_Origen1_idx` (`Origen_idOrigen` ASC) VISIBLE,
  INDEX `fk_Itinerario_Destino1_idx` (`Destino_idDestino` ASC) VISIBLE,
  CONSTRAINT `fk_Itinerario_Origen1`
    FOREIGN KEY (`Origen_idOrigen`)
    REFERENCES `taller2`.`Origen` (`idOrigen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Itinerario_Destino1`
    FOREIGN KEY (`Destino_idDestino`)
    REFERENCES `taller2`.`Destino` (`idDestino`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taller2`.`Vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taller2`.`Vuelo` (
  `idVuelo` INT NOT NULL,
  `Capacidad` INT NULL,
  `modeloAvion` VARCHAR(50) NULL,
  `numeroVuelo` VARCHAR(50) NULL,
  `Compañia_idCompañia` INT NOT NULL,
  `Itinerario_idItinerario` INT NOT NULL,
  PRIMARY KEY (`idVuelo`),
  INDEX `fk_Vuelo_Compañia1_idx` (`Compañia_idCompañia` ASC) VISIBLE,
  INDEX `fk_Vuelo_Itinerario1_idx` (`Itinerario_idItinerario` ASC) VISIBLE,
  CONSTRAINT `fk_Vuelo_Compañia1`
    FOREIGN KEY (`Compañia_idCompañia`)
    REFERENCES `taller2`.`Compañia` (`idCompañia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vuelo_Itinerario1`
    FOREIGN KEY (`Itinerario_idItinerario`)
    REFERENCES `taller2`.`Itinerario` (`idItinerario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `taller2`.`Pasaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `taller2`.`Pasaje` (
  `idPasaje` INT NOT NULL,
  `Clase` VARCHAR(50) NULL,
  `Asiento` VARCHAR(50) NULL,
  `Valor` INT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Vuelo_idVuelo` INT NOT NULL,
  PRIMARY KEY (`idPasaje`),
  INDEX `fk_Pasaje_Cliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Pasaje_Vuelo1_idx` (`Vuelo_idVuelo` ASC) VISIBLE,
  CONSTRAINT `fk_Pasaje_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `taller2`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pasaje_Vuelo1`
    FOREIGN KEY (`Vuelo_idVuelo`)
    REFERENCES `taller2`.`Vuelo` (`idVuelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
