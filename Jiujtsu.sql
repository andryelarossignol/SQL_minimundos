CREATE TABLE atletas (
    cpf TEXT PRIMARY KEY,
    nome TEXT NOT NULL,
    data_nascimento TEXT NOT NULL,
    endereco TEXT,
    telefone TEXT,
    peso REAL,
    categoria TEXT,
    faixa_atual TEXT,
    cpf_professor TEXT,
    FOREIGN KEY (cpf_professor) REFERENCES professores(cpf) ON DELETE SET NULL
);

CREATE TABLE progressos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cpf_atleta TEXT NOT NULL,
    data_graduacao TEXT NOT NULL,
    nova_faixa TEXT NOT NULL,
    observacoes TEXT,
    FOREIGN KEY (cpf_atleta) REFERENCES atletas(cpf) ON DELETE CASCADE
);

CREATE TABLE competicoes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cpf_atleta TEXT NOT NULL,
    nome TEXT NOT NULL,
    data TEXT NOT NULL,
    categoria TEXT,
    resultado TEXT,
    matricula TEXT,
    FOREIGN KEY (cpf_atleta) REFERENCES atletas(cpf) ON DELETE CASCADE
);
CREATE TABLE ranking (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cpf_atleta TEXT NOT NULL,
    graduacao TEXT NOT NULL,
    total_medalhas INTEGER,
    participacoes INTEGER,
    FOREIGN KEY (cpf_atleta) REFERENCES atletas(cpf) ON DELETE CASCADE
);

CREATE TABLE professores (
    cpf TEXT PRIMARY KEY,
    nome TEXT NOT NULL,
    telefone TEXT,
    salario REAL
);

INSERT INTO atletas (cpf, nome, data_nascimento, endereco, telefone, peso, categoria, faixa_atual, cpf_professor) VALUES
('123.456.789-00', 'João Silva', '1995-03-12', 'Rua A, 123, SP', '(85) 99999-1111', 75, 'Médio', 'Branca', '456.789.123-00'),
('987.654.321-00', 'Ana Oliveira', '2000-07-24', 'Rua B, 456, SP', '(85) 88888-2222', 65, 'Leve', 'Azul', '321.654.987-00');

INSERT INTO progressos (cpf_atleta, data_graduacao, nova_faixa, observacoes) VALUES
('123.456.789-00', '2024-08-15', 'Faixa Azul', 'Excelente progresso técnico'),
('987.654.321-00', '2024-11-01', 'Faixa Roxa', 'Avanço rapidamente');

INSERT INTO competicoes (cpf_atleta, nome, data, categoria, resultado, matricula) VALUES
('123.456.789-00', 'Estadual SP', '2024-08-10', 'Médio', 'Ouro', '123'),
('987.654.321-00', 'Nacional RJ', '2024-09-25', 'Leve', 'Prata', '456'),
('987.654.321-00', 'Nacional RJ', '2024-10-20', 'Leve', 'Bronze', '789');

INSERT INTO ranking (cpf_atleta, graduacao, total_medalhas, participacoes) VALUES
('123.456.789-00', 'Ouro', 2, 2),
('987.654.321-00', 'Roxa', 1, 1);

INSERT INTO professores (cpf, nome, telefone, salario) VALUES
('456.789.123-00', 'Carlos Souza', '(85) 77777-3333', 6000.00);

SELECT * FROM atletas;
SELECT * FROM progressos;
SELECT * FROM competicoes;
SELECT * FROM ranking;
SELECT * FROM professores;