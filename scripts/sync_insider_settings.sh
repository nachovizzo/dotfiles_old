#!/usr/bin/env bash
# @file      sync_insider_settings.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
# Taken from https://www.growingwiththeweb.com/2016/03/share-settings-in-vscode.html

INSIDERS_CONFIG="$HOME/.config/Code - Insiders/User"
STABLE_CONFIG="$HOME/.config/Code/User"

# First clean whatever is in the insiders folder
rm "$INSIDERS_CONFIG/keybindings.json" 2>/dev/null
rm "$INSIDERS_CONFIG/settings.json" 2>/dev/null

ln -s "$STABLE_CONFIG/keybindings.json" \
      "$INSIDERS_CONFIG/keybindings.json"
ln -s "$STABLE_CONFIG/settings.json" \
      "$INSIDERS_CONFIG/settings.json"
