#!/usr/bin/env zsh
# @file      mount_remote.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
#
source load_colors.zsh

# First umount all the mounted remote file systems, just in case
mkdir -p $DATASETS/remote
fusermount -q -u $DATASETS/remote

# This comes from my remote home directory, it's my own fault if I meto la pata
echo "${BOLD_YELLOW}Mounting datasets from ${BOLD_CYAN}ipb24${BOLD_YELLOW} into $DATASETS/remote/${RESET}"
sshfs -o reconnect,ro,ServerAliveInterval=15,ServerAliveCountMax=3,IdentityFile=$HOME/.ssh/id_rsa \
  ipb24:$HOME/data/ \
  $DATASETS/remote
