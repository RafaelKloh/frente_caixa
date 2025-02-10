-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Jan-2025 às 01:29
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `frente_caixa`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `email` text NOT NULL,
  `nascimento` date NOT NULL,
  `codigo` varchar(11) NOT NULL,
  `natureza` varchar(20) NOT NULL,
  `cnpj_cpf` int(20) NOT NULL,
  `rg` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `ie` varchar(20) NOT NULL,
  `bairro` varchar(20) NOT NULL,
  `numero` int(11) NOT NULL,
  `logradouro` varchar(30) NOT NULL,
  `pacote_preco` float NOT NULL,
  `ativo` varchar(11) NOT NULL,
  `sexo` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `email`, `nascimento`, `codigo`, `natureza`, `cnpj_cpf`, `rg`, `id_municipio`, `ie`, `bairro`, `numero`, `logradouro`, `pacote_preco`, `ativo`, `sexo`) VALUES
(1, 'Rafael', 'rafael@gmail.com', '2006-05-22', '1w2d3f4g', 'Fisica', 2147483647, 1111111111, 4316808, '', 'Centro', 111, 'R. Fernando Abott', 0, 'Sim', 'Masc'),
(2, 'Henrique', 'henrique@gmail.com', '2000-07-10', '2j4k5c6n', 'Fisica', 2147483647, 222222222, 4316808, '', 'Centro', 320, 'R. Julio de Castilhos', 0, 'Sim', 'Masc'),
(3, 'Isabela', 'isabela@gmail.com', '2010-10-10', '3m5n6f7s', 'Fisica', 2147483647, 333333333, 4316808, '', 'Linha Sta. Cruz', 450, 'Av. dos Cristais', 0, 'Sim', 'Fem'),
(4, 'Julia', 'julia@gmail.com', '2004-12-02', '4f5d7i9d', 'Fisica', 2147483647, 147483647, 4316808, '', 'Belvedere', 210, 'R. João Werlang ', 0, 'Sim', 'Fem'),
(5, 'Vitor', 'vitor@gmail.com', '2002-11-25', '5l3f6i8s', 'Fisica', 1234567890, 987654321, 4316808, '', 'Varzea', 560, 'R. Pastor Becker', 0, 'Sim', 'Masc');

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `id_forma_recebimento` int(11) NOT NULL,
  `denomincao` varchar(40) NOT NULL,
  `id_tipo_recebimento` int(11) NOT NULL,
  `ativo` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `id_forma_pagamento` int(11) NOT NULL,
  `qnt_max_parcelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `forma_pagamento`
--

INSERT INTO `forma_pagamento` (`id_forma_recebimento`, `denomincao`, `id_tipo_recebimento`, `ativo`, `codigo`, `id_forma_pagamento`, `qnt_max_parcelas`) VALUES
(1, 'Itau', 1, 1, '', 2, 0),
(2, 'Banrisul', 3, 1, '', 3, 0),
(3, 'PicPay', 4, 1, '', 1, 0),
(4, 'Caixa', 2, 1, '', 5, 3),
(5, 'Nubank', 5, 1, '', 4, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

CREATE TABLE `item` (
  `id_item` int(11) NOT NULL,
  `denominacao` varchar(30) NOT NULL,
  `preco` float(11,2) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `codigo_barra` varchar(20) NOT NULL,
  `unidade_medida` varchar(20) NOT NULL,
  `saldo_estoque_atual` float NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `registra_comissao` float NOT NULL,
  `status` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `item`
--

INSERT INTO `item` (`id_item`, `denominacao`, `preco`, `codigo`, `codigo_barra`, `unidade_medida`, `saldo_estoque_atual`, `id_categoria`, `registra_comissao`, `status`) VALUES
(1, 'Bolacha', 3.00, '', '', 'Kg', 0, 0, 0, ''),
(2, 'Massa', 10.25, '', '', 'Kg', 0, 0, 0, ''),
(3, 'Arroz', 12.27, '', '', 'Kg', 0, 0, 0, ''),
(4, 'Fermento', 5.00, '', '', 'Kg', 0, 0, 0, ''),
(5, 'Chocolate', 9.90, '', '', 'Kg', 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_venda`
--

CREATE TABLE `item_venda` (
  `id_item_venda` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `preco` float NOT NULL,
  `total` float NOT NULL,
  `desconto` float NOT NULL,
  `acrescimo` float NOT NULL,
  `data_venda` date NOT NULL,
  `observacao` varchar(20) NOT NULL,
  `status` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `recebimento_venda`
--

CREATE TABLE `recebimento_venda` (
  `id_recebimento_venda` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_forma_pagamento` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sis_log_registro`
--

CREATE TABLE `sis_log_registro` (
  `id_sis_log_registro` int(11) NOT NULL,
  `id_tipo_operacao` int(11) NOT NULL,
  `table_name` varchar(30) NOT NULL,
  `query` varchar(30) NOT NULL,
  `id_usuario_registro` int(11) NOT NULL,
  `ativo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_operacao`
--

CREATE TABLE `tipo_operacao` (
  `id_tipo_operacao` int(11) NOT NULL,
  `denominacao` varchar(30) NOT NULL,
  `ativo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_recebimento`
--

CREATE TABLE `tipo_recebimento` (
  `id_tipo_recebimento` int(11) NOT NULL,
  `denominacao` varchar(30) NOT NULL,
  `ativo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_recebimento`
--

INSERT INTO `tipo_recebimento` (`id_tipo_recebimento`, `denominacao`, `ativo`) VALUES
(1, 'Dinheiro', 1),
(2, 'Debito', 1),
(3, 'Pix', 1),
(4, 'Credito', 1),
(5, 'Prazo', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `ativo` varchar(5) NOT NULL,
  `login` varchar(15) NOT NULL,
  `id_grupo_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `ativo`, `login`, `id_grupo_usuario`) VALUES
(1, 'Pedro', 'S', 'pedro@gmail.com', 0),
(2, 'Vitória', 'S', 'vitoria@gmail', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `id_venda` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `numero_venda` int(11) NOT NULL,
  `data_registro_venda` date NOT NULL,
  `total_item` int(11) NOT NULL,
  `desconto` float NOT NULL,
  `acrescimo` float NOT NULL,
  `total_venda` int(11) NOT NULL,
  `observacao` varchar(20) NOT NULL,
  `status` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`id_forma_recebimento`);

--
-- Índices para tabela `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_item`);

--
-- Índices para tabela `item_venda`
--
ALTER TABLE `item_venda`
  ADD PRIMARY KEY (`id_item_venda`);

--
-- Índices para tabela `recebimento_venda`
--
ALTER TABLE `recebimento_venda`
  ADD PRIMARY KEY (`id_recebimento_venda`);

--
-- Índices para tabela `sis_log_registro`
--
ALTER TABLE `sis_log_registro`
  ADD PRIMARY KEY (`id_sis_log_registro`);

--
-- Índices para tabela `tipo_operacao`
--
ALTER TABLE `tipo_operacao`
  ADD PRIMARY KEY (`id_tipo_operacao`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Índices para tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id_venda`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `id_forma_recebimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `item_venda`
--
ALTER TABLE `item_venda`
  MODIFY `id_item_venda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `recebimento_venda`
--
ALTER TABLE `recebimento_venda`
  MODIFY `id_recebimento_venda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sis_log_registro`
--
ALTER TABLE `sis_log_registro`
  MODIFY `id_sis_log_registro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_operacao`
--
ALTER TABLE `tipo_operacao`
  MODIFY `id_tipo_operacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
