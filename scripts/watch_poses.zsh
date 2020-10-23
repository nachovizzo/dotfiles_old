#!/usr/bin/env zsh
# @file      watch_poses.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
FILE="$@"
watch -t -n1 'echo "['$FILE'] Poses estimated so far: $(<'${FILE}' wc -l)"'
