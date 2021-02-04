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

## Example `.zshrc_local`

This is the file I don't track with git because it might contain local specific
configurations and sensitive info.

As an example it usually contains(for the sudo-less servers):

```sh
# Default install prefix on home directory
export CMAKE_INSTALL_PREFIX=$HOME/usr/
export CPATH=$HOME/usr/include/
export LD_LIBRARY_PATH=$HOME/usr/lib:$LD_LIBRARY_PATH
export MANPATH=$MANPATH:$HOME/usr/share/man/
``
