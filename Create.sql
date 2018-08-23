
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;


CREATE TABLE IF NOT EXISTS `mydb`.`Item` (
  `idItem` INT NOT NULL,
  `codigo` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  PRIMARY KEY (`idItem`, `codigo`, `nome`, `valor`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`Estabelecimento` (
  `idEstabelecimento` INT NOT NULL,
  `nome` VARCHAR(80) NOT NULL,
  `endereco` VARCHAR(80) NOT NULL,
  `cnpj` INT NOT NULL,
  `Item_idItem` INT NOT NULL,
  `Item_codigo` INT NOT NULL,
  `Item_nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstabelecimento`, `nome`, `endereco`, `cnpj`),
  INDEX `fk_Estabelecimento_Item_idx` (`Item_idItem` ASC, `Item_codigo` ASC, `Item_nome` ASC),
  CONSTRAINT `fk_Estabelecimento_Item`
    FOREIGN KEY (`Item_idItem` , `Item_codigo` , `Item_nome`)
    REFERENCES `mydb`.`Item` (`idItem` , `codigo` , `nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `nome` VARCHAR(80) NOT NULL,
  `endereco` VARCHAR(90) NOT NULL,
  `cpf` INT NOT NULL,
  `telefone` INT NOT NULL,
  `Incluso_idIncluso` INT NOT NULL,
  PRIMARY KEY (`idCliente`, `nome`, `endereco`, `cpf`, `telefone`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `mydb`.`Motorista` (
  `idMotorista` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` INT NOT NULL,
  PRIMARY KEY (`idMotorista`, `nome`, `cpf`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `idPedido` INT NOT NULL,
  `codigo` VARCHAR(45) NOT NULL,
  `hora` VARCHAR(45) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Cliente_nome` VARCHAR(80) NOT NULL,
  `Cliente_endereco` VARCHAR(90) NOT NULL,
  `Cliente_cpf` INT NOT NULL,
  `Cliente_telefone` INT NOT NULL,
  `Motorista_idMotorista` INT NOT NULL,
  `Motorista_nome` VARCHAR(45) NOT NULL,
  `Motorista_cpf` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `codigo`, `hora`),
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_idCliente` ASC, `Cliente_nome` ASC, `Cliente_endereco` ASC, `Cliente_cpf` ASC, `Cliente_telefone` ASC),
  INDEX `fk_Pedido_Motorista1_idx` (`Motorista_idMotorista` ASC, `Motorista_nome` ASC, `Motorista_cpf` ASC),
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`Cliente_idCliente` , `Cliente_nome` , `Cliente_endereco` , `Cliente_cpf` , `Cliente_telefone`)
    REFERENCES `mydb`.`Cliente` (`idCliente` , `nome` , `endereco` , `cpf` , `telefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Motorista1`
    FOREIGN KEY (`Motorista_idMotorista` , `Motorista_nome` , `Motorista_cpf`)
    REFERENCES `mydb`.`Motorista` (`idMotorista` , `nome` , `cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb`.`Incluso` (
  `Item_idItem` INT NOT NULL,
  `Item_codigo` INT NOT NULL,
  `Item_nome` VARCHAR(45) NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  `Pedido_codigo` VARCHAR(45) NOT NULL,
  `Pedido_hora` VARCHAR(45) NOT NULL,
  INDEX `fk_Incluso_Item1_idx` (`Item_idItem` ASC, `Item_codigo` ASC, `Item_nome` ASC),
  INDEX `fk_Incluso_Pedido1_idx` (`Pedido_idPedido` ASC, `Pedido_codigo` ASC, `Pedido_hora` ASC),
  CONSTRAINT `fk_Incluso_Item1`
    FOREIGN KEY (`Item_idItem` , `Item_codigo` , `Item_nome`)
    REFERENCES `mydb`.`Item` (`idItem` , `codigo` , `nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incluso_Pedido1`
    FOREIGN KEY (`Pedido_idPedido` , `Pedido_codigo` , `Pedido_hora`)
    REFERENCES `mydb`.`Pedido` (`idPedido` , `codigo` , `hora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
