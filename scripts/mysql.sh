#!/bin/bash

yum install -y http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm

echo "Installing MySQL"
yum install -y mysql-community-server

echo "Adding MySQL service to autostart"
systemctl enable mysqld

echo "Starting MySQL service"
systemctl start mysqld

echo "Add port 3306 to firewalld"
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --reload

#Reload the database
echo "Setting DB permissions for root"
mysql -u root <<< "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql -u root <<< "UPDATE mysql.user SET Password=PASSWORD('toor') WHERE User='root';"
mysql -u root <<< "FLUSH PRIVILEGES;"

echo "MySQL installed"
