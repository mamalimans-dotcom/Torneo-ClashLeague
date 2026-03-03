// INSERTS DE USUARIOS
INSERT INTO users (email, password, rol) VALUES ('admin@correo.com', 'admin123', 'ADMIN');

INSERT INTO users (email, password, rol) VALUES('user1@correo.com', 'user123', 'USER');

INSERT INTO users (email, password, rol) VALUES ('user2@correo.com', 'user123', 'USER');

INSERT INTO users (email, password, rol) VALUES ('doctor@correo.com', 'doc123', 'DOCTOR');

INSERT INTO users (email, password, rol) VALUES ('cliente@correo.com', 'cliente123', 'CLIENTE');


// INSERTS DE TORNEOS
INSERT INTO torneos (nombre, NumeroCopas) VALUES ('Batalla de Vikingos', 3000);

INSERT INTO torneos (nombre, NumeroCopas) VALUES  ('Gladiadores', 2000);

INSERT INTO torneos (nombre, NumeroCopas) VALUES  ('Mineros', 4500);

INSERT INTO torneos (nombre, NumeroCopas) VALUES  ('Ladrones de Copas',1500);