#!/usr/bin/env bash
# @file      full_screen.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
set -e
MARGIN=0
WIDTH=$(expr $(xrandr --query | awk -F '[ x,+]' '/connected primary/{print $4}') - $MARGIN)
HEIGHT=$(expr $(xrandr --query | awk -F '[ x,+]' '/connected primary/{print $5}') - $MARGIN)

# Launch the snapshot gui
flameshot gui &
sleep 0.1

# Save the current mouse location
eval $(xdotool getmouselocation --shell)

# Move the mouse to the top left corner and drag it to to the right bottom corner
xdotool mousemove 0 0
xdotool mousedown 1
xdotool mousemove ${WIDTH} ${HEIGHT}
xdotool mousemove 0 0
xdotool mouseup 1

# Restore mouse to previous location
xdotool mousemove ${X} ${Y}
