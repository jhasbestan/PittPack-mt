
set(MKL_ROOT $ENV{MKLROOT})
message("MKL direc ${MKL_ROOT} ${MKL_DIR}")
set(CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_SHARED_LIBRARY_SUFFIX} )

find_library(MKL_LIB0 
             NAMES "mkl_core"  
             PATHS  ${MKL_ROOT}
             PATH_SUFFIXES "lib/intel64"
             NO_DEFAULT_PATH)


#find_library(MKL_LIB1 
#             NAMES "mkl_blacs_openmpi_lp64" 
#             PATHS  ${MKL_ROOT}
#             PATH_SUFFIXES "lib/intel64"
#             NO_DEFAULT_PATH)

#find_library(MKL_LIB3 
#             NAMES "mkl_blacs_intelmpi_lp64"  
#             PATHS  ${MKL_ROOT}
#             PATH_SUFFIXES "lib/intel64"
#             NO_DEFAULT_PATH)

find_library(MKL_LIB4 
             NAMES "mkl_blacs_intelmpi_lp64" 
             PATHS  ${MKL_ROOT}
             PATH_SUFFIXES "lib/intel64"
             NO_DEFAULT_PATH)

find_library(MKL_LIB5 
             NAMES "mkl_intel_lp64" 
             PATHS  ${MKL_ROOT}
             PATH_SUFFIXES "lib/intel64"
             NO_DEFAULT_PATH)

find_library(MKL_LIB6 
             NAMES "mkl_intel_lp64" 
             PATHS  ${MKL_ROOT}
             PATH_SUFFIXES "lib/intel64"
             NO_DEFAULT_PATH)

find_library(MKL_LIB9 
             NAMES "mkl_cdft_core" 
             PATHS  ${MKL_ROOT}
             PATH_SUFFIXES "lib/intel64"
             NO_DEFAULT_PATH)


if(DEFINED ENABLE_THREAD)
find_library(MKL_LIB7 
             NAMES "mkl_intel_thread" 
             PATHS  ${MKL_ROOT}
             PATH_SUFFIXES "lib/intel64"
             NO_DEFAULT_PATH)
else()
find_library(MKL_LIB7 
             NAMES "mkl_sequential" 
             PATHS  ${MKL_ROOT}
             PATH_SUFFIXES "lib/intel64"
             NO_DEFAULT_PATH)
endif()

#find_library(MKL_LIB8 
#             NAMES "mkl_scalapack_lp64" 
#             PATHS  ${MKL_ROOT}
#             PATH_SUFFIXES "lib/intel64"
#             NO_DEFAULT_PATH)

#find_library(MKL_LIB9 
#             NAMES "mkl_scalapack_ilp64" 
#             PATHS  ${MKL_ROOT}
#             PATH_SUFFIXES "lib/intel64"
#             NO_DEFAULT_PATH)

find_library(MKL_LIB2 
             NAMES "mkl_rt" 
             PATHS  ${MKL_ROOT}
             PATH_SUFFIXES "lib/intel64"
             NO_DEFAULT_PATH)

set(CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_STATIC_LIBRARY_SUFFIX} )
 
find_path(MKL_INCLUDES
          NAMES "fftw3.h"
          PATHS  ${MKL_ROOT}
          PATH_SUFFIXES "include/fftw"
          NO_DEFAULT_PATH)          

#set(MKL_LIB ${MKL_LIB0} ${MKL_LIB1} ${MKL_LIB2} ${MKL_LIB3} ${MKL_LIB4} ${MKL_LIB5} ${MKL_LIB6}  ${MKL_LIB7} ${MKL_LIB9} CACHE INTERNAL "MKL LIBS")
set(MKL_LIB ${MKL_LIB0} ${MKL_LIB6} ${MKL_LIB7} ${MKL_LIB9} CACHE INTERNAL "MKL LIBS")

message("MKL lib" ${MKL_LIB})
include(FindPackageHandleStandardArgs)
#link_directories(${MKL_ROOT}/lib/intel64)
find_package_handle_standard_args(MYMKL DEFAULT_MSG MKL_INCLUDES MKL_LIB)

