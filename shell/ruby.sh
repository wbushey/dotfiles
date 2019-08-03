#! /bin/bash

# Make bundled executables a bit more natural to use
alias bi='bundle install --binstubs .bundle/bin --path vendor/bundle'
export PATH=".bundle/bin:$PATH"
