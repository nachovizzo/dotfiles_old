#!/usr/bin/env zsh
# @file      create_cpp_project.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
source load_colors.zsh

echo "${BOLD_YELLOW}Creating a new C++ Project in $(pwd)/${RESET}"
mkdir -p build

echo "${BOLD_YELLOW}Copying project template ${RESET}"
cp $HOME/scripts/cpp_template_project/* .

echo "${BOLD_YELLOW}Copying configuration files ${RESET}"
cp -r $HOME/scripts/cpp_template_project/.vscode .

echo "${BOLD_YELLOW}Building Project${RESET}"
cd build
cmake \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
  -DCMAKE_BUILD_TYPE=Debug \
  ..
make all

echo "${BOLD_YELLOW}Testing...${RESET}"
./main

echo "${BOLD_YELLOW}Done!${RESET}"
