# Introduction

Common *nix config files that I like to customize. 

Also includes the following other tools (submodules unless *):

- [hg-prompt](https://github.com/pelletier/hg-prompt)
- [rbenv](https://github.com/sstephenson/rbenv)*
- [rbenv-default-gems](https://github.com/sstephenson/rbenv-default-gems)
- [rbenv-gem-rehash](https://github.com/sstephenson/rbenv-gem-rehash)
- [rbenv-update](https://github.com/rkh/rbenv-update)
- [ruby-build](https://github.com/sstephenson/ruby-build)
- [vim-flake8](https://github.com/nvie/vim-flake8)
- [vim-markdown](https://github.com/plasticboy/vim-markdown)
- [YouCompleteMe](http://valloric.github.io/YouCompleteMe/)

# Notes

## Git

Global git dotfiles (such as user .gitconfig and .gitignore) are found in .gitdotfiles. Any git files found 
in the repo root are files for configuing the repo specificly.

## Rbenv

This repo includes rbenv as a set of real folders and files, not as a submodule. This is because the rbenv
repo gitignores the plugins folder, which prevents defining submodules in the plugins folder. 

To allow for rbenv to still be updated, the rbenv-update plugin as has been added. 

All of the plugins aresubmodules of this repo.

# Dependencies

## Mercurial

- [mercurial](http://mercurial.selenic.com/)
  ```sudo apt-get install mercurial```

## Node
 - [nvm](https://github.com/creationix/nvm)
  `wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash`

## Python

- [pip](https://pip.pypa.io/en/latest/installing.html)
  `wget https://bootstrap.pypa.io/get-pip.py && sudo python get-pip.py`
- [virturlenv](http://virtualenv.readthedocs.org/)
  `sudo pip install virtualenv`
- [virtualenvwrapper](http://virtualenvwrapper.readthedocs.org/)
  `sudo pip install virtualenvwrapper`

## Vim

- [vim](http://www.vim.org/) (>= 7.3.584 for YouCompleteMe)
  - Debian: `sudo apt-get install vim-gtk`
  - OS X: `brew install macvim --override-system-vim`
- [cmake](http://www.cmake.org/) (for YouCompleteMe)
  `sudo apt-get install g++ cmake`
- [flake8](https://pypi.python.org/pypi/flake8)
  `sudo pip install flake8`
- [vim-plug](https://github.com/junegunn/vim-plug)
  `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim `
- Python Development headers/libraries (for YouCompleteMe)
  - Debian: [python-dev](https://packages.debian.org/stable/python-dev)
    `sudo apt-get install python-dev`
- Syntastic - npm & jshint
  - Debian: `sudo apt-get install npm && npm install -g jshint`

# Installation

    cd ~
    wget https://bootstrap.pypa.io/get-pip.py && sudo python get-pip.py
    wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash
    sudo apt-get install mercurial vim-gtk g++ cmake python-dev
    sudo pip install virtualenv virtualenvwrapper flake8
    nvm install stable && nvm alias default stable && npm install -g jshint
    git clone --recursive https://github.com/wbushey/vimrc.git .dotfiles

Create the file .ycm-clang-completer in the repo's root directory  to include support for C autocompletion.
This will require GLIBC >= 2.14

Edit ~/.bashrc --or-- ~/.bash_profile to include the following

    source ~/.dotfiles/.bashrc

Edit ~/.zshrc to include the following

    source ~/.dotfiles/.zshdotfiles/.zshrc

Edit ~/.gitconfig to include the following

    [include]
        path = ~/.dotfiles/.gitdotfiles/.gitconfig

Edit ~/.hgrc to include the following

    %include ~/.dotfiles/.hgdotfiles/.hgrc

Edit ~/.vimrc to include the following

    source ~/.dotfiles/.vimrc


# Updating

Submodules are used to include many other projects. To update the included submodules, simple run the 
following in the repo

    cd ~/.dotfiles
    ./update.sh
