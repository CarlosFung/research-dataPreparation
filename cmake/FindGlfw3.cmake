# Locate the glfw3 library
#
# This module defines the following variables:
#
# GLFW3_LIBRARY      the name of the library;
# GLFW3_INCLUDE_DIR  where to find glfw include files.
# GLFW3_FOUND        true if both the GLFW3_LIBRARY and GLFW3_INCLUDE_DIR have been found.
#
# To help locate the library and include file, you can define a 
# variable called GLFW3_ROOT which points to the root of the glfw library 
# installation.
#

# default search dirs
set( _glfw3_HEADER_SEARCH_DIRS 
  "/usr/include"
  "/usr/local/include"
  "../../SDK/include"
  "../SDK/include"
  "./SDK/include"
  "C:/Program Files (x86)/glfw/include" 
  "/usr/local/Cellar/glfw3/3.0.4/include"
  "C:/SDK/glfw-3.2.1/include"

  )
set( _glfw3_LIB_SEARCH_DIRS
  "/usr/lib"
  "/usr/local/lib"
  "C:/Program Files (x86)/glfw/lib-msvc110" 
  "../../SDK/lib/Release"
  "../SDK/lib/Release"
   "C:/SDK/glfw-3.2.1/lib"
  )

# Check environment for root search directory
set( _glfw3_ENV_ROOT $ENV{GLFW3_ROOT} )
if( NOT GLFW3_ROOT AND _glfw3_ENV_ROOT )
  set(GLFW3_ROOT ${_glfw3_ENV_ROOT} )
endif()

# Put user specified location at beginning of search
if( GLFW3_ROOT )
  list( INSERT _glfw3_HEADER_SEARCH_DIRS 0 "${GLFW3_ROOT}/include" )
  list( INSERT _glfw3_LIB_SEARCH_DIRS 0 "${GLFW3_ROOT}/lib" )
endif()

# Search for the header 
FIND_PATH(GLFW3_INCLUDE_DIR "GLFW/glfw3.h"
  PATHS ${_glfw3_HEADER_SEARCH_DIRS} )

# Search for the library
FIND_LIBRARY(GLFW3_LIBRARY NAMES glfw3 glfw libglfw3
  PATHS ${_glfw3_LIB_SEARCH_DIRS} )

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GLFW3 DEFAULT_MSG
GLFW3_LIBRARY GLFW3_INCLUDE_DIR)