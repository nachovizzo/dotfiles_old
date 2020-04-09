#!/bin/bash
# @file      keyboard_settings.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
# gsettings set org.gnome.settings-daemon.plugins.keyboard active false

# Use CapsLock as Super key
# Gnome(do once):
# gsettings set org.gnome.desktop.input-sources xkb-options "['caps:super']"
# setxkbmap -option 'caps:super'

# Use CapsLock as Escape key if nothing else is pressed aftwerwards
# notify-send -i keyboard "CapsLock" "Disabled"
xcape -e 'Super_L=Escape' -t 300
