#!/bin/bash
# Get the list of connected monitors
all_monitors=$(xrandr --query | grep " connected" | cut -d" " -f1)
echo "all monitors:"
echo "$all_monitors"

# Function to check if a monitor is in the list
function monitor_exists {
  local target_monitor=$1
  for monitor in "${all_monitors[@]}"; do
    if [[ "$monitor" == "$target_monitor" ]]; then
      return 0 # Found
    fi
  done
  return 1 # Not found
}

# Example usage of the function
if monitor_exists "$main_monitor"; then
  echo "$main_monitor is connected."
else
  echo "$main_monitor is not connected."
  main_monitor=$fallback_monitor
fi
