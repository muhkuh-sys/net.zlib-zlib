#! /bin/bash
set -e

#-----------------------------------------------------------------------------
#
# Build all artefacts.
#
pushd build
rm -rf net.zlib-zlib
rm -rf windows_x86
rm -rf windows_x86_64
rm -rf ubuntu_1404_x86
rm -rf ubuntu_1404_x86_64
rm -rf ubuntu_1604_x86
rm -rf ubuntu_1604_x86_64
rm -rf ubuntu_1610_x86
rm -rf ubuntu_1610_x86_64
rm -rf ubuntu_1704_x86
rm -rf ubuntu_1704_x86_64

mkdir net.zlib-zlib
mkdir windows_x86
mkdir windows_x86_64
mkdir ubuntu_1404_x86
mkdir ubuntu_1404_x86_64
mkdir ubuntu_1604_x86
mkdir ubuntu_1604_x86_64
mkdir ubuntu_1610_x86
mkdir ubuntu_1610_x86_64
mkdir ubuntu_1704_x86
mkdir ubuntu_1704_x86_64

tar --extract --directory windows_x86 --file build_windows_x86.tar.gz --gzip
tar --extract --directory windows_x86_64 --file build_windows_x86_64.tar.gz --gzip
tar --extract --directory ubuntu_1404_x86 --file build_ubuntu_1404_x86.tar.gz --gzip
tar --extract --directory ubuntu_1404_x86_64 --file build_ubuntu_1404_x86_64.tar.gz --gzip
tar --extract --directory ubuntu_1604_x86 --file build_ubuntu_1604_x86.tar.gz --gzip
tar --extract --directory ubuntu_1604_x86_64 --file build_ubuntu_1604_x86_64.tar.gz --gzip
tar --extract --directory ubuntu_1610_x86 --file build_ubuntu_1610_x86.tar.gz --gzip
tar --extract --directory ubuntu_1610_x86_64 --file build_ubuntu_1610_x86_64.tar.gz --gzip
tar --extract --directory ubuntu_1704_x86 --file build_ubuntu_1704_x86.tar.gz --gzip
tar --extract --directory ubuntu_1704_x86_64 --file build_ubuntu_1704_x86_64.tar.gz --gzip
popd

pushd build/net.zlib-zlib
cmake -DCMAKE_INSTALL_PREFIX="" ../../zlib/installer
make
make package
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/net/zlib/zlib/*/zlib-*.xml
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/net/zlib/zlib/*/zlib-*.tar.xz
popd
