#!/usr/bin/env zsh
# @file      eval_kitti_all_table.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
source load_colors.zsh

echo "Evaluating full KITTI Odometry benchmark in: ${BOLD_YELLOW}$(pwd)${RESET}"

echo "Translational/Rotational errors:"
echo -n "trans_error: ["
for seq in $(seq -w 00 10); do
    kitti_seq_err $DATASETS/kitti-odometry/dataset/kitti_poses/${seq}.txt *${seq}*txt \
        | tail -n2 \
        | sed -n '1 p' \
        | grep -E ':(.*)' | grep -Eo '[^:]*$' \
        | tr '\n' ","
done
echo "]"

echo -n "rot_error: ["
for seq in $(seq -w 00 10); do
    kitti_seq_err $DATASETS/kitti-odometry/dataset/kitti_poses/${seq}.txt *${seq}*txt \
        | tail -n1 \
        | grep -E ':(.*)' | grep -Eo '[^:]*$' \
        | tr '\n' ","
done
echo "]"
