#!/bin/bash
# to download and store PPA repository in a file on Debian Server + the GPG key
apt-get -y install lsb-release apt-transport-https ca-certificates -y;
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg;
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" \
		| tee /etc/apt/sources.list.d/php.list;

# to install PHP
apt-get update -y;

apt-get install php7.2 php7.2-cli php7.2-fpm php7.2-mysql \
				php7.2-json php7.2-opcache php7.2-mbstring \
				php7.2-xml php7.2-gd php7.2-curl -y