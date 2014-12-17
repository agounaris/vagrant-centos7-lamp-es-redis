#!/bin/bash

echo "Installing PHP 5.6"
rpm -Uvh https://mirror.webtatic.com/yum/el7/epel-release.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

yum install -y php56w php56w-opcache php56w-intl.x86_64 php56w-mbstring.x86_64 php56w-mcrypt.x86_64 php56w-mysql.x86_64 php56w-pecl-redis.x86_64 php56w-pecl-xdebug.x86_64 php56w-tidy.x86_64 php56w-pdo.x86_64

echo "Copying php config"
cp -f /vagrant/config/php.ini /etc/php.ini
cp -f /vagrant/config/opcache.ini /etc/php.d/opcache.ini

echo "Copying php info"
cp -f /vagrant/tools/index.php /var/www/html/index.php

echo "Restarting Apache"
systemctl restart httpd

echo "PHP installed"
