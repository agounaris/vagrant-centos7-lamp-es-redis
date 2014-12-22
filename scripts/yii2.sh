#!/bin/bash

DIRECTORY="/var/www/yii2"

if [ ! -d "$DIRECTORY" ]; then
    echo "Downloading yii2 latest stable"
    cd /var/www
    composer global require "fxp/composer-asset-plugin:1.0.0-beta4"
    composer create-project yiisoft/yii2-app-basic yii2 --prefer-dist

    echo "Copy apache conf"
    cp -r /vagrant/config/yii2/a2_yii2.conf /etc/httpd/conf.d/a2_yii2.conf

    echo "Setting firewall rules for yii2"
    firewall-cmd --zone=public --add-port=8002/tcp --permanent
    firewall-cmd --reload

    echo "Restarting httpd"
    systemctl restart httpd
else
    echo "symfony directory already exists"
fi