CREATE DATABASE DesafioModelagem;

CREATE TABLE Cliente (
    ID_Cliente INTEGER PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    CPF CHAR(11) UNIQUE NOT NULL,
    Telefone VARCHAR(20),
    Endereco VARCHAR(255)
);

CREATE TABLE Produto (
    ID_Produto INTEGER PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Categoria VARCHAR(100),
    Preco DECIMAL(10,2) NOT NULL,
    Estoque INTEGER NOT NULL,
    Descricao VARCHAR(255)
);

CREATE TABLE Funcionario (
    ID_Funcionario INTEGER PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Cargo VARCHAR(100) NOT NULL,
    Salario DECIMAL(10,2) NOT NULL,
    Telefone VARCHAR(20),
    Data_Admissao DATE NOT NULL
);

CREATE TABLE Pedido (
    ID_Pedido INTEGER PRIMARY KEY,
    ID_Cliente INTEGER NOT NULL,
    ID_Funcionario INTEGER NOT NULL,
    Data_Pedido DATE NOT NULL,
    Status VARCHAR(50) NOT NULL,
    Total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente (ID_Cliente) ON DELETE RESTRICT,
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario (ID_Funcionario) ON DELETE RESTRICT
);

CREATE TABLE Item_Pedido (
    ID_Pedido INTEGER NOT NULL,
    ID_Produto INTEGER NOT NULL,
    Quantidade INTEGER NOT NULL,
    Preco_Unitario DECIMAL(10,2) NOT NULL,
    Subtotal DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (ID_Pedido, ID_Produto),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido (ID_Pedido) ON DELETE CASCADE,
    FOREIGN KEY (ID_Produto) REFERENCES Produto (ID_Produto) ON DELETE RESTRICT
);

CREATE TABLE Pagamento (
    ID_Pagamento INTEGER PRIMARY KEY,
    ID_Pedido INTEGER NOT NULL,
    Tipo_Pagamento VARCHAR(50) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    Data_Pagamento DATE NOT NULL,
    Valor DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido (ID_Pedido) ON DELETE CASCADE
);

CREATE TABLE Fornecedor (
    ID_Fornecedor INTEGER PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    CNPJ CHAR(14) UNIQUE NOT NULL,
    Contato VARCHAR(100),
    Endereco VARCHAR(255)
);

CREATE TABLE Fornece (
    ID_Fornecedor INTEGER NOT NULL,
    ID_Produto INTEGER NOT NULL,
    Preco_Compra DECIMAL(10,2) NOT NULL,
    Quantidade_Disponivel INTEGER NOT NULL,
    PRIMARY KEY (ID_Fornecedor, ID_Produto),
    FOREIGN KEY (ID_Fornecedor) REFERENCES Fornecedor (ID_Fornecedor) ON DELETE CASCADE,
    FOREIGN KEY (ID_Produto) REFERENCES Produto (ID_Produto) ON DELETE CASCADE
);

SHOW TABLES;

SHOW COLUMNS FROM Cliente;

SELECT * FROM Cliente;