# @file      .zshrc
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
#
if [[ -n $SSH_CONNECTION ]]; then
    ZSH_THEME="fwalch-hostname"
else
    ZSH_THEME="fwalch"
fi

HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="false"

plugins=(
    colored-man-pages
    command-not-found
    extract
    git
    sudo
    tmux
    z
    zsh-autosuggestions
)

source $HOME/.aliases.zsh
source $HOME/.functions.zsh
source $HOME/.zshrc_local
source $ZSH/oh-my-zsh.sh

# Conda crap
if [ -f $HOME/dev/anaconda3/etc/profile.d/conda.sh ]; then
    . $HOME/dev/anaconda3/etc/profile.d/conda.sh
    source $ZSH/custom/plugins/zsh-autoswitch-conda/autoswitch_conda.plugin.zsh
fi
