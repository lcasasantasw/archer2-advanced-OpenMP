#!/bin/bash

# Slurm job options (job-name, compute nodes, job time)
#SBATCH --job-name=Mandelbrot
#SBATCH --time=0:10:0
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=2

# Replace [budget code] below with your project code (e.g. t01)
#SBATCH --account=ta088
# We use the "standard" partition as we are running on CPU nodes
#SBATCH --partition=standard
#SBATCH --qos=standard


#   We want one thread per physical core
#export OMP_PLACES=cores
#   Bind threads to cores in order
#export OMP_PROC_BIND=spread


export OMP_NUM_THREADS=2


# Launch the parallel job
#   Additional srun options to pin one thread per physical core
echo "Running on cores 0 and 1"
srun --hint=nomultithread --cpu-bind=mask_cpu:0x3 ./coherency
echo "Running on cores 0 and 4"
srun --hint=nomultithread --cpu-bind=mask_cpu:0x11 ./coherency
echo "Running on cores 0 and 16"
srun --hint=nomultithread --cpu-bind=mask_cpu:0x10001 ./coherency
echo "Running on cores 0 and 64"
srun --hint=nomultithread --cpu-bind=mask_cpu:0x10000000000000001 ./coherency

