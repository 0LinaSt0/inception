FROM debian:buster

# to install the prerequisites for the next downloading of nginx
RUN apt-get update \
	&& apt-get install curl \
						gnupg2 \
						ca-certificates \
						lsb-release debian-archive-keyring -y;

COPY ./tools/startnginx.sh /home/

RUN bash /home/startnginx.sh

COPY ./conf/my_configs.conf /etc/nginx/conf.d/

EXPOSE 443