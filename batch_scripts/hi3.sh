#!/bin/bash  
set -x  
cd /scratch/helloresults  
echo "3 nodes hello.c"
time mpirun --allow-run-as-root --np 3 --mca btl_base_warn_component_unused 0 /scratch/a.out
