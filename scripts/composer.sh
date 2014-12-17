#!/bin/bash

echo "Downloading composer"
curl -sS https://getcomposer.org/installer | php

echo "Moving composer to make it globally accessable"
mv composer.phar /usr/bin/composer

echo "Composer installed"

echo "Installing git due to composer dependency"
yum install -y git

echo "Composer installed"