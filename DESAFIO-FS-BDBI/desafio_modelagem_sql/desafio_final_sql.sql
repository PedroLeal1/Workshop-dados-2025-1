CREATE DATABASE desafio_final;
USE desafio_final;  

CREATE TABLE Cliente (
    ID_Cliente INTEGER PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    CPF VARCHAR(14),
    Telefone VARCHAR(20),
    Endereco VARCHAR(255)
);

CREATE TABLE Fornecedor (
    ID_Fornecedor INTEGER PRIMARY KEY,
    Nome_Fornecedor VARCHAR(100),
    Contato VARCHAR(100),
    Endereco VARCHAR(255),
    Produtos_Fornecidos VARCHAR(255),
    CNPJ VARCHAR(18)
);

CREATE TABLE Departamento (
    ID_Departamento INTEGER PRIMARY KEY,
    Nome_Departamento VARCHAR(100),
    Responsavel VARCHAR(100),
    Localizacao VARCHAR(100)
);

CREATE TABLE Vendedor (
    ID_Vendedor INTEGER PRIMARY KEY,
    Nome_Funcionario VARCHAR(100),
    Cargo VARCHAR(50),
    Salario DECIMAL(10,2),
    Telefone VARCHAR(20),
    Data_Admissao DATE,
    ID_Departamento INTEGER,
    FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento)
);

CREATE TABLE Produto (
    ID_Produto INTEGER PRIMARY KEY,
    Nome_Produto VARCHAR(100),
    Categoria VARCHAR(50),
    Preco DECIMAL(10,2),
    Descricao TEXT,
    ID_Fornecedor INTEGER,
    FOREIGN KEY (ID_Fornecedor) REFERENCES Fornecedor(ID_Fornecedor)
);

CREATE TABLE Estoque (
    ID_Estoque INTEGER PRIMARY KEY,
    Quantidade_Disponivel INTEGER,
    Data_Atualizacao DATE,
    Localizacao_Estoque VARCHAR(100),
    ID_Produto INTEGER,
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto)
);

CREATE TABLE Pedido (
    ID_Pedido INTEGER PRIMARY KEY,
    Status_Pedido VARCHAR(50),
    Total DECIMAL(10,2),
    Data_Pedido DATE,
    ID_Cliente INTEGER,
    ID_Vendedor INTEGER,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Vendedor) REFERENCES Vendedor(ID_Vendedor)
);

CREATE TABLE Item_Pedido (
    ID_Item INTEGER PRIMARY KEY,
    Quantidade INTEGER,
    Preco_Unitario DECIMAL(10,2),
    Subtotal DECIMAL(10,2),
    ID_Pedido INTEGER,
    ID_Produto INTEGER,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto)
);

CREATE TABLE Pagamento (
    ID_Pagamento INTEGER PRIMARY KEY,
    Tipo_Pagamento VARCHAR(50),
    Status_Pagamento VARCHAR(50),
    Data_Pagamento DATE,
    Valor DECIMAL(10,2),
    ID_Pedido INTEGER,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido)
);

INSERT INTO Cliente (ID_Cliente, Nome, Email, CPF, Telefone, Endereco) VALUES
(1, 'João Silva', 'joao@email.com', '123.456.789-00', '11987654321', 'Rua A, 123'),
(2, 'Maria Oliveira', 'maria@email.com', '987.654.321-00', '11976543210', 'Rua B, 456'),
(3, 'Carlos Pereira', 'carlos@email.com', '456.789.123-00', '11965432109', 'Rua C, 789'),
(4, 'Ana Souza', 'ana@email.com', '321.654.987-00', '11954321098', 'Rua D, 101'),
(5, 'Fernando Lima', 'fernando@email.com', '654.321.987-00', '11943210987', 'Rua E, 202'),
(6, 'Juliana Santos', 'juliana@email.com', '789.123.456-00', '11932109876', 'Rua F, 303'),
(7, 'Lucas Rocha', 'lucas@email.com', '159.357.852-00', '11921098765', 'Rua G, 404'),
(8, 'Beatriz Almeida', 'beatriz@email.com', '258.147.369-00', '11910987654', 'Rua H, 505'),
(9, 'Ricardo Mendes', 'ricardo@email.com', '357.951.753-00', '11909876543', 'Rua I, 606'),
(10, 'Camila Castro', 'camila@email.com', '951.753.357-00', '11908765432', 'Rua J, 707');

