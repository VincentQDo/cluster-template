#!/bin/bash
sudo yum install perl-ExtUtils-MakeMaker -y
#make sure the slurm version match with the slurm in wget
#this take roughly 13 minutes to complete
sudo rpmbuild -ta slurm-18.08.3.tar.bz2
mkdir /scratch/slurm-rpms
