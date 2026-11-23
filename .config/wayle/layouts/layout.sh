#!/usr/bin/env bash
dir=~/.config/wayle

apply() {
  if hyprctl monitors -j | jq -e '.[] | select(.name=="HDMI-A-1")' >/dev/null; then
    src=docked
  else
    src=standalone
  fi
  cmp -s "$dir/layouts/$src.toml" "$dir/layout.toml" || {
    cp "$dir/layouts/$src.toml" "$dir/layout.toml"
    touch "$dir/config.toml"   # nudge the live reload
  }
}

apply
socat -U - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" |
while read -r line; do
  case $line in
    monitoradded*|monitorremoved*) sleep 0.5; apply ;;
  esac
done