INSERT INTO Fornecedor (ID_Fornecedor, Nome_Fornecedor, Contato, Endereco, Produtos_Fornecidos, CNPJ) VALUES
(1, 'Tech Eletrônicos', 'contato@techeletronicos.com', 'Av. Central, 100', 'Celulares, Notebooks', '12.345.678/0001-00'),
(2, 'Moda Fashion', 'contato@modafashion.com', 'Rua das Roupas, 200', 'Roupas e Acessórios', '98.765.432/0001-11'),
(3, 'Casa Forte', 'contato@casaforte.com', 'Av. Móveis, 300', 'Móveis e Decoração', '56.789.123/0001-22'),
(4, 'Auto Peças Brasil', 'contato@autopecas.com', 'Rodovia SP-55, km 15', 'Peças Automotivas', '87.654.321/0001-33'),
(5, 'Super Alimentos', 'contato@superalimentos.com', 'Rua dos Alimentos, 400', 'Alimentos e Bebidas', '43.210.987/0001-44'),
(6, 'Eletro Mais', 'contato@eletromais.com', 'Av. Energia, 500', 'Eletrodomésticos', '11.223.344/0001-55'),
(7, 'Livraria Saber', 'contato@livrariasaber.com', 'Rua do Conhecimento, 600', 'Livros e Material Escolar', '22.334.455/0001-66'),
(8, 'PetAmigo', 'contato@petamigo.com', 'Rua dos Animais, 700', 'Produtos para pets', '33.445.566/0001-77'),
(9, 'Fitness Club', 'contato@fitnessclub.com', 'Av. Esporte, 800', 'Artigos esportivos', '44.556.677/0001-88'),
(10, 'ConstruCenter', 'contato@construcenter.com', 'Rodovia BR-101, km 20', 'Materiais de Construção', '55.667.788/0001-99');

INSERT INTO Departamento (ID_Departamento, Nome_Departamento, Responsavel, Localizacao) VALUES
(1, 'Eletrônicos', 'Carlos Silva', '1º andar'),
(2, 'Moda', 'Juliana Santos', '2º andar'),
(3, 'Móveis', 'Ricardo Almeida', '3º andar'),
(4, 'Automotivo', 'Fernando Mendes', '4º andar'),
(5, 'Alimentos', 'Ana Souza', 'Térreo'),
(6, 'Eletrodomésticos', 'Lucas Rocha', '1º andar'),
(7, 'Livraria', 'Beatriz Almeida', '2º andar'),
(8, 'Pet Shop', 'Camila Castro', '3º andar'),
(9, 'Esportes', 'Maria Oliveira', '4º andar'),
(10, 'Construção', 'João Silva', 'Térreo');

INSERT INTO Vendedor (ID_Vendedor, Nome_Funcionario, Cargo, Salario, Telefone, Data_Admissao, ID_Departamento) VALUES
(1, 'Felipe Souza', 'Atendente', 2500.00, '11987654321', '2023-01-15', 1),
(2, 'Mariana Costa', 'Gerente', 4000.00, '11976543210', '2022-05-20', 2),
(3, 'Roberto Lima', 'Atendente', 2700.00, '11965432109', '2021-08-10', 3),
(4, 'Patrícia Mendes', 'Vendedor', 2600.00, '11954321098', '2023-03-05', 4),
(5, 'Thiago Ribeiro', 'Caixa', 2200.00, '11943210987', '2020-11-30', 5),
(6, 'Camila Ferreira', 'Vendedor', 2800.00, '11932109876', '2021-09-25', 6),
(7, 'Eduardo Santos', 'Atendente', 2500.00, '11921098765', '2022-02-18', 7),
(8, 'Natália Oliveira', 'Gerente', 4200.00, '11910987654', '2019-07-12', 8),
(9, 'Daniel Martins', 'Vendedor', 2650.00, '11909876543', '2023-06-22', 9),
(10, 'Luciana Barros', 'Caixa', 2300.00, '11908765432', '2021-12-05', 10);

INSERT INTO Produto (ID_Produto, Nome_Produto, Categoria, Preco, Descricao, ID_Fornecedor) VALUES
(1, 'Smartphone X', 'Eletrônicos', 2999.99, 'Celular de última geração', 1),
(2, 'Notebook Gamer', 'Eletrônicos', 5999.99, 'Notebook potente para jogos', 1),
(3, 'Camiseta Casual', 'Moda', 49.90, 'Camiseta 100% algodão', 2),
(4, 'Sofá Retrátil', 'Móveis', 1999.99, 'Sofá confortável e espaçoso', 3),
(5, 'Óleo de Motor', 'Automotivo', 79.90, 'Óleo sintético para motores', 4),
(6, 'Cesta Básica', 'Alimentos', 150.00, 'Pacote com alimentos essenciais', 5),
(7, 'Geladeira Frost Free', 'Eletrodomésticos', 3499.99, 'Geladeira moderna', 6),
(8, 'Livro: O Poder do Hábito', 'Livraria', 89.90, 'Livro best-seller', 7),
(9, 'Ração para Cães', 'Pet Shop', 120.00, 'Ração premium para cães', 8),
(10, 'Bola de Futebol', 'Esportes', 99.90, 'Bola oficial de campeonato', 9);

