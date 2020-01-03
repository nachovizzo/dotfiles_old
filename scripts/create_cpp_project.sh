# !/usr/bin/zsh
# @file      create_cpp_project.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved

echo "\e[1m\e[93mCreating a new C++ Project in $(pwd)/\e[0m"
mkdir -p build

echo "\e[1m\e[93mCreating CMakeLists.txt \e[0m"
echo "cmake_minimum_required(VERSION 3.10)
project(test_project)
set(CMAKE_CXX_STANDARD 14)

set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_CXX_FLAGS \"-Wall -Wextra\")
set(CMAKE_CXX_FLAGS_DEBUG \"-g -O0\")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(main main.cpp)" >CMakeLists.txt

echo "\e[1m\e[93mCreating main.cpp \e[0m"
echo "// @file      main.cpp
// @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
//
// Copyright (c) 2019 Ignacio Vizzo, all rights reserved
#include <iostream>

int main() {
  std::cout << \"Ready to hack!\" << std::endl;
  return 0;
}" >main.cpp

echo "\e[1m\e[93mBuilding Project\e[0m"
cd build
cmake ..
make all

echo "\e[1m\e[93mTesting...\e[0m"
./main

echo "\e[1m\e[93mDone!\e[0m"
