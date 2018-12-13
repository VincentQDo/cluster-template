#!/bin/bash  
set -x  
echo "12 nodes"
time mpirun --np 12 /scratch/a.out 10000000 
