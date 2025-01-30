#!/bin/bash

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
	echo "Please run as root (use sudo)."
	exit 1
fi

CONFIG_FILE="/etc/gdm3/custom.conf"

# Check if the file exists
if [ ! -f "$CONFIG_FILE" ]; then
	echo "Configuration file not found: $CONFIG_FILE"
	exit 1
fi

# Create a backup of the original file
BACKUP_FILE="${CONFIG_FILE}.backup.$(date +%Y%m%d%H%M%S)"
echo "Creating backup at $BACKUP_FILE"
cp "$CONFIG_FILE" "$BACKUP_FILE"

# Enable Wayland by modifying the configuration
if grep -q "^#\?WaylandEnable=.*" "$CONFIG_FILE"; then
	sed -i 's/^#\?WaylandEnable=.*/WaylandEnable=true/' "$CONFIG_FILE"
	echo "Wayland has been enabled successfully."
else
	echo "WaylandEnable directive not found. Appending to the configuration file."
	echo "WaylandEnable=true" >>"$CONFIG_FILE"
fi

echo "Changes complete. Please restart your system to apply the changes."
