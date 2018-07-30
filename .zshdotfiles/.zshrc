if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/.zshdotfiles/oh-my-zsh

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="billybushey"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git-extras virtualenvwrapper vi-mode)

# Load Debian plugins only in Debian
if command -v lsb_release>/dev/null; then
  if [[ `lsb_release -si` == 'Debian' ]]; then
    plugins+=(debian)
  fi
fi

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH


# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# History
# This relies on Oh My Zsh
setopt histignorealldups sharehistory
if [ "$(uname 2> /dev/null)" = 'Darwin' ]; then
  bindkey "$terminfo[kcuu1]" history-search-backward
  bindkey "$terminfo[kcub1]" history-search-forward
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

unsetopt AUTO_CD

source ~/.dotfiles/.shell/git.sh
source ~/.dotfiles/.shell/node.sh
source ~/.dotfiles/.shell/ruby.sh
