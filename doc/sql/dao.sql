-- Consultas para Usuarios
SELECT id, email, password, rol, alias, nombre, nivel, copas FROM users WHERE email = ?;

SELECT id, email, password, rol, alias, nombre, nivel, copas FROM users WHERE id = ?;

SELECT id, email, password, rol, alias, nombre, nivel, copas FROM users ORDER BY id DESC;

INSERT INTO users (email, password, rol, alias, nombre, nivel, copas) VALUES (?, ?, ?, ?, ?, ?, ?);

UPDATE users SET email = ?, password = ?, rol = ?, alias = ?, nombre = ?, nivel = ?, copas = ? WHERE id = ?;

DELETE FROM users WHERE id = ?;

DELETE FROM usuario_torneo WHERE usuario_id = ?

DELETE FROM usuario_torneo WHERE torneo_id = ?

-- Consultas para Torneos
SELECT id, nombre, NumeroCopas FROM torneos;

INSERT INTO torneos (nombre, NumeroCopas) VALUES (?, ?);

DELETE FROM torneos WHERE id = ?;

DELETE FROM usuario_torneo WHERE torneo_id = ?

DELETE FROM usuario_torneo WHERE usuario_id = ?

UPDATE torneos set nombre=? , numeroCopas= ? WHERE id=?;