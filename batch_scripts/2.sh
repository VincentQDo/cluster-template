#!/bin/bash  
set -x  
echo "2 nodes"
time mpirun --np 2 /scratch/a.out 10000000 
