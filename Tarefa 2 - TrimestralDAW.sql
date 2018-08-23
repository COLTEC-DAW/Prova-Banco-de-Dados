SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `Estabelecimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Estabelecimento` (
  `CNPJ` INT NOT NULL,
  `endereco` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`CNPJ`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Item` (
  `codigo` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `valor` VARCHAR(45) NULL,
  `Estabelecimento_CNPJ` INT NOT NULL,
  PRIMARY KEY (`codigo`, `Estabelecimento_CNPJ`),
  INDEX `fk_Item_Estabelecimento_idx` (`Estabelecimento_CNPJ` ASC),
  CONSTRAINT `fk_Item_Estabelecimento`
    FOREIGN KEY (`Estabelecimento_CNPJ`)
    REFERENCES `Estabelecimento` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Motorista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Motorista` (
  `CPF` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cliente` (
  `CPF` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `endereço` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pedido` (
  `codigo` INT NOT NULL,
  `hora` DATETIME NULL,
  `Motorista_CPF` INT NOT NULL,
  `Cliente_CPF` INT NOT NULL,
  PRIMARY KEY (`codigo`, `Motorista_CPF`, `Cliente_CPF`),
  INDEX `fk_Pedido_Motorista1_idx` (`Motorista_CPF` ASC),
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_CPF` ASC),
  CONSTRAINT `fk_Pedido_Motorista1`
    FOREIGN KEY (`Motorista_CPF`)
    REFERENCES `Motorista` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`Cliente_CPF`)
    REFERENCES `Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Incluso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Incluso` (
  `Item_codigo` INT NOT NULL,
  `Item_Estabelecimento_CNPJ` INT NOT NULL,
  `Pedido_codigo` INT NOT NULL,
  PRIMARY KEY (`Item_codigo`, `Item_Estabelecimento_CNPJ`, `Pedido_codigo`),
  INDEX `fk_Item_has_Pedido_Pedido1_idx` (`Pedido_codigo` ASC),
  INDEX `fk_Item_has_Pedido_Item1_idx` (`Item_codigo` ASC, `Item_Estabelecimento_CNPJ` ASC),
  CONSTRAINT `fk_Item_has_Pedido_Item1`
    FOREIGN KEY (`Item_codigo` , `Item_Estabelecimento_CNPJ`)
    REFERENCES `Item` (`codigo` , `Estabelecimento_CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Item_has_Pedido_Pedido1`
    FOREIGN KEY (`Pedido_codigo`)
    REFERENCES `Pedido` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
