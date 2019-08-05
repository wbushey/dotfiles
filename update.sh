#!/bin/bash

cd ~/.dotfiles || exit
git pull
git submodule update --init --recursive
asdf update
asdf plugin-update --all
