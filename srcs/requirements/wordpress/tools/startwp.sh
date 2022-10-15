#!/bin/bash
# to install WP-CLI tool (tool which help to interact with WP from terminal commands)
echo -e "\033[32m ...wp: INSTALL WP-CLI\033[0m";
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;

# to change permissions for executing
chmod +x wp-cli.phar;

# to move it in created directory in /bin/. The name of
# directory will be name of command for to run WP-CLI
mv wp-cli.phar /usr/local/bin/wp-cli;

# to create directory for installing WP
mkdir -p /var/www/html/wordpress;

# to change it's permission for installing 
chmod o+w /var/www/html/wordpress;

# to go to directory
cd /var/www/html/wordpress;

# to downlode WP with using WP-CLI tool
echo -e "\033[32m ...wp: DOWNLOAD WP:\033[0m";
wp-cli --allow-root core download

# to create configuration file for WP wp-config.php
echo -e "\033[32m ...wp: CREATE CONFIG FILE:\033[0m";
wp-cli --allow-root config create --dbname=my_database \
				--dbuser=msalena \
				--dbpass=mdbpasswd \
				--locale=en_GB;

# to install WP with creating WP account
echo -e "\033[32m ...wp: INSTALL WP:\033[0m";
wp-cli --allow-root core install --url=msalena.42.fr \
				--title=msalena.42.fr \
				--admin_user=root_wp \
				--admin_password=root_wp_passwd \
				--admin_email=lina.stof@mail.ru;
