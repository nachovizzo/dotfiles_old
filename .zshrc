# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
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
ENABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  z
  git
  colored-man-pages
  sudo
  zsh-autosuggestions
  command-not-found
  extract
)

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Make sure Google Tests run always with a colored output
export GTEST_COLOR=1

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
export TERM=xterm-256color

# From http://packaging.ubuntu.com/html/getting-set-up.html
export DEBFULLNAME="Ignacio Vizzo"
export DEBEMAIL="ivizzo@uni-bonn.de"

export DATASETS=$HOME/dev/datasets
export MODELS=$HOME/dev/deep_learning/models

#Little hack to be able to find modules in subdris running scripts from somewhere else ;)
export PYTHONPATH=$PYTHONPATH:
export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:$HOME/scripts/

# This allow you to install a package if it's not found on the system
export COMMAND_NOT_FOUND_INSTALL_PROMPT=1

# Fix GTK weird shit:
#   GLib-CRITICAL **: g_variant_new_string: assertion 'string != NULL' failed
export SWT_GTK3=0

# Set personal aliases, overriding those provided by oh-my-zsh libs,
source $HOME/.aliases.zsh

# Source any local modifications
source $HOME/.zshrc_local

# Source oh-my-zsh configs
source $ZSH/oh-my-zsh.sh

# Add go binaries to local PATH
export PATH=$PATH:/usr/local/go/bin

# Add Open3D Binaries to path
export PATH=$PATH:/$HOME/dev/libs/Open3D/build/bin/

# Add local stuff
export PATH=$HOME/usr/bin:$PATH
export LD_LIBRARY_PATH=$HOME/usr/lib/:$LD_LIBRARY_PATH
