#!/bin/bash

sudo apt install wget unzip apache2 -y
mkdir -p /tmp/webfiles
cd /tmp/webfiles
wget https://www.tooplate.com/zip-templates/2098_health.zip
unzip 2098_health.zip
sudo mv /tmp/webfiles/2098_health/* /var/www/html/
sudo systemctl start apache2
sudo systemctl enable apache2
