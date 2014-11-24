# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -CF --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
if [ `uname` == 'Darwin' ]; then
    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagaced
    alias ls='ls -CF'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if [ -x /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Add Git and Mercurial repo status to the prompt
GIT_PS1_SHOWDIRTYSTATE='True'
GIT_PS1_SHOWSTASHSTATE='True'
GIT_PS1_SHOWUNTRACKEDFILES='True'
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS='True'
source $HOME/.dotfiles/.gitdotfiles/.git-prompt.sh


hg_ps1() {
    hg prompt "{ on {branch}}{ at {bookmark}}{status}" 2> /dev/null
    }

#export PS1='\u@\h \w$(hg_ps1)$(__git_ps1 " (%s)")\$ '
export PROMPT_COMMAND='__git_ps1 "\u@\h \w" "\$ "'
#export PS1='\u@\h \w$(__git_ps1 " (%s)")\$ '
export RBENV_ROOT=$HOME/.dotfiles/.ruby/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

