DROP DATABASE IF EXISTS crud_clash;
DROP USER IF EXISTS 'proy'@'localhost';

CREATE USER 'proy'@'localhost' IDENTIFIED BY 'password';
CREATE DATABASE crud_clash;
GRANT ALL PRIVILEGES ON crud_clash.* TO 'proy'@'localhost';
FLUSH PRIVILEGES;

USE crud_clash;