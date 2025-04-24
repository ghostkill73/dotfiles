############################################################
# Functions
############################################################

if ls --color -d . >/dev/null 2>&1; then
	declare -ax LS_OPTIONS=(
		--almost-all
		-C
		--color=always
		-F
		--group-directories-first
		--human-readable
		--sort=extension
		--time-style=long-iso
		-X
	)
	eval "$(dircolors)"

	function ls() {
		command ls "${LS_OPTIONS[@]}" "$@"
	}
	alias ll='ls -l'
	alias l='ls -og'
fi

function cd() {
	builtin cd "$@" && ls
}

function edit-bin() {
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

function mkscript() {
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
