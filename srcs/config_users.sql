GRANT SELECT, INSERT, UPDATE, DELETE ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root' WITH GRANT OPTION;

CREATE DATABASE wordpress;
CREATE USER 'wp-user'@'localhost' identified by 'root';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp-user'@'localhost';
FLUSH PRIVILEGES;