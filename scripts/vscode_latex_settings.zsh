#!/usr/bin/env zsh
# @file      vscode_latex_settings
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
source load_colors.zsh
echo "Linking ${BOLD_CYAN}~/.latex_papers.json.json${RESET} to ${BOLD_BLUE}.vscode/settings.json${RESET}"
mkdir -p .vscode/
if [ -f .vscode/settings.json ]; then
  mv .vscode/settings.json .vscode/settings.json.bak
fi
ln -s vscode_settings_templates/.latex_papers.json .vscode/settings.json
echo "done"
