
DROP DATABASE IF EXISTS crud_clash;
CREATE USER IF NOT EXISTS 'proy'@'localhost' IDENTIFIED BY 'password';
CREATE DATABASE crud_clash;
GRANT ALL PRIVILEGES ON crud_clash.* TO 'proy'@'localhost';
FLUSH PRIVILEGES;


CREATE USER 'proy'@'localhost' IDENTIFIED BY 'password';

CREATE DATABASE  crud_clash;

GRANT ALL PRIVILEGES ON  crud_clash.* TO 'proy'@'localhost';


USE  crud_clash;






