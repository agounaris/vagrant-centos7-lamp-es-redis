Vagrant Centos 7 lamp Elasticsearhc Redis
=========================================

Personal development VM

## Guest OS

I am using CentOS 7 image from [vagrant cloud puppetlabs](https://vagrantcloud.com/puppetlabs) (thanks)

## Prerequisites / Requirements

- virtual box
- vagrant with guest additions (vagrant plugin install vagrant-vbguest)
- a /src folder in your user folder (configuration in Vagrantfile)

## Includes

- Symfony 2.6.1 accessible from http://10.0.0.10:8000/app_dev.php
- phpmyadmin accessible from http://10.0.0.10:9000
- webgrind accessible from http://10.0.0.10:9001
- xdebugctl [-e -d -c] tool to control xdebug output
- php 5.6.2
- oracle mysql 5.6
- elasticsearch 4
- redis
