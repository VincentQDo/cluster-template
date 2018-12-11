#!/bin/bash 
set -x 
while [ ! -f /scratch/munge.key ]
do
  sleep 5
done
#copy the key file from shared folder down to local folder
sudo cp /scratch/munge.key /etc/munge/
#change ownership of directory
sudo chown -R munge: /etc/munge/ /var/log/munge/
#change permission to 0700
sudo chmod 0700 /etc/munge/ /var/log/munge/ 
