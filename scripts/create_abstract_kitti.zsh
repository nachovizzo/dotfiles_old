#!/usr/bin/env zsh
# @file      create_abstract_kitti.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved

# This script will copy-paste a KITTI like directory into a new one called
# "abstract", you could use this abstract dataset to create new KITTI-like
# datasets.
source load_colors.zsh

# First copy all the directory structure from the original dataset
dataset=$1
abstract=$2
$HOME/scripts/copy_kitti_dir.zsh $dataset $abstract

cat << EOF
Creating symbolic links to the following folders (if they exists):
${BOLD_YELLOW}image_2${RESET}
${BOLD_YELLOW}image_3${RESET}
${BOLD_YELLOW}labels${RESET}
EOF

# Create a function to replicate functionallity
function create_symbolic_link() {
    folder=$1
    src=$(readlink -f $dataset/sequences/$seq/$folder/)
    dst=$(readlink -f $abstract/sequences/$seq/)
    if [ -d "$dst/$folder" ]; then
        rmdir $dst/$folder
        ln -fs $src $dst
    fi
}

# Make symbolic links for everything expect for the velodyne/ folder
for seq in $(seq -w 00 21); do
    # Make symbolic links for these 3 folders
    create_symbolic_link "image_2"
    create_symbolic_link "image_3"
    create_symbolic_link "labels"
done

echo "KITTI-Abstract Created Successfully!"
tree -d $abstract/
