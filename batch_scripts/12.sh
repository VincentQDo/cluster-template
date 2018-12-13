#!/bin/bash  
#SBATCH -N 12
echo "12 nodes" 
time mpirun /scratch/a.out 10000000 
#SBATCH -N 10
echo "10 nodes" 
time mpirun /scratch/a.out 10000000 
