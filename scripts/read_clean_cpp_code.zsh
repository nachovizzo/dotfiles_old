#!/usr/bin/env zsh
# @file    read_clean_cpp_code.zsh
# @author  Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, University of Bonn.
source load_colors.zsh

echo "Copying ${BOLD_CYAN}~/scripts/vscode_settings_templates/.clean_cpp_code.json${RESET} to ${BOLD_BLUE}.vscode/settings.json${RESET}"
mkdir -p .vscode/
cat .vscode/settings.json >/dev/null 2>&1 && mv .vscode/settings.json .vscode/settings.json.bak
cp $HOME/scripts/vscode_settings_templates/.clean_cpp_code.json .vscode/settings.json
echo "done"
