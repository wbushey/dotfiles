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

# Thanks https://stackoverflow.com/questions/10406926/how-to-change-default-virtualenvwrapper-prompt
virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "[virtualenv: $venv] "
}

hg_ps1() {
    hg prompt "{ on {branch}}{ at {bookmark}}{status}" 2> /dev/null
}

build_prompt(){
    virtualenv_info
    __git_ps1 "\u@\h \w" "\$ "
}

#export PS1='\u@\h \w$(hg_ps1)$(__git_ps1 " (%s)")\$ '
export PROMPT_COMMAND='build_prompt'
#export PS1='\u@\h \w$(__git_ps1 " (%s)")\$ '

source ~/.dotfiles/.shell/ruby.sh
source ~/.dotfiles/.shell/node.sh
