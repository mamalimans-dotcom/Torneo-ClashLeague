DROP DATABASE IF EXISTS crud_clash;
CREATE USER IF NOT EXISTS 'proy'@'localhost' IDENTIFIED BY 'password';
CREATE DATABASE crud_clash;
GRANT ALL PRIVILEGES ON crud_clash.* TO 'proy'@'localhost';
FLUSH PRIVILEGES;
USE  crud_clash;
drop table if exists users;

/*********  Creacion de tablas  *************/
drop table if exists users;
CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       email VARCHAR(100) NOT NULL UNIQUE,
                       password VARCHAR(255) NOT NULL,
                       rol VARCHAR(50) NOT NULL,
                       alias varchar(50) not null,
                       nombre varchar (50) not null,
                       nivel varchar(50) ,
                       copas int
);
drop table if exists torneos;
 create table torneos (
					id int auto_increment primary key,
                    nombre varchar(70) not null,
                    NumeroCopas int not null
 );
 
drop table if exists rondas_clasificacion;
CREATE TABLE rondas_clasificacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    torneo_id INT,
    numero_ronda INT NOT NULL,
    nombre VARCHAR(50) DEFAULT 'RONDA',
    FOREIGN KEY (torneo_id) REFERENCES torneos(id)
);

drop table if exists enfrentamientos_clasificacion;
CREATE TABLE enfrentamientos_clasificacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ronda_id INT,
    jugador1_id INT,
    jugador2_id INT,
    ganador_id INT NULL,
    FOREIGN KEY (ronda_id) REFERENCES rondas_clasificacion(id),
    FOREIGN KEY (jugador1_id) REFERENCES users(id),
    FOREIGN KEY (jugador2_id) REFERENCES users(id),
    FOREIGN KEY (ganador_id) REFERENCES users(id)
);

/***************** Iserccion de Datos **********/
INSERT INTO users (email, password, rol, alias, nombre, nivel, copas) VALUES
('jugador1@email.com', 'password123', 'usuario', 'DragonLegend', 'Carlos López', '14', 6500),
('jugador2@email.com', 'password123', 'usuario', 'MegaKnightPro', 'Ana García', '13', 5800),
('jugador3@email.com', 'password123', 'admin', 'KingCrimson', 'Miguel Rodríguez', '15', 7200),
('jugador4@email.com', 'password123', 'usuario', 'HogRider33', 'Laura Martínez', '12', 4900),
('jugador5@email.com', 'password123', 'usuario', 'WizardMaster', 'Pedro Sánchez', '11', 3800),
('jugador6@email.com', 'password123', 'usuario', 'BalloonKiller', 'Sofía Pérez', '13', 5400),
('jugador7@email.com', 'password123', 'usuario', 'GolemCrusher', 'Javier Gómez', '14', 6100),
('jugador8@email.com', 'password123', 'moderador', 'ValkyrieQueen', 'Elena Díaz', '13', 5600),
('jugador9@email.com', 'password123', 'usuario', 'MiniPekka23', 'David Torres', '10', 3200),
('jugador10@email.com', 'password123', 'usuario', 'SparkyPower', 'Marta Ruiz', '12', 4500);

 
 insert into torneos (nombre, NumeroCopas) values
 ('Batalla de Vikingos', 3000),
 ('Gladiadores', 2000),
 ('Mineros', 4500),
 ('Ladrones de Copas',1500);
 
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
