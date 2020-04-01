#!/usr/bin/env sh
# @file      use-gcc-default-toolchain.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
sudo update-alternatives --set cc /usr/bin/gcc
sudo update-alternatives --set c++ /usr/bin/g++
sudo update-alternatives --set ld /usr/bin/x86_64-linux-gnu-ld

# LLVM
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang 40
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 40
sudo update-alternatives --install /usr/bin/ld ld /usr/bin/lld 40
