Vagrant Centos 7 lamp Elasticsearch Redis
=========================================

Personal development VM with shell provisioning

I created this VM in order to have a proper php testbed for my php applications. I created the provision in bash shellscripts
mainly because I think puppet/chef/ansible are too bloated for developing a personal VM and have some short of learning
curve that was unsuitable for my case. After vagrant up, the main url will welcome you with phpinfo().

The main approach is that applications live in the 80++ port range while tools in 90++ range. You will find few load testing
tools along with a handy xdebugctl script to turn on and off xdebug with a single command. I hope you will enjoy this
VM and I always accept recommendations and requests.

## Guest OS

I am using CentOS 7 image from [vagrant cloud puppetlabs](https://vagrantcloud.com/puppetlabs) (thanks)

## Prerequisites / Requirements

- virtual box
- vagrant with guest additions (vagrant plugin install vagrant-vbguest)
- a /src folder in your home directory (configuration in Vagrantfile)

## Includes

- Symfony 2.6.1 accessible from http://10.0.0.10:8000/app_dev.php
- phpmyadmin accessible from http://10.0.0.10:9000
- webgrind accessible from http://10.0.0.10:9001
- xdebugctl [-e -d -c] tool to control xdebug output (sudo mandatory)
- php 5.6.2
- oracle mysql 5.6
- elasticsearch 4
- redis
- load testing tools inlcuding sysbench, siege, ab
