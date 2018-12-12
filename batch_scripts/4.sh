#!/bin/bash  
set -x  
cd /scratch/piresults  
echo "4 nodes"
time mpirun --allow-run-as-root --np 4 --mca btl_base_warn_component_unused 0 /scratch/a.out 10000000 
