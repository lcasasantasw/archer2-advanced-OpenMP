#!/bin/bash 
#SBATCH --job-name=streams
#SBATCH --nodes=1
#SBATCH --tasks-per-node=128
#SBATCH --cpus-per-task=1
#SBATCH --time=0:20:0
#SBATCH --partition=standard
#SBATCH --qos=standard
#SBATCH --account=ta088

export OMP_PROC_BIND=close
echo "1 thread"
export OMP_NUM_THREADS=1
srun ./stream_d
echo "2 threads"
export OMP_NUM_THREADS=2
srun ./stream_d
echo "3 threads"
export OMP_NUM_THREADS=3
srun ./stream_d
echo "8 threads"
export OMP_NUM_THREADS=8
srun ./stream_d
echo "16 threads"
export OMP_NUM_THREADS=16
srun ./stream_d
echo "32 threads"
export OMP_NUM_THREADS=32
srun ./stream_d
echo "64 threads"
export OMP_NUM_THREADS=64
srun ./stream_d
echo "128 threads"
export OMP_NUM_THREADS=128
srun ./stream_d
export OMP_PROC_BIND=spread
echo "16 threads across chiplets"
export OMP_NUM_THREADS=16
srun ./stream_d
echo "32 threads across chiplets"
export OMP_NUM_THREADS=32
srun ./stream_d
echo "64 threads across chiplets"
export OMP_NUM_THREADS=64
srun ./stream_d
