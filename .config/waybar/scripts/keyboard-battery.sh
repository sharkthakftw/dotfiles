#!/usr/bin/env bash

KB_MAC=$(bluetoothctl devices | grep "HP 350/355 Series Keyboard" | grep -oE '([0-9A-F]{2}:){5}[0-9A-F]{2}')
ICON=""

connected_kb=$(bluetoothctl info "$KB_MAC" | grep -q "Connected: yes" && echo "yes" || echo "no")

if [ "$connected_kb" = "yes" ]; then
 	battery=$(bluetoothctl info "$KB_MAC" | grep 'Battery Percentage' | grep -oP '\(\K[0-9]+(?=\))')
   if [ -z "$battery" ]; then
        echo "$ICON"
    else
        echo "$ICON $battery%"
    fi
else
    echo "$ICON 🚫"
fi

