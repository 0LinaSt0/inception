# Maing (parent) image from which we will take other images
FROM debian:buster

# To execute the installation of mariadb and systemd 
# in a new layer on top of the current image
# .note: the flag '-y' means i agree with all installing
RUN apt-get update -y\
	&& apt-get install systemd -y\
	&& apt-get install mariadb-server -y

# To copy configuration for mariadb and create_database_sql_script
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/createmdb.sql /var/www

# To open needing port
EXPOSE 3306

# To execute the start for mariadb and run create_database_sql_script
# in a new layer on top of the current image
RUN systemctl start mysql; mysql < /var/www/createmdb.sql

# To startup mysql server after the container starts
#.note: the "mysqld_safe" command is special script for startup 
#		the mysql server with some safety features 
#		(as estarting the server when an error occurs, for example)
CMD mysqld_safe
