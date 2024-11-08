#!/bin/bash

# Specify the process name you want to kill
process_name="kanata"

# Get the PID of the current script
current_pid=$$

# Use pkill to terminate processes named 'kanata', excluding the current script's PID
pkill -f "$process_name" --ignore "$current_pid"
sleep 1

kanata >kanata_logs &
