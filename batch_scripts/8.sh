#!/bin/bash  
set -x  
cd /scratch/piresults  
echo "8 nodes"
time mpirun --allow-run-as-root --np 8 --mca btl_base_warn_component_unused 0 /scratch/a.out 10000000 
