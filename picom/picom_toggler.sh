#!/bin/bash



if pgrep -l picom | grep -v toggler  ; then
	echo "picom is running"
	pkill picom
else 
	echo "picom isn't running"
	picom &	
fi
