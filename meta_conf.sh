#!/bin/bash

sudo cp /scratch/slurm.conf /etc/slurm/slurm.conf
sudo cp /scratch/slurmdbd.conf /etc/slurm/slurmdbd.conf
sudo mkdir /var/spool/slurmdbd
sudo chown slurm: /var/spool/slurmdbd
sudo chmod 755 /var/spool/slurmdbd
sudo touch /var/log/slurmdbd.log
sudo chown slurm: /var/log/slurmdbd.log
sudo chmod 755 /var/log/slurmdbd.log
sudo touch /var/run/slurmdbd.pid
sudo chown slurm: /var/run/slurmdbd.pid
sudo chmod 777 /var/run/slurmdbd.pid
sudo cp /scratch/innodb.cnf /etc/my.cnf.d/innodb.cnf
sudo chown slurm: /etc/my.cnf.d/innodb.cnf
sudo chmod 777 /etc/my.cnf.d/innodb.cnf

sudo chkconfig ntpd on
sudo ntpdate pool.ntp.org
sudo systemctl start ntpd

sudo systemctl start mariadb 
sudo systemctl enable mariadb 

sudo mysql  -sfu root < "/local/repository/prep.sql"
sudo mysql "-psecret" < "/local/repository/mariadbQuery.sql"

sudo systemctl enable slurmdbd
sudo systemctl start slurmdbd

#notify all other nodes that slurmdbd daemon is up
sudo touch /scratch/metadb.done

#wait for callback from head node
while [ ! -f /scratch/head.done ]
do
  sleep 5
done

#add cluster
yes | sudo sacctmgr add cluster cluster

#notify head node cluster has been added
sudo touch /scratch/cluster.done
