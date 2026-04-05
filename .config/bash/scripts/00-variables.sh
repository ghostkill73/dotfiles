############################################################
# Variables
############################################################

PS1='\w > '

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Bash
export _BASH_HOME="$XDG_CONFIG_HOME/bash"
export HISTFILE="$_BASH_HOME/history"
export INPUTRC="$_BASH_HOME/inputrc"
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="ls:cd:[bf]g:exit:pwd:clear:nano:history:cat"
export HISTTIMEFORMAT="[%F %T] "
export HISTSIZE=10000
export HISTFILESIZE=10000

export PATH="/usr/local/bin:/usr/bin:/bin:$HOME/.local/bin"

# Editor
export EDITOR='nano'

# Less
export LESSHISTFILE=-
export LESS='-F -i -M -R -W -x4 -X -z-4'
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'
export LESS_TERMCAP_ue=$'\E[0m'
eval "$(lesspipe)" 2>&-
