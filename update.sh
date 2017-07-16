#!/bin/bash
cd ~/.dotfiles
git pull
git submodule update --init --recursive
rbenv update
if [ -e .ycm-clang-completer ]; then
    echo "Building YouCompleteMe with Clang Completer"
    sudo .vim/bundle/YouCompleteMe/install.py --clang-completer --tern-completer
else
    echo "Building YouCompleteMe"
    sudo .vim/bundle/YouCompleteMe/install.py
fi
