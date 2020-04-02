#!/bin/bash
# @file      presenter_mode_toggle.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
PRESENTER_MODE="1400x1050"
NORMAL_MODE="1920x1080"

resolution=$(xrandr --query | awk -F '[ +]' '/\<connected\>/{print $4}')
if [ $resolution == $NORMAL_MODE ]; then
  xrandr --size $PRESENTER_MODE
elif [ $resolution == $PRESENTER_MODE ]; then
  xrandr --size $NORMAL_MODE
fi
