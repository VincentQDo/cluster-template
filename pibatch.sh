mpicc pi_mc.c -lm
mkdir piresults
sbatch -N 2 /local/repository/batch_scripts/2.sh
sbatch -N 4 /local/repository/batch_scripts/4.sh
sbatch -N 6 /local/repository/batch_scripts/6.sh
sbatch -N 8 /local/repository/batch_scripts/8.sh
sbatch -N 10 /local/repository/batch_scripts/10.sh
sbatch -N 12 /local/repository/batch_scripts/12.sh
