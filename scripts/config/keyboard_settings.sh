#!/bin/bash
# @file      keyboard_settings.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved

# Use CapsLock as Super key
# Gnome(do once):
# gsettings set org.gnome.desktop.input-sources xkb-options "['caps:super']"
# setxkbmap -option 'caps:super'

# Just change this line:
#   key <CAPS> {        [ Caps_Lock               ]       };
# For this:
#   key <CAPS> {        [ Super_L                 ]       };
#   key <F12>  {        [ Super_L                 ]       };
