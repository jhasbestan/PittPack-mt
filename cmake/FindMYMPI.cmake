
set(MPI_ROOT $ENV{MPI_DIR})

if(NOT MPI_ROOT)
set(MPI_ROOT $ENV{MPIDIR})
endif()
if(NOT MPI_ROOT)
set(MPI_ROOT $ENV{MPI_HOME})
endif()
if(NOT MPI_ROOT)
set(MPI_ROOT $ENV{MPIHOME})
endif()
if(NOT MPI_ROOT)
set(MPI_ROOT $ENV{MPIROOT})
endif()
if(NOT MPI_ROOT)
set(MPI_ROOT $ENV{I_MPI_ROOT})
endif()


##message("mpi direc ${MPI_ROOT}")
set(CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_SHARED_LIBRARY_SUFFIX} )

find_library(MPI_LIB 
             NAMES "mpi" 
             PATHS  ${MPI_ROOT}
             PATH_SUFFIXES "lib" "lib64" "lib/release" "intel64/lib"
             NO_DEFAULT_PATH)

find_path(MPI_INCLUDES
          NAMES "mpi.h"
          PATHS  ${MPI_ROOT}
          PATH_SUFFIXES "include" "intel64/include"
          NO_DEFAULT_PATH)  
          
include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(MYMPI DEFAULT_MSG MPI_INCLUDES MPI_LIB)


