#!/bin/bash
while [ ! -f /scratch/rpm.done ]
do
  sleep 10
done
sudo yum --nogpgcheck localinstall /software/slurm-rpms/* -y
#to test if this worked just re run it and if you see nothing to do then it executed perfectly