INSERT INTO Estoque (ID_Estoque, Quantidade_Disponivel, Data_Atualizacao, Localizacao_Estoque, ID_Produto) VALUES
(1, 50, '2024-02-15', 'Depósito A', 1),
(2, 30, '2024-02-16', 'Depósito B', 2),
(3, 100, '2024-02-17', 'Depósito C', 3),
(4, 20, '2024-02-18', 'Depósito D', 4),
(5, 75, '2024-02-19', 'Depósito E', 5),
(6, 40, '2024-02-20', 'Depósito F', 6),
(7, 10, '2024-02-21', 'Depósito G', 7),
(8, 60, '2024-02-22', 'Depósito H', 8),
(9, 90, '2024-02-23', 'Depósito I', 9),
(10, 35, '2024-02-24', 'Depósito J', 10);

INSERT INTO Pedido (ID_Pedido, Status_Pedido, Total, Data_Pedido, ID_Cliente, ID_Vendedor) VALUES
(1, 'Entregue', 3299.99, '2024-02-10', 1, 1),
(2, 'Processando', 6099.99, '2024-02-11', 2, 2),
(3, 'Cancelado', 49.90, '2024-02-12', 3, 3),
(4, 'Enviado', 2199.99, '2024-02-13', 4, 4),
(5, 'Entregue', 79.90, '2024-02-14', 5, 5),
(6, 'Processando', 150.00, '2024-02-15', 6, 6),
(7, 'Enviado', 3499.99, '2024-02-16', 7, 7),
(8, 'Entregue', 89.90, '2024-02-17', 8, 8),
(9, 'Cancelado', 120.00, '2024-02-18', 9, 9),
(10, 'Enviado', 99.90, '2024-02-19', 10, 10);

INSERT INTO Item_Pedido (ID_Item, Quantidade, Preco_Unitario, Subtotal, ID_Pedido, ID_Produto) VALUES
(1, 1, 2999.99, 2999.99, 1, 1),
(2, 1, 5999.99, 5999.99, 2, 2),
(3, 1, 49.90, 49.90, 3, 3),
(4, 1, 1999.99, 1999.99, 4, 4),
(5, 1, 79.90, 79.90, 5, 5),
(6, 1, 150.00, 150.00, 6, 6),
(7, 1, 3499.99, 3499.99, 7, 7),
(8, 1, 89.90, 89.90, 8, 8),
(9, 1, 120.00, 120.00, 9, 9),
(10, 1, 99.90, 99.90, 10, 10);

INSERT INTO Pagamento (ID_Pagamento, Tipo_Pagamento, Status_Pagamento, Data_Pagamento, Valor, ID_Pedido) VALUES
(1, 'Cartão de Crédito', 'Aprovado', '2024-02-11', 3299.99, 1),
(2, 'Boleto', 'Pendente', '2024-02-12', 6099.99, 2),
(3, 'Pix', 'Cancelado', '2024-02-13', 49.90, 3),
(4, 'Cartão de Débito', 'Aprovado', '2024-02-14', 2199.99, 4),
(5, 'Dinheiro', 'Aprovado', '2024-02-15', 79.90, 5),
(6, 'Pix', 'Aprovado', '2024-02-16', 150.00, 6),
(7, 'Cartão de Crédito', 'Pendente', '2024-02-17', 3499.99, 7),
(8, 'Boleto', 'Aprovado', '2024-02-18', 89.90, 8),
(9, 'Cartão de Débito', 'Cancelado', '2024-02-19', 120.00, 9),
(10, 'Pix', 'Aprovado', '2024-02-20', 99.90, 10);

-- ----========---- Contagem de clientes cadastrados ----========----
-- Saber quantos clientes estão cadastrados ajuda a entender 
-- o tamanho da base de consumidores e pode indicar a necessidade de 
-- ações de marketing para expansão. No caso atual foram inseridas apenas 
-- 10 linhas por tabela então temos 10 clientes.

SELECT COUNT(*) AS Total_Clientes FROM Cliente;

