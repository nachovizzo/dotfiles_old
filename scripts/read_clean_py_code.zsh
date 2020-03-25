#!/usr/bin/env zsh
# @file    read_clean_py_code.zsh
# @author  Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, University of Bonn.
source load_colors.zsh

echo "Linking ${BOLD_CYAN}~/.clean_py_code.json${RESET} to ${BOLD_BLUE}.vscode/settings.json${RESET}"
mkdir -p .vscode/
if [ -f .vscode/settings.json ]; then
  mv .vscode/settings.json .vscode/settings.json.bak
fi
ln -s vscode_settings_templates/.clean_py_code.json .vscode/settings.json
echo "done"