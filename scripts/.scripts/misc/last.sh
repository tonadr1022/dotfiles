#!/bin/bash

app_name=$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true')

file="$HOME/floating_apps.txt"

if ! grep -Fxq "$app_name" "$file" 2>/dev/null; then
	echo "$app_name" >>"$file"
	/opt/homebrew/bin/yabai --restart-service
fi
