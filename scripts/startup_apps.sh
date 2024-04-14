#!/bin/bash

# Open Alacritty in workspace 1
alacritty &

# Wait for Alacritty to open
sleep 1

# Move Alacritty window to workspace 1
wid=$(wmctrl -l | grep "Alacritty" | awk '{print $1}')
wmctrl -i -r $wid -t 1

# Open Chrome in workspace 2
google-chrome &

# Wait for Chrome to open
sleep 1

# Move Chrome window to workspace 2
wid=$(wmctrl -l | grep "Google Chrome" | awk '{print $1}')
wmctrl -i -r $wid -t 2

# Open another instance of Chrome in workspace 3
google-chrome &

# Wait for Chrome to open
sleep 1

# Move Chrome window to workspace 3
wid=$(wmctrl -l | grep "Google Chrome" | awk '{print $1}')
wmctrl -i -r $wid -t 3

# Open CLion in workspace 4
clion &

# Wait for CLion to open
sleep 1

# # Move CLion window to workspace 4
# wid=$(wmctrl -l | grep "CLion" | awk '{print $1}')
# wmctrl -i -r $wid -t 4
