############################################################
# .bashrc
############################################################

case $- in
    *i*) ;;
      *) return ;;
esac

for script in $HOME/.config/bash/scripts/*; {
	[[ -x "$script" ]] && source "$script"
}
unset script
