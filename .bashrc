############################################################
# .bashrc
############################################################


case $- in
    *i*) ;;
      *) return;;
esac

[[ -z $(shopt -oq posix) ]] || {
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
}

############################################################
# bashrc.d
############################################################

for script in $HOME/.bashrc.d/*.sh; {
	source "$script"
}
