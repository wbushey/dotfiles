#!/bin/bash
cd ~/.dotfiles
git pull
git submodule update --init --recursive
rbenv update
