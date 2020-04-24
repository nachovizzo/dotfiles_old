# @file      .aliases.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved
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
alias coit='code . && exit'
alias cor='code -r'
alias cl=" /usr/bin/clear"
alias rescan="nmcli device wifi rescan"
alias list="nmcli device wifi list"
alias deko='cd ~/Desktop'
alias de='cd ~/dev'
alias ex='cd ~/dev/examples'
alias te='cd ~/Teaching'
alias adr='cd ~/Andromeda'
alias re='cd ~/Research/bibliography'
alias pu='cd ~/Publications'
alias bo='cd ~/Documents/Books/'
alias za='zathura --fork'
alias xopen='xdg-open'
alias gitc='git checkout'
alias xcopy='xclip -selection clipboard'
alias copywd='pwd | xclip -selection clipboard'
alias ll='ls -hltrBF --group-directories-first --color=auto'
alias tm='tmux'
alias suspend='systemctl suspend'
alias rmrf='rm -rf'
alias vp='cp'
alias kitti_monitor='htop -p $(pgrep -d, eval_sequence) --sort-key=Command'
alias mapping_monitor='htop -p $(pgrep -d, -f "python3 ./mapping_pipeline.py") --sort-key=Command'
alias df='df -h -xsquashfs -xtmpfs -xdevtmpfs'
alias i3config='$EDITOR ~/.config/regolith/i3/config'
alias codeconfig='$EDITOR ~/.config/Code/User/settings.json'
alias -g latest='*(om[1])'

alias no_prompt='export ZSH_THEME="no_prompt" && source $ZSH/oh-my-zsh.sh && _zsh_autosuggest_disable'
alias bash_theme='export ZSH_THEME="bash" && source $ZSH/oh-my-zsh.sh'
alias tterminal='gnome-terminal --tab-with-profile="Teaching Light"&& exit'

alias glow='glow -p'

source $HOME/scripts/config/aliases.zsh
