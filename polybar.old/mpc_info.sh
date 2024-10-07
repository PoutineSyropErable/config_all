#!/bin/bash

volume=$( mpc | sed -n 's/.*volume: *\([0-9]\+%\).*/\1/p' | sed 's/^[ \t]*//' )
time=$(mpc | sed -n '2p' | awk '{print $3}')

echo "$time  $volume"


