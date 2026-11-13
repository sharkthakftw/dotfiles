local programs = require("programs")

local function script(name)
    local scripts = "~/.config/hypr/scripts/"
    return hl.dsp.exec_cmd(scripts .. name)
end

local function docked()
    return #(hl.get_monitors()) > 1
end

-- fullscreen
hl.bind("SUPER + F", hl.dsp.window.fullscreen_state({ internal = 1, client = 0 }))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen_state({ internal = 2, client = 0, action = "toggle" }))

-- groups / windows
hl.bind("SUPER + TAB", hl.dsp.group.next())
hl.bind("SUPER + SHIFT + TAB", hl.dsp.group.prev())
hl.bind("SUPER + CTRL + TAB", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind("SUPER + G", hl.dsp.group.toggle())
hl.bind("SUPER + SHIFT + G", hl.dsp.window.move({ out_of_group = true }))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))

-- launchers
hl.bind("SUPER + Space", hl.dsp.exec_cmd(programs.menu))
hl.bind("SUPER + T", hl.dsp.exec_cmd(programs.terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(programs.filemanager))
hl.bind("SUPER + N", hl.dsp.exec_cmd(programs.code))

-- hypr ecosystem
hl.bind("SUPER + SHIFT + CTRL + R", hl.dsp.reload_config())
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd("hyprshot -s -m region --clipboard-only --freeze"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -s -m window -m active -o ~/Pictures -f grab.png"))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -arl"))
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("pkill hyprsunset || hyprsunset -t 5000"))
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + escape", hl.dsp.exec_cmd("wayle panel toggle"))
hl.bind("SUPER + C", hl.dsp.exec_cmd("rofi -show calc -modi calc -no-show-match -no-sort -no-persist-history -theme ~/.config/rofi/calc.rasi"))

-- kde connect
hl.bind("SUPER + CTRL + C", hl.dsp.exec_cmd("kdeconnect-cli --send-clipboard -n s26"))
hl.bind("SUPER + CTRL + F", script("kde-file-share"))

-- scripts
hl.bind("SUPER + SHIFT + D", script("dnd"))
hl.bind("SUPER + SHIFT + A", script("audio-toggle"))
hl.bind("SUPER + SHIFT + B", script("battery-notif"))
hl.bind("SUPER + CTRL + T", script("text-snatch"))
hl.bind("SUPER + SHIFT + CTRL + F", hl.dsp.exec_cmd("sudo -n /usr/local/bin/fanmax toggle"))

-- spotify
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl --player=spotify play-pause"), { locked = true })
hl.bind("CTRL + ALT + S", hl.dsp.exec_cmd("playerctl --player=spotify play-pause"), { locked = true })
hl.bind("CTRL + ALT + D", hl.dsp.exec_cmd("playerctl --player=spotify next"), { locked = true })
hl.bind("CTRL + ALT + A", hl.dsp.exec_cmd("playerctl --player=spotify previous"), { locked = true })

-- gpu screen recorder
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("gsr-ui-cli toggle-replay"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("gsr-ui-cli replay-save"))

-- mouse window management
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- workspaces
hl.gesture({ fingers = 3, direction = "left", action = "special", workspace_name = "browser" })
hl.gesture({ fingers = 3, direction = "down", action = "special", workspace_name = "terminal" })
hl.gesture({ fingers = 3, direction = "up", action = "special", workspace_name = "music" })

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

for i = 1, 6 do
    hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + CTRL + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + grave", function()
    if docked() then
        hl.dispatch(hl.dsp.focus({ workspace = 5 }))
    else
        hl.dispatch(hl.dsp.workspace.toggle_special("terminal"))
    end
end)
hl.bind("SUPER + CTRL + grave", function()
    hl.dispatch(hl.dsp.window.move({ workspace = docked() and 5 or "special:terminal" }))
end)

local function app_key(ws, class, fallback)
    return function()
        if docked() then
            hl.dispatch(hl.dsp.focus({ workspace = ws }))
            hl.dispatch(hl.dsp.focus({ window = "class:" .. class }))
        else
            hl.dispatch(fallback)
        end
    end
end

hl.bind("SUPER + B", app_key(6, "^Beeper$",  hl.dsp.workspace.toggle_special("msg")))
hl.bind("SUPER + S", app_key(6, "^Spotify$", hl.dsp.workspace.toggle_special("music")))
hl.bind("SUPER + W", app_key(1, "zen",       hl.dsp.workspace.toggle_special("browser")))
hl.bind("SUPER + V", app_key(6, "^vesktop$"))

hl.bind("SUPER + D", hl.dsp.workspace.toggle_special("downloads"))

-- function keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("SUPER + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness up"), { locked = true, repeating = false })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness down"), { locked = true, repeating = false })
