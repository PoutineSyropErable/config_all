#!/bin/bash

# Fetch the current song's filename from mpd
current_song=$(mpc current -f "%file%")

# If no song is playing, show a message
if [ -z "$current_song" ]; then
    echo "No song playing"
else
    echo "$current_song"
fi
