#!/bin/sh 

service apache2 stop
certbot renew
service apache2 start
