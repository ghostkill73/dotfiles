############################################################
# Variables
############################################################

# Bash
export PS1='λ '
export HISTCONTROL=ignoreboth
export HISTSIZE=2000
export HISTFILESIZE=2000
#unset HISTFILE

# Editor
export EDITOR='nano'

# Programming
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PYTHONDONTWRITEBYTECODE=1
export NEXT_TELEMETRY_DISABLED=1

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
