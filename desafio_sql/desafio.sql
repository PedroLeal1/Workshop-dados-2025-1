-- Fábrica de Software - Dados - 21/02/2025
-- Pedro Henrique Leal Vieira - P6 - Ciências da Computação 
CREATE SCHEMA DESAFIO;

CREATE TABLE Jogadores(
    id_jogador SERIAL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    idade INT,
    posicao VARCHAR(45),
    nacionalidade VARCHAR(45)
);

CREATE TABLE Estatisticas(
    id_estatistica SERIAL PRIMARY KEY,
    nome VARCHAR(45) REFERENCES Jogadores(nome),
    gols INT,
    assistencias INT,
    partidas_jogadas INT,
    amarelos INT
);

INSERT INTO Jogadores(id_jogador, nome, idade, posicao, nacionalidade)  
VALUES  
(1, 'Raul', 27, 'Goleiro', 'Brasil'),  
(2, 'Léo Linck', 23, 'Goleiro', 'Brasil'),  
(3, 'Vitinho', 25, 'Lateral Direito', 'Brasil'),  
(4, 'Mateo Ponte', 21, 'Lateral Direito', 'Uruguai'),  
(5, 'Alexander Barboza', 29, 'Zagueiro', 'Argentina'),  
(6, 'David Ricardo', 22, 'Zagueiro', 'Brasil'),  
(7, 'Bastos', 33, 'Zagueiro', 'Angola'),   
(9, 'Alex Telles', 32, 'Lateral Esquerdo', 'Brasil'),  
(10, 'Cuiabano', 22, 'Lateral Esquerdo', 'Brasil'),  
(11, 'Danilo', 28, 'Volante', 'Brasil'),  
(12, 'Marlon Freitas', 29, 'Volante', 'Brasil'),  
(13, 'Gregore', 30, 'Volante', 'Brasil'),  
(14, 'Patrick de Paula', 25, 'Meio-campista', 'Brasil'),  
(15, 'Kauan Lindes', 21, 'Meio-campista', 'Brasil'),  
(16, 'Jefferson Savarino', 28, 'Atacante', 'Venezuela'),  
(17, 'Artur', 27, 'Atacante', 'Brasil'),  
(18, 'Igor Jesus', 23, 'Atacante', 'Brasil'),    
(20, 'Jeffinho', 25, 'Atacante', 'Brasil'),    
(22, 'Matheus Martins', 21, 'Atacante', 'Brasil'),  
(23, 'Rwan Cruz', 23, 'Atacante', 'Brasil');

INSERT INTO Estatisticas(nome, gols, assistencias, partidas_jogadas, amarelos) 
VALUES
('Raul', 0, 0, 10, 1),
('Léo Linck', 0, 0, 15, 2),
('Vitinho', 1, 2, 20, 3),
('Mateo Ponte', 0, 1, 18, 1),
('Alexander Barboza', 0, 0, 22, 4),
('David Ricardo', 0, 1, 25, 2),
('Bastos', 0, 0, 30, 5),
('Lucas Halter', 0, 1, 28, 3),
('Alex Telles', 1, 2, 25, 3),
('Cuiabano', 0, 0, 27, 2),
('Danilo', 2, 3, 30, 2),
('Marlon Freitas', 3, 4, 32, 3),
('Gregore', 0, 1, 26, 1),
('Patrick de Paula', 4, 5, 28, 2),
('Kauan Lindes', 0, 2, 22, 1),
('Jefferson Savarino', 5, 7, 23, 2),
('Artur', 6, 4, 24, 2),
('Igor Jesus', 3, 1, 20, 3),
('Carlos Alberto', 7, 3, 25, 3),
('Jeffinho', 6, 4, 22, 2),
('Matheus Nascimento', 8, 9, 21, 2),
('Matheus Martins', 2, 3, 19, 2),
('Rwan Cruz', 1, 1, 20, 1);

SELECT *
FROM Jogadores;

SELECT *
FROM Estatisticas

--Agregação
    
SELECT 
    nome, 
    SUM(gols + assistencias) AS participacoes_em_gols
FROM Estatisticas
GROUP BY nome;

SELECT 
    nome, 
    AVG(amarelos / partidas_jogadas) AS media_amarelos_por_partida
FROM Estatisticas
GROUP BY nome;

SELECT COUNT(id_jogador)
FROM DESAFIO.Jogadores;

--Agrupamento

SELECT 
    nome, 
    SUM(gols + assistencias) AS participacoes_em_gols
FROM Estatisticas
GROUP BY nome;

SELECT 
    nome, 
    gols 
FROM Estatisticas
ORDER BY gols DESC;
