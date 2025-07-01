#!/usr/bin/env bash

PERCENT=$(upower -d | grep -A12 'Logitech G304' | awk '/percentage:/ {print $2}')

if [[ "$PERCENT" == "0%" ]]; then
    echo "🖱️ 🚫"
else
    echo "🖱️ $PERCENT"
fi
