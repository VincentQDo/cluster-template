#!/bin/bash  
set -x  
cd /scratch/helloresults  
echo "1 node hello.c"
time mpirun --allow-run-as-root --np 1 --mca btl_base_warn_component_unused 0 /scratch/a.out
