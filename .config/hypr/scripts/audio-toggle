#!/usr/bin/env bash
set -euo pipefail

# Speaker ID
function get_speaker_id {
    local speaker="Raptor Lake High Definition Audio Controller Speaker"
    local sinks=$(wpctl status | grep -A7 "Sinks:" | grep "$speaker" || true)
    local node_id="${sinks##*│}"    # Remove leading non-digit characters to isolate the ID
    node_id="${node_id%%.*}"            # Keep only up to the first '.'
    node_id="${node_id//[[:space:]]/}"  # Strip all whitespace
    node_id="${node_id#\*}"          # Remove leading * if present
    if [[ -n "$node_id" ]]; then
            echo "$node_id"
            return 0
        else
            return 1
        fi
}

# Buds ID
function get_buds_id {
    local buds="CMF Buds"
    local sinks=$(wpctl status | grep -A7 "Sinks:" | grep "$buds" || true)
    if [[ -z "$sinks" ]]; then
        notify-send -t 2000 "Error" "Buds not connected"  # Error popup
        return 1
    fi
    local node_id="${sinks##*│}"    # Remove leading non-digit characters to isolate the ID
    node_id="${node_id%%.*}"            # Keep only up to the first '.'
    node_id="${node_id//[[:space:]]/}"  # Strip all whitespace
    node_id="${node_id#\*}"          # Remove leading * if present
    if [[ -n "$node_id" ]]; then
            echo "$node_id"
            return 0
        else
            return 1
        fi
}

buds_id=$(get_buds_id) || exit 1
speaker_id=$(get_speaker_id) || exit 1

wpctl set-volume "$buds_id" 0.50    # Ensures volume is 50%

current_default=$(wpctl status | sed -n '/Sinks:/,/^ ├─ /{ /^ ├─ /!p }' | grep '\*')
current_default="${current_default##*│}"    # Remove leading non-digit characters to isolate the ID
current_default="${current_default%%.*}"            # Keep only up to the first '.'
current_default="${current_default//[[:space:]]/}"  # Strip all whitespace
current_default="${current_default#\*}"     # Removes leading * if present

if [[ "$current_default" = "$speaker_id" ]]; then
    wpctl set-default "$buds_id"
elif [[ "$current_default" = "$buds_id" ]]; then
    wpctl set-default "$speaker_id"
else
    notify-send -t 2000 "Error" "Unknown default device"
fi
