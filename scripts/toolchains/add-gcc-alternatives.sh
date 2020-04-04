#!/usr/bin/env sh
# @file      add-gcc-alternatives.sh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 \
  --slave /usr/bin/g++ g++ /usr/bin/g++-9

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 \
  --slave /usr/bin/g++ g++ /usr/bin/g++-7

sudo update-alternatives --set gcc /usr/bin/gcc-9
