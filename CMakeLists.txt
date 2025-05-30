cmake_minimum_required(VERSION 2.8)

PROJECT("net.zlib-zlib")

INCLUDE(cmake/version.cmake)
INCLUDE(cmake/platform.cmake)
MESSAGE("Building for: ${JONCHKI_PLATFORM}")

#----------------------------------------------------------------------------
#
# Include the projects in the subdirectories.
#
ADD_SUBDIRECTORY(zlib)


#----------------------------------------------------------------------------
