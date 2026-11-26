local programs = require("programs")

local function script(name)
    local scripts = "~/.config/hypr/scripts/"
    return hl.dsp.exec_cmd(scripts .. name)
end

local function bind_reset(key, action)
    hl.bind(key, function()
        hl.dispatch(action)
        hl.dispatch(hl.dsp.submap("reset"))
    end)
end

local function docked()
    return hl.get_monitor("HDMI-A-1") ~= nil
end

hl.bind("SUPER + escape", hl.dsp.exec_cmd("wayle panel toggle"))

-- launchers
hl.bind("SUPER + Space", hl.dsp.exec_cmd(programs.menu))
hl.bind("SUPER + SHIFT + Space", script("tofi-prime"))
hl.bind("SUPER + T", hl.dsp.exec_cmd(programs.terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(programs.filemanager))
hl.bind("SUPER + N", hl.dsp.exec_cmd(programs.code))
hl.bind("SUPER + K", hl.dsp.exec_cmd(programs.wikid))
hl.bind("SUPER + C", hl.dsp.exec_cmd("rofi -show calc -modi calc -no-show-match -no-sort -no-persist-history -theme ~/.config/rofi/calc.rasi"))

-- windows
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + W", hl.dsp.submap("window"))
hl.define_submap("window", function()
    hl.bind("Escape", hl.dsp.submap("reset"))

    bind_reset("M", hl.dsp.window.fullscreen_state({ internal = 1, client = 0 }))
    bind_reset("F", hl.dsp.window.fullscreen_state({ internal = 2, client = 0, action = "toggle" }))
    bind_reset("G", hl.dsp.group.toggle())
    bind_reset("SHIFT + G", hl.dsp.window.move({ out_of_group = true }))
    bind_reset("V", hl.dsp.window.float({ action = "toggle" }))
end)
hl.bind("SUPER + TAB", hl.dsp.group.next())
hl.bind("SUPER + SHIFT + TAB", hl.dsp.group.prev())
hl.bind("SUPER + CTRL + TAB", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.bring_to_top())
end)

-- kde connect
hl.bind("SUPER + SHIFT + K", hl.dsp.submap("kde"))
hl.define_submap("kde", function()
    hl.bind("Escape", hl.dsp.submap("reset"))

    bind_reset("C", hl.dsp.exec_cmd("kdeconnect-cli --send-clipboard -n s26"))
    bind_reset("F", script("kde-file-share"))
end)

-- screenshot/recording
hl.bind("SUPER + SHIFT + S", hl.dsp.submap("scr"))
hl.define_submap("scr", function()
    hl.bind("Escape", hl.dsp.submap("reset"))

    bind_reset("S", hl.dsp.exec_cmd("hyprshot -s -m region --clipboard-only --freeze"))
    bind_reset("W", hl.dsp.exec_cmd("hyprshot -s -m window -m active -o ~/Pictures -f grab.png"))
    bind_reset("C", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -arl"))
    bind_reset("T", script("text-snatch"))
    bind_reset("R", hl.dsp.exec_cmd("gsr-ui-cli replay-save"))
    bind_reset("SHIFT + R", hl.dsp.exec_cmd("gsr-ui-cli toggle-replay"))
    bind_reset("V", script("clip"))
end)

-- system
hl.bind("SUPER + X", hl.dsp.submap("system"))
hl.define_submap("system", function()
    hl.bind("Escape", hl.dsp.submap("reset"))

    hl.bind("V", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
    hl.bind("SHIFT + V", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
    hl.bind("B", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness up"), { locked = true, repeating = false })
    hl.bind("SHIFT + B", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness down"), { locked = true, repeating = false })
    bind_reset("M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
    bind_reset("SHIFT + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
    bind_reset("F", hl.dsp.exec_cmd("sudo -n /usr/local/bin/fanmax toggle"))
    bind_reset("N", hl.dsp.exec_cmd("pkill hyprsunset || hyprsunset -t 5000"))
    bind_reset("D", script("dnd"))
    hl.bind("A", script("cycle-sinks"))
    bind_reset("P", script("battery-notif"))
    bind_reset("R", hl.dsp.reload_config())
    bind_reset("L", hl.dsp.exec_cmd("hyprlock"))
end)

-- spotify
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl --player=spotify play-pause"), { locked = true })
hl.bind("CTRL + ALT + S", hl.dsp.exec_cmd("playerctl --player=spotify play-pause"), { locked = true })
hl.bind("CTRL + ALT + D", hl.dsp.exec_cmd("playerctl --player=spotify next"), { locked = true })
hl.bind("CTRL + ALT + A", hl.dsp.exec_cmd("playerctl --player=spotify previous"), { locked = true })
hl.bind("SUPER + M", hl.dsp.submap("spotify"))
hl.define_submap("spotify", function()
   hl.bind("Escape", hl.dsp.submap("reset"))

    bind_reset("S", hl.dsp.exec_cmd("playerctl --player=spotify play-pause"))
    hl.bind("D", hl.dsp.exec_cmd("playerctl --player=spotify next"))
    hl.bind("A", hl.dsp.exec_cmd("playerctl --player=spotify previous"))
end)

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

hl.bind("SUPER + B", app_key(6, "^zapfast$",  hl.dsp.workspace.toggle_special("msg")))
hl.bind("SUPER + S", app_key(6, "^Spotify$",  hl.dsp.workspace.toggle_special("music")))
hl.bind("SUPER + W", app_key(1, "zen",        hl.dsp.workspace.toggle_special("browser")))
hl.bind("SUPER + V", app_key(6, "^vesktop$",  hl.dsp.focus({ window = "class:vesktop" })))

hl.bind("SUPER + D", hl.dsp.workspace.toggle_special("downloads"))

-- function keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness up"), { locked = true, repeating = false })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/hypr/scripts/brightness down"), { locked = true, repeating = false })
