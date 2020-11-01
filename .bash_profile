# @file      .bash_profile
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved

# First we need to check if we are on Windows...
grep -qEi "(microsoft|WSL)" /proc/version &> /dev/null && cd $HOME && exec zsh -l

# When running thorugh ssh sessions we need to manually source zsh, fallback to
# bash in case it's not there
if ! hash zsh >/dev/null 2>&1; then
     if ! hash $HOME/usr/bin/zsh >/dev/null 2>&1; then
            echo "****************************************************************"
            echo -e "\e[31mzsh is NOT available in your system\e[0m"
            echo -e "\e[31mCompile from source with scripts/insall_zsh_no_root.sh\e[0m"
            echo "****************************************************************"
            if [ -f ~/.bashrc ]; then
                  . ~/.bashrc
            fi
      else
            export FPATH=$HOME/usr/share/zsh/5.7.1-test-2/functions:$FPATH
            export PATH=$PATH:$HOME/usr/bin
            exec $HOME/usr/bin/zsh -l
      fi
fi
