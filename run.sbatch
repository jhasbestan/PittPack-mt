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
module load hdf5-icc-hpcx
module load mkl
module load hpcx

nodelist="$(scontrol show hostname $SLURM_NODELIST)"

printf "%s\n" "${nodelist[@]}" > hostfile

mpirun -np 16 --hostfile hostfile --map-by ppr:1:l3cache:PE=8 ./bin/PittPack 256 256 256
#mpirun -np $SLURM_NTASKS --hostfile hostfile  ./bin/PittPack 128 128 128 
