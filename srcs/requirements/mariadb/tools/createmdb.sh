echo -e "\033[32m ...mdb: CREATE DATABASE WITH USERS:\033[0m";

#userdel mysql
#useradd -u 999 mysql
#chown -R mysql:mysql /var/lib/mysql

#mysql -u root -e "DROP DATABASE IF EXISTS my_database;"
#mysql -u root -e "DROP USER IF EXISTS 'mdbpasswd'@'%';"
#mysql -u root -e "CREATE DATABASE IF NOT EXISTS my_database;"
#mysql -u root -e "CREATE USER 'msalena'@'%' IDENTIFIED BY 'mdbpasswd';"
#mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'msalena'@'msalena.42.fr' IDENTIFIED BY 'mdbpasswd';"
#mysql -u root -e "FLUSH PRIVILEGES;"
#mysqladmin -u root password "aaa"
#service mysql stop

#userdel mysql
#useradd -u 999 mysql
#chown -R mysql:mysql /var/lib/mysql
#mkdir -p /var/run/mysqld/
#chmod -R 755 /var/run/mysqld
#chown -R mysql:mysql /var/run/mysqld
#ln -s /run/mysqld/mysqld.sock /var/run/mysqld/mysqld.sock

mkdir /var/run/mysqld
mkfifo /var/run/mysqld/mysqld.sock
chown -R mysql /var/run/mysqld

/usr/bin/mysqld_safe
mysql -u root -e "DROP DATABASE IF EXISTS my_database;"
mysql -u root -e "DROP USER IF EXISTS 'msalena'@'%';"
mysql -u root -e "CREATE DATABASE my_database;"
mysql -u root -e "CREATE USER 'msalena'@'%' IDENTIFIED BY 'mdbpasswd'"
mysql -u root -e "GRANT ALL ON my_database.* TO 'msalena'@'%' IDENTIFIED BY 'mdbpasswd' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"
mysqladmin -u root password "aaa"
service mysql stop