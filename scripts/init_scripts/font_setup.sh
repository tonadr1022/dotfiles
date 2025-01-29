#!/bin/bash

mkdir -p ~/.local/share/fonts

# Define font URLs
FONT_URLS=(
	"https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz"
	# Add more font URLs here if needed
)

install_fonts() {
	local url="$1"
	local filename=$(basename "$url")
	local fontname="${filename%.tar.xz}" # Remove the .tar.xz extension from filename

	mkdir -p "$fontname" # Create a directory for extracting fonts
	cd "$fontname" || exit

	# Download and extract font
	echo "Downloading $filename..."
	curl -OL "$url"
	tar -xf "$filename"

	# Install fonts
	echo "Installing fonts..."
	mv ./*.ttf ~/.local/share/fonts/

	# Clean up
	cd ..
	rm -rf "$fontname"
	rm "$filename"

	# Refresh font cache
	echo "Refreshing font cache..."
	fc-cache -f -v

	echo "$fontname installation complete."
}

# Iterate over font URLs and install fonts
for url in "${FONT_URLS[@]}"; do
	install_fonts "$url"
done

echo "All font installations complete."
