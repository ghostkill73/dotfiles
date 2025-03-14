############################################################
# Functions
############################################################

if ls --color -d . >/dev/null 2>&1; then
	export COLUMNS
	eval "$(dircolors)"
	function ls() {
		command ls \
			-AFCrhv --color=always \
			--time-style=long-iso \
			"$@"
	}
	alias ll='ls -l'
	alias la='ls -la'
fi

function cd() {
	command cd "$@" && ls
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
