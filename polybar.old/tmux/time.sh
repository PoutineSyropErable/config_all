#!/bin/bash

time=$(mpc | sed -n '2p' | awk '{print $3}')

echo "$time"


