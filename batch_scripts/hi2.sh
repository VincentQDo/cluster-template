#!/bin/bash  
set -x  
cd /scratch/helloresults  
echo "2 nodes hello.c"
time mpirun --allow-run-as-root --np 2 --mca btl_base_warn_component_unused 0 /scratch/a.out
