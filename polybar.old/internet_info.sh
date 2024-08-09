#!/bin/bash

# Get the active network interface
INTERFACE=$(ip route | grep default | awk '{print $5}')

if [ -z "$INTERFACE" ]; then
    echo "No active internet connection found."
    exit 1
fi

# Get the connection name using nmcli
CONNECTION_NAME=$(nmcli -t -f NAME,DEVICE connection show --active | grep "$INTERFACE" | cut -d':' -f1)

# Get the link speed (works for both Wi-Fi and Ethernet)
if [ -d "/sys/class/net/$INTERFACE/wireless" ]; then
    # Wi-Fi connection
    LINK_SPEED=$(iwctl station "$INTERFACE" show | grep 'Current TX Rate' | awk '{print $4, $5}')
else
    # Ethernet connection
    LINK_SPEED=$(cat /sys/class/net/$INTERFACE/speed)Mb/s
fi

# Display the results
echo "Internet Connection Name: $CONNECTION_NAME"
echo "Interface: $INTERFACE"
echo "Link Speed: $LINK_SPEED"
