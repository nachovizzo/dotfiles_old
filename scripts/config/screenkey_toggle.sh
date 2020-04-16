#!/bin/bash
# @file      screenkey_toggle.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved

# Basically, if screenkey is running kill it, launch it otherwise
pgrep screenkey >/dev/null && killall screenkey || screenkey
