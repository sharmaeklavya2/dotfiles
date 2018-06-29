#!/bin/bash

# Even though .bash_aliases is meant to store aliases, I'm using it for
# other things as well, since it is sourced in Ubuntu's default .bashrc.

# include other files
if [ -f ~/.env ]; then
    source "$HOME/.env"
fi
if [ -f ~/.eku/myprompt ]; then
    source ~/.eku/myprompt
fi
if [ -f ~/.eku/gcc_aliases ]; then
    source ~/.eku/gcc_aliases
fi

# additions to PATH
if [ -d "$HOME/ext_bin" ] ; then
    PATH="$HOME/ext_bin:$PATH"
fi

# constants

if [ -d ~/.rlwrap ]; then
    export RLWRAP_HOME="$HOME/.rlwrap"
fi

# set tab stops to 4 characters
tabs -4

# alises

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias nless='less -N'
alias today='date "+%F"'
alias yesterday='date -d "yesterday" "+%F"'
alias logit='vim ~/mylog/$(today).mylog'
alias logyes='vim ~/mylog/$(yesterday).mylog'

# functions

function mydiff(){
    colordiff -u "$@" | less -R
}

# fast goto: cd to a nautilus bookmark
function fgoto(){
    if [ -z "$1" ]; then
        echo "You must specify a bookmark name." 1>&2
        false
    else
        newpath=$(bkmrk.py "$1")
        if [ "$?" == "0" ]; then
            cd "$newpath"
        else
            false
        fi
    fi
}

function workon() {
    source "$VENV_DIR/$1/bin/activate"
}
