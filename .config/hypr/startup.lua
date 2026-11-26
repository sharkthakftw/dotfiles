hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("~/.config/wayle/layouts/layout.sh")
    hl.exec_cmd("wayle panel start")
    hl.exec_cmd("kdeconnectd")
    hl.exec_cmd("cliphist wipe")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- apps start 3 seconds later
    hl.exec_cmd([[sh -c 'sleep 3
        hyprctl reload &

        ext=0
        for f in /sys/class/drm/card*-*/status; do
            case "$f" in
                *eDP*) ;;
                *) grep -q "^connected" "$f" && ext=1 ;;
            esac
        done

        if [ "$ext" = 1 ]; then
            prime-run zen-browser &
            prime-run steam &
        else
            zen-browser &
        fi

        vesktop &
        obsidian &
        spotify &
        zapfast &
        wait']])
end)
