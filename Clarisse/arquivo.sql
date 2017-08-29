USE `daw-aluno04-2017`;

CREATE TABLE IF NOT EXISTS `daw-aluno04-2017`.`impressoras` (
  `idimpressoras` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45),
  `marca` VARCHAR(45),
   PRIMARY KEY (`idimpressoras`))
   ENGINE = InnoDB;




CREATE TABLE IF NOT EXISTS `daw-aluno04-2017`.`funcionarios` (
  `idfuncionarios` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45),
  `CPF` INT,
  PRIMARY KEY (`idfuncionarios`))
  ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `daw-aluno04-2017`.`cargos` (
  `idcargos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45),
  `salario` DECIMAL(45,0),
  `funcionarios_idfuncionarios` INT NOT NULL,
   PRIMARY KEY (`idcargos`, `funcionarios_idfuncionarios`),
   INDEX `fk_cargos_funcionarios_idx` (`funcionarios_idfuncionarios` ASC),

   CONSTRAINT `fk_cargos_funcionarios`
    FOREIGN KEY (`funcionarios_idfuncionarios`)
    REFERENCES `daw-aluno04-2017`.`funcionarios` (`idfuncionarios`)
)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `daw-aluno04-2017`.`clientes` (
  `idclientes` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45),
  `CPF` INT,
  PRIMARY KEY (`idclientes`))
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `daw-aluno04-2017`.`atendimentos` (
  `num_paginas` INT ,
  `valor` INT,
  `data` DATETIME NOT NULL,
  `impressoras_idimpressoras` INT NOT NULL,
  `clientes_idclientes` INT NOT NULL,
  `funcionarios_idfuncionarios` INT NOT NULL,
  PRIMARY KEY (`data`, `impressoras_idimpressoras`, `clientes_idclientes`, `funcionarios_idfuncionarios`),
  
  CONSTRAINT `fk_atendimentos_impressoras1`
    FOREIGN KEY (`impressoras_idimpressoras`)
    REFERENCES `daw-aluno04-2017`.`impressoras` (`idimpressoras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

  CONSTRAINT `fk_atendimentos_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `daw-aluno04-2017`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

  CONSTRAINT `fk_atendimentos_funcionarios1`
    FOREIGN KEY (`funcionarios_idfuncionarios`)
    REFERENCES `daw-aluno04-2017`.`funcionarios` (`idfuncionarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


INSERT INTO clientes (nome, CPF) VALUES ("c1", "123451");
INSERT INTO clientes (nome, CPF) VALUES ("c2", "123452");
INSERT INTO clientes (nome, CPF) VALUES ("c3", "123453");
INSERT INTO clientes (nome, CPF) VALUES ("c4", "123454");


INSERT INTO funcionarios (nome, cpf) VALUES ("f1", "111111");
INSERT INTO funcionarios (nome, cpf) VALUES ("f2", "222222");
INSERT INTO funcionarios (nome, cpf) VALUES ("f3", "333333");
INSERT INTO funcionarios (nome, cpf) VALUES ("f4", "444444");

INSERT INTO cargos (nome, salario, funcionarios_idfuncionarios) VALUES ("cargo1", "100", "1");
INSERT INTO cargos (nome, salario, funcionarios_idfuncionarios) VALUES ("cargo2", "200", "2");
INSERT INTO cargos (nome, salario, funcionarios_idfuncionarios) VALUES ("cargo3", "300", "3");
INSERT INTO cargos (nome, salario, funcionarios_idfuncionarios) VALUES ("cargo4", "400", "4");


INSERT INTO impressoras (nome, marca) VALUES ("robot", "hp");
INSERT INTO impressoras (nome, marca) VALUES ("robot1", "hp1");
INSERT INTO impressoras (nome, marca) VALUES ("robot2", "hp2");


INSERT INTO atendimentos (num_paginas, valor, data, impressoras_idimpressoras, funcionarios_idfuncionarios, clientes_idclientes) VALUES ("10", "1", "31/05/2014", "1", "1", "1");
INSERT INTO atendimentos (num_paginas, valor, data, impressoras_idimpressoras, funcionarios_idfuncionarios, clientes_idclientes) VALUES ("20", "2", "30/05/2014", "2", "2", "2");
INSERT INTO atendimentos (num_paginas, valor, data, impressoras_idimpressoras, funcionarios_idfuncionarios, clientes_idclientes) VALUES ("30", "3", "29/05/2014", "3", "3", "3");


SELECT nome, marca FROM impressoras;

SELECT funcionarios.nome, cargos.nome, cargos.salario FROM cargos
JOIN funcionarios ON cargos.funcionarios_idfuncionarios = funcionarios.idfuncionarios;

SELECT funcionarios.nome, clientes.nome, impressoras.nome, atendimentos.valor, atendimentos.num_paginas, atendimentos.data FROM atendimentos
JOIN funcionarios ON atendimentos.funcionarios_idfuncionarios = funcionarios.idfuncionarios
JOIN clientes ON atendimentos.clientes_idclientes= clientes.idclientes
JOIN impressoras ON atendimentos.impressoras_idimpressoras= impressoras.idimpressoras;


SELECT funcionarios.nome, clientes.nome, impressoras.nome, atendimentos.valor, atendimentos.num_paginas, atendimentos.data FROM atendimentos
JOIN funcionarios ON atendimentos.funcionarios_idfuncionarios = funcionarios.idfuncionarios
JOIN clientes ON atendimentos.clientes_idclientes= clientes.idclientes
JOIN impressoras ON atendimentos.impressoras_idimpressoras= impressoras.idimpressoras
WHERE impressoras.marca="hp";


SELECT clientes.nome FROM atendimentos 
JOIN clientes ON atendimentos.clientes_idclientes = clientes.idclientes
WHERE atendimentos.data <= DATE_FORMAT( "2017/07/01", "%Y/%m/%d");
         
