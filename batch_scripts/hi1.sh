#!/bin/bash  
set -x  
cd /scratch/helloresults  
echo "1 node hello.c"
time mpirun /scratch/a.out
