#!/bin/bash
#SBATCH --partition=7773X_RHEL8.7_Power
#SBATCH --job-name=JJH
#SBATCH --mail-user=jaber.hasbestan@amd.com
#SBATCH --mail-type=END,FAIL
#SBATCH --time=23:00:00
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive
#SBATCH --error=slurm-%j.error
#SBATCH --ntasks-per-core=1


module load icc
##module load hdf5-icc-hpcx
module load mkl
module load hpcx

export LD_PRELOAD=/mnt/share/codes/hpl/libfakeintel.so
export  MKL_ENABLE_INSTRUCTIONS=AVX2


nodelist="$(scontrol show hostname $SLURM_NODELIST)"

printf "%s\n" "${nodelist[@]}" > hostfile

mpirun -np 32 --hostfile hostfile --map-by ppr:1:l3cache:PE=4 ./bin/PittPack 576 576 576
#mpirun -np $SLURM_NTASKS --hostfile hostfile  ./bin/PittPack 128 128 128 
