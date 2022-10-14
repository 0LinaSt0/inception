mysql -u root -e "CREATE DATABASE IF NOT EXISTS my_database;"
mysql -u root -e "CREATE USE 'msalena'@'%' IDENTIFIED BY 'mdbpasswd';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'msalena'@'msalena.42.fr';"
mysql -u root -e "FLUSH PRIVILEGES;"