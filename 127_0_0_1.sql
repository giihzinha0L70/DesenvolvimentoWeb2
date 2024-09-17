-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Set-2024 às 20:41
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `363707`
--
CREATE DATABASE IF NOT EXISTS `363707` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `363707`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `amplificadores`
--

CREATE TABLE `amplificadores` (
  `cod_amp` int(11) NOT NULL,
  `tipo_amp` varchar(45) NOT NULL,
  `marca_amp` varchar(45) NOT NULL,
  `modelo_amp` varchar(45) NOT NULL,
  `preco_amp` decimal(10,2) NOT NULL,
  `foto_amp` varchar(100) NOT NULL,
  `fila_compra_amp` char(1) NOT NULL DEFAULT 'N',
  `vendas_cod_ven` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `cod_fun` int(11) NOT NULL,
  `nome_fun` varchar(45) NOT NULL,
  `login_fun` varchar(45) NOT NULL,
  `senha_fun` varchar(45) NOT NULL,
  `status_fun` varchar(10) NOT NULL DEFAULT 'ATIVO',
  `funcao_fun` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`cod_fun`, `nome_fun`, `login_fun`, `senha_fun`, `status_fun`, `funcao_fun`) VALUES
(1, 'Administrador do Sistema', 'admin', '1', 'ATIVO', 'administrador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `cod_ven` int(11) NOT NULL,
  `data_ven` date NOT NULL,
  `funcionarios_cod_fun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `amplificadores`
--
ALTER TABLE `amplificadores`
  ADD PRIMARY KEY (`cod_amp`),
  ADD KEY `fk_amplificadores_vendas1_idx` (`vendas_cod_ven`);

--
-- Índices para tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`cod_fun`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`cod_ven`),
  ADD KEY `fk_vendas_funcionarios_idx` (`funcionarios_cod_fun`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `amplificadores`
--
ALTER TABLE `amplificadores`
  MODIFY `cod_amp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `cod_fun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `cod_ven` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `amplificadores`
--
ALTER TABLE `amplificadores`
  ADD CONSTRAINT `fk_amplificadores_vendas1` FOREIGN KEY (`vendas_cod_ven`) REFERENCES `vendas` (`cod_ven`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `fk_vendas_funcionarios` FOREIGN KEY (`funcionarios_cod_fun`) REFERENCES `funcionarios` (`cod_fun`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
