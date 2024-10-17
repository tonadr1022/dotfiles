#!/bin/bash
set -e # Exit immediately if any command fails

if [[ -z "$1" ]]; then
	echo "Usage: cbr <executable name>"
	exit 1
fi

# Create the build directory if it doesn't exist
mkdir -p build/Debug

# Run CMake from the base directory, but specify the output directory as build/Release
cmake -S . -B build/Debug -GNinja -DCMAKE_EXE_LINKER_FLAGS="-fuse-ld=lld" -DCMAKE_BUILD_TYPE=Debug

br.sh $1
