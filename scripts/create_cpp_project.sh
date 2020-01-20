# !/usr/bin/zsh
# @file      create_cpp_project.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved

echo "\e[1m\e[93mCreating a new C++ Project in $(pwd)/\e[0m"
mkdir -p build

echo "\e[1m\e[93mCopying project template \e[0m"
cp $HOME/scripts/cpp_template_project/* .

echo "\e[1m\e[93mCopying configuration files \e[0m"
cp -r $HOME/scripts/cpp_template_project/.vscode .

echo "\e[1m\e[93mBuilding Project\e[0m"
cd build
cmake ..
make all

echo "\e[1m\e[93mTesting...\e[0m"
./main

echo "\e[1m\e[93mDone!\e[0m"
