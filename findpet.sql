CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    telefone TEXT
);

CREATE TABLE animais (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    especie TEXT,
    raca TEXT,
    cor TEXT,
    sexo TEXT,
    foto TEXT,
    dono_id INTEGER,
    FOREIGN KEY (dono_id) REFERENCES usuarios(id)
);

CREATE TABLE anuncios (
    id INTEGER PRIMARY KEY,
    tipo TEXT CHECK(tipo IN ('perdido', 'encontrado')),
    data DATE,
    local TEXT,
    recompensa DECIMAL(10,2),
    status TEXT DEFAULT 'ativo',
    animal_id INTEGER,
    FOREIGN KEY (animal_id) REFERENCES animais(id)
);
-- Usuários
INSERT INTO usuarios (id, nome, email, telefone) VALUES
(1, 'Ana Costa', 'ana@email.com', '11999999999'),
(2, 'Carlos Silva', 'carlos@email.com', '11988888888');

-- Animais
INSERT INTO animais (id, nome, especie, raca, cor, sexo, foto, dono_id) VALUES
(1, 'Bolt', 'Cachorro', 'Vira-lata', 'Preto', 'Macho', 'foto1.jpg', 1),
(2, 'Luna', 'Gato', 'Persa', 'Branco', 'Fêmea', 'foto2.jpg', 2);

-- Anúncios
INSERT INTO anuncios (id, tipo, data, local, recompensa, status, animal_id) VALUES
(1, 'perdido', '2025-04-20', 'Rua das Flores, 100', 100.00, 'ativo', 1),
(2, 'encontrado', '2025-04-21', 'Praça Central', NULL, 'ativo', 2);
