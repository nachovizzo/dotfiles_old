#!/usr/bin/env zsh
# @file      copy_dir_structure.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
source load_colors.zsh

ORIGIN=$(readlink -f $1)
DESTINATION=$(readlink -f $2)

echo "Copying directory structure from ${BOLD_YELLOW}$ORIGIN${RESET} to ${BOLD_CYAN}$DESTINATION${RESET} "

# Create path if doesn't exits
if [ ! -d "$DESTINATION" ]; then
  mkdir -p "$DESTINATION"
fi

cd $ORIGIN
find -type d -exec mkdir -p -- $DESTINATION/{} \;
