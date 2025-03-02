#!/usr/bin/env bash
set -eu

function snore() {
	local IFS
	[[ -n "${_snore_fd:-}" ]] || exec {_snore_fd}<> <(:)
	read ${1:+-t "$1"} -u $_snore_fd || :
}

function Status.GetMemoryUsage() {
	local memtotal
	local memavailable
	local memused

	while IFS=: read -r j c; do
		if [[ "$j" == 'MemTotal' ]]; then
			memtotal="${c% *}"
			memtotal="$((memtotal/1024))"
		elif [[ "$j" == 'MemAvailable' ]]; then
			memavailable="${c% *}"
			memavailable="$((memavailable/1024))"
		fi
	done < /proc/meminfo

	memused="$((memtotal - memavailable))"

	XSETROOT_BASE+="RAM: ${memused}mb/${memtotal}mb | "
}

function Status.Date() {
	local _date

	printf -v _date \
		'%(%a %d %b %l:%M:%S %p %Z %Y)T' "-1"

	XSETROOT_BASE+="$_date"
}

while :; do
	declare -- XSETROOT_BASE="DWM | "
	Status.GetMemoryUsage
	Status.Date
	xsetroot -name "$XSETROOT_BASE"
	snore 1
done
