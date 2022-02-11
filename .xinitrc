#!/bin/sh

# xrandr
xrandr --output Virtual1 --mode 2560x1080 &

# Compositor
#picom -f --experimental-backends &

# Xresources
xrdb -merge .Xresources

# VBox clipboard
VBoxClient --clipboard &

# wal
wal -Rq

# DWM loop
while true; do
	dwm >/dev/null 2>&1
#	VBoxClient --clipboard &
done

# DWM
exec dwm
