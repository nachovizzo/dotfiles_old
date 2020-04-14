#!/usr/bin/env bash
# @file      full_screen.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
WIDTH=$(xrandr --query | awk -F '[ x,+]' '/\<connected\>/{print $4}')
HEIGHT=$(xrandr --query | awk -F '[ x,+]' '/\<connected\>/{print $5}')

# Launch the snapshot gui
flameshot gui && sleep 0.05

# Save the current mouse location
eval $(xdotool getmouselocation --shell)

# Move the mouse to the top left corner and drag it to to the right bottom corner
xdotool mousemove 0 0
xdotool mousedown 1 # pres and hold
xdotool mousemove ${WIDTH} ${HEIGHT}
xdotool mouseup 1 # release click

# Restore mouse to previous location
xdotool mousemove ${X} ${Y}
