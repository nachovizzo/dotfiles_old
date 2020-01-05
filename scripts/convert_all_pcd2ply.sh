# !/usr/bin/zsh
# @file      convert_all_pcd2ply.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved

# For now, let's do it in the current working directory
PWD=$(pwd)
echo "\e[1m\e[36mConverting all .pcd scans we find in $PWD ...\e[0m"

for SCAN in $PWD/*.pcd; do
  [ -f "$SCAN" ] || continue
  SCAN_NAME="${SCAN%.*}"
  pcl_pcd2ply $SCAN $SCAN_NAME.ply -format 1 -use_camera 0
done
