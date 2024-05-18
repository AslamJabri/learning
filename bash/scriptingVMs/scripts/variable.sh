#!/bin/bash

## Variable Declaration
Package="wget unzip apache2"
SVC="apache2"
URL="https://www.tooplate.com/zip-templates/2097_pop.zip"
name="2097_pop"
Destination="/var/www/html/"


sudo apt install $Package -y
mkdir -p /tmp/webfiles
cd /tmp/webfiles
wget $URL
unzip $name.zip
sudo mv /tmp/webfiles/$name/* $Destination
sudo systemctl start $SVC
sudo systemctl enable $SVC
