#!/bin/bash  
set -x  
echo "8 nodes"
time mpirun --np 8 /scratch/a.out 10000000 
