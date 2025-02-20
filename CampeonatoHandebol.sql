CREATE TABLE jogadores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    data_nascimento TEXT NOT NULL,
    genero TEXT NOT NULL,
    altura REAL NOT NULL,
    time_id INTEGER,
    FOREIGN KEY (time_id) REFERENCES times(id) ON DELETE SET NULL
);

CREATE TABLE estadios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE,
    endereco TEXT NOT NULL
);

CREATE TABLE times (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE,
    estadio_id INTEGER,
    capitao_id INTEGER UNIQUE,
    FOREIGN KEY (estadio_id) REFERENCES estadios(id) ON DELETE SET NULL,
    FOREIGN KEY (capitao_id) REFERENCES jogadores(id) ON DELETE SET NULL
);

CREATE TABLE partidas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    data TEXT NOT NULL,
    horario TEXT NOT NULL,
    mandante_id INTEGER NOT NULL,
    visitante_id INTEGER NOT NULL,
    estadio_id INTEGER NOT NULL,
    gols_mandante INTEGER,
    gols_visitante INTEGER,
    FOREIGN KEY (mandante_id) REFERENCES times(id) ON DELETE CASCADE,
    FOREIGN KEY (visitante_id) REFERENCES times(id) ON DELETE CASCADE,
    FOREIGN KEY (estadio_id) REFERENCES estadios(id) ON DELETE CASCADE
);

CREATE TABLE campeonato (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    time_id INTEGER NOT NULL,
    saldo_vitorias INTEGER NOT NULL DEFAULT 0,
    saldo_gols INTEGER NOT NULL DEFAULT 0,
    posicao INTEGER NOT NULL,
    FOREIGN KEY (time_id) REFERENCES times(id) ON DELETE CASCADE
);

INSERT INTO estadios (nome, endereco) VALUES
('Arena Central', 'Rua Principal, 123'),
('Ginásio Norte', 'Avenida Leste, 456');

INSERT INTO times (nome, estadio_id) VALUES
('Time A', 1),
('Time B', 2);

INSERT INTO jogadores (nome, data_nascimento, genero, altura, time_id) VALUES
('João Silva', '1995-05-12', 'M', 1.80, 1),
('Carlos Santos', '1997-08-20', 'M', 1.85, 1),
('Maria Oliveira', '1996-02-10', 'F', 1.70, 2);

UPDATE times SET capitao_id = (SELECT id FROM jogadores WHERE nome = 'João Silva') WHERE nome = 'Time A';
UPDATE times SET capitao_id = (SELECT id FROM jogadores WHERE nome = 'Maria Oliveira') WHERE nome = 'Time B';

INSERT INTO partidas (data, horario, mandante_id, visitante_id, estadio_id, gols_mandante, gols_visitante) VALUES
('2024-01-15', '16:00', 1, 2, 1, 3, 2),
('2024-01-20', '18:00', 2, 1, 2, NULL, NULL);

INSERT INTO campeonato (time_id, saldo_vitorias, saldo_gols, posicao) VALUES
(1, 1, 1, 1),
(2, 0, -1, 25);

SELECT * FROM jogadores;
SELECT * FROM times;
SELECT * FROM estadios;
SELECT * FROM partidas;
SELECT * FROM campeonato;
