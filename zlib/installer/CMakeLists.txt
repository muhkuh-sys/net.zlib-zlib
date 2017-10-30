CMAKE_MINIMUM_REQUIRED(VERSION 3.7)

PROJECT("net.zlib-zlib-artifact")

INCLUDE(../../cmake/version.cmake)

SET(INSTALL_WINDOWS_x86        ${CMAKE_CURRENT_SOURCE_DIR}/../../build/windows_x86)
SET(INSTALL_WINDOWS_x86_64     ${CMAKE_CURRENT_SOURCE_DIR}/../../build/windows_x86_64)
SET(INSTALL_UBUNTU_1404_x86    ${CMAKE_CURRENT_SOURCE_DIR}/../../build/ubuntu_1404_x86)
SET(INSTALL_UBUNTU_1404_x86_64 ${CMAKE_CURRENT_SOURCE_DIR}/../../build/ubuntu_1404_x86_64)
SET(INSTALL_UBUNTU_1604_x86    ${CMAKE_CURRENT_SOURCE_DIR}/../../build/ubuntu_1604_x86)
SET(INSTALL_UBUNTU_1604_x86_64 ${CMAKE_CURRENT_SOURCE_DIR}/../../build/ubuntu_1604_x86_64)
SET(INSTALL_UBUNTU_1704_x86    ${CMAKE_CURRENT_SOURCE_DIR}/../../build/ubuntu_1704_x86)
SET(INSTALL_UBUNTU_1704_x86_64 ${CMAKE_CURRENT_SOURCE_DIR}/../../build/ubuntu_1704_x86_64)
SET(INSTALL_UBUNTU_1710_x86    ${CMAKE_CURRENT_SOURCE_DIR}/../../build/ubuntu_1710_x86)
SET(INSTALL_UBUNTU_1710_x86_64 ${CMAKE_CURRENT_SOURCE_DIR}/../../build/ubuntu_1710_x86_64)

# Get the version from one of the packages.
SET(net.zlib-zlib_DIR ${INSTALL_WINDOWS_x86}/dev/cmake)
FIND_PACKAGE("net.zlib-zlib" REQUIRED)
SET(PROJECT_VERSION ${net.zlib-zlib_VERSION})

SET(CPACK_OUTPUT_FILE_PREFIX targets/jonchki/repository/net/zlib/zlib/${PROJECT_VERSION})
SET(CPACK_INCLUDE_TOPLEVEL_DIRECTORY FALSE)
SET(CPACK_PACKAGE_FILE_NAME "zlib-${PROJECT_VERSION}")

SET(CPACK_GENERATOR "TXZ")
INCLUDE(CPack)


#-----------------------------------------------------------------------------
#
# Install the Windows_x86 files.
#
INSTALL(FILES ${INSTALL_WINDOWS_x86}/dev/lib/libz.a
        DESTINATION windows_x86/dev/lib
)

INSTALL(DIRECTORY ${INSTALL_WINDOWS_x86}/dev/include
        DESTINATION windows_x86/dev
        FILES_MATCHING PATTERN "*.h"
)

INSTALL(DIRECTORY ${INSTALL_WINDOWS_x86}/dev/cmake
        DESTINATION windows_x86/dev
        FILES_MATCHING PATTERN "*.cmake"
)


#-----------------------------------------------------------------------------
#
# Install the Windows_x86_64 files.
#
INSTALL(FILES ${INSTALL_WINDOWS_x86_64}/dev/lib/libz.a
        DESTINATION windows_x86_64/dev/lib
)

INSTALL(DIRECTORY ${INSTALL_WINDOWS_x86_64}/dev/include
        DESTINATION windows_x86_64/dev
        FILES_MATCHING PATTERN "*.h"
)

INSTALL(DIRECTORY ${INSTALL_WINDOWS_x86_64}/dev/cmake
        DESTINATION windows_x86_64/dev
        FILES_MATCHING PATTERN "*.cmake"
)


#-----------------------------------------------------------------------------
#
# Install the Ubuntu_1404_x86 files.
#
INSTALL(FILES ${INSTALL_UBUNTU_1404_x86}/dev/lib/libz.a
        DESTINATION ubuntu_1404_x86/dev/lib
)

INSTALL(DIRECTORY ${INSTALL_UBUNTU_1404_x86}/dev/include
        DESTINATION ubuntu_1404_x86/dev
        FILES_MATCHING PATTERN "*.h"
)

INSTALL(DIRECTORY ${INSTALL_UBUNTU_1404_x86}/dev/cmake
        DESTINATION ubuntu_1404_x86/dev
        FILES_MATCHING PATTERN "*.cmake"
)


#-----------------------------------------------------------------------------
#
# Install the Ubuntu_1404_x86_64 files.
#
INSTALL(FILES ${INSTALL_UBUNTU_1404_x86_64}/dev/lib/libz.a
        DESTINATION ubuntu_1404_x86_64/dev/lib
)

INSTALL(DIRECTORY ${INSTALL_UBUNTU_1404_x86_64}/dev/include
        DESTINATION ubuntu_1404_x86_64/dev
        FILES_MATCHING PATTERN "*.h"
)

