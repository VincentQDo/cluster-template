#!/bin/bash
#1.0
sudo yum install openssl openssl-devel pam-devel numactl numactl-devel hwloc hwloc-devel lua lua-devel readline-devel rrdtool-devel ncurses-devel man2html libibmad libibumad -y
cd /scratch/
#link from the tutorial from slothparadise is dead so this is a new link
wget https://download.schedmd.com/slurm/slurm-18.08.3.tar.bz2
#need to install this for RPM to work
sudo yum install perl-ExtUtils-MakeMaker -y

sudo yum install rpm-build
#make sure the slurm version match with the slurm in wget
#this take roughly 13 minutes to complete
sudo rpmbuild -ta slurm-18.08.3.tar.bz2
mkdir /scratch/slurm-rpms
#copy everything from rpmbuild to the shared folder
sudo cp /root/rpmbuild/RPMS/x86_64/* /scratch/slurm-rpms/
#not sure why this command does not work, it cannot open the rpm files
yum --nogpgcheck localinstall slurm-18.08.3-1.el7.x86_64.rpm slurm-example-configs-18.08.3-1.el7.x86_64.rpm  slurm-pam_slurm-18.08.3-1.el7.x86_64.rpm  slurm-slurmd-18.08.3-1.el7.x86_64.rpm slurm-contribs-18.08.3-1.el7.x86_64.rpm  slurm-libpmi-18.08.3-1.el7.x86_64.rpm  slurm-perlapi-18.08.3-1.el7.x86_64.rpm slurm-slurmdbd-18.08.3-1.el7.x86_64.rpm slurm-devel-18.08.3-1.el7.x86_64.rpm slurm-openlava-18.08.3-1.el7.x86_64.rpm  slurm-slurmctld-18.08.3-1.el7.x86_64.rpm  slurm-torque-18.08.3-1.el7.x86_64.rpm -y
