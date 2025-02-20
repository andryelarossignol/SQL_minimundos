CREATE TABLE cursos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE,
    carga_horaria INTEGER NOT NULL,
    valor REAL NOT NULL
);

CREATE TABLE turmas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    curso_id INTEGER NOT NULL,
    data_inicio TEXT NOT NULL,
    numero_vagas INTEGER NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON DELETE CASCADE
);

CREATE TABLE alunos (
    cpf TEXT PRIMARY KEY,
    nome TEXT NOT NULL,
    data_nascimento TEXT NOT NULL
);

CREATE TABLE matriculas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    aluno_cpf TEXT NOT NULL,
    turma_id INTEGER NOT NULL,
    data_matricula TEXT NOT NULL,
    numero_prestacoes INTEGER NOT NULL,
    FOREIGN KEY (aluno_cpf) REFERENCES alunos(cpf) ON DELETE CASCADE,
    FOREIGN KEY (turma_id) REFERENCES turmas(id) ON DELETE CASCADE
);

CREATE TABLE avaliacoes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    turma_id INTEGER NOT NULL,
    aluno_cpf TEXT NOT NULL,
    nota REAL NOT NULL,
    data_avaliacao TEXT NOT NULL,
    FOREIGN KEY (turma_id) REFERENCES turmas(id) ON DELETE CASCADE,
    FOREIGN KEY (aluno_cpf) REFERENCES alunos(cpf) ON DELETE CASCADE
);

CREATE TABLE resultados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    aluno_cpf TEXT NOT NULL,
    curso_id INTEGER NOT NULL,
    nota_total REAL NOT NULL,
    status TEXT NOT NULL,
    FOREIGN KEY (aluno_cpf) REFERENCES alunos(cpf) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON DELETE CASCADE
);

INSERT INTO cursos (nome, carga_horaria, valor) VALUES
('Engenharia Civil', 3600, 18000.00),
('Administração', 2000, 8000.00);

INSERT INTO turmas (curso_id, data_inicio, numero_vagas) VALUES
(1, '2024-01-15', 30),
(2, '2024-02-10', 25);

INSERT INTO alunos (cpf, nome, data_nascimento) VALUES
('123.456.789-00', 'Pedro da Silva', '2000-04-15'),
('987.654.321-00', 'Joana Oliveira', '1999-11-05');

INSERT INTO matriculas (aluno_cpf, turma_id, data_matricula, numero_prestacoes) VALUES
('123.456.789-00', 1, '2024-01-10', 12),
('987.654.321-00', 2, '2024-02-05', 6);

INSERT INTO avaliacoes (turma_id, aluno_cpf, nota, data_avaliacao) VALUES
(1, '123.456.789-00', 8.0, '2024-03-15'),
(2, '987.654.321-00', 9.0, '2024-05-07');

INSERT INTO resultados (aluno_cpf, curso_id, nota_total, status) VALUES
('123.456.789-00', 1, 8.0, 'Aprovado'),
('987.654.321-00', 2, 9.0, 'Aprovado');

SELECT * FROM cursos;
SELECT * FROM turmas;
SELECT * FROM alunos;
SELECT * FROM matriculas;
SELECT * FROM avaliacoes;
SELECT * FROM resultados;