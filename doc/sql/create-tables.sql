CREATE TABLE crud_db.notas (
                             id  bigint(20) NOT NULL AUTO_INCREMENT,
                             titulo varchar(255) DEFAULT '',
                             contenido varchar(4095) DEFAULT '',
                             creado varchar(4095) DEFAULT '',
                             modificado varchar(4095) DEFAULT '',
                             PRIMARY KEY (id)
);
CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       email VARCHAR(100) NOT NULL UNIQUE,
                       password VARCHAR(255) NOT NULL,
                       rol VARCHAR(50) NOT NULL
);