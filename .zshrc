# @file      .zshrc
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
if [[ -n $SSH_CONNECTION ]]; then
    ZSH_THEME="fwalch-hostname"
else
    ZSH_THEME="fwalch"
fi

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
source $HOME/.aliases.zsh

# Source personal functions
source $HOME/.functions.zsh

# Source any local modifications
source $HOME/.zshrc_local

# Source oh-my-zsh configs
source $ZSH/oh-my-zsh.sh
