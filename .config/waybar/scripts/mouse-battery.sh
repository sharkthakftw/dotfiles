#!/usr/bin/env bash

DEVICE="/org/freedesktop/UPower/devices/battery_hidpp_battery_0"

PERCENT=$(upower -i "$DEVICE" | awk '/percentage:/ {print $2}')

if [[ "$PERCENT" == "0%" ]]; then
    echo "🖱️ 🚫"
else
    echo "🖱️$PERCENT"
fi
