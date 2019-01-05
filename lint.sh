#!/bin/bash

find . -type d \(  -path ./.zshdotfiles/oh-my-zsh \) -prune -o -type f -name '*.sh' -exec shellcheck --external-sources {} +
