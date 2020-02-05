# !/usr/bin/zsh
# @file      mount_datasets.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
#
# NOTE: Rememver to add `dataserver` to your /etc/hosts file

# First umount all the mounted remote file systems, just in case
fusermount -q -u $DATASETS/dataserver

# Mount this directory as read only so we don't screw up anything
echo "\e[1m\e[93mMounting datasets from dataserver into $DATASETS/dataserver/\e[0m"
sshfs -o ro,IdentityFile=$HOME/.ssh/id_rsa \
  nacho@dataserver:/export/datasets/ \
  $DATASETS/dataserver

