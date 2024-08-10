#!/bin/bash

# Check if Hyprland is running
if pgrep -x "Hyprland" > /dev/null; then
    # Hyprland is running, exit Hyprland
	#notify-send "Hyperland"
	echo "Hyperland"
    hyprctl dispatch exit

# Check if i3 is running
elif pgrep -x "i3" > /dev/null; then
    # i3 is running, exit i3
	#notify-send "i3"
	echo "i3"
    i3-msg exit
else
    echo "Neither Hyprland nor i3 is running."
fi

