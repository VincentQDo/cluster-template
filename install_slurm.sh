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
#this may take a while to complete 
sudo rpmbuild -ta slurm-18.08.3.tar.bz2
