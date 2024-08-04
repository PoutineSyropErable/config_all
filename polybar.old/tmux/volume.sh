#!/bin/bash

volume=$( mpc | sed -n 's/.*volume: *\([0-9]\+%\).*/\1/p')

echo "$volume"


