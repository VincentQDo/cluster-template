#condition inside while loop is creditted to js637496
while [ ! -f /scratch/munge.key ]
do
  sleep 5
done
sudo cp /scratch/munge.key /etc/munge/munge.key
sudo chown munge: /etc/munge/munge.key
sudo chmod 400 /etc/munge/munge.key

sudo chown -R munge: /etc/munge/ /var/log/munge/
sudo chmod 0700 /etc/munge/ /var/log/munge/

sudo systemctl enable munge
sudo systemctl start munge

#check if the rpm is finished building, if yes then continue to install the rpms that were built
while [ ! -f /scratch/rpm.done ]
do
  sleep 10
done
#install everything in the slurm-rpms folder, the * means everything
sudo yum --nogpgcheck localinstall /scratch/slurm-rpms/* -y

sudo cp /scratch/slurm.conf /etc/slurm/slurm.conf
sudo mkdir /var/spool/slurmd
sudo chown slurm: /var/spool/slurmd
sudo chmod 755 /var/spool/slurmd
sudo touch /var/log/slurmd.log
sudo chown slurm: /var/log/slurmd.log

sudo systemctl enable slurmd.service
sudo systemctl start slurmd.service
