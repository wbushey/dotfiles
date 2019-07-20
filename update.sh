#!/bin/bash

cd ~/.dotfiles || exit
git pull
git submodule update --init --recursive
asdf update
adsf plugin-update --all
