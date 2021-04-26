if [[ -n $SSH_CONNECTION ]]; then
    ZSH_THEME="fwalch-hostname"
    ZSH_TMUX_AUTOSTART="false"
else
    ZSH_THEME="fwalch"
    ZSH_TMUX_AUTOSTART="true"
fi

DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="false"
HYPHEN_INSENSITIVE="true"
ZSH_TMUX_AUTOCONNECT="false"
ZSH_TMUX_AUTOQUIT="false"

plugins=(
    colored-man-pages
    command-not-found
    extract
    fzf
    git
    sudo
    tmux
    z
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases.zsh
source $HOME/.functions.zsh
source $HOME/.zshrc_local
