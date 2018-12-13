#!/bin/bash  
set -x  
echo "6 nodes"
time mpirun --np 6 /scratch/a.out 10000000 
