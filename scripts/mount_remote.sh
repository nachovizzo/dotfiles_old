# !/usr/bin/zsh
# @file      mount_remote.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
#
# NOTE: Rememver to add `dataserver` to your /etc/hosts file

# First umount all the mounted remote file systems, just in case
fusermount -q -u $DATASETS/remote

# This comes from my remote home directory, it's my own fault if I meto la pata
echo "\e[1m\e[93mMounting datasets from ~dataserver into $DATASETS/remote/\e[0m"
sshfs -o IdentityFile=$HOME/.ssh/id_rsa \
  nacho@dataserver:/home/nacho/data/ \
  $DATASETS/remote
