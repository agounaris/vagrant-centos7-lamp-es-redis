#!/bin/bash

DIRECTORY="/var/www/laravel"

if [ ! -d "$DIRECTORY" ]; then
    echo "Downloading laravel latest stable"
    cd /var/www
    composer create-project laravel/laravel laravel --prefer-dist

    echo "Setting laravel rights on cache and logs, creating database"
    cd laravel
    chmod 777 -R app/storage

    echo "Copy apache conf"
    cp -r /vagrant/config/laravel/a2_laravel.conf /etc/httpd/conf.d/a2_laravel.conf

    echo "Setting firewall rules for laravel"
    firewall-cmd --zone=public --add-port=8002/tcp --permanent
    firewall-cmd --reload

    echo "Restarting httpd"
    systemctl restart httpd
else
    echo "symfony directory already exists"
fi