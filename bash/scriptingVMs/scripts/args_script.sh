#!/bin/bash

## Variable Declaration
Package="wget unzip apache2"
SVC="apache2"
Destination="/var/www/html/"


sudo apt install $Package -y
mkdir -p /tmp/webfiles
cd /tmp/webfiles
wget $1 
unzip $2.zip
sudo mv /tmp/webfiles/$name/* $Destination
sudo systemctl start $SVC
sudo systemctl enable $SVC
ip addr | grep inet