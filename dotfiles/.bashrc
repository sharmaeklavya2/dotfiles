# load config common to bash and zsh
if [ -f ~/.eku/shellrc ]; then
    source ~/.eku/shellrc
fi

# include other files
if [ -f ~/.eku/bash_prompt ]; then
    source ~/.eku/bash_prompt
fi

# history management
HISTSIZE=100000
HISTCONTROL=ignoredups
