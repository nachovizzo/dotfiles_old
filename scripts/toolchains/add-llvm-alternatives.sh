#!/usr/bin/env sh
# @file      add-llvm-alternatives.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved

# Remove all existing alternatives
sudo update-alternatives --remove-all cc
sudo update-alternatives --remove-all c++
sudo update-alternatives --remove-all ld

# exit on first error
set -e

# GCC
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
sudo update-alternatives --install /usr/bin/ld ld /usr/bin/x86_64-linux-gnu-ld 30

# LLVM
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang 40
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 40
sudo update-alternatives --install /usr/bin/ld ld /usr/bin/lld 40
