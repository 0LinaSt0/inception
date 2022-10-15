#!/bin/bash

# to fetch the signing key so apt could verify the packages authenticity
echo -e "\033[32m ...nginx: FETCH THE SIGNING KEY:\033[0m";
curl https://nginx.org/keys/nginx_signing.key| gpg --dearmor \
	| tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null;

gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg;

# to set up mainline nginx packages
echo -e "\033[32m ...nginx: SET UP MAINLINE NGINX PACKAGES:\033[0m";
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
	http://nginx.org/packages/mainline/debian `lsb_release -cs` nginx" \
	| tee /etc/apt/sources.list.d/nginx.list;

# to set up repository pinning to prefer original packages over distribution-provided ones
echo -e "\033[32m ...nginx: SET UP REPOSITORY PINNNG TO PREFER ORIG PACKAGES:\033[0m";
echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \
	| tee /etc/apt/preferences.d/99nginx;

# to install nginx
echo -e "\033[32m ...nginx: INSTALL NGINX:\033[0m";
apt-get update -y\
	&& apt-get install nginx -y;

#Change to your company details
commonname=msalena
country=RU
locality=Moscow
organization=escole42
email=msalena@escole42.from

# to create TLS/SSL certificates with public and private keys
echo -e "\033[32m ...nginx: CREATE TLS/SSL CERTIFICATES:\033[0m";
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
			-keyout /etc/ssl/private/nginx-selfsigned.key \
			-subj "/C=$country/ST=./L=$locality/O=$organization/OU=./CN=*.msalena.42.fr/emailAddress=$email" \
			-out /etc/ssl/certs/nginx-selfsigned.crt 
			