INSTALL(DIRECTORY ${INSTALL_UBUNTU_1404_x86_64}/dev/cmake
        DESTINATION ubuntu_1404_x86_64/dev
        FILES_MATCHING PATTERN "*.cmake"
)


#-----------------------------------------------------------------------------
#
# Install the Ubuntu_1604_x86 files.
#
INSTALL(FILES ${INSTALL_UBUNTU_1604_x86}/dev/lib/libz.a
        DESTINATION ubuntu_1604_x86/dev/lib
)

INSTALL(DIRECTORY ${INSTALL_UBUNTU_1604_x86}/dev/include
        DESTINATION ubuntu_1604_x86/dev
        FILES_MATCHING PATTERN "*.h"
)

INSTALL(DIRECTORY ${INSTALL_UBUNTU_1604_x86}/dev/cmake
        DESTINATION ubuntu_1604_x86/dev
        FILES_MATCHING PATTERN "*.cmake"
)


#-----------------------------------------------------------------------------
#
# Install the Ubuntu_1604_x86_64 files.
#
INSTALL(FILES ${INSTALL_UBUNTU_1604_x86_64}/dev/lib/libz.a
        DESTINATION ubuntu_1604_x86_64/dev/lib
)

INSTALL(DIRECTORY ${INSTALL_UBUNTU_1604_x86_64}/dev/include
        DESTINATION ubuntu_1604_x86_64/dev
        FILES_MATCHING PATTERN "*.h"
)

INSTALL(DIRECTORY ${INSTALL_UBUNTU_1604_x86_64}/dev/cmake
        DESTINATION ubuntu_1604_x86_64/dev
        FILES_MATCHING PATTERN "*.cmake"
)


#-----------------------------------------------------------------------------
#
# Install the Ubuntu_1704_x86 files.
#
INSTALL(FILES ${INSTALL_UBUNTU_1704_x86}/dev/lib/libz.a
        DESTINATION ubuntu_1704_x86/dev/lib
)

INSTALL(DIRECTORY ${INSTALL_UBUNTU_1704_x86}/dev/include
        DESTINATION ubuntu_1704_x86/dev
        FILES_MATCHING PATTERN "*.h"
)

INSTALL(DIRECTORY ${INSTALL_UBUNTU_1704_x86}/dev/cmake
        DESTINATION ubuntu_1704_x86/dev
        FILES_MATCHING PATTERN "*.cmake"
)


#-----------------------------------------------------------------------------
#
# Install the Ubuntu_1704_x86_64 files.
#
INSTALL(FILES ${INSTALL_UBUNTU_1704_x86_64}/dev/lib/libz.a
        DESTINATION ubuntu_1704_x86_64/dev/lib
)

INSTALL(DIRECTORY ${INSTALL_UBUNTU_1704_x86_64}/dev/include
        DESTINATION ubuntu_1704_x86_64/dev
        FILES_MATCHING PATTERN "*.h"
)

INSTALL(DIRECTORY ${INSTALL_UBUNTU_1704_x86_64}/dev/cmake
        DESTINATION ubuntu_1704_x86_64/dev
        FILES_MATCHING PATTERN "*.cmake"
)


#-----------------------------------------------------------------------------
#
# Install the Ubuntu_1710_x86 files.
#
INSTALL(FILES ${INSTALL_UBUNTU_1710_x86}/dev/lib/libz.a
        DESTINATION ubuntu_1710_x86/dev/lib
)

INSTALL(DIRECTORY ${INSTALL_UBUNTU_1710_x86}/dev/include
        DESTINATION ubuntu_1710_x86/dev
        FILES_MATCHING PATTERN "*.h"
)

INSTALL(DIRECTORY ${INSTALL_UBUNTU_1710_x86}/dev/cmake
        DESTINATION ubuntu_1710_x86/dev
        FILES_MATCHING PATTERN "*.cmake"
)


#-----------------------------------------------------------------------------
#
# Install the Ubuntu_1710_x86_64 files.
#
INSTALL(FILES ${INSTALL_UBUNTU_1710_x86_64}/dev/lib/libz.a
        DESTINATION ubuntu_1710_x86_64/dev/lib
)

INSTALL(DIRECTORY ${INSTALL_UBUNTU_1710_x86_64}/dev/include
        DESTINATION ubuntu_1710_x86_64/dev
        FILES_MATCHING PATTERN "*.h"
)

INSTALL(DIRECTORY ${INSTALL_UBUNTU_1710_x86_64}/dev/cmake
        DESTINATION ubuntu_1710_x86_64/dev
        FILES_MATCHING PATTERN "*.cmake"
)


#-----------------------------------------------------------------------------

INSTALL(FILES install.lua
        DESTINATION .)


CONFIGURE_FILE(zlib.xml
               ${CPACK_OUTPUT_FILE_PREFIX}/zlib-${PROJECT_VERSION}.xml
               @ONLY)


#-----------------------------------------------------------------------------
#
# Filter the pom.xml file.
#
SET(POM_ARTIFACT_ID  "zlib")
SET(POM_GROUP_ID     "net.zlib")
SET(POM_VERSION      "${PROJECT_VERSION}")
SET(POM_PACKAGING    "tar.xz")
CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/pom.xml ${CPACK_OUTPUT_FILE_PREFIX}/zlib-${PROJECT_VERSION}.pom)
