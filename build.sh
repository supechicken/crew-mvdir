#!/bin/bash -ex

mkdir -p builddir
cd builddir

# build shared library
cc -shared -fPIC ${1:-CFLAGS} ../src/mvdir.c -o crew-mvdir.so

# build CLI for use in install.sh
cc ${1:-CFLAGS} -L . -l:crew-mvdir.so ../src/main.c -o crew-mvdir

# build ruby binding for use in crew
ruby ../src/ruby_binding/extconf.rb
make -j"$(nproc)"

echo 'Build completed.'
