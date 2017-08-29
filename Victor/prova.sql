CREATE TABLE IF NOT EXISTS `daw-aluno14-2017`.`Cargos` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `salario` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `daw-aluno14-2017`.`Funcionarios` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `Cargos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Funcionarios_Cargos1_idx` (`Cargos_id` ASC),
  CONSTRAINT `fk_Funcionarios_Cargos1`
    FOREIGN KEY (`Cargos_id`)
    REFERENCES `daw-aluno14-2017`.`Cargos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `daw-aluno14-2017`.`Impressoras` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));


CREATE TABLE IF NOT EXISTS `daw-aluno14-2017`.`Clientes` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `daw-aluno14-2017`.`Atendimentos` (
  `data` DATETIME NOT NULL,
  `num_paginas` INT NOT NULL,
  `valor` VARCHAR(45) NOT NULL,
  `Funcionarios_id` INT NOT NULL,
  `Impressoras_id` INT NOT NULL,
  `Clientes_id` INT NOT NULL,
  PRIMARY KEY (`data`, `Funcionarios_id`, `Impressoras_id`, `Clientes_id`),
  INDEX `fk_Atendimentos_Funcionarios1_idx` (`Funcionarios_id` ASC),
  INDEX `fk_Atendimentos_Impressoras1_idx` (`Impressoras_id` ASC),
  INDEX `fk_Atendimentos_Clientes1_idx` (`Clientes_id` ASC),
  CONSTRAINT `fk_Atendimentos_Funcionarios1`
    FOREIGN KEY (`Funcionarios_id`)
    REFERENCES `daw-aluno14-2017`.`Funcionarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atendimentos_Impressoras1`
    FOREIGN KEY (`Impressoras_id`)
    REFERENCES `daw-aluno14-2017`.`Impressoras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atendimentos_Clientes1`
    FOREIGN KEY (`Clientes_id`)
    REFERENCES `daw-aluno14-2017`.`Clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

SELECT nome, marca FROM Impressoras;
SELECT Funcionarios.nome, Cargos.nome, Cargos.salario FROM Funcionarios, Cargos WHERE Cargos.id = Funcionarios.Cargos_id;
SELECT Atendimentos.*, Clientes.*, Funcionarios.*, Impressoras.* FROM Atendimentos, Clientes, Funcionarios, Impressoras
WHERE Clientes.id = Atendimentos.Clientes_id, Funcionarios.id = Atendimentos.Funcionarios_id, Impressoras.id = Atendimentos.Impressoras_id;