-- Criando o banco de dados
CREATE DATABASE Hotel;
USE Hotel;

-- Criando a tabela Cliente
CREATE TABLE Cliente (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    CPF CHAR(11) UNIQUE,
    Passaporte VARCHAR(20) UNIQUE
);

-- Criando a tabela ClienteBrasileiro
CREATE TABLE ClienteBrasileiro (
    ClienteId INT PRIMARY KEY,
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id)
);

-- Criando a tabela ClienteEstrangeiro
CREATE TABLE ClienteEstrangeiro (
    ClienteId INT PRIMARY KEY,
    Nacionalidade VARCHAR(50),
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id)
);

-- Criando a tabela Telefone
CREATE TABLE Telefone (
    ClienteId INT,
    Numero VARCHAR(15),
    PRIMARY KEY (ClienteId, Numero),
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id)
);

-- Criando a tabela Quarto
CREATE TABLE Quarto (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Numero INT UNIQUE,
    Tipo VARCHAR(50)
);

-- Criando a tabela Reserva
CREATE TABLE Reserva (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    ClienteId INT,
    QuartoId INT,
    CheckIn DATETIME,
    CheckOut DATETIME,
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id),
    FOREIGN KEY (QuartoId) REFERENCES Quarto(Id)
);

-- Criando a tabela Gerente
CREATE TABLE Gerente (
    Matricula INT PRIMARY KEY,
    Nome VARCHAR(100)
);

-- Criando a tabela Aprovação
CREATE TABLE Aprovacao (
    ReservaId INT PRIMARY KEY,
    GerenteMatricula INT,
    FOREIGN KEY (ReservaId) REFERENCES Reserva(Id),
    FOREIGN KEY (GerenteMatricula) REFERENCES Gerente(Matricula)
);

-- Criando a tabela Ocupação
CREATE TABLE Ocupacao (
    ClienteId INT,
    QuartoId INT,
    Entrada DATETIME,
    Saida DATETIME,
    PRIMARY KEY (ClienteId, QuartoId, Entrada),
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id),
    FOREIGN KEY (QuartoId) REFERENCES Quarto(Id)
);

-- Criando a tabela Restaurante
CREATE TABLE Restaurante (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100)
);

-- Criando a tabela OcupacaoRestaurante
CREATE TABLE OcupacaoRestaurante (
    ClienteId INT,
    RestauranteId INT,
    DataVisita DATETIME,
    PRIMARY KEY (ClienteId, RestauranteId, DataVisita),
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id),
    FOREIGN KEY (RestauranteId) REFERENCES Restaurante(Id)
);

-- Criando a tabela Frigobar
CREATE TABLE Frigobar (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Conteudo VARCHAR(255)
);

-- Criando a tabela OcupacaoFrigobar
CREATE TABLE OcupacaoFrigobar (
    ClienteId INT,
    FrigobarId INT,
    DataConsumo DATETIME,
    PRIMARY KEY (ClienteId, FrigobarId, DataConsumo),
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id),
    FOREIGN KEY (FrigobarId) REFERENCES Frigobar(Id)
);

-- Criando a tabela Massagem
CREATE TABLE Massagem (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Tipo VARCHAR(100)
);

-- Criando a tabela OcupacaoMassagem
CREATE TABLE OcupacaoMassagem (
    ClienteId INT,
    MassagemId INT,
    DataSessao DATETIME,
    PRIMARY KEY (ClienteId, MassagemId, DataSessao),
    FOREIGN KEY (ClienteId) REFERENCES Cliente(Id),
    FOREIGN KEY (MassagemId) REFERENCES Massagem(Id)
);

-- Inserindo dados nas tabelas
INSERT INTO Cliente (Nome, CPF, Passaporte) VALUES 
('João Silva', '12345678901', NULL),
('Maria Oliveira', '98765432100', NULL),
('Carlos Gomez', NULL, 'AB1234567');

INSERT INTO ClienteBrasileiro (ClienteId) VALUES 
(1), (2);

INSERT INTO ClienteEstrangeiro (ClienteId, Nacionalidade) VALUES 
(3, 'Espanhol');

INSERT INTO Telefone (ClienteId, Numero) VALUES 
(1, '11987654321'), (2, '21987654321'), (3, '55987654321');

INSERT INTO Quarto (Numero, Tipo) VALUES 
(101, 'Solteiro'), (102, 'Casal');

INSERT INTO Reserva (ClienteId, QuartoId, CheckIn, CheckOut) VALUES 
(1, 1, '2024-10-15 14:00:00', '2024-10-18 12:00:00'),
(2, 2, '2024-10-16 15:00:00', '2024-10-20 10:00:00');

INSERT INTO Gerente (Matricula, Nome) VALUES 
(1001, 'Roberto Mendes'), (1002, 'Ana Paula');

INSERT INTO Aprovacao (ReservaId, GerenteMatricula) VALUES 
(1, 1001), (2, 1002);

INSERT INTO Ocupacao (ClienteId, QuartoId, Entrada, Saida) VALUES 
(1, 1, '2024-10-15 16:00:00', '2024-10-18 10:00:00'),
(2, 2, '2024-10-16 16:00:00', '2024-10-20 10:00:00');

INSERT INTO Restaurante (Nome) VALUES 
('Gourmet Hotel'), ('Buffet Luxo');

INSERT INTO OcupacaoRestaurante (ClienteId, RestauranteId, DataVisita) VALUES 
(1, 1, '2024-10-16 20:00:00'), (2, 2, '2024-10-17 19:30:00');

INSERT INTO Frigobar (Conteudo) VALUES 
('Água, Refrigerante, Chocolate'), ('Suco, Cerveja, Snacks');

INSERT INTO OcupacaoFrigobar (ClienteId, FrigobarId, DataConsumo) VALUES 
(1, 1, '2024-10-16 22:00:00'), (2, 2, '2024-10-17 23:00:00');

INSERT INTO Massagem (Tipo) VALUES 
('Relaxante'), ('Terapêutica');

INSERT INTO OcupacaoMassagem (ClienteId, MassagemId, DataSessao) VALUES 
(1, 1, '2024-10-17 18:00:00'), (2, 2, '2024-10-18 17:00:00');
