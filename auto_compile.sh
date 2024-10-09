#!/bin/bash

versions="6.6.7 6.6.9 6.7.0 6.7.1 6.7.2 6.7.7"

for ver in $versions; do
    if [ -d "dst/$ver/linux64" ]; then
        :
    else
        mkdir -p "dst/$ver/linux64"
    fi

done

echo "################################ build project #################"
cmake -S. -B build

echo
echo
echo "################################ start building #################"
cmake --build build --config Release --clean-first

echo
echo
echo "################################ delete project files #################"
rm -rf build

echo
echo
echo "################################ move library #################"
for dir in 6.*; do
if [ -e "$dir/libthostmduserapi_se.so" ]; then
    echo $dir
    mv $dir/libthostmduserapi_se.so dst/$dir/linux64
fi
done

read -p "Press any key to continue..."
