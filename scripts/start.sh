#!/bin/bash
vagrant ssh -c "sudo pkill nginx; sudo nginx -c /vagrant/$1/conf/nginx.conf"
echo "Nginx server started for $1"
