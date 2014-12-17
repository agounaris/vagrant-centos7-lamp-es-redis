#!/bin/bash

echo "Enable xdebugctl"
cp -f /vagrant/tools/xdebugctl /usr/sbin/xdebugctl
chmod +x /usr/sbin/xdebugctl

echo "Installing unzip"
yum install -y unzip

echo "Installing graphviz"
yum install -y graphviz
