# Maing (parent) image from which we will take other images
FROM debian:buster

# To copy scripts for installing PHP and istalling and starting WP
COPY ./tools/phpinstall.sh /home/
COPY ./tools/startwp.sh /home/

# To execute the installation of systemd, curl, wget, MDB_client and PHP
RUN echo "\033[32m ...wp: UPDATE INSTALLER:\033[0m" \
	&& apt-get update -y \
	&& echo "\033[32m ...wp: INSTALL SYSTEMD:\033[0m" \
	&& apt-get install systemd -y \
	&& echo "\033[32m ...wp: INSTALL CURL:\033[0m" \
	&& apt-get install curl -y\
	&& echo "\033[32m ...wp: INSTALL WGET:\033[0m" \
	&& apt-get install wget -y \
	&& echo "\033[32m ...wp: UPDATE INSTALLER:\033[0m" \
	&& apt-get update \
	&& echo "\033[32m ...mdb: INSTALL MARIADB_CLIENT:\033[0m" \
	#&& apt-get install mariadb-client -y \
	&& bash /home/phpinstall.sh

# To copy configs for PHP
COPY ./conf/www.conf /etc/php/7.2/fpm/pool.d/

# To open needing port
EXPOSE 9000 

# To execute downloading, installig and creating accounts of WP
CMD bash /home/startwp.sh