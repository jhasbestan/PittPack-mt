#! /usr/bin/bash



module load hdf5-icc-hpcx
module load icc
module load mkl
module load hpcx


cd build && cmake .. && make -j 8 && cd ../bin


