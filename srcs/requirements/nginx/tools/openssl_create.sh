#!/bin/bash

openssl req -x509 -nodes -days 365 \
	-subj $CERTS \
	-newkey rsa:2048 \
	-keyout /etc/ssl/msalena.key \
	-out /etc/ssl/msalena.crt;