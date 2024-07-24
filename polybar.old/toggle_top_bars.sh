#!/bin/bash

#"$HOME/.config/polybar.old/polykill_bar" bar0
#"$HOME/.config/polybar.old/polykill_bar" bar1
sleep 0.5
"$HOME/.config/polybar.old/polybar_toggle" bar0 &
"$HOME/.config/polybar.old/polybar_toggle" bar1
