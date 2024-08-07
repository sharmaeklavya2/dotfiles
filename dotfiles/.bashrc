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
if [ "$UNAME" == Darwin ]; then
    export VSCODE_BIN='/Applications/Visual Studio Code.app/Contents/Resources/app/bin'
    if [ -d "$VSCODE_BIN" ]; then
        PATH="$PATH:$VSCODE_BIN"
    fi
fi

function workon() {
    source "$VENV_DIR/$1/bin/activate"
}

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

# pagers and diffing

export LESS="-R -+FSX"
export DELTA_PAGER="less $LESS"

if command -v delta > /dev/null ; then
    export GIT_PAGER="delta"
elif command -v diffr > /dev/null ; then
    export GIT_PAGER="diffr | less"
else
    unset GIT_PAGER
fi

function mydiff(){
    if command -v diffr ; then
        diff -u "$@" | diffr | less -R
    elif command -v colordiff ; then
        colordiff -u "$@" | less -R
    else
        diff -u "$@" | less -R
    fi
}

# set tab stops to 4 characters
tabs -4

# aliases

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
alias logit='vim ~/mylogs/activity/$(today).mylog'
alias logyes='vim ~/mylogs/activity/$(yesterday).mylog'
alias medlogit='vim ~/mylogs/medical/$(today).txt'
alias medlogyes='vim ~/mylogs/medical/$(yesterday).txt'
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
alias tex-clean='rm -f *.{aux,bbl,blg,log,out,toc,brf,lot,lof,nlo,add.spl}'
