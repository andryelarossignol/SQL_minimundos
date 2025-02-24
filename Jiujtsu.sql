CREATE TABLE IF NOT EXISTS Professores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    salario DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Categorias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Faixas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_faixa VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Atletas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    rua VARCHAR(100),
    numero VARCHAR(10),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    telefone VARCHAR(20),
    peso DECIMAL(5,2),
    id_categoria INTEGER,
    id_faixa INTEGER,
    id_professor INTEGER,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id) ON DELETE SET NULL,
    FOREIGN KEY (id_faixa) REFERENCES Faixas(id) ON DELETE SET NULL,
    FOREIGN KEY (id_professor) REFERENCES Professores(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Progressoes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_atleta INTEGER NOT NULL,
    data_graduacao DATE NOT NULL,
    nova_faixa TEXT NOT NULL,
    observacao TEXT,
    FOREIGN KEY (id_atleta) REFERENCES Atletas(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Competicoes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    data TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Participacoes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_atleta INTEGER NOT NULL, 
    id_competicao INTEGER NOT NULL,
    id_categoria INTEGER,
    resultado TEXT,
    matricula TEXT,
    FOREIGN KEY (id_atleta) REFERENCES Atletas(id) ON DELETE CASCADE,
    FOREIGN KEY (id_competicao) REFERENCES Competicoes(id) ON DELETE CASCADE,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id) ON DELETE SET NULL
);



INSERT INTO Professores (cpf, nome, telefone, salario) VALUES
('111.222.333-44', 'Carlos Silva', '11999999999', 3500.00),
('555.666.777-88', 'Ana Souza', '11988888888', 4200.00);

INSERT INTO Categorias (nome_categoria) VALUES
('Leve'),
('Médio'),
('Pesado');

INSERT INTO Faixas (nome_faixa) VALUES
('Branca'),
('Azul'),
('Roxa'),
('Marrom'),
('Preta');

INSERT INTO Atletas (cpf, nome, data_nascimento, rua, numero, bairro, cidade, telefone, peso, id_categoria, id_faixa, id_professor) VALUES
('123.456.789-00', 'Pedro da Silva', '2000-04-15', 'Rua A', '100', 'Centro', 'São Paulo', '11977777777', 75.5, 2, 1, 1),
('987.654.321-00', 'Joana Oliveira', '1999-11-05', 'Rua B', '200', 'Bairro B', 'Rio de Janeiro', '11966666666', 65.0, 1, 2, 2);

INSERT INTO Progressoes (id_atleta, data_graduacao, nova_faixa, observacao) VALUES
(1, '2024-05-10', 'Azul', 'Bom desempenho no campeonato'),
(2, '2024-06-15', 'Roxa', 'Evolução técnica demonstrada');

INSERT INTO Competicoes (nome, data) VALUES
('Open Jiu-Jitsu SP', '2024-07-20'),
('Campeonato Estadual RJ', '2024-08-15');

INSERT INTO Participacoes (id_atleta, id_competicao, id_categoria, resultado, matricula) VALUES
(1, 1, 2, '1º Lugar', 'MAT123'),
(2, 2, 1, '2º Lugar', 'MAT456');


SELECT * FROM Professores;
SELECT * FROM Categorias;
SELECT * FROM Faixas;
SELECT * FROM Atletas;
SELECT * FROM Progressoes;
SELECT * FROM Competicoes;
SELECT * FROM Participacoes;
