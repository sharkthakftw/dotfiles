hl.on("hyprland.start", function ()
  hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")

  hl.exec_cmd("hypridle")
  hl.exec_cmd("wayle panel start")
  hl.exec_cmd("vesktop")
  hl.exec_cmd("zen-browser")
  hl.exec_cmd("spotify")
  hl.exec_cmd("obsidian")
  hl.exec_cmd("beeper")

  hl.exec_cmd("bluetoothctl connect 2C:BE:EE:79:B0:47") -- Connect to CMF Buds
end)
