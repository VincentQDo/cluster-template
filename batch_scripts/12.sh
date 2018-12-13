#!/bin/bash  
#SBATCH -N 12
set -x  
echo "12 nodes"
time mpirun --np 2 /scratch/a.out 10000000 
time mpirun --np 4 /scratch/a.out 10000000 
time mpirun --np 6 /scratch/a.out 10000000 
time mpirun --np 8 /scratch/a.out 10000000 
time mpirun --np 10 /scratch/a.out 10000000 
time mpirun --np 12 /scratch/a.out 10000000 
