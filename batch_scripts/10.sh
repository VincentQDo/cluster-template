#!/bin/bash  
set -x  
echo "10 nodes"
time mpirun --np 10 /scratch/a.out 10000000 
