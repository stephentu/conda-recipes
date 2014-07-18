#!/bin/sh
CXXFLAGS=-I${PREFIX}/include LDFLAGS=-L${PREFIX}/lib ./configure --prefix=${PREFIX}
make -j
make install
