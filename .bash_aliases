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

alias eg++='g++ --std=c++11 -Wall -Wpedantic -Wno-sign-compare'
alias egcc='gcc -Wall -Wpedantic -Wno-sign-compare'

alias nless='less -N'
