#!/bin/bash
set -e # Exit immediately if any command fails

# Build the project
cmake --build build/Release

# if compile_commands.json symlink in base dir is out of data, symlink it from build/release
if [ -f build/Release/compile_commands.json ]; then
	if [ ! -L compile_commands.json ] || [ build/Release/compile_commands.json -nt compile_commands.json ]; then
		ln -sf build/Release/compile_commands.json compile_commands.json
		echo "Updated symlink for compile_commands.json"
	fi
fi

# Check if the executable exists and run it
if [ -f ./build/Release/"$1" ]; then
	./build/Release/"$1" "${@:2}"
fi
