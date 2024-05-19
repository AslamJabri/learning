#!/bin/bash

## Variable Declaration
Package="wget unzip apache2"
SVC="apache2"
URL="https://www.tooplate.com/zip-templates/2097_pop.zip"
name="2097_pop"
Destination="/var/www/html/"
yum --help &>/dev/null

if [ $? -eq 0 ]; then
    Package="wget unzip httpd"
    SVC="httpd"
    sudo yum install $Package -y
    mkdir -p /tmp/
    cd /tmp/
    wget $URL
    unzip $name.zip
    sudo mv /tmp/$name/* $Destination
    sudo systemctl start $SVC
    sudo systemctl enable $SVC
else
    echo "This is Debian Based system"
    Package="wget unzip apache2"
    SVC="apache2"
    sudo apt update
    sudo apt install $Package -y
    mkdir -p /tmp
    cd /tmp
    wget $URL
    unzip $name.zip
    sudo cp -R /tmp/$name/* $Destination
    sudo systemctl start $SVC
    sudo systemctl enable $SVC
fi