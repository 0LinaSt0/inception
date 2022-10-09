FROM debian:buster

WORKDIR /app

COPY . .

RUN apt update -y\
	&& apt install nginx -y

#CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80 8080
STOPSIGNAL SIGQUIT
#CMD ["nginx","-g","daemon off;"]
ENTRYPOINT ["nginx", "-g", "daemon off;"]