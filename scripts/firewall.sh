#!/bin/bash
#
# iptables example configuration script
#
# Flush all current rules from iptables
#
echo "Setting up secure firewalld"
systemctl enable firewalld

systemctl start firewalld

