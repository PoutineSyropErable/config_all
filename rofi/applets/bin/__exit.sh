#!/bin/bash

# Check if Hyprland is running
if pgrep -x "Hyprland" >/dev/null; then
	# Hyprland is running, exit Hyprland
	#notify-send "Hyperland"
	echo "Hyperland"
	hyprctl dispatch exit

elif pgrep -x "i3" >/dev/null || pgrep -x "i3-with-shmlog" >/dev/null; then
	echo "i3"
	i3-msg exit

elif pgrep -x "sway" >/dev/null; then
	echo "sway"
	swaymsg exit

elif pgrep -x "awesome" >/dev/null; then
	echo "awesome"
	awesome-client 'awesome.quit()'
fi

echo "it got here"
