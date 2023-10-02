#!/bin/bash
#SBATCH --partition=7773X_RHEL8.7_Power
#SBATCH --job-name=JJH
#SBATCH --mail-user=jaber.hasbestan@amd.com
#SBATCH --mail-type=END,FAIL
#SBATCH --time=23:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --exclusive
#SBATCH --error=slurm-%j.error
#SBATCH --ntasks-per-core=1


module load aocc-4.0
module load hdf5-aocc-ompi
module load aocl-4.0
module load ompi-aocc
#module load hpcx
##moduel load mkl/latest

##export MKL_ENABLE_INSTRUCTIONS=AVX2
#export MKL_NUM_THREADS=8
export OMP_NUM_THREADS=4


nodelist="$(scontrol show hostname $SLURM_NODELIST)"

printf "%s\n" "${nodelist[@]}" > hostfile

#mpirun -np 1 --map-by ppr:1:l3cache:PE=8 ./bin/PittPack 64 64 64 

mpirun -np $SLURM_NTASKS --report-bindings --map-by ppr:2:l3cache:PE=4 ./bin/PittPack 512 512 512

#mpirun -np $SLURM_NTASKS --hostfile hostfile  ./bin/PittPack 128 128 128 
