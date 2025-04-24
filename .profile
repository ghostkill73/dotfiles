if [ -n "$BASH_VERSION" ]
then
	if [ -f "$HOME/.bashrc" ]
	then
		. "$HOME/.bashrc"
	fi
else
	if [ -f "$HOME/.shrc" ]
	then
		. "$HOME/.shrc"
	fi
fi
