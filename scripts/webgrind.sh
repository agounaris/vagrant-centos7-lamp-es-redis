#!/bin/bash

VERSION="1.0"
DIRECTORY="/var/www/webgrind"

if [ ! -d "$DIRECTORY" ]; then
    echo "Downloading webgrind $VERSION"
    cd /var/www
    git clone https://github.com/jokkedk/webgrind.git
    mkdir /var/www/profiling

    echo "Copy configuration"
    cp -r /vagrant/config/webgrind/a2_webgrind.conf /etc/httpd/conf.d/a2_webgrind.conf
    cp /vagrant/config/webgrind/config.php /var/www/webgrind/config.php

    echo "Setting firewall rules for webgrind"
    firewall-cmd --zone=public --add-port=9001/tcp --permanent
    firewall-cmd --reload


    echo "Restarting httpd"
    systemctl restart httpd
else
    echo "webgrind directory already exists"
fi