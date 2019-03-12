# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="fwalch"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    colored-man-pages
    sudo
    zsh-autosuggestions
    command-not-found
    extract
)

# User configuration

# Preferred editor for local and remote sessions
export EDITOR='vim'

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias apts='apt-cache search'
alias erp='er-repo'
alias suqui='subl ./'
alias apts='apt-cache search'
alias lgrep='ll  | grep'
alias hgrep='history | grep'
alias erps='er-repo status'
alias catree='cat .tree | less'
alias naqui='nautilus ./'
alias py='ipython3'
alias python='python3'
alias code='code-insiders'
alias coit='code . && exit'
alias cor='code -r'
alias cl=" /usr/bin/clear"
alias rescan="nmcli device wifi rescan"
alias list="nmcli device wifi list"
alias deko='cd ~/Desktop'
alias de='cd ~/dev'
alias te='cd ~/Teaching'
alias adr='cd ~/Andromeda'
alias re='cd ~/Research'
alias pu='cd ~/Publications'
alias bo='cd ~/Documents/Books/'
alias za='zathura'
alias xopen='xdg-open'
alias gitc='git checkout'
alias xcopy='xclip -selection clipboard'
alias copywd='pwd | xclip -selection clipboard'
alias ll='ls -hltrBF --group-directories-first --color=auto'
alias tm='tmux'
alias suspend='systemctl suspend'

export TERM=xterm-256color

# From http://packaging.ubuntu.com/html/getting-set-up.html
export COMMAND_NOT_FOUND_INSTALL_PROMPT=1

export DEBFULLNAME="Ignacio Vizzo"
export DEBEMAIL="ivizzo@uni-bonn.de"
#source /opt/ros/melodic/setup.zsh

export DATASETS=$HOME/dev/datasets
export MODELS=$HOME/dev/models

#Little hack to be able to find modules in subdris running scripts from somewhere else ;)
export PYTHONPATH=$PYTHONPATH:
export PATH=$PATH:$HOME/.local/bin/

# Source oh-my-zsh configs
source $ZSH/oh-my-zsh.sh

# Source any local modifications
source $HOME/.zshrc_local
