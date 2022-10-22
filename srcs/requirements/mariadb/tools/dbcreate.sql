CREATE DATABASE InceptionDB;
CREATE USER 'msalena'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON InceptionDB.* TO 'msalena'@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';