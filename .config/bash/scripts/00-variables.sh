############################################################
# Variables
############################################################

# Bash
export HISTFILE="$HOME/.config/bash/history"
export INPUTRC="$HOME/.config/bash/inputrc"
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTFILESIZE=10000

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

[[ -n "$SSH_CONNECTION" ]] &&
	PS1="\[\033[1;35m\](ssh)\[\033[0m\] $PS1"

# PATH
export PATH+=":$HOME/.local/bin"

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
