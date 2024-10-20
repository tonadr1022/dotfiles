#!/bin/bash
set -e # Exit immediately if any command fails

# Build the project
cmake --build build/Debug

# if compile_commands.json symlink in base dir is out of data, symlink it from build/release
if [ -f build/Debug/compile_commands.json ]; then
	if [ ! -L compile_commands.json ] || [ build/Debug/compile_commands.json -nt compile_commands.json ]; then
		ln -sf build/Release/compile_commands.json compile_commands.json
		echo "Updated symlink for compile_commands.json"
	fi
fi

# Check if the executable exists and run it
if [ -f ./build/Debug/"$1" ]; then
	./build/Debug/"$1" "${@:2}"
fi
