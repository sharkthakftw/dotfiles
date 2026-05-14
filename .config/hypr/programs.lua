return {
    terminal    = 'sh -c "kitty @ --to unix:/tmp/kitty launch --type=tab || kitty --listen-on unix:/tmp/kitty & sleep 0.1 && hyprctl dispatch focuswindow \'class:^(kitty)$\' || hyprctl dispatch focuswindow \'class:^(kitty)$\'"',
    code        = 'sh -c "kitty @ --to unix:/tmp/kitty launch --type=tab nvim || (kitty --listen-on unix:/tmp/kitty nvim &) && sleep 0.1; hyprctl dispatch focuswindow \'class:^(kitty)$\'"',
    filemanager = "nautilus --no-desktop",
    menu        = "tofi-drun --drun-launch=true",
    -- wallpaper = "awww-daemon && awww img ~/.config/wallpapers/pixel-computer.png",
}
