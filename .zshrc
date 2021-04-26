[[ -n $SSH_CONNECTION ]] && ZSH_THEME="fwalch-hostname" || ZSH_THEME="fwalch"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="false"

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

# Start tmux automatically if available
if command -v tmux &>/dev/null &&
    [[ ! -n "$SSH_CONNECTION" ]] &&
    [[ -z "$TMUX" ]]; then
    exec tmux
fi
