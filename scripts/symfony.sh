#!/bin/bash

VERSION="2.6.1"
DIRECTORY="/var/www/symfony"

if [ ! -d "$DIRECTORY" ]; then
    echo "Downloading symfony $VERSION"
    cd /var/www
    wget https://github.com/symfony/symfony-standard/archive/v$VERSION.tar.gz
    tar zxvf v$VERSION.tar.gz
    mv symfony-standard-$VERSION symfony
    rm v$VERSION.tar.gz

    echo "Copy parameters.yml and create database"
    cp -f /vagrant/config/symfony/parameters.yml /var/www/symfony/app/config/parameters.yml

    echo "Running composer install"
    cd symfony
    composer install

    echo "Setting symfony rights on cache and logs"
    rm -rf app/cache/* app/logs/*
    chmod 777 -R app/cache app/logs #dev only prod should have the official way to set user rights
    app/console assetic:dump

    echo "Copy apache conf"
    cp -r /vagrant/config/symfony/a2_symfony.conf /etc/httpd/conf.d/a2_symfony.conf

    echo "Copy app_dev.php"
    cp -f /vagrant/config/symfony/app_dev.php /var/www/symfony/web/app_dev.php

    echo "Setting firewall rules for symfony"
    firewall-cmd --direct --add-rule ipv4 filter INPUT 0 -p tcp --dport 8000 -j ACCEPT
    firewall-cmd --reload

    echo "Restarting httpd"
    systemctl restart httpd
else
    echo "symfony directory already exists"
fi