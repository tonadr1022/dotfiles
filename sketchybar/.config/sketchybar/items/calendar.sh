#!/bin/bash

sketchybar --add item calendar right \
    --set calendar icon=LOL \
    update_freq=30 \
    script="$PLUGIN_DIR/calendar.sh"
