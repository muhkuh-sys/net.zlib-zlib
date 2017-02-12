cmake_minimum_required(VERSION 2.8)

PROJECT("net.zlib-zlib")


# Enable tests (see here for details: http://www.vtk.org/Wiki/CMake/Testing_With_CTest)
ENABLE_TESTING()


#----------------------------------------------------------------------------
#
# Find all packages.
#

# Python is used for some test scripts.
FIND_PACKAGE(PythonInterp 2.7 REQUIRED)


#----------------------------------------------------------------------------
#
# Set custom definitions for several compiler.
#

# Microsoft: Do not show msvs security warnings about unsafe functions.
if(${CMAKE_BUILD_TOOL} MATCHES "(msdev|VCExpress|devenv|nmake)")
	add_definitions(-D_CRT_SECURE_NO_WARNINGS)
	add_definitions(-D_CRT_SECURE_NO_DEPRECATE)
ENDIF(${CMAKE_BUILD_TOOL} MATCHES "(msdev|VCExpress|devenv|nmake)")


# Microsoft: Set warning level to 2.
if(${CMAKE_BUILD_TOOL} MATCHES "(msdev|VCExpress|devenv)")
	add_definitions(/W2)
ENDIF(${CMAKE_BUILD_TOOL} MATCHES "(msdev|VCExpress|devenv)")


#----------------------------------------------------------------------------
#
# Include the projects in the subdirectories.
#

ADD_SUBDIRECTORY(zlib)


#----------------------------------------------------------------------------
