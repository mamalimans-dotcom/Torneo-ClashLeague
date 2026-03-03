drop database  if exists crud_clash;
create database crud_clash;
USE  crud_clash;
drop table if exists users;
CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       email VARCHAR(100) NOT NULL UNIQUE,
                       password VARCHAR(255) NOT NULL,
                       rol VARCHAR(50) NOT NULL
);
INSERT INTO users (email, password, rol) VALUES 
('admin@correo.com', 'admin123', 'ADMIN'),
('user1@correo.com', 'user123', 'USER'),
 ('user2@correo.com', 'user123', 'USER'),
 ('doctor@correo.com', 'doc123', 'DOCTOR'),
 ('cliente@correo.com', 'cliente123', 'CLIENTE');
 
 drop table if exists torneos;
 create table torneos (
					id int auto_increment primary key,
                    nombre varchar(70) not null,
                    NumeroCopas int not null
 );
 insert into torneos (nombre, NumeroCopas) values
 ('Batalla de Vikingos', 3000),
 ('Gladiadores', 2000),
 ('Mineros', 4500),
 ('Ladrones de Copas',1500)