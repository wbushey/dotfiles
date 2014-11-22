# Introduction

Common *nix config files that I like to customize. 

Also includes the following submodules:

- [hg-prompt](https://github.com/pelletier/hg-prompt)
- [rbenv](https://github.com/sstephenson/rbenv)
- [vim-flake8](https://github.com/nvie/vim-flake8)
- [vim-markdown](https://github.com/plasticboy/vim-markdown)
- [YouCompleteMe](http://valloric.github.io/YouCompleteMe/)

# Notes

## Git

Global git dotfiles (such as user .gitconfig and .gitignore) are found in 
.gitdotfiles. Any git files found in the repo root are files for configuing
the repo specificly.

# Dependencies

## Mercurial

- [mercurial](http://mercurial.selenic.com/)

## Python

- [virturlenv](http://virtualenv.readthedocs.org/)
  sudo pip install virtualenv
- [virtualenvwrapper](http://virtualenvwrapper.readthedocs.org/)
  sudo pip install virtualenvwrapper

## Ruby

- [rbenv](https://github.com/sstephenson/rbenv)

Unfortunately, rbenv's gitignore prevents adding the following as submodules of this repo

- [rbenv-gem-rehash](https://github.com/sstephenson/rbenv-gem-rehash)
- [ruby-build](https://github.com/sstephenson/ruby-build)

## Vim

- [vim](http://www.vim.org/) (>= 7.3.584 for YouCompleteMe)
- [cmake](http://www.cmake.org/) (for YouCompleteMe)
- [flake8](https://pypi.python.org/pypi/flake8)
- [Pathogen](https://github.com/tpope/vim-pathogen)
- Python Development headers/libraries (for YouCompleteMe)
  - Debian: [python-dev](https://packages.debian.org/stable/python-dev)

# Installation

    cd ~
    git clone --recursive https://github.com/wbushey/vimrc.git .dotfiles
    cd .dotfiles
    sudo .vim/bundle/YouCompleteMe/install.sh

Add the --clang-completer option to install.sh above to include support for C autocompletion.
This will require GLIBC >= 2.14

Also git clone the appropriate rbenv plugins

Edit ~/.bashrc --or-- ~/.bash_profile to include the following

    source ~/.dotfiles/.bashrc

Edit ~/.gitconfig to include the following

    [include]
        path = ~/.dotfiles/.gitdotfiles/.gitconfig

Edit ~/.hgrc to include the following

    %include ~/.dotfiles/.hgdotfiles/.hgrc

Edit ~/.vimrc to include the following

    source ~/.dotfiles/.vimrc


# Updating

Submodules are used to include many other projects. To update the included
submodules, simple run the following in the repo

    cd ~/.dotfiles
    git submodule update --recursive
    sudo .vim/bundle/YouCompleteMe/install.sh
