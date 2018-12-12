#generate a munge key
/usr/sbin/create-munge-key -f
#make the group own the key file
chown -R munge:munge /etc/munge/munge.key
#change the permission to 400
sudo chmod 400 /etc/munge/munge.key
#copy the key file to scratch to allow other compute nodes to see it and copy it later
sudo cp /etc/munge/munge.key /scratch/

sudo chown -R munge: /etc/munge/ /var/log/munge/
sudo chmod 0700 /etc/munge/ /var/log/munge/

sudo systemctl enable munge
sudo systemctl start munge

cd /scratch/
#link from the tutorial from slothparadise is dead so this is a new link
wget https://download.schedmd.com/slurm/slurm-18.08.3.tar.bz2

sudo yum install perl-ExtUtils-MakeMaker -y
sudo rpmbuild -ta /scratch/slurm-18.08.3.tar.bz2

mkdir /scratch/slurm-rpms
sudo cp /root/rpmbuild/RPMS/x86_64/* /scratch/slurm-rpms/
#create a flag to let others know that rpm is done building
sudo touch /scratch/rpm.done
#install everything in the slurm-rpms folder
sudo yum --nogpgcheck localinstall /scratch/slurm-rpms/* -y

while [ ! -f /scratch/slurm.conf ]
do
  sleep 10
done
sudo cp /scratch/slurm.conf /etc/slurm/
sudo mkdir /var/spool/slurmctld
sudo chown slurm: /var/spool/slurmctld
sudo chmod 755 /var/spool/slurmctld
sudo touch /var/log/slurmctld.log
sudo chown slurm: /var/log/slurmctld.log
sudo touch /var/log/slurm_jobacct.log /var/log/slurm_jobcomp.log
sudo chown slurm: /var/log/slurm_jobacct.log /var/log/slurm_jobcomp.log

sudo systemctl enable slurmctld
sudo systemctl start slurmctld

sudo touch /scratch/head.done

while [ ! -f /scratch/cluster.done ]
do
  sleep 5
done

#restart slurmctld daemon
sudo systemctl restart slurmctld
