#!/bin/bash
# @file      keyboard_settings.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
# gsettings set org.gnome.settings-daemon.plugins.keyboard active false

# Use CapsLock as Super key
setxkbmap -option 'caps:super' && notify-send -i keyboard "CapsLock" "Disabled"

# Use CapsLock as Escape key if nothing else is pressed aftwerwards
xcape -e 'Super_L=Escape' -t 300
