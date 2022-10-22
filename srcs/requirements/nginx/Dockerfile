FROM debian:buster

COPY ./tools/openssl_create.sh /home

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install nginx -y \
	&& apt-get install openssl -y \
	&& bash /home/openssl_create.sh

COPY ./conf/default /etc/nginx/sites-enabled/default
CMD [ "nginx", "-g", "daemon off;"]