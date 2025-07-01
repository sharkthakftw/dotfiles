#!/usr/bin/env bash

BUDS_MAC=$(bluetoothctl devices | grep "CMF Buds" | grep -oE '([0-9A-F]{2}:){5}[0-9A-F]{2}')
ICON=""

connected_buds=$(bluetoothctl info "$BUDS_MAC" | grep -q "Connected: yes" && echo "yes" || echo "no")

if [ "$connected_buds" = "yes" ]; then
 	battery=$(bluetoothctl info "$BUDS_MAC" | grep 'Battery Percentage' | grep -oP '\(\K[0-9]+(?=\))')
   if [ -z "$battery" ]; then
        echo "$ICON"
    else
        echo "$ICON $battery%"
    fi
else
    echo "$ICON 🚫"
fi
