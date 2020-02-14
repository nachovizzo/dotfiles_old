# @file      kitti_gt.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
for SEQ in $(seq -w 0 10); do
  eval KITTI_GT_${SEQ}='$DATASETS/dataserver/kitti-odometry/dataset/poses/${SEQ}.txt'
done
