#!/bin/bash

# Even though .bash_aliases is meant to store aliases, I'm using it for
# other things as well, since it is sourced in Ubuntu's default .bashrc.

# include other files
if [ -f ~/.eku/myprompt ]; then
    source ~/.eku/myprompt
fi
if [ -f ~/.eku/guify ]; then
    source ~/.eku/guify
fi

# additions to PATH
if [ -d "$HOME/ext_bin" ] ; then
    PATH="$HOME/ext_bin:$PATH"
fi

# set tab stops to 4 characters
tabs -4

# alises

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias eg++='g++ -D EKLAVYA --std=c++11 -Wall -Wpedantic -Wno-sign-compare'
alias egcc='gcc -D EKLAVYA -Wall -Wpedantic -Wno-sign-compare'

alias nless='less -N'
alias today='date +%F'
alias logit='vim ~/mylog/$(today).mylog'

# functions

function mydiff(){
    colordiff -u $@ | less -R
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
