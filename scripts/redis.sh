#!/bin/bash

echo "Installing Redis"
yum install -y redis.x86_64

echo "Adding Redis service to autostart"
systemctl enable redis

echo "Starting Redis service"
systemctl restart redis