#!/bin/bash
echo "This season $Season is good."

echo "Login Details"

read -p 'username:' USR
read -p 'id: ' ID
read -sp 'password:' pass 
echo

if [ $USR == "aslam" ]; then
    echo "Welcome back admin"
    echo "Memory : $(free -m | grep "Mem" | awk '{print $2}')"
    ls /run/apache2/apache.pid
    if [ $? -eq 0 ]; then
        echo "apache2 is running"
    else
        echo "apache2 is not running"
        systemctl start apache2
        if [ $? -eq 0 ]; then
            echo "Process started successfully"
        else
            echo "Process failed"
        fi
    fi
elif [ -d "/home/$USR" ] && [ $ID -gt 10 ]; then
    echo "Welcome $USR"
    echo "Today's date is : $(date)"
    echo "You have a meeting with admin"
    if [ -f "/home/$USR/schedule" ]; then
        echo "The Schedule file is on your home directory"
    else 
        echo "The Schedule file will be created on the home directory"
        touch "/home/$USR/schedule"
    fi
else
    echo "Welcome Guest"
fi
