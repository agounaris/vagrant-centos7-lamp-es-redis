#!/bin/bash

yum install -y http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm

echo "Installing MySQL"
yum install -y mysql-community-server

echo "Adding MySQL service to autostart"
systemctl enable mysqld

echo "Starting MySQL service"
systemctl start mysqld

echo "Add port 3306 to iptables"
firewall-cmd --direct --add-rule ipv4 filter INPUT 0 -p tcp --dport 3306 -j ACCEPT
firewall-cmd --reload

#Reload the database
echo "Setting DB permissions for root"
mysql -u root <<< "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"

echo "MySQL installed"
