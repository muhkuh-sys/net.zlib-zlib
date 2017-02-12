#! /bin/bash
set -e

#-----------------------------------------------------------------------------
#
# Build the linux version.
#
rm -rf build/linux
mkdir build/linux
pushd build/linux
cmake ../..
make
popd
