hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("wayle panel start")
    hl.exec_cmd("kdeconnectd")

    -- apps start 2 seconds later
    hl.exec_cmd([[sh -c 'sleep 3
        zen-browser &
        vesktop &
        obsidian &
        spotify &
        beeper &
        for f in /sys/class/drm/card*-*/status; do
            case "$f" in
                *eDP*) ;;
                *) grep -q "^connected" "$f" && { steam & break; } ;;
            esac
        done
        wait']])
end)
