#!/bin/sh
protoc schema.proto --cpp_out=.
g++ -I${PREFIX}/include -L${PREFIX}/lib -o test test.cc schema.pb.cc -lprotobuf
export DYLD_LIBRARY_PATH=${PREFIX}/lib 
export LD_LIBRARY_PATH=${PREFIX}/lib 
./test
