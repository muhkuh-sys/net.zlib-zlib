cmake_minimum_required(VERSION 3.7.0)

PROJECT("net.zlib-zlib")

INCLUDE(ExternalProject)

SET(VERSION_EXTERNAL "1.2.14")
SET(VERSION_PACKAGE  "1")
SET(PROJECT_VERSION  "${VERSION_EXTERNAL}.${VERSION_PACKAGE}")

# Enable tests (see here for details: http://www.vtk.org/Wiki/CMake/Testing_With_CTest)
ENABLE_TESTING()

# Python is used for the patch tool.
FIND_PACKAGE(PythonInterp 2.7 REQUIRED)

#----------------------------------------------------------------------------
#
# Build the project.
#

SET(PRJ_CMAKE_ARGS "")
LIST(APPEND PRJ_CMAKE_ARGS "-DCMAKE_C_FLAGS=${CMAKE_C_FLAGS}")
LIST(APPEND PRJ_CMAKE_ARGS "-DCMAKE_SYSTEM_NAME=${CMAKE_SYSTEM_NAME}")
LIST(APPEND PRJ_CMAKE_ARGS "-DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}")
IF(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
	LIST(APPEND PRJ_CMAKE_ARGS "-DCMAKE_RC_COMPILER=${CMAKE_RC_COMPILER}")
ENDIF(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
LIST(APPEND PRJ_CMAKE_ARGS "-DCMAKE_INSTALL_PREFIX=''")
LIST(APPEND PRJ_CMAKE_ARGS "-DPROJECT_VERSION=${PROJECT_VERSION}")


ExternalProject_Add(TARGET_zlib
                    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/zlib-${VERSION_EXTERNAL}
                    URL ${CMAKE_CURRENT_SOURCE_DIR}/zlib-${VERSION_EXTERNAL}.tar.gz
                    URL_HASH SHA1=55eaa84906f31ac20d725aa26cd20839196b6ba6
                    PATCH_COMMAND "${PYTHON_EXECUTABLE}" ${CMAKE_HOME_DIRECTORY}/cmake/tools/apply_patches.py --working-folder ${CMAKE_CURRENT_BINARY_DIR}/zlib-${VERSION_EXTERNAL}/src/TARGET_zlib --patch-folder ${CMAKE_CURRENT_SOURCE_DIR}/patches --copy-folder ${CMAKE_CURRENT_SOURCE_DIR}/copy_over --strip 1
                    CMAKE_ARGS ${PRJ_CMAKE_ARGS}
                    INSTALL_COMMAND make install DESTDIR=${CMAKE_CURRENT_BINARY_DIR}/install
)


#----------------------------------------------------------------------------
#
# Build a package for the selected platform.
#

SET(CPACK_OUTPUT_FILE_PREFIX ${CMAKE_BINARY_DIR}/../repository/net/zlib/zlib/${PROJECT_VERSION})
SET(CPACK_INCLUDE_TOPLEVEL_DIRECTORY FALSE)
SET(CPACK_PACKAGE_FILE_NAME "zlib-${PROJECT_VERSION}-${JONCHKI_PLATFORM}")

SET(CPACK_GENERATOR "TXZ")
INCLUDE(CPack)

# This is the folder where the external project TARGET_zlib installed the files.
SET(SUB_INSTALL_DIR "${CMAKE_CURRENT_BINARY_DIR}/install")


IF(${JONCHKI_PLATFORM_DIST_ID} STREQUAL "windows")
	# Package a windows build.

	INSTALL(FILES ${SUB_INSTALL_DIR}/dev/lib/libz.a
	        DESTINATION dev/lib)

	INSTALL(DIRECTORY ${SUB_INSTALL_DIR}/dev/include
	        DESTINATION dev
	        FILES_MATCHING PATTERN "*.h")

	INSTALL(DIRECTORY ${SUB_INSTALL_DIR}/dev/cmake
	        DESTINATION dev
	        FILES_MATCHING PATTERN "*.cmake")

	CONFIGURE_FILE(installer/install_windows.lua
	               ${CMAKE_CURRENT_BINARY_DIR}/package/install.lua
	               @ONLY)

	INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/package/install.lua
	        DESTINATION .)
ELSE(${JONCHKI_PLATFORM_DIST_ID} STREQUAL "windows")
	# Package a linux build.

	INSTALL(FILES ${SUB_INSTALL_DIR}/dev/lib/libz.a
	        DESTINATION dev/lib)

	INSTALL(DIRECTORY ${SUB_INSTALL_DIR}/dev/include
	        DESTINATION dev
	        FILES_MATCHING PATTERN "*.h")

	INSTALL(DIRECTORY ${SUB_INSTALL_DIR}/dev/cmake
	        DESTINATION dev
	        FILES_MATCHING PATTERN "*.cmake")

	CONFIGURE_FILE(installer/install_linux.lua
	               ${CMAKE_CURRENT_BINARY_DIR}/package/install.lua
	               @ONLY)

	INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/package/install.lua
	        DESTINATION .)
ENDIF(${JONCHKI_PLATFORM_DIST_ID} STREQUAL "windows")

CONFIGURE_FILE(installer/zlib.xml
               ${CPACK_OUTPUT_FILE_PREFIX}/zlib-${PROJECT_VERSION}-${JONCHKI_PLATFORM}.xml
               @ONLY)


#-----------------------------------------------------------------------------
#
# Create a custom target named "pack".
# It builds the package and creates the hashes.
#
ADD_CUSTOM_TARGET(pack
                  COMMAND ${CMAKE_MAKE_PROGRAM}
                  COMMAND ${CMAKE_MAKE_PROGRAM} package
                  COMMAND "${PYTHON_EXECUTABLE}" ${CMAKE_HOME_DIRECTORY}/cmake/tools/generate_hash.py ${CPACK_OUTPUT_FILE_PREFIX}/zlib-${PROJECT_VERSION}-${JONCHKI_PLATFORM}.xml
                  COMMAND "${PYTHON_EXECUTABLE}" ${CMAKE_HOME_DIRECTORY}/cmake/tools/generate_hash.py ${CPACK_OUTPUT_FILE_PREFIX}/zlib-${PROJECT_VERSION}-${JONCHKI_PLATFORM}.tar.xz
                  COMMENT "Pack the artifact and generate the hashes...")


#-----------------------------------------------------------------------------
#
# Filter the pom.xml file.
#
SET(POM_ARTIFACT_ID  "zlib")
SET(POM_GROUP_ID     "net.zlib")
SET(POM_VERSION      "${PROJECT_VERSION}")
SET(POM_PACKAGING    "tar.xz")
CONFIGURE_FILE(installer/pom.xml ${CPACK_OUTPUT_FILE_PREFIX}/zlib-${PROJECT_VERSION}.pom)
