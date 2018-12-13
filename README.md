
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
$ git pull origin master
$ git submodule init
$ git submodule update
```

## Change the default shell for zsh
```sh
chsh $USER # enter /bin/zsh
```
