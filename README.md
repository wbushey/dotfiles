# Introduction

Common *nix config files that I like to customize. 

Also includes the following vim bundles:

- [vim-flake8](https://github.com/nvie/vim-flake8)
- [vim-markdown](https://github.com/plasticboy/vim-markdown)
- [YouCompleteMe](http://valloric.github.io/YouCompleteMe/)

# Dependencies

## Vim
- [cmake](http://www.cmake.org/)
- [flake8](https://pypi.python.org/pypi/flake8)
- [Pathogen](https://github.com/tpope/vim-pathogen)
- Python Development headers/libraries 
  - Debian: [python-dev](https://packages.debian.org/stable/python-dev)
- [vim](http://www.vim.org/) (>= 7.3.584 for YouCompleteMe)


# Installation

    cd ~
    git clone --recursive https://github.com/wbushey/vimrc.git .dotfiles
    sudo .vim/bundle/YouCompleteMe/install.sh --clang-completer

Edit ~/.vimrc to include the following

    source ~/.dotfiles/.vimrc


# Updating

Submodules are used to include many other projects. To update the included
submodules, simple run the following in the repo

    git submodule update --remote
    sudo .vim/bundle/YouCompleteMe/install.sh --clang-completer
