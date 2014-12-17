#!/bin/bash

echo "Installing Apache"
yum install -y httpd

echo "Adding Apache service to autostart"
systemctl enable httpd

#echo "Copying httpd config"
#cp -f /vagrant/environment/config/httpd.conf /etc/httpd/conf/httpd.conf

# echo "Mounting webroot"
# # pick the webroot
# if [ -d /vagrant/www ]
# then
# 	echo "Found folder www, using as webroot"
# 	WEBROOT="www"
# elif [ -d /vagrant/public_html ]
# then
# 	echo "Found folder public_html, using as webroot"
# 	WEBROOT="public_html"
# elif [ -d /vagrant/webroot ]
# then
# 	echo "Found folder webroot, using as webroot"
# 	WEBROOT="webroot"
# fi

# if [ -d /vagrant/$WEBROOT ]
# then
# 	rm -rf /var/www/html
# 	ln -s /vagrant/$WEBROOT /var/www/html
# fi

# if [ -d /var/lib/php/session ]
# then
# 	chown -R vagrant: /var/lib/php/session
# fi

echo "Starting httpd service"
systemctl restart httpd

echo "Add ports 80, 443 to firewall"
firewall-cmd --direct --add-rule ipv4 filter INPUT 0 -p tcp --dport 80 -j ACCEPT
firewall-cmd --direct --add-rule ipv4 filter INPUT 0 -p tcp --dport 443 -j ACCEPT
firewall-cmd --reload

echo "Apache installed"
