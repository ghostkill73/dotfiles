# xinitrc

# notifications
if ! pgrep dunst; then
	dunst &
fi

# d-bus session
if
	command -v dbus-launch >/dev/null &&
	test -z "$DBUS_SESSION_BUS_ADDRESS"
then
	eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

# scripts
for i in $HOME/.config/dwm/scripts/*.sh; do
	test -x "$i" && "$i" &
done

# wallpaper
if test -e "$HOME/.config/dwm/wallpaper.png"; then
	feh --no-fehbg --bg-scale "$HOME/.config/dwm/wallpaper.png" &
fi

# wm
exec dwm
