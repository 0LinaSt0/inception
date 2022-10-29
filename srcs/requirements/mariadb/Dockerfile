FROM debian:buster

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/dbcreate.sql /

RUN service mysql start && mysql < dbcreate.sql
RUN rm -rf dbcreate.sql

CMD ["mysqld_safe"]