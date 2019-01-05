#!/bin/bash

cd ~/.dotfiles || exit
git pull
git submodule update --init --recursive
rbenv update
