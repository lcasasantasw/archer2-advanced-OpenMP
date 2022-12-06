#!/bin/bash

# Slurm job options (job-name, compute nodes, job time)
#SBATCH --job-name=Mandelbrot
#SBATCH --time=0:10:0
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=128

# Replace [budget code] below with your project code (e.g. t01)
#SBATCH --account=ta088
# We use the "standard" partition as we are running on CPU nodes
#SBATCH --partition=standard
#SBATCH --qos=standard

#   We want one thread per physical core
export OMP_PLACES=cores
#   Bind threads to cores in order
export OMP_PROC_BIND=close


export OMP_NUM_THREADS=16

# Launch the parallel job
#   Additional srun options to pin one thread per physical core
srun --hint=nomultithread ./md

