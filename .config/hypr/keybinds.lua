local programs = require("programs")
local function script(name)
    local scripts = "~/.config/hypr/scripts/"
    return hl.dsp.exec_cmd(scripts .. name)
end

-- fullscreen
hl.bind("SUPER + F", hl.dsp.window.fullscreen_state({ internal = 1, client = 0 }))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen_state({ internal = 2, client = 0, action = "toggle" }))

-- groups / windows
hl.bind("SUPER + TAB", hl.dsp.group.next())
hl.bind("SUPER + SHIFT + TAB", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind("SUPER + G", hl.dsp.group.toggle())
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))

-- muting
hl.bind("SUPER + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))

-- launchers
hl.bind("SUPER + Space", hl.dsp.exec_cmd(programs.menu))
hl.bind("SUPER + T", hl.dsp.exec_cmd(programs.terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(programs.filemanager))
hl.bind("SUPER + N", hl.dsp.exec_cmd("pidof nvim || " .. programs.code))
hl.bind("SUPER + K", hl.dsp.exec_cmd("pidof wikid || " .. programs.wikid))
hl.bind("SUPER + B", hl.dsp.exec_cmd("beeper"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("hyprctl clients | grep zen || zen-browser"))

-- zooming
local function zoomfunction(value)
    local zoomvalue = hl.get_config("cursor:zoom_factor")
    if (zoomvalue + value) > 3.0 then
        hl.config({ cursor = { zoom_factor = 3.0 } })
    elseif (zoomvalue + value) < 1.0 then
        hl.config({ cursor = { zoom_factor = 1.0 } })
    else
        hl.config({ cursor = { zoom_factor = zoomvalue + value } })
    end
end
hl.bind("SUPER + mouse_up", function() zoomfunction(-1.5) end, { repeating = true, description = "Misc: Zoom out" })
hl.bind("SUPER + mouse_down", function() zoomfunction(1.5) end, { repeating = true, description = "Misc: Zoom in" })
hl.bind("SUPER + Minus", function() zoomfunction(-1.5) end, { repeating = true, description = "Misc: Zoom out" })
hl.bind("SUPER + Equal", function() zoomfunction(1.5) end, { repeating = true, description = "Misc: Zoom in" })

-- hypr ecosystem
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd("hyprshot -s -m region --clipboard-only --freeze"),
    { description = "Capture region to clipboard" })
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -s -m window -m active -o ~/Pictures -f grab.png"),
    { description = "Capture active window" })
hl.bind("SUPER + C", hl.dsp.exec_cmd("hyprpicker -arl"))
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + escape", hl.dsp.exec_cmd("wayle panel toggle"))

-- kde connect
hl.bind("SUPER + CTRL + C", hl.dsp.exec_cmd("kdeconnect-cli --send-clipboard -n nord3"),
    { description = "KDE Connect send clipboard" })
hl.bind("SUPER + CTRL + F", script("kde-file-share"), { description = "KDE Connect file sharing" })

-- scripts
hl.bind("SUPER + SHIFT + D", script("dnd"), { description = "DND for Wayle" })
hl.bind("SUPER + SHIFT + A", script("audio-toggle"), { description = "Audio output toggle" })
hl.bind("SUPER + SHIFT + B", script("battery-notif"), { description = "Battery status" })
hl.bind("SUPER + CTRL + T", script("text-snatch"), { description = "Text snatcher from image" })

-- spotify
hl.bind("CTRL + ALT + S", hl.dsp.exec_cmd("playerctl --player=spotify play-pause"))
hl.bind("CTRL + ALT + D", hl.dsp.exec_cmd("playerctl --player=spotify next"))
hl.bind("CTRL + ALT + A", hl.dsp.exec_cmd("playerctl --player=spotify previous"))

-- gpu screen recorder
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("gsr-ui-cli toggle-replay"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("gsr-ui-cli replay-save"))

-- mouse window management
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- workspaces
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
for i = 1, 4 do
    hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + CTRL + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind("SUPER + grave", hl.dsp.workspace.toggle_special("terminal"))
hl.bind("SUPER + CTRL + grave", hl.dsp.window.move({ workspace = "special:terminal" }))

-- function keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { repeating = true })
