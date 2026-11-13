local programs = require("programs")

local odyssey = "desc:Samsung Electric Company Odyssey G50F HNAL800882"
local laptop = "desc:Chimei Innolux Corporation 0x162E"

local dock = require("docked")
local docked = dock.docked()

for i = 1, 5 do
    hl.workspace_rule({ workspace = tostring(i), monitor = odyssey, default = (i == 1), persistent = (i == 1) })
end
hl.workspace_rule({ workspace = "6", monitor = laptop, default = true, persistent = true })

local autostart = {}
if docked then
    autostart["5"] = programs.terminal
else
    autostart["special:terminal"] = programs.terminal
    autostart["special:browser"]  = "zen-browser"
    autostart["special:msg"]      = "beeper"
    autostart["special:music"]    = "spotify"
end
hl.on("workspace.created", function(ws)
    local cmd = autostart[ws.name]
    if cmd and ws.is_empty then
        for _, c in ipairs(type(cmd) == "table" and cmd or { cmd }) do
            hl.exec_cmd(c, { workspace = ws.name .. " silent" })
        end
    end
end)

-- reload only when the mode actually changes
local function check_mode()
    if dock.docked() ~= docked then
        hl.exec_cmd("hyprctl reload")
    end
end
hl.on("monitor.added", check_mode)
hl.on("monitor.removed", check_mode)

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
float_center("zen browser library", { title = "Library" }, { 900, 600 })
float_center("vlc file dialog",     { class = "^vlc$", title = "^(Select one or more files to open)$" })
float_center("vlc dir dialog",      { class = "^vlc$", title = "^(Open Directory)$" })

-- workspace 1
if docked then
    assign(1, {
        { "zen", { class = "zen" } },
    }, { focus_on_activate = true })
else
    assign(1, {
        { "vesktop",      { class = "^vesktop$" } },
    })
end
hl.window_rule({
    name = "steam client",
    match = { class = "^[Ss]team$" },
    workspace = docked and "2 silent" or "1 silent",
    tile = true,
    float = false,
    no_initial_focus = true,
})
hl.window_rule({
    name = "steam popups",
    match = { class = "^[Ss]team$", title = "^$" },
    float = true,
    group = "deny"
})

-- workspace 2
assign(2, {
    { "steam games", { class = "^(steam_app_.*|steam_proton)$" } },
    { "vlc",         { class = "vlc", title = "VLC media player" } },
})

-- workspace 3
assign(3, {
    { "obsidian", { class = "^md.obsidian.Obsidian$" } },
    { "sioyek",   { class = "^sioyek$" } },
})

-- workspace 4
assign(4, {
    { "arduino ide",         { class = "^Arduino IDE$" } },
    { "stm32cubeide",        { class = "^STM32CubeIDE$" } },
    { "stm32cubemx",         { class = "^com-st-microxplorer-maingui-STM32CubeMX$" } },
    { "stm32cubeprogrammer", { class = "^com.st.app.Main$" } },
    { "blender",             { class = "blender" } },
})

-- workspace 6
if docked then
    assign(6, {
        { "vesktop", { class = "^vesktop$" } },
        { "spotify", { class = "Spotify" } },
        { "beeper",  { class = "Beeper" } },
    })
else
    hl.window_rule({
        name = "beeper",
        match = { class = "Beeper" },
        workspace = "special:msg silent",
        group = "set invade",
        focus_on_activate = true,
        no_screen_share = true,
        no_initial_focus = true,
    })
    hl.window_rule({
        name = "spotify",
        match = { class = "Spotify" },
        workspace = "special:music silent",
        group = "set invade",
        focus_on_activate = true,
    })
end

-- special workspace: terminal
hl.window_rule({
    name = "kitty",
    match = { class = "kitty" },
    workspace = docked and "5" or "special:terminal silent",
    focus_on_activate = true,
})

-- special workspace: browser
if not docked then
    hl.workspace_rule({ workspace = "special:browser" })
    hl.window_rule({
        name = "zen",
        match = { class = "zen" },
        workspace = "special:browser silent",
        group = "set invade",
        focus_on_activate = true,
    })
end

-- special workspace: downloads
assign("special:downloads silent", {
    { "qbittorrent",  { class = "^org.qbittorrent.qBittorrent$" } },
    { "jdownloader2", { title = "^(JDownloader 2)$" } },
})
