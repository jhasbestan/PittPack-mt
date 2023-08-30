
set(HDF5_ROOT $ENV{HDF5_DIR})

if(NOT HDF5_ROOT)
set(HDF5_ROOT $ENV{HDF5_PATH})
endif()
if(NOT HDF5_ROOT)
	set(HDF5_ROOT $ENV{HDF5_ROOT})
endif()
if(NOT HDF5_ROOT)
	set(HDF5_ROOT $ENV{HDF5_HOME})
endif()


message("HDF direc ${HDF5_ROOT} ${HDF5_DIR}")
set(CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_STATIC_LIBRARY_SUFFIX} )

find_library(HDF5_LIB 
             NAMES "hdf5" 
             PATHS  ${HDF5_ROOT}
             PATH_SUFFIXES "lib"
             NO_DEFAULT_PATH)

set(CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_STATIC_LIBRARY_SUFFIX} )

find_path(HDF5_INCLUDES
          NAMES "hdf5.h"
          PATHS  ${HDF5_ROOT}
          PATH_SUFFIXES "include"
          NO_DEFAULT_PATH)          

#set(HDF_LIB ${HDF5_LIB} CACHE INTERNAL "HDF5 LIBS")

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(HDF5 DEFAULT_MSG HDF5_INCLUDES HDF5_LIB)

