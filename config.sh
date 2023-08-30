#! /usr/bin/bash


module load aocc-4.0
module load aocl-4.0
module load ompi-aocc
module load hdf5-aocc-ompi



cd build && cmake .. && make -j 8 && cd ../bin


