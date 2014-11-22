# Dependencies

## Vim
- [Pathogen](https://github.com/tpope/vim-pathogen)
- [flake8](https://pypi.python.org/pypi/flake8)


# Installation

    cd ~
    git clone --recursive https://github.com/wbushey/vimrc.git .dotfiles

Edit ~/.vimrc to include the following

    source ~/.dotfiles/.vimrc


# Updating

Submodules are used to include many other projects. To update the included
submodules, simple run the following in the repo

    git submodule update --remote

