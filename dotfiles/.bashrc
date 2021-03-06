#!/bin/bash

# Even though .bash_aliases is meant to store aliases, I'm using it for
# other things as well, since it is sourced in Ubuntu's default .bashrc.

UNAME="$(uname)"

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
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/bin2" ] ; then
    PATH="$HOME/bin2:$PATH"
fi
if [ -d "$HOME/bin3" ] ; then
    PATH="$HOME/bin3:$PATH"
fi
if [ -d "$HOME/ext_bin" ] ; then
    PATH="$HOME/ext_bin:$PATH"
fi

# constants

if command -v vim > /dev/null ; then
    export EDITOR='vim'
fi
if [ -d ~/.rlwrap ]; then
    export RLWRAP_HOME="$HOME/.rlwrap"
fi
if [ -d ~/.nvm ]; then
    export NVM_DIR="$HOME/.nvm"
fi

# set tab stops to 4 characters
tabs -4

# alises

type -t xclip > /dev/null
export HAS_XCLIP="$?"
type -t pbcopy > /dev/null
export HAS_PBCOPY="$?"
type -t pbpaste > /dev/null
export HAS_PBPASTE="$?"
if [ "$HAS_XCLIP" -a ! "$HAS_PBCOPY" ]; then
    alias pbcopy='xclip -selection clipboard'
fi
if [ "$HAS_XCLIP" -a ! "$HAS_PBPASTE" ]; then
    alias pbpaste='xclip -selection clipboard -o'
fi

alias nless='less -N'
alias today='date "+%F"'
alias logit='vim ~/mylog/$(today).mylog'
alias logyes='vim ~/mylog/$(yesterday).mylog'
alias medlogit='vim ~/medlog/$(today).txt'
alias medlogyes='vim ~/medlog/$(yesterday).txt'
if [ "$UNAME" == Darwin ]; then
    export CLICOLOR=1
    alias yesterday='date -j -v-1d "+%F"'
else
    alias yesterday='date -d "yesterday" "+%F"'
fi

MY_TEX_OPTIONS='-cnf-line "max_print_line = 10000" -halt-on-error'
alias mypdftex="pdftex ${MY_TEX_OPTIONS}"
alias mypdflatex="pdflatex ${MY_TEX_OPTIONS}"
alias myluatex="luatex ${MY_TEX_OPTIONS}"
alias mylualatex="lualatex ${MY_TEX_OPTIONS}"
alias myxelatex="xelatex ${MY_TEX_OPTIONS}"

# functions

function mydiff(){
    colordiff -u "$@" | less -R
}

function workon() {
    source "$VENV_DIR/$1/bin/activate"
}
