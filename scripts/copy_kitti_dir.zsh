#!/usr/bin/env zsh
# @file      copy_kitti_dir.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
# This script will copy-paste a KITTI like directory into a new one, but empty
# of data. This means, that it will copy all the directory structure and the
# *.txt files as well
source load_colors.zsh

ORIGIN=$(readlink -f $1)
DESTINATION=$(readlink -f $2)

cat << EOF
Copying all directory structure and all ${BOLD_RED}.txt${RESET} files.
Origin     : ${BOLD_YELLOW}$ORIGIN${RESET}
Destination: ${BOLD_CYAN}$DESTINATION${RESET}
EOF

# Create path if doesn't exits
if [ ! -d "$DESTINATION" ]; then
    mkdir -p "$DESTINATION"
fi

cd $ORIGIN
find -type d -exec mkdir -p -- $DESTINATION/{} \;
cd ..

# Copy all the *.txt files to destination
rsync -a             \
    --include '*/'   \
    --include '*.txt'\
    --exclude '*'    \
    ${ORIGIN}/* ${DESTINATION}
