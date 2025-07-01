#!/usr/bin/env bash

DEVICE="$(kdeconnect-cli --list-available | grep 'paired and reachable' | grep -oP '(?<=- )[^:]+')"

FILE=$(yad --file --title="Send file via KDE Connect")

if [[ -n "$FILE" ]]; then
    kdeconnect-cli --share "$FILE" --n "$DEVICE"
fi

