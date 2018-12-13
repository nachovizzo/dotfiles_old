
## Add a ssh key for your user
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
$ cat .ssh/id_rsa.pub # copy this to the clipboard

## Install dependencies
$ sudo apt update
$ sudo apt install tmux zsh vim

## Init the dotfile repository into your home directory
$ cd ~
$ git init
$ git remote add origin git@github.com:nachovizzo/dotfiles.git
$ git fetch
$ git pull origin master
$ git submodule init
$ git submodule update

## Change the default shell for zsh
chsh $USER # enter /bin/zsh