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
export _BASH_CONFIG="$XDG_CONFIG_HOME/bash"
export _BASH_SCRIPTS="$_BASH_CONFIG/scripts"
export HISTFILE="$_BASH_CONFIG/history"
export INPUTRC="$_BASH_CONFIG/inputrc"
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTFILESIZE=10000

export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin"

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
eval "$(lesspipe)"
