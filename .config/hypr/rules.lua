local programs = require("programs")

local autostart = {
    ["special:terminal"] = programs.terminal,
    ["special:msg"]      = "beeper",
    ["special:music"]    = "spotify",
    ["special:browser"]  = "zen-browser",
}
hl.on("workspace.created", function(ws)
    local cmd = autostart[ws.name]
    if cmd and ws.is_empty then
        hl.exec_cmd(cmd, { workspace = ws.name .. " silent" })
    end
end)

local function float_center(name, match, size)
    local rule = { name = name, match = match, float = true, center = true, group = "barred" }
    if size then rule.size = size end
    hl.window_rule(rule)
end

local function assign(ws, apps, extra)
    for _, app in ipairs(apps) do
        local rule = { name = app[1], match = app[2], workspace = ws, group = "set invade", tile = true }
        for k, v in pairs(extra or {}) do rule[k] = v end
        hl.window_rule(rule)
    end
end

float_center("nemo",                { class = "nemo" },                     { 900, 600 })
float_center("nautilus",            { class = "org.gnome.Nautilus" },       { 900, 600 })
float_center("yad",                 { class = "yad" },                      { 900, 600 })
float_center("peazip",              { class = "Peazip" },                   { 900, 600 })
float_center("kdeconnect app",      { class = "org.kde.kdeconnect.app" },   { 900, 600 })
float_center("kdeconnect daemon",   { class = "org.kde.kdeconnect.daemon" })
float_center("screen-share-picker", { class = "hyprland-share-picker" },    { 400, 400 })

-- workspace 1
hl.workspace_rule({
    workspace = "1",
    default = true,
    persistent = true,
})
assign(1, {
    { "vesktop",      { class = "^vesktop$" } },
    { "steam client", { class = "^[Ss]team$" } },
})
hl.window_rule({
    name = "steam popups",
    match = { class = "^[Ss]team$", title = "^$" },
    float = true,
})

-- workspace 2
hl.workspace_rule({
    workspace = "2",
})
assign(2, {
    { "steam games", { class = "^(steam_app_.*|steam_proton)$" } },
    { "vlc",         { class = "vlc", title = "VLC media player" } },
})
float_center(
    "vlc file dialog",
    { class = "^vlc$",title = "^(Select one or more files to open)$" }
)
float_center(
    "vlc dir dialog",
    { class = "^vlc$",title = "^(Open Directory)$" }
)

-- workspace 3
hl.workspace_rule({
    workspace = "3",
})
assign(3, {
    { "obsidian", { class = "^md.obsidian.Obsidian$" } },
    { "sioyek",   { class = "^sioyek$" } },
})

-- workspace 4
hl.workspace_rule({
    workspace = "4",
})
assign(4, {
    { "arduino ide",         { class = "^Arduino IDE$" } },
    { "stm32cubeide",        { class = "^STM32CubeIDE$" } },
    { "stm32cubemx",         { class = "^com-st-microxplorer-maingui-STM32CubeMX$" } },
    { "stm32cubeprogrammer", { class = "^com.st.app.Main$" } },
    { "blender",             { class = "blender" } },
})

-- special workspace: terminal
hl.workspace_rule({
    workspace = "special:terminal",
})
hl.window_rule({
    name = "kitty",
    match = { class = "kitty" },
    workspace = "special:terminal",
    fullscreen_state = "2 0",
    focus_on_activate = true,
})
hl.workspace_rule({
    workspace = "special:terminal",
})

-- special workspace: msg
hl.workspace_rule({
    workspace = "special:msg",
})
hl.window_rule({
    name = "beeper",
    match = { class = "Beeper" },
    workspace = "special:msg",
    fullscreen_state = "2 0",
    focus_on_activate = true,
})
hl.workspace_rule({
    workspace = "special:msg",
})

-- special workspace: music
hl.workspace_rule({
    workspace = "special:music",
})
hl.window_rule({
    name = "spotify",
    match = { class = "Spotify" },
    workspace = "special:music",
    group = "set invade",
    focus_on_activate = true,
})

-- special workspace: browser
hl.workspace_rule({
    workspace = "special:browser",
})
hl.window_rule({
    name = "zen",
    match = { class = "zen" },
    workspace = "special:browser",
    group = "set invade",
    focus_on_activate = true,
})
float_center("zen browser library", { title = "Library" }, { 900, 600 })

-- special workspace: downloads
hl.workspace_rule({
    workspace = "special:downloads",
})
assign("special:downloads silent", {
    { "qbittorrent",  { class = "^org.qbittorrent.qBittorrent$" } },
    { "jdownloader2", { title = "^(JDownloader 2)$" } },
})

