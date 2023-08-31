-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 31/08/2023 às 15:50
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escola`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `curso`
--

CREATE TABLE `curso` (
  `idCurso` int(11) NOT NULL,
  `Departamento_idDepartamento` int(11) NOT NULL,
  `Created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamento`
--

CREATE TABLE `departamento` (
  `idDepartamento` int(11) NOT NULL,
  `nome` varchar(240) NOT NULL,
  `campus` varchar(240) NOT NULL,
  `idProfessor_Coordenador` int(11) NOT NULL,
  `Created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `discplina`
--

CREATE TABLE `discplina` (
  `idDiscplina` int(11) NOT NULL,
  `nomeDisciplina` int(11) NOT NULL,
  `Professor_idProfessor` int(11) NOT NULL,
  `Created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `discplina_e_curso`
--

CREATE TABLE `discplina_e_curso` (
  `Disciplina_idDiscplina` int(11) NOT NULL,
  `Curso_idCurso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor`
--

CREATE TABLE `professor` (
  `idProfessor` int(11) NOT NULL,
  `nome` varchar(240) NOT NULL,
  `Departamento_idDepartamento` int(11) NOT NULL,
  `Created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`idCurso`),
  ADD KEY `Departamento_idDepartamento` (`Departamento_idDepartamento`);

--
-- Índices de tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`idDepartamento`),
  ADD KEY `idProfessor_Coordenador` (`idProfessor_Coordenador`);

--
-- Índices de tabela `discplina`
--
ALTER TABLE `discplina`
  ADD PRIMARY KEY (`idDiscplina`),
  ADD KEY `Professor_idProfessor` (`Professor_idProfessor`);

--
-- Índices de tabela `discplina_e_curso`
--
ALTER TABLE `discplina_e_curso`
  ADD KEY `Curso_idCurso` (`Curso_idCurso`),
  ADD KEY `Disciplina_idDiscplina` (`Disciplina_idDiscplina`);

--
-- Índices de tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`idProfessor`),
  ADD KEY `Departamento_idDepartamento` (`Departamento_idDepartamento`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `curso`
--
ALTER TABLE `curso`
  MODIFY `idCurso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `idDepartamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `discplina`
--
ALTER TABLE `discplina`
  MODIFY `idDiscplina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `idProfessor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`Departamento_idDepartamento`) REFERENCES `departamento` (`idDepartamento`);

--
-- Restrições para tabelas `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`idProfessor_Coordenador`) REFERENCES `professor` (`idProfessor`);

--
-- Restrições para tabelas `discplina`
--
ALTER TABLE `discplina`
  ADD CONSTRAINT `discplina_ibfk_1` FOREIGN KEY (`Professor_idProfessor`) REFERENCES `professor` (`idProfessor`);

--
-- Restrições para tabelas `discplina_e_curso`
--
ALTER TABLE `discplina_e_curso`
  ADD CONSTRAINT `discplina_e_curso_ibfk_1` FOREIGN KEY (`Curso_idCurso`) REFERENCES `curso` (`idCurso`),
  ADD CONSTRAINT `discplina_e_curso_ibfk_2` FOREIGN KEY (`Disciplina_idDiscplina`) REFERENCES `discplina` (`idDiscplina`);

--
-- Restrições para tabelas `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`Departamento_idDepartamento`) REFERENCES `departamento` (`idDepartamento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
