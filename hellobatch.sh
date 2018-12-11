mpicc hello.c -lm
mkdir helloresults
sbatch -N 1 /local/repository/batch_scripts/hi1.sh
sbatch -N 2 /local/repository/batch_scripts/hi2.sh
sbatch -N 3 /local/repository/batch_scripts/hi3.sh
