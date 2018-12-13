#!/bin/bash  
#SBATCH -N 12
set -x 
echo "12 nodes" 
time mpirun /scratch/a.out 10000000 
