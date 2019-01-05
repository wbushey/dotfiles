#! /bin/bash

export RBENV_ROOT=$HOME/.dotfiles/.ruby/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

# Make bundled executables a bit more natural to use
alias bi='bundle install --binstubs .bundle/bin --path vendor/bundle'
export PATH=".bundle/bin:$PATH"
