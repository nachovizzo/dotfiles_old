# @file      .aliases.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
alias py='ipython3'
alias coit='code . && exit'
alias cor='code -r'
alias rescan="nmcli device wifi rescan"
alias list="nmcli device wifi list"
alias deko='cd ~/Desktop'
alias dekon='cd ~/Desktop && ranger'
alias de='cd ~/dev'
alias ex='cd ~/dev/examples'
alias to='cd ~/dev/tools'
alias li='cd ~/dev/libs'
alias te='cd ~/Teaching'
alias adr='cd ~/Andromeda'
alias re='cd ~/Research/'
alias pu='cd ~/Research/publications'
alias bi='cd ~/Research/bibliography'
alias bo='cd ~/Documents/Books/'
alias za='zathura --fork'
alias zas='i3-swallow zathura'
alias zl='zas *(om[1])'
alias xopen='xdg-open'
alias gitc='git checkout'
alias gitcd='cd $(git rev-parse --show-toplevel)'
alias gs='git status'
alias xcopy='xclip -selection clipboard'
alias copywd='pwd | tr "\n" "\b" | xclip -selection clipboard'
alias ll='ls -hltrBF --group-directories-first --color=auto'
alias ts='tmux new-session -s $(basename $(pwd))'
alias rmrf='rm -rf'
alias vp='cp'
alias kitti_monitor='htop -p $(pgrep -d, eval_sequence) --sort-key=Command'
alias mapping_monitor='htop -p $(pgrep -d, -f "python3 ./mapping_pipeline.py") --sort-key=Command'
alias pidar_monitor='htop -p $(pgrep -d, -f "python3 ./full_pipeline.py") --sort-key=Command'
alias df='df -h -xsquashfs -xtmpfs -xdevtmpfs'
alias i3config='$EDITOR ~/.config/regolith/i3/config'
alias codeconfig='$EDITOR ~/.config/Code/User/settings.json'
alias rn='ranger .'
alias tkb='take build'
alias jpc='jupyter console --existing'
alias ag='ag -U'
alias start_notebook_tunnel='ssh -f -N ipb24-tunnel'

alias -g latest='*(om[1])'

alias no_prompt='export ZSH_THEME="no_prompt" && source $ZSH/oh-my-zsh.sh && _zsh_autosuggest_disable'
alias bash_theme='export ZSH_THEME="bash" && source $ZSH/oh-my-zsh.sh'
alias tterminal='gnome-terminal --tab-with-profile="Teaching Light"&& exit'

alias glow='glow -p'

alias meld='GTK_THEME=Adwaita:light meld'
source $HOME/scripts/config/aliases.zsh
