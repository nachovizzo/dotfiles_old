#!/usr/bin/env sh
# @file      use-llvm-default-toolchain.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
sudo update-alternatives --set cc /usr/bin/clang
sudo update-alternatives --set c++ /usr/bin/clang++
sudo update-alternatives --set ld /usr/bin/lld
