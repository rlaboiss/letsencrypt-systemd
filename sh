#!/bin/sh 

service apache2 stop
letsencrypt renew
service apache2 start
