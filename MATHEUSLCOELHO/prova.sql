-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tempo de Geração: 29/08/2017 às 11:10
-- Versão do servidor: 5.5.38-0ubuntu0.14.04.1
-- Versão do PHP: 5.5.9-1ubuntu4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `daw-aluno11-2017`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Atendimentos`
--

CREATE TABLE IF NOT EXISTS `Atendimentos` (
  `id_impressora` varchar(13) NOT NULL,
  `id_cliente` varchar(13) NOT NULL,
  `id_funcionario` varchar(13) NOT NULL,
  `num_paginas` int(11) NOT NULL,
  `valor` float NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_impressora`,`id_cliente`,`id_funcionario`,`data`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_funcionario` (`id_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Atendimentos`
--

INSERT INTO `Atendimentos` (`id_impressora`, `id_cliente`, `id_funcionario`, `num_paginas`, `valor`, `data`) VALUES
('1', '2', '3', 20, 5, '2017-07-05 11:31:44'),
('1', '4', '1', 30, 10, '2017-08-29 13:50:41'),
('3', '2', '3', 20, 5, '2017-08-31 11:32:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Cargos`
--

CREATE TABLE IF NOT EXISTS `Cargos` (
  `id` varchar(13) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `salario` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Cargos`
--

INSERT INTO `Cargos` (`id`, `nome`, `salario`) VALUES
('1', 'Vendedor de farofa', 50),
('2', 'Gerente', 10000),
('3', 'Fazedor de Nada', 5000),
('4', 'Operador de Xerox', 500.2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Clientes`
--

CREATE TABLE IF NOT EXISTS `Clientes` (
  `id` varchar(13) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Clientes`
--

INSERT INTO `Clientes` (`id`, `nome`, `CPF`) VALUES
('1', 'João', '12345678902'),
('2', 'Marcos', '12345678903'),
('3', 'Matheus', '12345678904'),
('4', 'Carolina', '12345678905');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Funcionarios`
--

CREATE TABLE IF NOT EXISTS `Funcionarios` (
  `id` varchar(13) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `id_cargo` varchar(13) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cargo` (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Funcionarios`
--

INSERT INTO `Funcionarios` (`id`, `nome`, `CPF`, `id_cargo`) VALUES
('1', 'João', '12345678910', '1'),
('2', 'Maria', '21212121211', '4'),
('3', 'Foca', '09864963678', '2');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Impressoras`
--

CREATE TABLE IF NOT EXISTS `Impressoras` (
  `id` varchar(13) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `Impressoras`
--

INSERT INTO `Impressoras` (`id`, `nome`, `marca`) VALUES
('1', 'Nome1', 'HP'),
('2', 'Nome2', 'HP'),
('3', 'ImpressoraLegal', 'Marca2'),
('4', 'ImpressoraChata', 'MarcaDor');

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `Atendimentos`
--
ALTER TABLE `Atendimentos`
  ADD CONSTRAINT `Atendimentos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Atendimentos_ibfk_2` FOREIGN KEY (`id_impressora`) REFERENCES `Impressoras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Atendimentos_ibfk_3` FOREIGN KEY (`id_funcionario`) REFERENCES `Funcionarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `Funcionarios`
--
ALTER TABLE `Funcionarios`
  ADD CONSTRAINT `Funcionarios_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `Cargos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/* ------------------------------------------------------------------------------------ */