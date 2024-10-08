#!/bin/bash

versions="6.6.7 6.6.9 6.7.0 6.7.1 6.7.2 6.7.7"

for ver in $versions; do
    if [ -d "dst/$ver/linux64" ]; then
        :
    else
        mkdir -p "dst/$ver/linux64"
    fi

done

cmake -S. -B build
cmake --build build --config Release --clean-first
rm -rf build

for dir in 6.*; do
if [ -e "$dir/libthostmduserapi_se.so" ]; then
    echo $dir
    cp $dir/libthostmduserapi_se.so dst/$dir/linux64
    rm -rf $dir/libthostmduserapi_se.so
fi
done

read -p "Press any key to continue..."
