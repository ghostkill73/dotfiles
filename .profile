# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

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
