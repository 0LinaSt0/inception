# Maing (parent) image from which we will take other images
FROM debian:buster

# To execute the installation of mariadb and systemd 
# in a new layer on top of the current image
# .note: the flag '-y' means i agree with all installing
RUN echo "\033[32m ...mdb: UPDATE INSTALLER:\033[0m" \
	&& apt-get update -y\
	&& echo "\033[32m ...mdb: INSTALL SYSTEMD:\033[0m" \
	&& apt-get install systemd -y\
	&& echo "\033[32m ...mdb: INSTALL MARIADB_SERVER:\033[0m" \
	&& apt-get install mariadb-server -y

# To copy configuration for mariadb and create_database_sql_script
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/createmdb.sh /home/
#COPY ./tools/createmdb.sql ./var/www

# To open needing port
EXPOSE 3306

# To execute the start for mariadb and run create_database_sql_script
# in a new layer on top of the current image
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

RUN echo "\033[32m ...mdb: START MYSQL:\033[0m" \
	&& service mysql start \
	&& bash /home/createmdb.sh

# To startup mysql server after the container starts
#.note: the "mysqld_safe" command is special script for startup 
#		the mysql server with some safety features 
#		(as estarting the server when an error occurs, for example)
CMD mysqld_safe
#ENTRYPOINT service mysql start