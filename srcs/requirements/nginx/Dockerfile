FROM debian:buster

# to install the prerequisites for the next downloading of nginx
RUN echo "\033[32m ...nginx: UPDATE INSTALLER:\033[0m" \
	&& apt-get update \
	&& echo "\033[32m ...nginx: INSTALL TOOLS(curl, gnupg2m, etc.):\033[0m" \
	&& apt-get install curl \
						gnupg2 \
						ca-certificates \
						lsb-release debian-archive-keyring -y;

COPY ./tools/startnginx.sh /home/

RUN bash /home/startnginx.sh

COPY ./conf/my_configs.conf /etc/nginx/conf.d/

EXPOSE 443

CMD service nginx start