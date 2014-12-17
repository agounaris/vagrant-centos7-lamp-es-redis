#!/bin/bash

rpm --import https://packages.elasticsearch.org/GPG-KEY-elasticsearch

echo "
[elasticsearch-1.4]
name=Elasticsearch repository for 1.4.x packages
baseurl=http://packages.elasticsearch.org/elasticsearch/1.4/centos
gpgcheck=1
gpgkey=http://packages.elasticsearch.org/GPG-KEY-elasticsearch
enabled=1" >> /etc/yum.repos.d/elasticsearch.repo

echo "Installing Java 7"
yum install -y java-1.7.0-openjdk.x86_64

echo "Installing Elasticsaerch"
yum install -y elasticsearch

echo "Adding Elasticsaerch service to autostart"
systemctl enable elasticsearch

echo "Starting Elasticsaerch service"
systemctl restart elasticsearch

echo "Add port 9200 to firewall"
firewall-cmd --direct --add-rule ipv4 filter INPUT 0 -p tcp --dport 9200 -j ACCEPT
firewall-cmd --reload