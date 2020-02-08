# @file      aliases.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
for SCRIPT in $HOME/scripts/*.zsh; do
  SCRIPT=$(basename -- $SCRIPT)
  eval alias ${SCRIPT%.*}="$SCRIPT"
done
