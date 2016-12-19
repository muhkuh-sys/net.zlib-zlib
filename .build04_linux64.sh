#! /bin/bash
set -e

#-----------------------------------------------------------------------------
#
# Build the 64bit version.
#
rm -rf build_linux64
mkdir build_linux64
pushd build_linux64
cmake -DCMAKE_C_FLAGS=-m64 -DCMAKE_CXX_FLAGS=-m64 ..
make
popd
