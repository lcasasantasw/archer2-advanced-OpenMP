#!/bin/bash

# Slurm job options (job-name, compute nodes, job time)
#SBATCH --job-name=mpca
#SBATCH --time=0:10:0
#SBATCH --nodes=1
#SBATCH --tasks-per-node=32
#SBATCH --cpus-per-task=4

# Replace [budget code] below with your project code (e.g. t01)
#SBATCH --account=ta088 
#SBATCH --partition=standard
#SBATCH --qos=standard


# Set the number of threads to 16 and specify placement
#   There are 16 OpenMP threads per MPI process
#   We want one thread per physical core
export OMP_NUM_THREADS=4
export OMP_PLACES=cores

# Launch the parallel job
srun --hint=nomultithread --distribution=block:block ./mpca.x
