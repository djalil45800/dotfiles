#!/bin/bash

shutdown="󰐥  Power Off"
reboot="󰜉  Reboot"
lock="  Lock"
suspend="󰒲  Suspend"

options="$shutdown\n$reboot\n$lock\n$suspend"

choix=$(echo -e "$options" | wofi --dmenu \
	--prompt "System" \
	--width 200 \
	--height 190 \
	--hide-search \
	--style "$HOME/.config/sway/style/power.css" \
	--cache-file /dev/null)

case "$choix" in
"$shutdown") systemctl poweroff ;;
"$reboot") systemctl reboot ;;
"$lock") ~/.config/sway/scripts/lock.sh ;;
"$suspend")
	~/.config/sway/scripts/lock.sh &
	sleep 1 && systemctl suspend
	;;
esac
