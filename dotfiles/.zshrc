export CLICOLOR=1  # colored output for ls
export LSCOLORS="gxfxbxdxcxegedabagacad"  # replace directory color from blue (c) to cyan (g), since ANSI blue looks too dark.

# set the prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt prompt_subst
export PROMPT='[%*]%(0?.%F{green}.%F{red})(%?)%f%F{green}%n@%m%f:%F{cyan}%1d%f ${vcs_info_msg_0_}%# '

# have homebrew executables override macOS defaults by changing $PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
