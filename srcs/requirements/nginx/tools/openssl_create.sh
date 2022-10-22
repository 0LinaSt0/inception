#!/bin/bash

openssl req -x509 -nodes -days 365 \
    -subj "/c=RU/ST=Russia/L=Moscow/O=school21/OU=21Moscow/CN=msalena" \
    -newkey rsa:2048 \
    -keyout /etc/ssl/msalena.key \
    -out /etc/ssl/msalena.crt;