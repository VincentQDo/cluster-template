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
yum --nogpgcheck localinstall slurm-15.08.9-1.el7.centos.x86_64.rpm slurm-devel-15.08.9-1.el7.centos.x86_64.rpm slurm-munge-15.08.9-1.el7.centos.x86_64.rpm slurm-perlapi-15.08.9-1.el7.centos.x86_64.rpm slurm-plugins-15.08.9-1.el7.centos.x86_64.rpm slurm-sjobexit-15.08.9-1.el7.centos.x86_64.rpm slurm-sjstat-15.08.9-1.el7.centos.x86_64.rpm slurm-torque-15.08.9-1.el7.centos.x86_64.rpm
