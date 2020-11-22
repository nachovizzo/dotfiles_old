#!/usr/bin/env zsh
# @file      ignore.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
source load_colors.zsh
FILES="$@"
echo "Adding $BOLD_YELLOW$FILES$RESET to .gitignore"
echo "$FILES" >> .gitignore
git add .gitignore && git commit -m "Ingore $FILES"

