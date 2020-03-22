# Nacho Dotfiles

## Warning

Since I'm the only user of this repository, I don't really support
documentation, so use it at your own risk!

## Init the dotfile repository into your home directory

```sh
cd ~
git init
git remote add origin git@github.com:nachovizzo/dotfiles.git
git fetch
git reset origin/master --hard
git pull origin master
git submodule init
git submodule update
```
