#!/bin/bash  
set -x  
cd /scratch/piresults  
echo "10 nodes"
time mpirun --allow-run-as-root --np 10 --mca btl_base_warn_component_unused 0 /scratch/a.out 10000000 
