#!/usr/bin/env zsh
# @file      eval_kitti_all.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
source load_colors.zsh
COMMAND="$@"

echo "Running the following command in all KITTI sequnces: ${BOLD_CYAN}${COMMAND}${RESET}"
echo "---------------------------------------------------------------------------------------------"

for SEQ in $(seq -w 00 10); do
    $COMMAND $SEQ
done
