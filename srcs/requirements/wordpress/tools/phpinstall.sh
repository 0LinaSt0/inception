#!/bin/bash
# to ppa:ondrej add fot installing specific versions of the PHP
# to update apt and to install PHP after
add-apt-repository ppa:ondrej/php -y;
apt-get update -y;
apt-get install php7.2 php7.2-cli php7.2-fpm php7.2-mysql \
				php7.2-json php7.2-opcache php7.2-mbstring \
				php7.2-xml php7.2-gd php7.2-curl -y