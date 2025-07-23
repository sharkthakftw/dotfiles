#!/usr/bin/env bash

status=$(playerctl --player=spotify status)

if [ "$status" = "Playing" ]; then
    icon=""
elif [ "$status" = "Paused" ]; then
    icon=""
else
    echo ""
    exit 0
fi

info=$(playerctl --player=spotify metadata --format "{{ title }} - {{ artist }}")

echo "$icon $info"

