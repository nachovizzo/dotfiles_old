#!/usr/bin/env zsh
# @file      convert_all_pcd2ply.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved

# For now, let's do it in the current working directory
source load_colors.zsh
PWD=$(pwd)
echo "${BOLD_CYAN}Converting all .pcd scans we find in $PWD ...${RESET}"

for SCAN in $PWD/*.pcd; do
  [ -f "$SCAN" ] || continue
  SCAN_NAME="${SCAN%.*}"
  pcl_pcd2ply $SCAN $SCAN_NAME.ply -format 1 -use_camera 0
done
