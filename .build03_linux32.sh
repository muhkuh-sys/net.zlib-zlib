#! /bin/bash
set -e

#-----------------------------------------------------------------------------
#
# Build the 32bit version.
#
rm -rf build_linux32
mkdir build_linux32
pushd build_linux32
cmake -DCMAKE_C_FLAGS=-m32 -DCMAKE_CXX_FLAGS=-m32 ..
make
popd
