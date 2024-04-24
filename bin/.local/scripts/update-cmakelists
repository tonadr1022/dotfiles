#!/bin/bash

CMAKELISTS_FILE="CMakeLists.txt"

# change to directory for relative paths
cd $1

# Find all .cpp files in the source directory
CPP_FILES=$(find "." -type f -name "*.cpp")

# Create the set(SOURCES ...) line
SOURCES_LINE="set(SOURCES"
for FILE in $CPP_FILES; do
	FILE=${FILE#./}         # Remove "./" prefix
	SOURCES_LINE+="\n$FILE" # add file name
done
SOURCES_LINE+="\n)"

# Check if the set(SOURCES ...) line already exists in CMakeLists.txt
if grep -q "set(SOURCES" "$CMAKELISTS_FILE"; then
	# If it exists, delete the entire block and append the new one
	sed -i '/set(SOURCES/,/)/c\'"$SOURCES_LINE" "$CMAKELISTS_FILE"
else
	echo "need 'set(SOURCES )' line in $CMAKELISTS_FILE and for the file to exist"
fi

echo "Added .cpp files to set(SOURCES ...) in $CMAKELISTS_FILE"
