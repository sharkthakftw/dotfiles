#!/usr/bin/env bash

bar="▁▂▃▄▅▆▇█"
dict="s/;//g"
space=" "

bar_length=${#bar}

for ((i = 0; i < bar_length; i++)); do
    dict+=";s/$i/${bar:$i:1}${space}/g"
done

config_file="/home/sharkthak/.config/cava/config-waybar"

pkill -f "cava -p $config_file"

cava -p "$config_file" | sed -u "$dict"
