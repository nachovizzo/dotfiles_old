#!/usr/bin/env zsh
# @file      ping_till_alive.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
source load_colors.zsh

HOST="$1"
printf "%s" "${BOLD_CYAN}ping ${BOLD_YELLOW}${HOST}${BOLD_CYAN} until it becoms alive ${RESET}"
while ! timeout 1 ping -c 1 -n $HOST &>/dev/null; do
  printf "%c" "."
  sleep 1
done
printf "\n%s\n" "${BOLD_YELLOW}${HOST}${BOLD_CYAN} is online"
notify-send "${HOST} is online"
