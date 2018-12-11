#!/bin/bash
while [ ! -f /scratch/meta.done ]
do
  sleep 5
done
sudo systemctl enable munge
sudo systemctl start munge
