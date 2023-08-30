
set(AOCL_ROOT $ENV{AOCL_DIR})

if(NOT AOCL_ROOT)
set(AOCL_ROOT $ENV{AOCL_PATH})
endif()
if(NOT AOCL_ROOT)
	set(AOCL_ROOT $ENV{AOCL_ROOT})
endif()
if(NOT AOCL_ROOT)
	set(AOCL_ROOT $ENV{AOCL_HOME})
endif()




##message("AOCL direc ${AOCL_ROOT} ${AOCL_DIR}")
set(CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_SHARED_LIBRARY_SUFFIX} )

if(DEFINED ENABLE_THREAD)
find_library(BLIS_LIB 
             NAMES "blis-mt" 
             PATHS  ${AOCL_ROOT}
             PATH_SUFFIXES "lib"
             NO_DEFAULT_PATH)

find_library(FFTW_LIB 
             NAMES "fftw3_omp" 
             PATHS  ${AOCL_ROOT}
             PATH_SUFFIXES "lib"
             NO_DEFAULT_PATH)
else()
find_library(BLIS_LIB 
             NAMES "blis" 
             PATHS  ${AOCL_ROOT}
             PATH_SUFFIXES "lib"
             NO_DEFAULT_PATH)
endif()
find_library(FFTW_LIB 
             NAMES "fftw3" 
             PATHS  ${AOCL_ROOT}
             PATH_SUFFIXES "lib"
             NO_DEFAULT_PATH)

find_library(ALM_LIB 
             NAMES "alm" 
             PATHS  ${AOCL_ROOT}
             PATH_SUFFIXES "lib"
             NO_DEFAULT_PATH)
find_library(FLAME_LIB 
             NAMES "flame" 
             PATHS  ${AOCL_ROOT}
             PATH_SUFFIXES "lib"
             NO_DEFAULT_PATH)

set(CMAKE_FIND_LIBRARY_SUFFIXES ${CMAKE_STATIC_LIBRARY_SUFFIX} )
#find_library(MATH_LIB 
#             NAMES "amdlibm" 
#             PATHS  ${AOCL_ROOT}
#             PATH_SUFFIXES "lib"
#             NO_DEFAULT_PATH)

#find_path(AOCL_INCLUDES
#          NAMES "cblas.h"
#          PATHS  ${AOCL_ROOT}
#          PATH_SUFFIXES "include"
#          NO_DEFAULT_PATH)  
 
find_path(AOCL_INCLUDES
          NAMES "blis.h"
          PATHS  ${AOCL_ROOT}
          PATH_SUFFIXES "include"
          NO_DEFAULT_PATH)          

find_path(FFTW_INCLUDES
          NAMES "fftw3.h"
          PATHS  ${AOCL_ROOT}
          PATH_SUFFIXES "include"
          NO_DEFAULT_PATH)          

set(AOCL_LIB ${MATH_LIB} ${BLISS_LIB} ${FLAME_LIB} ${ALM_LIB} CACHE INTERNAL "AOCL LIBS")
set(BLAS_LIBRARIES ${BLISS_LIB})
set(LAPACK_LIBRARIES ${FLAME_LIB} ${BLIS_LIB})

include(FindPackageHandleStandardArgs)

#find_package_handle_standard_args(MYAOCL DEFAULT_MSG AOCL_INCLUDES AOCL_LIB)

