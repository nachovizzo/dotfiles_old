#!/usr/bin/env zsh
# @file      cppbuild.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
#
# This simple shell script will allow you to build a simple C++/C object using
# the shell, it will use the name of the file as the name of the output binary
# It's not smart, it's not a build system, don't expect too much out of it
source load_colors.zsh

# Get the source filenmae
FILE="$@"

# Get the extension (C oder C++)
EXT="${FILE#*.}"

# Obtain the name of the program
PROGRAM="${FILE%.$EXT}"

if test "$EXT" = "cpp"; then
  echo "${BOLD_WHITE}Building C++ program = ${BOLD_YELLOW}\""$PROGRAM"\"${RESET}..."
  g++ --std=c++17 -Wall -Wextra -g0 -O3 $FILE -o $PROGRAM
elif test "$EXT" = "c"; then
  echo "${BOLD_WHITE}Building C program = ${BOLD_YELLOW}\""$PROGRAM"\"${RESET}..."
  gcc --std=c11 -Wall -Wextra -g0 -O3 $FILE -o $PROGRAM
else
  echo "File extension =\"${BOLD_RED}".$EXT"${RESET}\" not supported, aborting..."
fi

echo "${BOLD_WHITE}Done!${RESET}"
