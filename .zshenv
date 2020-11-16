# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

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

export DATASETS=$HOME/data
export MODELS=$HOME/dev/deep_learning/models

#Little hack to be able to find modules in subdris running scripts from somewhere else ;)
export PYTHONPATH=$PYTHONPATH:
export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:$HOME/scripts/

# This allow you to install a package if it's not found on the system
export COMMAND_NOT_FOUND_INSTALL_PROMPT=1

# Add go binaries to local PATH
export PATH=$PATH:/usr/local/go/bin

# Add Open3D Binaries to path
export PATH=$PATH:/$HOME/dev/libs/Open3D/build/bin/

# Add local stuff
export PATH=$HOME/usr/bin:$PATH

# Virtual environments
export VIRTUALENV=$HOME/dev/virtualenv/

# Conda crap
if [ -f $HOME/dev/anaconda3/etc/profile.d/conda.sh ]; then
    . $HOME/dev/anaconda3/etc/profile.d/conda.sh
    source $ZSH/custom/plugins/zsh-autoswitch-conda/autoswitch_conda.plugin.zsh
fi

