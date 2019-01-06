#!/bin/bash

find . -type d \(  -path ./zsh/oh-my-zsh \) -prune -o -type f -name '*.sh' -exec shellcheck --external-sources {} +
