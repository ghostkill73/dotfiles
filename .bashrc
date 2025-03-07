###################################################################################################
# .bashrc
###################################################################################################

case $- in
    *i*) ;;
      *) return;;
esac

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

[[ -z $(shopt -oq posix) ]] || {
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
}

###################################################################################################
# shopt
###################################################################################################

shopt -s cdspell
shopt -s histappend
shopt -s checkwinsize

###################################################################################################
# variables
###################################################################################################

PS1='λ '

### INIT PATH ###

PATH+=:"$HOME/.local/bin/"

for git_pkg in $HOME/.git-bin/*; {
	PATH+=:"$git_pkg"
}; unset git_pkg

[[ -f "$HOME/.cargo/env" ]] &&
	source "$HOME/.cargo/env"

export PATH

### END PATH ###

HISTCONTROL=ignoreboth
HISTSIZE=100
HISTFILESIZE=0
unset HISTFILE

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PYTHONDONTWRITEBYTECODE=1
export NEXT_TELEMETRY_DISABLED=1
export EDITOR='nano'

###################################################################################################
# aliases
###################################################################################################

[[ -x /usr/bin/dircolors ]] && {
	dircolors -b &>/dev/null
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
}

alias l='ls -aA'
alias la='ls -laA'
alias rm='rm -i'
alias mv='mv -v'
alias cp='cp -v'
alias mkdir='mkdir -v'

alias mdclear='exiftool -all= -overwrite_original $@'
alias nano='nano -xc'
alias bnano='nano -B'
alias fd='fdfind'
alias cpufetchx='cpufetch --logo-long'
alias pkg='sudo apt'

###################################################################################################
# functions
###################################################################################################

edit-bin()
{
	builtin local binary="$1"
	builtin local binary_path="$(type -P $binary)"

	if [[ -n "$binary_path" ]]; then
		"${EDITOR:=nano}" "$binary_path"
		return $?
	elif [[ -z "$binary" ]]; then
		echo "enter the bin name."
		return 1
	else
		echo "$binary not found."
		return 1
	fi
}

mkscript() {
	builtin local script="$1"

	if [[ -e "$script" ]]; then
		echo "$script alredy exists."
		return 1
	elif [[ -z "$script" ]]; then
		echo "enter the script name."
		return 1
	else
		echo '#!/usr/bin/env bash' > "$script"
		chmod +x "$script"
		return $?
	fi
}
