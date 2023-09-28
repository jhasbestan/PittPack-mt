#! /usr/bin/bash



module load icc/latest
module load impi/latest
module load mkl/latest

cd build && cmake .. -DCMAKE_BUILD_TYPE=release -DNO_HDF5=true && make -j 8 && make install && cd ../


