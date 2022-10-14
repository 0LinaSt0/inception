#!/bin/bash
# to install WP-CLI tool (tool which help to interact with WP from terminal commands)
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -y;

# to change permissions for executing
chmod +x wp-cli.phar;

# to move it in created directory in /bin/. The name of
# directory will be name of command for to run WP-CLI
mv wp-cli.phar /usr/local/bin/wp;

# to create directory for installing WP
mkdir /var/www/html/wordpress;

# to change it's permission for installing 
chmod o+w /var/www/html/wordpress;

# to go to directory
cd /var/www/html/wordpress;

# to downlode WP with using WP-CLI tool
wp core download

# to create configuration file for WP wp-config.php
wp config create --dbname=my_database \
				--dbuser=msalena \
				--dbpass=mdbpasswd \
				--locale=en_DB;

# to install WP with creating WP account
wp core install --url=msalena.42.fr \
				--title=msalena.42.fr \
				--admin_user=root_wp \
				--admin_password=root_wp_passwd \
				--admin_email=lina.stof@mail.ru;
