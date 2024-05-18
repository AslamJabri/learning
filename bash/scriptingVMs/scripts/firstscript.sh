#!/bin/bash
#This gives me a system information also starting with # is a comment

echo "Welcome to bash script"
echo
echo "##############"
echo "The uptime of the system is:"
uptime
echo
echo "############"
echo "Memory Utilization"
free -m
echo
echo "############"
echo "Disk Utilization"
df -hT