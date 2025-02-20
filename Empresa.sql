CREATE TABLE departamentos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE,
    numero INTEGER NOT NULL UNIQUE,
    gerente TEXT NOT NULL,
    data_entrada TEXT NOT NULL
);

CREATE TABLE localizacao_departamentos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE,
    rua TEXT NOT NULL,
    bairro TEXT NOT NULL,
    cidade TEXT NOT NULL
);

CREATE TABLE projetos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE,
    codigo TEXT NOT NULL UNIQUE,
    rua TEXT NOT NULL,
    bairro TEXT NOT NULL,
    cidade TEXT NOT NULL,
    departamento_id INTEGER,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id) ON DELETE SET NULL
);

CREATE TABLE empregados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    salario REAL NOT NULL,
    escolaridade TEXT NOT NULL,
    cargo TEXT NOT NULL,
    departamento_id INTEGER,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id) ON DELETE SET NULL
);

CREATE TABLE participacao_projetos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    empregado_id INTEGER NOT NULL,
    projeto_id INTEGER NOT NULL,
    horas_trabalhadas INTEGER NOT NULL,
    FOREIGN KEY (empregado_id) REFERENCES empregados(id) ON DELETE CASCADE,
    FOREIGN KEY (projeto_id) REFERENCES projetos(id) ON DELETE CASCADE
);

CREATE TABLE dependentes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    sexo TEXT NOT NULL CHECK(sexo IN ('M', 'F')),
    data_nascimento TEXT NOT NULL,
    empregado_id INTEGER NOT NULL,
    FOREIGN KEY (empregado_id) REFERENCES empregados(id) ON DELETE CASCADE
);

CREATE TABLE supervisores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    departamento_id INTEGER NOT NULL,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id) ON DELETE CASCADE
);

-- Inserindo dados

INSERT INTO departamentos (nome, numero, gerente, data_entrada) VALUES
('Marketing', 101, 'Ana Silva', '2022-01-10'),
('TI', 102, 'João Souza', '2021-07-15');

INSERT INTO localizacao_departamentos (nome, rua, bairro, cidade) VALUES
('Marketing', 'Rua A, 123', 'Centro', 'Fortaleza'),
('TI', 'Avenida B, 456', 'Aldeota', 'Fortaleza');

INSERT INTO projetos (nome, codigo, rua, bairro, cidade, departamento_id) VALUES
('Site Corporativo', 'P001', 'Rua A, 123', 'Centro', 'Fortaleza', 1),
('Sistema ERP', 'P002', 'Avenida B, 456', 'Aldeota', 'Fortaleza', 2);

INSERT INTO empregados (nome, salario, escolaridade, cargo, departamento_id) VALUES
('Ana Silva', 5000.00, 'Pós-Graduação', 'Gerente', 1),
('João Souza', 4500.00, 'Graduação', 'Gerente', 2);

INSERT INTO participacao_projetos (empregado_id, projeto_id, horas_trabalhadas) VALUES
(1, 1, 30),
(2, 2, 25);

INSERT INTO dependentes (nome, sexo, data_nascimento, empregado_id) VALUES
('Maria Silva', 'F', '2015-03-12', 1),
('Pedro Souza', 'M', '2018-06-25', 2);

INSERT INTO supervisores (nome, departamento_id) VALUES
('Ana Silva', 1),
('João Souza', 2);

-- Consultas para verificar os dados inseridos

SELECT * FROM departamentos;
SELECT * FROM localizacao_departamentos;
SELECT * FROM projetos;
SELECT * FROM empregados;
SELECT * FROM participacao_projetos;
SELECT * FROM dependentes;
SELECT * FROM supervisores;