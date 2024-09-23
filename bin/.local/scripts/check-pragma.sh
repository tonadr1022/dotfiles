#!/bin/bash

# Function to check if the first line of a file is "#pragma once"
check_pragma_once() {
    file="$1"
    first_line=$(head -n 1 "$file")
    if [ "$first_line" != "#pragma once" ]; then
        echo "$file: Failed - First line is not '#pragma once'"
    fi
}

# Function to recursively check all .h files in a directory
check_directory() {
    directory="$1"
    find "$directory" -type f -name "*.h" | while read -r file; do
        check_pragma_once "$file"
    done
    find "$directory" -type f -name "*.hpp" | while read -r file; do
        check_pragma_once "$file"
    done
}

# Main script
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 directory"
    exit 1
fi

directory="$1"
if [ ! -d "$directory" ]; then
    echo "Error: '$directory' is not a valid directory"
    exit 1
fi

check_directory "$directory"
