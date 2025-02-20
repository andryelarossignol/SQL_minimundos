CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    telefone TEXT
);

CREATE TABLE colecoes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE,
    descricao TEXT
);

CREATE TABLE livros (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    genero TEXT,
    editora TEXT,
    num_paginas INTEGER,
    valor_diario_multa REAL NOT NULL,
    colecao_id INTEGER,
    FOREIGN KEY (colecao_id) REFERENCES colecoes(id) ON DELETE SET NULL
);

CREATE TABLE emprestimos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER NOT NULL,
    livro_id INTEGER NOT NULL,
    data_emprestimo TEXT NOT NULL,
    data_devolucao TEXT,
    dias_atraso INTEGER,
    multa_total REAL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (livro_id) REFERENCES livros(id) ON DELETE CASCADE
);   
    
INSERT INTO usuarios (nome, email, telefone) VALUES
('Raíssa Donato', 'raissa@gmail.com', '85986021679'),
('Andryela Rossignol', 'andryela@gmail.com', '85978459800');

INSERT INTO colecoes (nome, descricao) VALUES
('Fundamentos de Banco de Dados', 'Livros voltados à disciplina de Banco de Dados')

INSERT INTO livros (titulo, genero, editora, num_paginas, valor_diario_multa, colecao_id) VALUES
('Fundamentos de Banco de Dados', 'Didático', 'Editora UNICAMP', 37, 2.50, 1)

INSERT INTO emprestimos (usuario_id, livro_id, data_emprestimo) VALUES
(1, 1, '2025-02-11');

UPDATE emprestimos 
SET data_devolucao = '2025-02-20' 
WHERE id = 1;

UPDATE emprestimos 
SET
	dias_atraso = 
      CASE 
          WHEN data_devolucao IS NOT NULL AND data_devolucao > data_emprestimo 
          THEN CAST(julianday(data_devolucao) - julianday(data_emprestimo) AS INTEGER)
          ELSE 0
      END,
   	multa_total = 
        CASE 
            WHEN data_devolucao IS NOT NULL AND data_devolucao > data_emprestimo 
            THEN (CAST(julianday(data_devolucao) - julianday(data_emprestimo) AS INTEGER) * 
                  (SELECT valor_diario_multa FROM livros WHERE livros.id = emprestimos.livro_id))
            ELSE 0
        END;

SELECT * FROM usuarios
SELECT * FROM colecoes
SELECT * FROM livros
SELECT * FROM emprestimos
