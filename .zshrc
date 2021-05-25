[[ -n $SSH_CONNECTION ]] && ZSH_THEME="fwalch-hostname" || ZSH_THEME="fwalch"
[[ -n $SSH_CONNECTION ]] && ZSH_TMUX_AUTOSTART="false"  || ZSH_TMUX_AUTOSTART="true"

# Don't start tmux server if already running
$(ps -e | grep -q tmux) && ZSH_TMUX_AUTOSTART="false"

# Don't start tmux server if running a floating_terminal, cleanup later
[[ $(xprop -id $(xdotool getactivewindow) | grep 'WM_CLASS(STRING)' | cut -d'"' -f4) = "floating_terminal" ]] && ZSH_TMUX_AUTOSTART="false"

DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="false"
HYPHEN_INSENSITIVE="true"
ZSH_TMUX_AUTOCONNECT="false"
ZSH_TMUX_AUTOQUIT="true"

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
