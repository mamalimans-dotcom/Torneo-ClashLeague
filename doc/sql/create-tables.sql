
CREATE TABLE users (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    email VARCHAR(100) NOT NULL UNIQUE,
                    password VARCHAR(255) NOT NULL,
                    rol VARCHAR(50) NOT NULL CHECK (rol IN ('usuario', 'admin', 'moderador')),
                    alias VARCHAR(50) NOT NULL,
                    nombre VARCHAR(50) NOT NULL,
                    nivel INT,
                    copas INT
);


CREATE TABLE torneos (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    nombre VARCHAR(70) NOT NULL,
                    numeroCopas INT NOT NULL
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


