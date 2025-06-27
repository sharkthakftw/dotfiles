#!/usr/bin/env bash

DEVICE="2C:BE:EB:DE:96:D2"

# Check if device is connected
connected=$(bluetoothctl info "$DEVICE" | grep "Connected: yes")

if [ -n "$connected" ]; then
  # Device is connected, disconnect it
  echo -e "disconnect $DEVICE\nexit" | bluetoothctl
else
  # Device is disconnected, connect it
  echo -e "connect $DEVICE\nexit" | bluetoothctl
fi

