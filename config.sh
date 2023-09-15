#! /usr/bin/bash



module load aocc-4.1
module load hdf5-aocc-ompi
module load aocl-4.0
module load ompi-aocc


cd build && cmake .. -DCMAKE_BUILD_TYPE=release -DENABLE_THREAD=true -DNO_HDF5=true && make -j 8 && make install && cd ../


