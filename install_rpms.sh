#!/bin/bash
#not sure why this command does not work, it cannot open the rpm files
yum --nogpgcheck localinstall slurm-18.08.3-1.el7.x86_64.rpm slurm-example-configs-18.08.3-1.el7.x86_64.rpm  slurm-pam_slurm-18.08.3-1.el7.x86_64.rpm  slurm-slurmd-18.08.3-1.el7.x86_64.rpm slurm-contribs-18.08.3-1.el7.x86_64.rpm  slurm-libpmi-18.08.3-1.el7.x86_64.rpm  slurm-perlapi-18.08.3-1.el7.x86_64.rpm slurm-slurmdbd-18.08.3-1.el7.x86_64.rpm slurm-devel-18.08.3-1.el7.x86_64.rpm slurm-openlava-18.08.3-1.el7.x86_64.rpm  slurm-slurmctld-18.08.3-1.el7.x86_64.rpm  slurm-torque-18.08.3-1.el7.x86_64.rpm -y
