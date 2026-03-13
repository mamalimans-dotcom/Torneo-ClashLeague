DROP DATABASE IF EXISTS crud_clash;
DROP USER IF EXISTS 'proy'@'localhost';

-- Crear usuario y base de datos
CREATE USER 'proy'@'localhost' IDENTIFIED BY 'password';
CREATE DATABASE crud_clash;
GRANT ALL PRIVILEGES ON crud_clash.* TO 'proy'@'localhost';
FLUSH PRIVILEGES;

-- Usar la base de datos
USE crud_clash;

DROP TABLE IF EXISTS enfrentamientos_clasificacion;
DROP TABLE IF EXISTS rondas_clasificacion;
DROP TABLE IF EXISTS torneos;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    rol VARCHAR(50) NOT NULL CHECK (rol IN ('usuario', 'admin', 'moderador')),
    alias VARCHAR(50) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    nivel INT,
    copas INT,
    clan varchar(50),
    img varchar(500)
);


CREATE TABLE torneos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(70) NOT NULL,
    numeroCopas INT NOT NULL,
    arena varchar(50),
    numJugadores int
);

CREATE TABLE usuario_torneo (
    usuario_id INT,
    torneo_id INT,
    PRIMARY KEY (usuario_id, torneo_id),
    FOREIGN KEY (usuario_id) REFERENCES users(id),
    FOREIGN KEY (torneo_id) REFERENCES torneos(id)
);


CREATE TABLE rondas_clasificacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    torneo_id INT NOT NULL,
    numero_ronda INT NOT NULL,
    nombre VARCHAR(50) DEFAULT 'RONDA',
    FOREIGN KEY (torneo_id) REFERENCES torneos(id) ON UPDATE CASCADE ON DELETE CASCADE,
    INDEX idx_torneo_id (torneo_id)
);


