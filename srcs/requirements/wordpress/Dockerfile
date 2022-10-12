# Maing (parent) image from which we will take other images
FROM debian:buster

# To copy scripts for installing PHP and istalling and starting WP
COPY ./tools/phpinsall.sh /home/
COPY ./tools/startwp.sh /home/

# To execute the installation of systemd, curl and PHP
RUN apt-get update -y \
	&& apt-get install systemd -y \
	&& apt-get install curl \
	&& bash /home/phpinsall.sh

# To copy configs for PHP
COPY ./conf/www.conf /etc/php/7.2/fpm/pool.d/

# To open needing port
EXPOSE 9000 

# To execute downloading, installig and creating accounts of WP
CMD bash /home/startwp.sh