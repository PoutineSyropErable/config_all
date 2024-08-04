#!/bin/bash

# Get the current status from mpc

# Extract the volume percentage using sed
volume=$( mpc | sed -n 's/.*volume: *\([0-9]\+%\).*/\1/p')

# Print the volume percentage
echo $volume

