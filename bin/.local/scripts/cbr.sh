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

# Build the project
cmake --build build/Debug

# Check if the executable exists and run it
if [ -f ./build/Debug/$1 ]; then
	./build/Debug/$1
else
	exit 1
fi

# if compile_commands.json symlink in base dir is out of data, symlink it from build/release
if [ -f build/Debug/compile_commands.json ]; then
	if [ ! -L compile_commands.json ] || [ build/Debug/compile_commands.json -nt compile_commands.json ]; then
		ln -sf build/Release/compile_commands.json compile_commands.json
		echo "Updated symlink for compile_commands.json"
	fi
fi
