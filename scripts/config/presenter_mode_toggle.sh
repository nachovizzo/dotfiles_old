#!/bin/bash
# @file      presenter_mode_toggle.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
PRESENTER_MODE="1280x1024"
NORMAL_MODE="1920x1080"

resolution=$(xrandr --query | awk -F '[ +]' '/connected primary/{print $4}')
if [ $resolution == $NORMAL_MODE ]; then
    xrandr --output eDP-1-1 --mode $PRESENTER_MODE
elif [ $resolution == $PRESENTER_MODE ]; then
    xrandr --output eDP-1-1 --mode $NORMAL_MODE
fi
