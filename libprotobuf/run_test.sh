#!/bin/sh
if [ "`uname`" = "Darwin" ]; then
    # conda sets MACOSX_DEPLOYMENT_TARGET=10.5, but we need to build with
    # -stdlib=libc++
    export MACOSX_DEPLOYMENT_TARGET=10.7
fi
echo "Conda testing env:"
printenv
protoc schema.proto --cpp_out=.
g++ -v -stdlib=libc++ -I${PREFIX}/include -L${PREFIX}/lib -o test test.cc schema.pb.cc -lprotobuf
export DYLD_LIBRARY_PATH=${PREFIX}/lib 
export LD_LIBRARY_PATH=${PREFIX}/lib 
./test