-- ----========---- Quantidade de produtos fornecidos por cada fornecedor ----========----
-- Ajuda a identificar quais fornecedores são mais relevantes para a loja, 
-- e facilita a diversificação de produtos.

SELECT Fornecedor.ID_Fornecedor, Fornecedor.Nome_Fornecedor, COUNT(*) AS Total_Produtos
FROM Produto
JOIN Fornecedor ON Produto.ID_Fornecedor = Fornecedor.ID_Fornecedor
GROUP BY Fornecedor.ID_Fornecedor, Fornecedor.Nome_Fornecedor;

-- ----========---- Quantidade de funcionários por departamento ----========----
-- Por meio dessa consulta temos acesso ao nome do departamento e a quantidade de
-- funcionários em cada um deles. Em uma situação de uma empresa com dezenas ou centenas
-- de funcionários e departamentos essa é uma informação muito relevante para controle.

SELECT Departamento.ID_Departamento, Departamento.Nome_Departamento, COUNT(*) AS Total_Funcionarios
FROM Vendedor
JOIN Departamento ON Vendedor.ID_Departamento = Departamento.ID_Departamento
GROUP BY Departamento.ID_Departamento, Departamento.Nome_Departamento;

-- ----========---- Média salarial por cargo ----========----
-- Ajuda a entender a estrutura salarial e verificar se há igualdade 
-- entre os cargos ou necessidade de ajustes nos salários.

SELECT Cargo, FORMAT(AVG(Salario), 2) AS Media_Salarial
FROM Vendedor
GROUP BY Cargo;

-- ----========---- Média de preço por categoria ----========----
-- Permite analisar quais categorias possuem produtos mais caros ou baratos,
-- auxiliando na precificação e estratégias promocionais.

SELECT Categoria, FORMAT(AVG(Preco), 2) AS Preco_Medio
FROM Produto
GROUP BY Categoria;

-- ----========---- Quantidade total de produtos em estoque ----========----
-- Dá uma visão geral da quantidade de produtos disponíveis, 
-- evitando problemas de excesso ou falta de estoque.

SELECT SUM(Quantidade_Disponivel) AS Total_Produtos_Estoque
FROM Estoque;

-- ----========---- Total de vendas por status do pedido ----========----
-- Seleciona os pedidos seprando por Status. É importante para ter controle
-- de quais pedidos já foram entregues, quais ainda precisam ser enviados,
-- os pedidos que foram cancelados e os que já foram entregues ou enviados.

SELECT Status_Pedido, COUNT(*) AS Total_Pedidos, SUM(Total) AS Valor_Total_Vendas
FROM Pedido
GROUP BY Status_Pedido;

-- ----========---- Quantidade total vendida de cada produto ----========----
-- Permite identificar os produtos mais vendidos, facilitando o planejamento de reposição e promoções.

SELECT ID_Produto, SUM(Quantidade) AS Quantidade_Total_Vendida
FROM Item_Pedido
GROUP BY ID_Produto;

-- ----========---- Total de valores pagos por método de pagamento ----========----
-- Ajuda a analisar quais métodos de pagamento são mais usados pelos clientes, 
-- orientando estratégias como descontos em determinadas formas de pagamento, calculos de taxas, juros etc.

SELECT Tipo_Pagamento, SUM(Valor) AS Valor_Total
FROM Pagamento
GROUP BY Tipo_Pagamento;

-- ----========---- Listar os pedidos com informações do cliente e do vendedor ----========----
-- Mostra quem realizou e quem atendeu cada pedido, facilitando a análise de 
-- desempenho dos vendedores, comportamento dos clientes, status dos pedidos, valores gastos etc.

SELECT Pedido.ID_Pedido, Cliente.Nome AS Nome_Cliente, Vendedor.Nome_Funcionario AS Nome_Vendedor, Pedido.Total, Pedido.Status_Pedido
FROM Pedido
JOIN Cliente ON Pedido.ID_Cliente = Cliente.ID_Cliente
JOIN Vendedor ON Pedido.ID_Vendedor = Vendedor.ID_Vendedor;

-- ----========---- Exibir os produtos em estoque e seus fornecedores ----========----
-- Permite verificar a disponibilidade de produtos no estoque e quais fornecedores são responsáveis por eles, 
-- ajudando no planejamento de reposições.

SELECT PR.Nome_Produto, E.Quantidade_Disponivel, F.Nome_Fornecedor
FROM Estoque E
JOIN Produto PR ON E.ID_Produto = PR.ID_Produto
JOIN Fornecedor F ON PR.ID_Fornecedor = F.ID_Fornecedor;