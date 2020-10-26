#!/usr/bin/env zsh
# @file      eval_kitti_all_table.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
source load_colors.zsh

echo "Evaluating full KITTI Odometry benchmark in: ${BOLD_CYAN}$(pwd)${RESET}"
echo "------------------------------------------------------------------------------------------------------"

for seq in $(seq -w 00 10); do
    kitti_seq_err $DATASETS/kitti-odometry/dataset/poses/${seq}.txt *${seq}*txt \
        | tail -n2 \
        | grep -Eo '[0-9]+\.[0-9]+' \
        | tr '\n' ", "
done
echo "\n------------------------------------------------------------------------------------------------------"
