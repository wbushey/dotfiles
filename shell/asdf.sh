#! /bin/sh

if command -v asdf>/dev/null; then
  export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fi
