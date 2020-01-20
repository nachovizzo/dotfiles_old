# !/usr/bin/zsh
# @file      mount_datasets.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
#
# NOTE: Rememver to add `dataserver` to your /etc/hosts file

# First umount all the mounted remote file systems, just in case
sudo umount $DATASETS/dataserver
sudo umount $DATASETS/remote

# Mount this directory as read only so we don't screw up anything
echo "\e[1m\e[93mMounting datasets from dataserver into $DATASETS/dataserver/\e[0m"
sudo sshfs -o allow_other,default_permissions,IdentityFile=$HOME/.ssh/id_rsa \
  nacho@dataserver:/export/datasets/ \
  $DATASETS/dataserver

# This comes from my remote home directory, it's my own fault if I meto la pata
echo "\e[1m\e[93mMounting datasets from ~dataserver into $DATASETS/remote/\e[0m"
sshfs -o IdentityFile=$HOME/.ssh/id_rsa \
  nacho@dataserver:/home/nacho/data/ \
  $DATASETS/remote
