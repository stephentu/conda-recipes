#!/bin/sh
export CXXFLAGS="-I${PREFIX}/include" 
export LDFLAGS="-L${PREFIX}/lib"
export PKG_CONFIG_PATH="${PREFIX}/lib/pkgconfig"
./configure --prefix=${PREFIX} --without-zlib
make -j
make install
