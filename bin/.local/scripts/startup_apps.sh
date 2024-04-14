#!/bin/bash

# Open applications
google-chrome &
alacritty &

# Wait for a short moment to allow windows to appear
sleep 0.5

# Define workspace numbers for each application
alacritty_ws=1
chrome_ws=2

# Get window IDs for each application
alacritty_id=$(wmctrl -lx | grep "Alacritty.Alacritty" | awk '{print $1}')
chrome_id=$(wmctrl -lx | grep "google-chrome.Google-chrome" | awk '{print $1}')

# focus alacritty
xdotool windowactivate --sync "$chrome_id"

xdotool keydown Escape
xdotool keyup Escape
xdotool keydown Shift super+2
xdotool keyup Shift super+2

xdotool keydown super+1
xdotool keyup super+1

# # Move windows to desired workspaces
# wmctrl -ir "$chrome_id" -t $chrome_ws
# wmctrl -ir "$alacritty_id" -t $alacritty_ws
# sleep 0.5
#
# xdotool type "tmux"
# xdotool keydown Return
# xdotool keyup Return
#
# sleep 0.5
#
# xdotool keydown Return
# xdotool keyup Return
#
# sleep 0.5
#
# xdotool keydown Control
# xdotool key a
# xdotool keyup Control
#
# sleep 0.5
#
# xdotool keydown Control
# xdotool key r
# xdotool keyup Control
