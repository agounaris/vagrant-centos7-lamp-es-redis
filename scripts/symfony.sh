#!/bin/bash

DIRECTORY="/var/www/symfony"

if [ ! -d "$DIRECTORY" ]; then
    echo "Downloading symfony latest stable"
    cd /var/www
    composer create-project symfony/framework-standard-edition symfony

    echo "Copy parameters.yml and create database"
    cp -f /vagrant/config/symfony/parameters.yml /var/www/symfony/app/config/parameters.yml

    echo "Setting symfony rights on cache and logs, creating database"
    cd symfony
    rm -rf app/cache/* app/logs/*
    chmod 777 -R app/cache app/logs #dev only prod should have the official way to set user rights
    app/console doctrine:database:create
    app/console assetic:dump

    echo "Copy apache conf"
    cp -r /vagrant/config/symfony/a2_symfony.conf /etc/httpd/conf.d/a2_symfony.conf

    echo "Copy app_dev.php"
    cp -f /vagrant/config/symfony/app_dev.php /var/www/symfony/web/app_dev.php

    echo "Setting firewall rules for symfony"
    firewall-cmd --zone=public --add-port=8000/tcp --permanent
    firewall-cmd --reload

    echo "Restarting httpd"
    systemctl restart httpd
else
    echo "symfony directory already exists"
fi