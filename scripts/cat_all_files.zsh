#!/usr/bin/env zsh
# @file      cat_all_files.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
source load_colors.zsh

for source in *; do
  echo "${BOLD_YELLOW}$source:${RESET}"
  cat $source && echo
done
