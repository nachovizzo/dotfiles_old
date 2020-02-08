#!/usr/bin/env zsh
# @file      mount_datasets.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
#
# NOTE: Rememver to add `dataserver` to your /etc/hosts file
source load_colors.zsh

# First umount all the mounted remote file systems, just in case
mkdir -p $DATASETS/dataserver
fusermount -q -u $DATASETS/dataserver

# Mount this directory as read only so we don't screw up anything
echo "${BOLD_YELLOW}Mounting datasets from dataserver into $DATASETS/dataserver/${RESET}"
sshfs -o ro,IdentityFile=$HOME/.ssh/id_rsa \
  nacho@dataserver:/export/datasets/ \
  $DATASETS/dataserver
