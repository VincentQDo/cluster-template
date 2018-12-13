#!/bin/bash  
set -x  
#SBATCH -N 12
echo "12 nodes" 
time mpirun /scratch/a.out 10000000 
