#!/usr/bin/env bash

status=$(playerctl --player=spotify status 2>/dev/null)

if [ "$status" = "Playing" ]; then
    icon=""
elif [ "$status" = "Paused" ]; then
    icon=""
else
    echo ""
    exit 0
fi

info=$(playerctl --player=spotify metadata --format "{{ title }} - {{ artist }}" 2>/dev/null)

echo "$icon $info"

