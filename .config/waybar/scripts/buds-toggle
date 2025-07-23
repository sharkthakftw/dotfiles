#!/usr/bin/env bash

DEVICE="$(bluetoothctl devices | grep "CMF Buds" | grep -oE '([0-9A-F]{2}:){5}[0-9A-F]{2}')"

connected=$(bluetoothctl info "$DEVICE" | grep "Connected: yes")

if [ -n "$connected" ]; then
  echo -e "disconnect $DEVICE\nexit" | bluetoothctl
else
  echo -e "connect $DEVICE\nexit" | bluetoothctl
fi

