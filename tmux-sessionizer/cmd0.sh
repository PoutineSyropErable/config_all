#!/usr/bin/env bash

# Dictionary of paths -> commands
declare -A path_commands

path_commands["$HOME/.config/zsh"]="nvim .zshrc" # nvim commands are kinda useless
path_commands["$HOME/.config/nvim"]="nvim $HOME/.config/nvim/init.lua"
path_commands["$HOME/.config/hypr"]="nvim $HOME/.config/hypr/hyprland.conf"
path_commands["$HOME/Documents/zzz__PersonalProjects/MapleKernel/src"]="./build.sh release qemu '' nomove"

# Input path
target_path="$(pwd)"

command=${path_commands[$target_path]}
# notify-send "0s: $command"

# Dispatcher
if [[ -n "$command" ]]; then
	eval "$command"
else
	notify-send "No command registered for: $target_path"
fi
