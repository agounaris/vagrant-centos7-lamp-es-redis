Vagrant Centos 7 lamp Elasticsearch Redis
=========================================

Personal development VM with shell provisioning

I created this VM in order to have a proper php testbed for my php applications. I created the provision in bash shellscripts
mainly because I think puppet/chef/ansible are too bloated for developing a personal VM and have some short of learning
curve that was unsuitable for my case. After vagrant up, the main url will welcome you with phpinfo().

The main approach is that applications live in the 80++ port range while tools in 90++ range. You will find few load testing
tools along with a handy xdebugctl script to turn on and off xdebug with a single command. By default laravel and yii2 installation
is deactivated so have a look in Vagrant file and comment/uncomment out those that you don't want/need. I hope you will enjoy
this VM and I always accept recommendations and requests.

## Guest OS

I am using CentOS 7 image from [vagrant cloud puppetlabs](https://vagrantcloud.com/puppetlabs) (thanks)

## Prerequisites / Requirements

- virtualbox
- vagrant with guest additions (vagrant plugin install vagrant-vbguest)
- a /src folder in your home directory (configuration in Vagrantfile)

## Includes

- php 5.6.2
- mysql community 5.6.22
- elasticsearch 1.4.2, check http://10.0.0.10:9200
- redis 2.8.14
- phpinfo() on http://10.0.0.10
- Symfony latest stable on http://10.0.0.10:8000/app_dev.php
- Laravel latest stable on http://10.0.0.10:8001
- Yii2 latest stable simple template on http://10.0.0.10:8002
- phpmyadmin on http://10.0.0.10:9000
- webgrind on from http://10.0.0.10:9001
- xdebugctl [-e -d -c] tool to control xdebug output (sudo mandatory)
- load testing tools inlcuding sysbench, siege, ab
