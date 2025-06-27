#!/usr/bin/env bash

DEVICE="nord3"

FILE=$(yad --file --title="Send file via KDE Connect")

if [[ -n "$FILE" ]]; then
    kdeconnect-cli --share "$FILE" --n "$DEVICE"
fi

