#!/bin/bash
USR='devops'
for host in `cat remotehosts`
do
    echo "#####################"
    echo "Copying to $host"
    scp multios.sh $USR@$host:/tmp/
    echo "Running script on $host"
    ssh $USR@$host sudo /tmp/multios.sh
    echo
    echo "### Deleting the files"
    ssh $USR@$host sudo rm -rf /tmp/multios.sh
done