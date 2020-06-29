#!/usr/bin/env zsh
# @file      run-clang-format.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
source load_colors.zsh

sources=$(find . -regextype posix-extended -regex \
    ".*\.(cpp|cxx|cc|hpp|hxx|h)" |
    grep -vE "^./(build)/")

echo "${BOLD_YELLOW}Running clang-format on all project sources...${RESET}"
# clang-format -Werror --dry-run --ferror-limit=1 -style=file ${sources}
clang-format -i -style=file ${sources}
