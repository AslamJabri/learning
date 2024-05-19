#!/bin/bash
#if you want to use the output of the command and store it into a variable

#     $(command)  or `command`

#variable

echo "Welcome $USER on $HOSTNAME"
echo "###############################"

echo
FREERAM=$(free -m | grep Mem | awk '{print $4}')
LOAD=`uptime | awk '{print $9}'`
HARDDISK=$(df -h  | grep '/dev/mapper/*'| awk '{print $4}')

echo
echo "Free Ram is $FREERAM MB"
echo
echo "Current Load is $LOAD"
echo
echo "Disk Spcae is $HARDDISK"