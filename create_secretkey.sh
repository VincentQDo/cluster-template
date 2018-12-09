#!/bin/bash 
set -x 

/usr/sbin/create-munge-key 

sudo bash -c "echo "foo" > /etc/munge/munge.key"
chown munge: /etc/munge/munge.key
sudo chmod 700 /etc/munge/munge.key 
