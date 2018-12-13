#!/bin/bash  
set -x  

#SBATCH -N 2
echo "2 nodes" 
time mpirun /scratch/a.out 10000000 
#SBATCH -N 4
echo "4 nodes" 
time mpirun /scratch/a.out 10000000 
#SBATCH -N 6
echo "6 nodes" 
time mpirun /scratch/a.out 10000000 
#SBATCH -N 8
echo "8 nodes" 
time mpirun /scratch/a.out 10000000 
#SBATCH -N 10
echo "10 nodes" 
time mpirun /scratch/a.out 10000000 
#SBATCH -N 12
echo "12 nodes" 
time mpirun /scratch/a.out 10000000 
