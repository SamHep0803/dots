#!/bin/sh

# xrandr
xrandr --output Virtual1 --mode 2560x1080 &

# Compositor
#picom -f --experimental-backends &

# disable DPMS sleep because qemu is dumb
xset -dpms; xset s off

# Xresources
xrdb -merge .Xresources

# VBox clipboard
VBoxClient --clipboard &

# wal
wal -Rq

# DWM status loop
while true; do
  xsetroot -name "$(free -m | grep '^Mem' | awk '{printf "Mem: %.1fG/%.1fG", $3/1000, $2/1000}') | $(date +'%b %d (%a) %R')"
  sleep 1
done &

# DWM loop
while true; do
	dwm >/dev/null 2>&1
#	VBoxClient --clipboard &
done

# DWM
exec dwm
