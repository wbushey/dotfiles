#! /bin/bash

if [[ -d "$HOME/.jenv/bin" ]]; then
  export PATH="$HOME/.jenv/bin:$PATH"
fi

if command -v jenv>/dev/null; then
  eval "$(jenv init -)"
fi
