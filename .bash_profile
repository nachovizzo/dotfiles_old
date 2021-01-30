# @file      .bash_profile
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved

# First we need to check if we are on Windows...
grep -qEi "(microsoft|WSL)" /proc/version &> /dev/null && cd $HOME && exec zsh -l

# If the zsh binary is available, then use the one installed in the system
command -v zsh &> /dev/null && exec zsh -l

# When running thorugh ssh sessions we need to manually source zsh, fallback to
# bash in case it's not there
if [ -f "$HOME/usr/bin/zsh" ]; then
    # We need the nacho's local zsh build of zsh
    export FPATH=$HOME/usr/share/zsh/5.7.1-test-2/functions:$FPATH
    export PATH=$PATH:$HOME/usr/bin
    exec $HOME/usr/bin/zsh -l
 else
    echo "****************************************************************"
    echo -e "\e[31mzsh is NOT available in your system\e[0m"
    echo -e "\e[31mCompile from source with scripts/insall_zsh_no_root.sh\e[0m"
    echo "****************************************************************"
    test -f ~/.bashrc && . ~/.bashrc
 fi
