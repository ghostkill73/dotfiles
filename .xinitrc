# xinitrc

# statusbar
$HOME/.config/dwm/scripts/status.sh &

# wallpaper
$HOME/.fehbg &

# notifications
dunst &

# d-bus session
eval $(dbus-launch --sh-syntax)

# wm
exec dwm
