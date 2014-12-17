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
firewall-cmd --direct --add-rule ipv4 filter INPUT 0 -p tcp --dport 80 -j ACCEPT
firewall-cmd --direct --add-rule ipv4 filter INPUT 0 -p tcp --dport 443 -j ACCEPT
firewall-cmd --reload

echo "Apache installed"
