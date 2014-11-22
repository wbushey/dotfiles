source /usr/local/bin/virtualenvwrapper.sh

# Add Git and Mercurial repo status to the prompt
source $HOME/.dotfiles/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE='True'
GIT_PS1_SHOWUNTRACKEDFILES='True'
GIT_PS1_SHOWUPSTREAM="auto"

hg_ps1() {
    hg prompt "{ on {branch}}{ at {bookmark}}{status}" 2> /dev/null
    }

# export PS1='\u@\h \w$(hg_ps1)$(__git_ps1 " (%s)")\$ '
export PS1='\u@\h \w$(__git_ps1 " (%s)")\$ '
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

