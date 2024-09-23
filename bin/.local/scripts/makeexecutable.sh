#!/bin/bash
set -e # Exit immediately if any command fails

# If no directory is passed, default to the current working directory (pwd)
dir="${1:-$(pwd)}"

# Recursively find all .sh files in the given directory
find "$dir" -type f -name "*.sh" | while read -r script; do
	# Get the directory and the base name of the script
	script_dir=$(dirname "$script")
	base=$(basename "$script" .sh)

	# Create a symlink without the .sh extension in the same directory
	symlink="$script_dir/$base"

	if [[ ! -f "$symlink" ]]; then
		ln -s "$script" "$symlink"
		echo "Aliased $script to $symlink"
	else
		echo "Skipping $symlink (already exists)"
	fi
done
