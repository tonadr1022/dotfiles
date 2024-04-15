#!/bin/bash

alacritty &
google-chrome &
flatpak run com.discordapp.Discord

wmctrl -s 0
