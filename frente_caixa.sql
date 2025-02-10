-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11-Fev-2025 às 00:47
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
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `denominacao` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `denominacao`) VALUES
(1, 'Cereais'),
(2, 'Laticínios'),
(3, 'Vegetais'),
(4, 'Frutas'),
(5, 'Legumes'),
(6, 'Bebidas'),
(7, 'Carnes'),
(8, 'Outros');

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
  `ie` varchar(20) NOT NULL,
  `cep` int(11) NOT NULL,
  `logradouro` varchar(50) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `id_cidade_ibge` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `id_pacote_preco` float NOT NULL,
  `ativo` varchar(11) NOT NULL,
  `sexo` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `email`, `nascimento`, `codigo`, `natureza`, `cnpj_cpf`, `rg`, `ie`, `cep`, `logradouro`, `bairro`, `cidade`, `estado`, `id_cidade_ibge`, `numero`, `id_pacote_preco`, `ativo`, `sexo`) VALUES
(9, 'Gustavo', 'gustavo@gmail.com', '2006-05-09', '290345', 'fisical', 2147483647, 123456789, '', 96825490, 'Rua Carlos Kern', 'Margarida', 'Santa Cruz do Sul', 'Rio Grande do Sul', 4316808, 96, 19, 'Sim', 'masc'),
(13, 'Kauã Pereira', 'kaua.p@gmail.com', '2007-03-19', '124578963', 'fisica', 2147483647, 2147483647, '', 96824400, 'Avenida Leo Kraether', 'Country', 'Santa Cruz do Sul', 'Rio Grande do Sul', 4316808, 555, 7, 'Sim', 'masc'),
(14, 'Senac', 'senac@gmail.com', '1946-01-10', '96810204', 'juridica', 2147483647, 454545454, '2457115781', 93040160, 'Avenida Vinte de Setembro', 'São José', 'São Leopoldo', 'RS', 4318705, 300, 0, 'Sim', 'masc');

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `id_forma_pagamento` int(11) NOT NULL,
  `denominacao` varchar(40) NOT NULL,
  `id_tipo_recebimento` int(11) NOT NULL,
  `ativo` varchar(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `qnt_max_parcelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `forma_pagamento`
--

INSERT INTO `forma_pagamento` (`id_forma_pagamento`, `denominacao`, `id_tipo_recebimento`, `ativo`, `codigo`, `qnt_max_parcelas`) VALUES
(1, 'Itau', 1, 'Sim', '', 0),
(2, 'Banrisul', 3, 'Sim', '', 0),
(3, 'PicPay', 4, 'Sim', '', 0),
(4, 'Caixa', 2, 'Sim', '', 3),
(5, 'Nubank', 5, 'Sim', '', 5),
(6, 'Nubank', 1, 'Sim', '9898', 4),
(7, 'Nubank', 1, 'Sim', '9898', 4),
(8, 'Nubank', 1, 'Sim', '9898', 4),
(9, 'Nubank', 1, 'Sim', '9898', 4),
(10, 'Itau', 2, 'Sim', '89871455', 1),
(11, 'Sicredi', 1, 'Sim', '857444', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo_usuario`
--

CREATE TABLE `grupo_usuario` (
  `id_grupo_usuario` int(11) NOT NULL,
  `denominacao` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `grupo_usuario`
--

INSERT INTO `grupo_usuario` (`id_grupo_usuario`, `denominacao`) VALUES
(1, 'cliente'),
(2, 'funcionario');

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

CREATE TABLE `item` (
  `id_item` int(11) NOT NULL,
  `denominacao` varchar(30) NOT NULL,
  `preco` float(11,2) NOT NULL,
  `codigo` int(20) NOT NULL,
  `codigo_barra` bigint(20) NOT NULL,
  `unidade_medida` varchar(20) NOT NULL,
  `saldo_estoque_atual` float NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `registra_comissao` float NOT NULL,
  `ativo` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `item`
--

INSERT INTO `item` (`id_item`, `denominacao`, `preco`, `codigo`, `codigo_barra`, `unidade_medida`, `saldo_estoque_atual`, `id_categoria`, `registra_comissao`, `ativo`) VALUES
(29, 'CEBOLA', 34.00, 5432, 435, 'lt', 435, 4, 5, 'Sim'),
(30, 'BATATA ', 3.00, 84563512, 1236547899, 'kg', 90, 3, 20, 'Sim'),
(31, 'QUEIJO', 4.00, 44458788, 2563998, 'kg', 100, 2, 15, 'Sim'),
(32, 'FANTA LARANJA 2L', 8.00, 55555555, 6565447, 'lt', 200, 4, 2, 'Sim'),
(33, 'FANTA LARANJA 2L', 8.00, 55555555, 6565447, 'lt', 200, 4, 2, 'Sim'),
(34, 'Coca 600ml', 6.00, 589967471, 12215584, 'lt', 500, 6, 4, 'Sim'),
(35, 'FEIJAO', 3.00, 5485649, 5687967, 'kg', 10, 5, 10, 'Sim');

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
  `ativo` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pacote_itens`
--

CREATE TABLE `pacote_itens` (
  `id_pacote_itens` int(11) NOT NULL,
  `id_pacote_preco` int(11) NOT NULL,
  `item` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pacote_itens`
--

INSERT INTO `pacote_itens` (`id_pacote_itens`, `id_pacote_preco`, `item`) VALUES
(1, 3, '29'),
(2, 3, '30'),
(3, 4, '29'),
(4, 4, '30'),
(5, 5, '29'),
(6, 5, '30'),
(7, 6, '29'),
(8, 6, '30'),
(9, 6, '31'),
(10, 7, '29'),
(11, 7, '30'),
(12, 7, '31'),
(13, 8, '30'),
(14, 8, '31'),
(15, 9, '29'),
(16, 9, '31'),
(17, 9, '32'),
(18, 10, '31'),
(19, 10, '33'),
(20, 10, '34'),
(21, 11, '32'),
(22, 18, '30'),
(23, 19, '33'),
(24, 19, '34');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pacote_preco`
--

CREATE TABLE `pacote_preco` (
  `id_pacote_preco` int(11) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `cliente` varchar(50) NOT NULL,
  `desconto` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pacote_preco`
--

INSERT INTO `pacote_preco` (`id_pacote_preco`, `descricao`, `cliente`, `desconto`) VALUES
(1, 'SenacOferta', '1', 5),
(2, 'pacote de teste', '5', 50),
(3, 'teste', '3', 99),
(7, 'Agora funciona pfv', '13', 10),
(9, 'Promoção especial final de curso', '15', 50),
(19, 'teste', '9', 50);

-- --------------------------------------------------------

--
-- Estrutura da tabela `recebimento_venda`
--

CREATE TABLE `recebimento_venda` (
  `id_recebimento_venda` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_forma_pagamento` int(11) NOT NULL,
  `ativo` varchar(11) NOT NULL
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
  `ativo` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_operacao`
--

CREATE TABLE `tipo_operacao` (
  `id_tipo_operacao` int(11) NOT NULL,
  `denominacao` varchar(30) NOT NULL,
  `ativo` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_recebimento`
--

CREATE TABLE `tipo_recebimento` (
  `id_tipo_recebimento` int(11) NOT NULL,
  `denominacao` varchar(30) NOT NULL,
  `ativo` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_recebimento`
--

INSERT INTO `tipo_recebimento` (`id_tipo_recebimento`, `denominacao`, `ativo`) VALUES
(1, 'Dinheiro', '1'),
(2, 'Debito', '1'),
(3, 'Pix', '1'),
(4, 'Credito', '1'),
(5, 'Prazo', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `ativo` varchar(5) NOT NULL,
  `login_usuario` varchar(50) NOT NULL,
  `id_grupo_usuario` int(11) NOT NULL,
  `senha` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `ativo`, `login_usuario`, `id_grupo_usuario`, `senha`) VALUES
(30, 'Teste', 'Sim', 'teste@gmail.com', 1, 'teste'),
(31, 'Heitor', 'Sim', 'heitor@gmail.com', 2, 'heitor'),
(34, 'marcelo', 'Sim', 'marcelo@gmail.com', 1, '123');

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
  `ativo` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`id_forma_pagamento`);

--
-- Índices para tabela `grupo_usuario`
--
ALTER TABLE `grupo_usuario`
  ADD PRIMARY KEY (`id_grupo_usuario`);

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
-- Índices para tabela `pacote_itens`
--
ALTER TABLE `pacote_itens`
  ADD PRIMARY KEY (`id_pacote_itens`);

--
-- Índices para tabela `pacote_preco`
--
ALTER TABLE `pacote_preco`
  ADD PRIMARY KEY (`id_pacote_preco`);

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
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `id_forma_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `grupo_usuario`
--
ALTER TABLE `grupo_usuario`
  MODIFY `id_grupo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `item_venda`
--
ALTER TABLE `item_venda`
  MODIFY `id_item_venda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pacote_itens`
--
ALTER TABLE `pacote_itens`
  MODIFY `id_pacote_itens` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `pacote_preco`
--
ALTER TABLE `pacote_preco`
  MODIFY `id_pacote_preco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
