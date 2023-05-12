#! /usr/bin/bash



module load icc
module load hdf5-icc-hpcx
module load mkl
module load hpcx

export CC=icc
export CXX=icpc

cd build && cmake .. && make -j 8 && cd ../


