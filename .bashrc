############################################################
# .bashrc
############################################################

case $- in
    *i*) ;;
      *) return;;
esac

default_ps1=yes
[[ "${default_ps1:=no}" = yes ]] && {
        [[ -z "${debian_chroot:-}" ]] && [[ -r /etc/debian_chroot ]] &&
                debian_chroot=$(</etc/debian_chroot)

        case "$TERM" in
            xterm-color|*-256color) color_prompt=yes;;
        esac

        force_color_prompt=yes
        [[ -n "$force_color_prompt" ]] &&
                [[ -x /usr/bin/tput ]] && tput setaf 1 >&/dev/null && color_prompt=yes

        [[ "$color_prompt" = yes ]] \
                && PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ' \
                || PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
        unset color_prompt force_color_prompt

        case "$TERM" in
                xterm*|rxvt*)
                        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
                        ;;
                *) ;;
        esac

        [[ -n "$SSH_CONNECTION" ]] &&
                PS1="\[\033[1;35m(ssh)\[\033[0m $PS1"
}

if [[ -f /usr/share/bash-completion/bash_completion ]]; then
        . /usr/share/bash-completion/bash_completion
elif [[ -f /etc/bash_completion ]]; then
        . /etc/bash_completion
fi

############################################################
# bashrc.d
############################################################

for script in $HOME/.bashrc.d/*.sh; {
	source "$script"
}
