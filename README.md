# Introduction

Common *nix config files that I like to customize.

Also includes the following other tools as submodules:

- [hg-prompt](https://github.com/pelletier/hg-prompt)
- [vim-flake8](https://github.com/nvie/vim-flake8)
- [vim-markdown](https://github.com/plasticboy/vim-markdown)

# Notes

## Git

Global git dotfiles (such as user .gitconfig and .gitignore) are found in .gitdotfiles. Any git files found 
in the repo root are files for configuing the repo specificly.

## asdf

This repo will initialize [asdf](https://github.com/asdf-vm/asdf) if it is installed.

# Dependencies

## Vim

- [vim](http://www.vim.org/)
  - Debian: `sudo apt-get install vim-gtk`
  - OS X: `brew install macvim --override-system-vim`
- [flake8](https://pypi.python.org/pypi/flake8)
  `sudo pip install flake8`
- [vim-plug](https://github.com/junegunn/vim-plug)
  `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim `

# Installation

    cd ~
    sudo apt-get install --no-install-recommends vim-gtk make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
    git clone --recursive https://github.com/wbushey/dotfiles.git .dotfiles

Edit ~/.bashrc --or-- ~/.bash_profile to include the following

    source ~/.dotfiles/.bashrc

Edit ~/.zshrc to include the following

    source ~/.dotfiles/zsh/zshrc

Edit ~/.gitconfig to include the following

    [include]
        path = ~/.dotfiles/.gitdotfiles/.gitconfig

Edit ~/.vimrc to include the following

    source ~/.dotfiles/.vimrc

Edit ~/.tmux.conf to include the following

    source-file ~/.dotfiles/tmux/tmux.conf

Install language plugins for asdf:

    adsf plugin-add java
    adsf plugin-add nodejs
    bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
    adsf plugin-add python
    adsf plugin-add ruby
    # Set tool versions in ~/.tool-versions

Install flake8:

    sudo pip install flake8

# Updating

Submodules are used to include many other projects. To update the included submodules, simple run the
following in the repo

    cd ~/.dotfiles
    ./update.sh
