FROM debian:buster

RUN apt-get update -y \ 
    && apt-get upgrade -y \
    && apt-get install -y php7.3 php-mysql php-fpm \
                                mariadb-client wget

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
WORKDIR /var/www
RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xvzf latest.tar.gz \
    && rm -rf latest.tar.gz

WORKDIR /
COPY ./conf/wp-config.php /var/www/wordpress
COPY ./tools/object-cache.php /var/www

RUN mkdir /run/php/
COPY ./tools/wpcreate.sh /
RUN chmod 775 /wpcreate.sh
ENTRYPOINT [ "/bin/bash", "wpcreate.sh" ]