-- Tabela de Usuários
CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    data_nascimento TEXT,
    website TEXT,
    genero TEXT,
    telefone TEXT,
    foto_perfil TEXT
);

-- Tabela de Postagens
CREATE TABLE postagens (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    texto TEXT NOT NULL,
    data_postagem TEXT NOT NULL,
    usuario_id INTEGER NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- Tabela de Fotos
CREATE TABLE fotos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    url TEXT NOT NULL,
    titulo TEXT NOT NULL,
    postagem_id INTEGER NOT NULL,
    FOREIGN KEY (postagem_id) REFERENCES postagens(id) ON DELETE CASCADE
);

-- Tabela de Álbuns
CREATE TABLE albuns (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER NOT NULL,
    titulo TEXT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- Tabela de Relacionamento entre Fotos e Álbuns
CREATE TABLE fotos_albuns (
    album_id INTEGER NOT NULL,
    foto_id INTEGER NOT NULL,
    PRIMARY KEY (album_id, foto_id),
    FOREIGN KEY (album_id) REFERENCES albuns(id) ON DELETE CASCADE,
    FOREIGN KEY (foto_id) REFERENCES fotos(id) ON DELETE CASCADE
);

-- Tabela de Seguidores
CREATE TABLE seguir (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_seguidor INTEGER NOT NULL,
    id_seguido INTEGER NOT NULL,
    FOREIGN KEY (id_seguidor) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (id_seguido) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- Inserindo usuários
INSERT INTO usuarios (nome, email, data_nascimento, website, genero, telefone, foto_perfil) VALUES
('Ana Souza', 'ana@email.com', '1992-07-15', 'https://ana.com', 'F', '(11) 99999-1234', 'ana.jpg'),
('Bruno Lima', 'bruno@email.com', '1990-05-22', NULL, 'M', '(21) 98888-5678', 'bruno.jpg'),
('Carla Mendes', 'carla@email.com', '1995-11-10', 'https://carla.com', 'F', '(31) 97777-4321', 'carla.jpg');

-- Inserindo postagens
INSERT INTO postagens (texto, data_postagem, usuario_id) VALUES
('Primeira postagem no meu perfil!', '2024-02-01', 1),
('Hoje foi um dia incrível!', '2024-02-02', 2),
('Foto nova do meu último passeio.', '2024-02-03', 3);

-- Inserindo fotos
INSERT INTO fotos (url, titulo, postagem_id) VALUES
('https://meusite.com/foto1.jpg', 'Foto do pôr do sol', 3),
('https://meusite.com/foto2.jpg', 'Selfie na praia', 1),
('https://meusite.com/foto3.jpg', 'Passeio na montanha', 2);

-- Inserindo álbuns
INSERT INTO albuns (usuario_id, titulo) VALUES
(1, 'Viagens 2024'),
(2, 'Momentos Especiais'),
(3, 'Selfies');

-- Relacionando fotos a álbuns
INSERT INTO fotos_albuns (album_id, foto_id) VALUES
(1, 1), -- Pôr do sol na viagem
(2, 2), -- Selfie na praia em momentos especiais
(3, 3); -- Passeio na montanha no álbum de selfies

-- Inserindo seguidores
INSERT INTO seguir (id_seguidor, id_seguido) VALUES
(1, 2), -- Ana segue Bruno
(2, 3), -- Bruno segue Carla
(3, 1); -- Carla segue Ana

-- Consultas para visualizar os dados inseridos
SELECT * FROM usuarios;
SELECT * FROM postagens;
SELECT * FROM fotos;
SELECT * FROM albuns;
SELECT * FROM seguir;

