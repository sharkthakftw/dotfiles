local programs = require("programs")

local function float_center(name, match, size)
    local rule = { name = name, match = match, float = true, center = true, group = "barred" }
    if size then rule.size = size end
    hl.window_rule(rule)
end

float_center(
    "nemo",
    { class = "nemo" },
    { 900, 600 }
)
float_center(
    "nautilus",
    { class = "org.gnome.Nautilus" },
    { 900, 600 }
)
float_center(
    "yad",
    { class = "yad" },
    { 900, 600 }
)
float_center(
    "peazip",
    { class = "Peazip" },
    { 900, 600 }
)
float_center(
    "kdeconnect daemon",
    { class = "org.kde.kdeconnect.daemon" }
)
float_center(
    "kdeconnect app",
    { class = "org.kde.kdeconnect.app" },
    { 900, 600 }
)
float_center(
    "screen-share-picker",
    { class = "hyprland-share-picker" },
    { 400, 400 }
)

hl.window_rule({
    name = "beeper",
    match = { class = "Beeper" },
    float = true,
    center = true,
    size = { 800, 800 },
    max_size = { 800, 800 },
})

-- workspace 1
hl.window_rule({
    name = "zen browser",
    match = { title = "^(Zen Browser)$" },
    workspace = 1,
    group = "set invade",
})
hl.window_rule({
    name = "qbittorrent",
    match = { class = "org.qbittorrent.qBittorrent" },
    workspace = 1,
    group = "set invade",
})
hl.window_rule({
    name = "jdownloader2",
    match = { title = "^(JDownloader 2)$" },
    workspace = 1,
    group = "set invade",
})
float_center(
    "zen browser library",
    { title = "Library" }
)

-- workspace 2
hl.window_rule({
    name = "vesktop",
    match = { class = "vesktop" },
    workspace = 2,
    group = "set invade",
})
hl.window_rule({
    name = "steam",
    match = { class = "steam" },
    workspace = 2,
    group = "set invade",
})
hl.window_rule({
    name = "steam2",
    match = { class = "Steam" },
    workspace = 2,
    group = "set invade",
})
hl.window_rule({
    name = "steam3",
    match = { title = "Steam" },
    workspace = 2,
    group = "set invade",
})
hl.window_rule({
    name = "steam_app",
    match = { class = "^(steam_app_.*)$" },
    workspace = 2,
    group = "set invade",
})
hl.window_rule({
    name = "steam_proton",
    match = { class = "steam_proton" },
    workspace = 2,
    group = "set invade",
})
hl.window_rule({
    name = "blender",
    match = { class = "blender" },
    workspace = 2,
})

-- workspace 3
hl.window_rule({
    name = "vlc",
    match = { class = "vlc" },
    workspace = 3,
    group = "set invade",
})
hl.window_rule({
    name = "spotify",
    match = { class = "Spotify" },
    workspace = 3,
    group = "set invade",
})
float_center(
    "vlc file dialog",
    { title = "^(Select one or more files to open — VLC media player)$" }
)
float_center(
    "vlc dir dialog",
    { title = "^(Open Directory — VLC media player)$" }
)

-- workspace 4
hl.window_rule({
    name = "obsidian",
    match = { class = "obsidian" },
    workspace = 4,
    group = "set invade",
})
hl.window_rule({
    name = "sioyek",
    match = { class = "sioyek" },
    workspace = 4,
})
hl.window_rule({
    name = "arduino ide",
    match = { class = "Arduino IDE" },
    workspace = 4,
    group = "set invade",
})
hl.window_rule({
    name = "stm32cubeide",
    match = { class = "STM32CubeIDE" },
    workspace = 4,
    group = "set invade",
})
hl.window_rule({
    name = "stm32cubemx",
    match = { class = "com-st-microxplorer-maingui-STM32CubeMX" },
    workspace = 4,
    group = "set invade",
})
hl.window_rule({
    name = "stm32cubeprogrammer",
    match = { class = "com.st.app.Main" },
    workspace = 4,
    group = "set invade",
})

-- special workspace: terminal
hl.window_rule({
    name = "kitty",
    match = { class = "kitty" },
    workspace = "special:terminal",
    fullscreen_state = "2 0",
    focus_on_activate = true,
})
hl.workspace_rule({
    workspace = "special:terminal",
    on_created_empty = programs.terminal,
})