CREATE TABLE enfrentamientos_clasificacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ronda_id INT NOT NULL,
    jugador1_id INT ,
    jugador2_id INT ,
    ganador_id INT NULL,
    FOREIGN KEY (ronda_id) REFERENCES rondas_clasificacion(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (jugador1_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (jugador2_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ganador_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    INDEX idx_ronda_id (ronda_id)
);

/***************** Iserccion de Datos **********/
INSERT INTO users (email, password, rol, alias, nombre, nivel, copas, clan, img) VALUES
('jugador1@email.com', 'password123', 'usuario', 'DragonLegend', 'Carlos López', '14', 6500, "Trap", "emblema1"),
('jugador2@email.com', 'password123', 'usuario', 'MegaKnightPro', 'Ana García', '13', 5800, "Kinglegends", "emblema2"),
('jugador3@email.com', 'password123', 'admin', 'KingCrimson', 'Miguel Rodríguez', '15', 7200, "Royal Arena", "emblema3"),
('jugador4@email.com', 'password123', 'usuario', 'HogRider33', 'Laura Martínez', '12', 4900, "Electro Valley", "emblema4"),
('jugador5@email.com', 'password123', 'usuario', 'WizardMaster', 'Pedro Sánchez', '11', 3800, "Trap", "emblema5"),
('jugador6@email.com', 'password123', 'usuario', 'BalloonKiller', 'Sofía Pérez', '13', 5400, "Kinglegends", "emblema6"),
('jugador7@email.com', 'password123', 'usuario', 'GolemCrusher', 'Javier Gómez', '14', 6100, "Royal Arena", "emblema7"),
('jugador8@email.com', 'password123', 'moderador', 'ValkyrieQueen', 'Elena Díaz', '13', 5600, "Electro Valley", "emblema8"),
('jugador9@email.com', 'password123', 'usuario', 'MiniPekka23', 'David Torres', '10', 3200, "Trap", "emblema1"),
('jugador10@email.com', 'password123', 'usuario', 'SparkyPower', 'Marta Ruiz', '12', 4500, "Kinglegends", "emblema2");

 
 insert into torneos (nombre, numeroCopas, arena, numJugadores) values
 ('Batalla de Vikingos', 3000, 'arena5', 4),
 ('Gladiadores', 2000, 'arena7', 4),
 ('Mineros', 4500, 'arena9', 8),
 ('Ladrones de Copas',1500, 'arena7', 4);
 
 INSERT INTO usuario_torneo (usuario_id, torneo_id) VALUES
-- Torneo 1: Relámpago
(1, 1),  -- guerrero1 en Torneo Relámpago
(2, 1),  -- mago_oscuro en Torneo Relámpago
(4, 1),  -- tronco en Torneo Relámpago

-- Torneo 2: Copa de Leyendas
(1, 2),  -- guerrero1 en Copa Leyendas
(3, 2),  -- admin en Copa Leyendas
(5, 2),  -- princesa_arco en Copa Leyendas

-- Torneo 3: Desafío de Clanes
(2, 3),  -- mago_oscuro en Desafío
(4, 3),  -- tronco en Desafío

-- Torneo 4: Épico
(1, 4),  -- guerrero1 en Épico
(3, 4),  -- admin en Épico
(5, 4);  -- princesa_arco en Épico
 
 /***************** Inserción de Datos para Rondas y Enfrentamientos **********/

-- Insertar rondas para cada torneo (4 rondas por torneo)
-- Torneo 1: Batalla de Vikingos
INSERT INTO rondas_clasificacion (torneo_id, numero_ronda, nombre) VALUES
(1, 1, 'RONDA 1'),
(1, 2, 'RONDA 2'),
(1, 3, 'FINAL'),
(1, 4, 'GANADOR');

-- Torneo 2: Gladiadores
INSERT INTO rondas_clasificacion (torneo_id, numero_ronda, nombre) VALUES
(2, 1, 'RONDA 1'),
(2, 2, 'RONDA 2'),
(2, 3, 'FINAL'),
(2, 4, 'GANADOR');

-- Torneo 3: Mineros
INSERT INTO rondas_clasificacion (torneo_id, numero_ronda, nombre) VALUES
(3, 1, 'RONDA 1'),
(3, 2, 'RONDA 2'),
(3, 3, 'FINAL'),
(3, 4, 'GANADOR');

-- Torneo 4: Ladrones de Copas
INSERT INTO rondas_clasificacion (torneo_id, numero_ronda, nombre) VALUES
(4, 1, 'RONDA 1'),
(4, 2, 'RONDA 2'),
(4, 3, 'FINAL'),
(4, 4, 'GANADOR');

/************* ENFRENTAMIENTOS PARA TORNEO 1 - BATALLA DE VIKINGOS *************/
-- RONDA 1 (ronda_id = 1)
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(1, 1, 2, 2),  -- DragonLegend vs MegaKnightPro → Gana MegaKnightPro
(1, 3, 4, 3),  -- KingCrimson vs HogRider33 → Gana KingCrimson
(1, 5, 6, 6),  -- WizardMaster vs BalloonKiller → Gana BalloonKiller
(1, 7, 8, 7);  -- GolemCrusher vs ValkyrieQueen → Gana GolemCrusher

-- RONDA 2 (ronda_id = 2)
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(2, 2, 3, 3),  -- MegaKnightPro vs KingCrimson → Gana KingCrimson
(2, 6, 7, 7);  -- BalloonKiller vs GolemCrusher → Gana GolemCrusher

-- FINAL (ronda_id = 3)
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(3, 3, 7, 3);  -- KingCrimson vs GolemCrusher → Gana KingCrimson

-- GANADOR (ronda_id = 4)
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(4, 3, NULL, 3);  -- KingCrimson es el campeón

/************* ENFRENTAMIENTOS PARA TORNEO 2 - GLADIADORES *************/
-- RONDA 1 (ronda_id = 5)
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(5, 4, 5, 4),  -- HogRider33 vs WizardMaster → Gana HogRider33
(5, 6, 7, 7),  -- BalloonKiller vs GolemCrusher → Gana GolemCrusher
(5, 8, 9, 8),  -- ValkyrieQueen vs MiniPekka23 → Gana ValkyrieQueen
(5, 10, 1, 1); -- SparkyPower vs DragonLegend → Gana DragonLegend

-- RONDA 2 (ronda_id = 6)
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(6, 4, 7, 7),  -- HogRider33 vs GolemCrusher → Gana GolemCrusher
(6, 8, 1, 8);  -- ValkyrieQueen vs DragonLegend → Gana ValkyrieQueen

-- FINAL (ronda_id = 7)
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(7, 7, 8, 7);  -- GolemCrusher vs ValkyrieQueen → Gana GolemCrusher

-- GANADOR (ronda_id = 8)
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(8, 7, NULL, 7);  -- GolemCrusher es el campeón

/************* ENFRENTAMIENTOS PARA TORNEO 3 - MINEROS *************/
-- RONDA 1 (ronda_id = 9)
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(9, 2, 4, 2),  -- MegaKnightPro vs HogRider33 → Gana MegaKnightPro
(9, 6, 8, 8),  -- BalloonKiller vs ValkyrieQueen → Gana ValkyrieQueen
(9, 10, 3, 3), -- SparkyPower vs KingCrimson → Gana KingCrimson
(9, 5, 7, 5);  -- WizardMaster vs GolemCrusher → Gana WizardMaster (SORPRESA!)

-- RONDA 2 (ronda_id = 10)
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(10, 2, 8, 2),  -- MegaKnightPro vs ValkyrieQueen → Gana MegaKnightPro
(10, 3, 5, 3);  -- KingCrimson vs WizardMaster → Gana KingCrimson

-- FINAL (ronda_id = 11)
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(11, 2, 3, 3);  -- MegaKnightPro vs KingCrimson → Gana KingCrimson

-- GANADOR (ronda_id = 12)
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(12, 3, NULL, 3);  -- KingCrimson es el campeón

/************* ENFRENTAMIENTOS PARA TORNEO 4 - LADRONES DE COPAS *************/
-- RONDA 1 (ronda_id = 13)
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(13, 9, 10, 9),  -- MiniPekka23 vs SparkyPower → Gana MiniPekka23
(13, 1, 2, 1),   -- DragonLegend vs MegaKnightPro → Gana DragonLegend
(13, 3, 4, 3),   -- KingCrimson vs HogRider33 → Gana KingCrimson
(13, 5, 6, 6);   -- WizardMaster vs BalloonKiller → Gana BalloonKiller

-- RONDA 2 (ronda_id = 14)
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(14, 9, 1, 1),  -- MiniPekka23 vs DragonLegend → Gana DragonLegend
(14, 3, 6, 3);  -- KingCrimson vs BalloonKiller → Gana KingCrimson

-- FINAL (ronda_id = 15)
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(15, 1, 3, 3);  -- DragonLegend vs KingCrimson → Gana KingCrimson

-- GANADOR (ronda_id = 16)
INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES
(16, 3, NULL, 3);  -- KingCrimson es el campeón

select * from users;
select * from torneos;