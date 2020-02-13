#!/usr/bin/env zsh
# @file      mount_remote.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
#
# First umount all the mounted remote file systems, just in case
source load_colors.zsh
mkdir -p $DATASETS/remote
fusermount -q -u $DATASETS/remote

# This comes from my remote home directory, it's my own fault if I meto la pata
echo "${BOLD_YELLOW}Mounting datasets from ~dataserver into $DATASETS/remote/${RESET}"
sshfs -o IdentityFile=$HOME/.ssh/id_rsa \
  nacho@dataserver:/home/nacho/dev/datasets \
  $DATASETS/remote
