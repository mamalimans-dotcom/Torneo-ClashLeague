// INSERTS DE USUARIOS
INSERT INTO users (email, password, rol, alias, nombre, nivel, copas) VALUES ('jugador1@email.com', 'password123', 'usuario', 'DragonLegend', 'Carlos López', '14', 6500);

INSERT INTO users (email, password, rol, alias, nombre, nivel, copas) VALUES ('jugador2@email.com', 'password123', 'usuario', 'MegaKnightPro', 'Ana García', '13', 5800);

INSERT INTO users (email, password, rol, alias, nombre, nivel, copas) VALUES ('jugador3@email.com', 'password123', 'admin', 'KingCrimson', 'Miguel Rodríguez', '15', 7200);

INSERT INTO users (email, password, rol, alias, nombre, nivel, copas) VALUES ('jugador4@email.com', 'password123', 'usuario', 'HogRider33', 'Laura Martínez', '12', 4900);

INSERT INTO users (email, password, rol, alias, nombre, nivel, copas) VALUES ('jugador5@email.com', 'password123', 'usuario', 'WizardMaster', 'Pedro Sánchez', '11', 3800);

INSERT INTO users (email, password, rol, alias, nombre, nivel, copas) VALUES ('jugador6@email.com', 'password123', 'usuario', 'BalloonKiller', 'Sofía Pérez', '13', 5400);

INSERT INTO users (email, password, rol, alias, nombre, nivel, copas) VALUES ('jugador7@email.com', 'password123', 'usuario', 'GolemCrusher', 'Javier Gómez', '14', 6100);

INSERT INTO users (email, password, rol, alias, nombre, nivel, copas) VALUES ('jugador8@email.com', 'password123', 'moderador', 'ValkyrieQueen', 'Elena Díaz', '13', 5600);

INSERT INTO users (email, password, rol, alias, nombre, nivel, copas) VALUES ('jugador9@email.com', 'password123', 'usuario', 'MiniPekka23', 'David Torres', '10', 3200);

INSERT INTO users (email, password, rol, alias, nombre, nivel, copas) VALUES ('jugador10@email.com', 'password123', 'usuario', 'SparkyPower', 'Marta Ruiz', '12', 4500);


// INSERTS DE TORNEOS

INSERT INTO torneos (nombre, NumeroCopas) VALUES ('Batalla de Vikingos', 3000);

INSERT INTO torneos (nombre, NumeroCopas) VALUES  ('Gladiadores', 2000);

INSERT INTO torneos (nombre, NumeroCopas) VALUES  ('Mineros', 4500);

INSERT INTO torneos (nombre, NumeroCopas) VALUES  ('Ladrones de Copas',1500);


// INSERTS RONDA_CLASIFICACION

INSERT INTO rondas_clasificacion (torneo_id, numero_ronda, nombre) VALUES (1, 1, 'RONDA 1');

INSERT INTO rondas_clasificacion (torneo_id, numero_ronda, nombre) VALUES (1, 2, 'RONDA 2');

INSERT INTO rondas_clasificacion (torneo_id, numero_ronda, nombre) VALUES (1, 3, 'FINAL');

INSERT INTO rondas_clasificacion (torneo_id, numero_ronda, nombre) VALUES (1, 4, 'GANADOR');


// INSERTS DE ENFRENTAMIENTOS_CLASIFICACION

INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES (1, 1, 2, 2);

INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES (1, 3, 4, 3);

INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES (1, 5, 6, 6);

INSERT INTO enfrentamientos_clasificacion (ronda_id, jugador1_id, jugador2_id, ganador_id) VALUES (1, 7, 8, 7);
