#!/usr/bin/env zsh
# @file      push_subdirs.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
source load_colors.zsh
PWD=$(pwd)
DIRS=$(ls -d *)
echo "${BOLD_CYAN}Updating all the sub-repositories we find in $PWD"
for repo in $DIRS; do
  if [ -d $repo/.git ]; then
    echo "${BOLD_YELLOW}Updating git repository found in $repo ...${RESET}"
    cd $repo
    git push
    cd ../
  fi
done
echo "done"
