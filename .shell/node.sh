#! /bin/bash
export PATH="node_modules/.bin:$PATH"
export NVM_DIR="$HOME/.nvm"

nvm_is_installed(){
  [ -s "$NVM_DIR/nvm.sh" ]
}

nvm_scope_version(){
  local dir="$PWD/" version

  until [[ -z "$dir" ]]; do
    dir="${dir%/*}"

    if { read -r version <"$dir/.nvmrc"; } 2>/dev/null || [[ -n "$version" ]];
    then
      echo "${version%%[[:space:]]}"
      return
    fi
  done

  echo "default"
}

nvm_use_scope_version() {
  local version
  version="$(nvm_scope_version)"
  nvm use "$version"
  export ACTIVE_NODE_VERSION=$version
}

check_for_new_nvm_scope(){
  if [ -n "$ACTIVE_NODE_VERSION" ] && [ "$ACTIVE_NODE_VERSION" != "$(nvm_scope_version)" ];
  then
    reset_node_commands
  fi
}

register_check_for_new_nvm_scope_on_cd(){
  if [[ -n "$ZSH_VERSION" ]]; then
    if [[ ! "$chpwd_functions" == *nvm_auto* ]]; then
      chpwd_functions+=("check_for_new_nvm_scope")
    fi
  elif [[ -n "$BASH_VERSION" ]]; then
    trap '[[ "$BASH_COMMAND" != "$PROMPT_COMMAND" ]] && check_for_new_nvm_scope' DEBUG
  fi
}

reset_node_commands(){
  # Defer initialization of nvm until nvm, node or a node-dependent command is
  # run. Ensure this block is only run once by checking whether __init_nvm is a function.
  if [[ -n "$ACTIVE_NODE_VERSION" ]]; then unset ACTIVE_NODE_VERSION; fi
  if [ ! "$(whence -w __init_nvm)" = function ]; then
    __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack' 'topgun')
    function __init_nvm() {
      for i in "${__node_commands[@]}"; do unalias "$i"; done
      unset __node_commands
      unset -f __init_nvm
      nvm_use_scope_version
    }
    for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
  fi
}

# Load NVM and setup deferred use
if nvm_is_installed; then
  # shellcheck source=/dev/null
  . "$NVM_DIR/nvm.sh" --no-use
  reset_node_commands
  register_check_for_new_nvm_scope_on_cd
fi
