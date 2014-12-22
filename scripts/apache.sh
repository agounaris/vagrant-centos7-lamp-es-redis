#!/bin/bash

echo "Installing Apache"
yum install -y httpd

echo "Adding Apache service to autostart"
systemctl enable httpd

echo "Copying httpd config"
cp -f /vagrant/config/httpd.conf /etc/httpd/conf/httpd.conf

echo "Starting httpd service"
systemctl restart httpd

echo "Add ports 80, 443 to firewall"
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp --permanent
firewall-cmd --reload

echo "Apache installed"
