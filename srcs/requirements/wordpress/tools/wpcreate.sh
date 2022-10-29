#!/bin/bash

sed -i -r 's/listen=\/run\/php\/php7.3-fpm.sock/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf ;

mkdir /run/php/
touch /run/php/php7.3-fpm.pid ;
chown -R www-data:www-data /var/www/html/wordpress ;
chmod -R 755 /var/www/html/wordpress ;

if [ ! -f /var/www/html/wordpress/readme.html ]; then
	wget http://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar ;
	chmod +x wp-cli.phar ;
	mv wp-cli.phar /usr/local/bin/wp ;
	cd /var/www/html/wordpress ;
	wp core download --allow-root ;
	wp config create --allow-root \
					--dbname=$MDB_DATABASE \
					--dbuser=$MDB_USER \
					--dbpass=$MDB_PASSWORD \
					--dbhost=$MDB_HOST \
					--path=/var/www/html/wordpress ;
	wp core install --allow-root \
					--url=${DOMAIN_NAME} \
					--title=${WP_TITLE} \
					--admin_user=${WP_ADMIN_USER} \
					--admin_password=${WP_ADMIN_PASSWORD} \
					--admin_email=${WP_ADMIN_EMAIL} ;
	wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD} ;
fi
	/usr/sbin/php-fpm7.3 -F

echo "Wordpress ready for work"
