#!/usr/bin/env sh
# @file      config-toolchain-alternatives.sh
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
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30 \
  --slave /usr/bin/c++ c++ /usr/bin/g++ \
  --slave /usr/bin/ld ld /usr/bin/x86_64-linux-gnu-ld

# LLVM
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang 40 \
  --slave /usr/bin/c++ c++ /usr/bin/clang++ \
  --slave /usr/bin/ld ld /usr/bin/lld
