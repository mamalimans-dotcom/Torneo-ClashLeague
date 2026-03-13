-- ==========================================================
-- INSERTS DE USUARIOS (8 columnas originales + clan)
-- ==========================================================
INSERT INTO users (email, password, rol, alias, nombre, nivel, copas, clan) VALUES
('jugador1@email.com', 'password123', 'usuario', 'DragonLegend', 'Carlos López', 14, 6500, 'Los Vikingos'),
('jugador2@email.com', 'password123', 'usuario', 'MegaKnightPro', 'Ana García', 13, 5800, 'Real Madrid CR'),
('jugador3@email.com', 'password123', 'admin', 'KingCrimson', 'Miguel Rodríguez', 15, 7200, 'Clan de Elite'),
('jugador4@email.com', 'password123', 'usuario', 'HogRider33', 'Laura Martínez', 12, 4900, 'Sin Clan'),
('jugador5@email.com', 'password123', 'usuario', 'WizardMaster', 'Pedro Sánchez', 11, 3800, 'Magos Oscuros'),
('jugador6@email.com', 'password123', 'usuario', 'BalloonKiller', 'Sofía Pérez', 13, 5400, 'Cazadores'),
('jugador7@email.com', 'password123', 'usuario', 'GolemCrusher', 'Javier Gómez', 14, 6100, 'Rocas Vivas'),
('jugador8@email.com', 'password123', 'moderador', 'ValkyrieQueen', 'Elena Díaz', 13, 5600, 'Guerreras'),
('jugador9@email.com', 'password123', 'usuario', 'MiniPekka23', 'David Torres', 10, 3200, 'Pekka Boys'),
('jugador10@email.com', 'password123', 'usuario', 'SparkyPower', 'Marta Ruiz', 12, 4500, 'Chispitas Team');

-- ==========================================================
-- INSERTS DE TORNEOS
-- ==========================================================
INSERT INTO torneos (nombre, numeroCopas) VALUES
('Batalla de Vikingos', 3000),
('Gladiadores', 2000),
('Mineros', 4500),
('Ladrones de Copas', 1500);

-- ==========================================================
-- INSERTS DE RONDAS (Para el Torneo 1: Batalla de Vikingos)
-- ==========================================================
INSERT INTO rondas_clasificacion (torneo_id, numero_ronda, nombre) VALUES
(1, 1, 'RONDA 1'),
(1, 2, 'RONDA 2'),
(1, 3, 'FINAL'),
(1, 4, 'GANADOR');

-- Inserción de rondas para el Torneo 2 (Gladiadores)
INSERT INTO rondas_clasificacion (torneo_id, numero_ronda, nombre) VALUES
(2, 1, 'RONDA 1'),
(2, 2, 'RONDA 2'),
(2, 3, 'FINAL'),
(2, 4, 'GANADOR');

-- ==========================================================
-- INSERTS DE ENFRENTAMIENTOS (Torneo 1 - Batalla de Vikingos)
-- ==========================================================
-- Suponiendo que las rondas del Torneo 1 tienen los IDs 1, 2, 3 y 4

-- RONDA 1 (id=1): 4 enfrentamientos iniciales
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(1, 1, 2, 2),  -- DragonLegend vs MegaKnightPro -> Gana MegaKnightPro
(1, 3, 4, 3),  -- KingCrimson vs HogRider33 -> Gana KingCrimson
(1, 5, 6, 6),  -- WizardMaster vs BalloonKiller -> Gana BalloonKiller
(1, 7, 8, 7);  -- GolemCrusher vs ValkyrieQueen -> Gana GolemCrusher

-- RONDA 2 (id=2): Semifinales con los ganadores de la ronda 1
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(2, 2, 3, 3),  -- MegaKnightPro vs KingCrimson -> Gana KingCrimson
(2, 6, 7, 7);  -- BalloonKiller vs GolemCrusher -> Gana GolemCrusher

-- FINAL (id=3): Final con los ganadores de la ronda 2
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(3, 3, 7, 3);  -- KingCrimson vs GolemCrusher -> Gana KingCrimson (CAMPEÓN)

-- GANADOR (id=4): Registro del campeón solitario
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(4, 3, NULL, 3);

-- ==========================================================
-- INSERTS DE ENFRENTAMIENTOS (Torneo 2 - Gladiadores)
-- ==========================================================
-- Suponiendo que las rondas del Torneo 2 tienen los IDs 5, 6, 7 y 8

-- RONDA 1 (id=5)
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(5, 4, 5, 4),
(5, 6, 7, 7),
(5, 8, 9, 8),
(5, 10, 1, 1);

