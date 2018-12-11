#!/bin/bash
while [ ! -f /scratch/slurmdb.done ]
do
  sleep 5
done
sudo systemctl restart slurmctld
