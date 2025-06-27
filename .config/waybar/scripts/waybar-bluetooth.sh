#!/usr/bin/env bash

MAC="$1"
ICON="$2"

connected=$(bluetoothctl info "$MAC" | grep -q "Connected: yes" && echo "yes" || echo "no")

if [ "$connected" = "yes" ]; then
 	battery=$(bluetoothctl info "$MAC" | grep 'Battery Percentage' | grep -oP '\(\K[0-9]+')
   if [ -z "$battery" ]; then
        echo "$ICON"
    else
        echo "$ICON $battery%"
    fi
else
    echo "$ICON 🚫"
fi

