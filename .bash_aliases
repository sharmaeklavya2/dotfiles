#!/bin/bash

# non-alias customizations

# set a nice prompt
if [ -f ~/.myprompt ]; then
    source ~/.myprompt
fi

# unlike ~/bin, ext_bin contains executables not made by me
if [ -d "$HOME/ext_bin" ] ; then
    PATH="$HOME/ext_bin:$PATH"
fi

# alises

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias eg++='g++ -D EKLAVYA --std=c++11 -Wall -Wpedantic -Wno-sign-compare'
alias egcc='gcc -D EKLAVYA -Wall -Wpedantic -Wno-sign-compare'

alias nless='less -N'

# functions

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

function mydiff(){
    colordiff -u $@ | less -R
}
