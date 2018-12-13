#!/bin/bash  
set -x  
echo "4 nodes"
time mpirun --np 4 /scratch/a.out 10000000 
