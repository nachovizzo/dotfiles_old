#!/bin/bash
# @file      show_desktop.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved

desktop_is_shown=$(gsettings get org.gnome.desktop.background show-desktop-icons)

if $desktop_is_shown; then
  gsettings set org.gnome.desktop.background show-desktop-icons false
else
  gsettings set org.gnome.desktop.background show-desktop-icons true
fi
