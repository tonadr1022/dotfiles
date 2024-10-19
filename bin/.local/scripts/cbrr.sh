#!/bin/bash
set -e # Exit immediately if any command fails

# Create the build directory if it doesn't exist
mkdir -p build/Release

# Run CMake from the base directory, but specify the output directory as build/Release
cmake -S . -B build/Release -GNinja -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld" -DCMAKE_BUILD_TYPE=Release

brr.sh "$1"
