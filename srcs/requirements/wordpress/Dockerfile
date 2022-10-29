FROM debian:buster

RUN apt-get update -y \ 
	&& apt-get upgrade -y \
	&& apt-get install -y php7.3 php-mysql php-fpm \
							mariadb-client \
							wget

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/wpcreate.sh /

RUN chmod 775 /wpcreate.sh

ENTRYPOINT [ "/bin/bash", "wpcreate.sh" ]