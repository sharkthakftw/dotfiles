local M = {}

-- docked = any non-internal display connector reports "connected"
function M.docked()
    local p = io.popen([[for f in /sys/class/drm/card*-*/status; do case "$f" in *eDP*) ;; *) grep -q '^connected' "$f" && echo 1;; esac; done]])
    local out = p:read("*a")
    p:close()
    return out ~= ""
end

local lidClosed = false

local function laptopScreenOff()
    hl.monitor({ output = "eDP-1", disabled = true })
end

local function laptopScreenOn()
    local ext = hl.get_monitor("HDMI-A-1") ~= nil
    hl.monitor({
        output   = "eDP-1",
        disabled = false,
        mode     = "1920x1080@144",
        position = ext and "1920x90" or "0x0",
        scale    = ext and 1.2 or 1,
    })
end

-- lid closed: turn the laptop screen off only if an external monitor is connected
hl.bind("switch:on:Lid Switch", function()
    lidClosed = true
    if #(hl.get_monitors()) <= 1 then return end
    laptopScreenOff()
end, { locked = true })

-- lid opened: turn it back on
hl.bind("switch:off:Lid Switch", function()
    lidClosed = false
    laptopScreenOn()
end, { locked = true })

-- monitor plugged in while the lid is already closed
hl.on("monitor.added", function()
    if lidClosed and #(hl.get_monitors()) > 1 then
        laptopScreenOff()
    end
end)

hl.bind("SUPER + CTRL + SHIFT + K", function()
    if hl.get_monitor("eDP-1") then
        laptopScreenOff()
    else
        laptopScreenOn()
    end
end, { locked = true })

return M
