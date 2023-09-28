#! /usr/bin/bash


module purge
module load aocc-4.0
module load ompi-aocc
module load hdf5-aocc-ompi
module load mkl/latest

cd build && cmake .. -DCMAKE_BUILD_TYPE=release -DNO_HDF5=true  -DMKL=true && make -j 8 && make install && cd ../


