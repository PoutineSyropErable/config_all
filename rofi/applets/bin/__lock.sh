#!/bin/bash

# Check if Hyprland is running
if pgrep -x "Hyprland" >/dev/null; then
	# Hyprland is running, exit Hyprland
	#notify-send "Hyperland"
	echo "Hyperland"
	hyprlock

elif pgrep -x "i3" >/dev/null || pgrep -x "i3-with-shmlog" >/dev/null; then
	echo "i3"
	betterlockscreen -l
fi
