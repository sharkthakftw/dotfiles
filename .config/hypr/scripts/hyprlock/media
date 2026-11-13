#!/usr/bin/env bash

# Fetch current Spotify/media metadata
playerctl -p spotify,zen,firefox,%any metadata --format '{{status}}|{{artist}}|{{title}}|{{duration(position)}}|{{duration(mpris:length)}}|{{position}}|{{mpris:length}}' 2>/dev/null | awk -F'|' '
NF < 7 { exit }
{
    status = $1; artist = $2; title = $3; pos = $4; len = $5; raw_pos = $6; raw_len = $7
    if (status != "Playing" && status != "Paused") exit
    icon = (status == "Playing") ? "" : ""
    
    # Progress ratio
    ratio = (raw_len > 0) ? raw_pos / raw_len : 0
    if (ratio < 0) ratio = 0
    if (ratio > 1) ratio = 1
    
    # 16-char progress bar matching TUI box chars
    bar_len = 16
    filled = int(ratio * bar_len + 0.5)
    bar = ""
    for (i = 0; i < filled; i++) bar = bar "━"
    for (i = filled; i < bar_len; i++) bar = bar "─"
    
    # Format track name (max 44 chars to keep 51-char box width)
    track = (artist != "") ? title " — " artist : title
    max_track = 44
    if (length(track) > max_track) track = substr(track, 1, max_track - 1) "…"
    
    pad1 = ""
    for (i = 0; i < (45 - length(track)); i++) pad1 = pad1 " "
    
    time_info = icon " " pos "/" len " "
    pad2_len = 49 - 4 - bar_len - length(time_info)
    pad2 = ""
    for (i = 0; i < pad2_len; i++) pad2 = pad2 " "
    
    print "┌─ now playing ───────────────────────────────────┐"
    print "│   " track pad1 "│"
    print "│    " bar pad2 time_info "│"
    print "└─────────────────────────────────────────────────┘"
}'
