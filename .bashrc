############################################################
# .bashrc
############################################################

case $- in
    *i*) ;;
      *) return ;;
esac

umask 077

for script in $HOME/.config/bash/scripts/*; {
	[[ -x "$script" ]] && source "$script"
}
unset script
