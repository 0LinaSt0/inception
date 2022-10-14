#!/bin/bash

# to fetch the signing key so apt could verify the packages authenticity
curl https://nginx.org/keys/nginx_signing.key| gpg --dearmor \
	| tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null;

gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg;

# to set up mainline nginx packages
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
	http://nginx.org/packages/mainline/debian `lsb_release -cs` nginx" \
	| tee /etc/apt/sources.list.d/nginx.list;

# to set up repository pinning to prefer original packages over distribution-provided ones
echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \
	| tee /etc/apt/preferences.d/99nginx;

# to install nginx
apt-get update -y\
	&& apt-get install nginx -y;

echo "~~~~~~~~~~~~~~~~~~~~AAAAAAAAA~~~~~~~~~~~~~~~~~~~~~~"

#Change to your company details
country=RU
state=RU
locality=Moscow
organization=escole42
organizationalunit=schoole
email=msalena@escole42.fr

# to create TLS/SSL certificates with public and private keys
openssl req -x509 -nodes -days 365 -newkey \
				rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
				-out /etc/ssl/certs/nginx-selfsigned.crt \
				-subj "/CN=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"