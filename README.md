
## Add a ssh key for your user
```sh
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
$ cat .ssh/id_rsa.pub # copy this to the clipboard
```

## Install dependencies
```sh
$ sudo apt update
$ sudo apt install tmux zsh vim
```

## Init the dotfile repository into your home directory
```sh
$ cd ~
$ git init
$ git remote add origin git@github.com:nachovizzo/dotfiles.git
$ git fetch
$ git reset origin/master --hard
$ git pull origin master
$ git submodule init
$ git submodule update
```

## Install zsh-autosuggestions(could be done by submodules but fork is required)
```sh
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## Change the default shell for zsh
```sh
chsh $USER # enter /bin/zsh
```

## Use nvim instead of vim
```sh
$ sudo apt-get install software-properties-common \
$ sudo apt-get install python-software-properties \
$ sudo add-apt-repository ppa:neovim-ppa/stable \
$ sudo apt-get update \
$ sudo apt-get install neovim \
$ ln -s ~/.vimrc ~/.config/nvim/init.vim \
$ ln -s ~/.vim ~/.config/nvim \
```
