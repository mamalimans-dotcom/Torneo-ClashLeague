
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

 create table torneos (
					id int auto_increment not null,
                    nombre varchar(70) not null,
                    NumeroCopas int not null,
                    primary key(id)
 );

 CREATE TABLE rondas_clasificacion (
                     id INT AUTO_INCREMENT PRIMARY KEY,
                     torneo_id INT,
                     numero_ronda INT NOT NULL,
                     nombre VARCHAR(50) DEFAULT 'RONDA',
                     FOREIGN KEY (torneo_id) REFERENCES torneos(id)
 );


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