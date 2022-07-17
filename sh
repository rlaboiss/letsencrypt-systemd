#!/bin/sh 

systemctl stop apache2.service
certbot renew
systemctl start apache2.service
