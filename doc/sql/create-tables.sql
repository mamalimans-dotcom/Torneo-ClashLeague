
CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       email VARCHAR(100) NOT NULL UNIQUE,
                       password VARCHAR(255) NOT NULL,
                       rol VARCHAR(50) NOT NULL
);

 create table torneos (
					id int auto_increment not null,
                    nombre varchar(70) not null,
                    NumeroCopas int not null,
                    primary key(id)
 );