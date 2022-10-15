echo -e "\033[32m ...mdb: CREATE DATABASE WITH USERS:\033[0m";

mysql -u root -e "CREATE DATABASE IF NOT EXISTS my_database;"
mysql -u root -e "CREATE USER 'msalena'@'%' IDENTIFIED BY 'mdbpasswd';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'msalena'@'msalena.42.fr' IDENTIFIED BY 'mdbpasswd';"
mysql -u root -e "FLUSH PRIVILEGES;"