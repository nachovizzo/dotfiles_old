#!/usr/bin/env zsh
# @file      extract_audio.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
source load_colors.zsh

INFILE="$1"
TMPOUTFILE="${INFILE%.*}"
OUTFILE="${TMPOUTFILE##*/}.mp3"

echo "${BOLD_CYAN} Extracting audio from $INFILE to ${BOLD_YELLOW}${OUTFILE}${RESET}..."
ffmpeg -i "${INFILE}" -b:a 192K -vn "${OUTFILE}"
