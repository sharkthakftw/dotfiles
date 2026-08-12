return {
    terminal    = 'sh -c "kitty @ --to unix:/tmp/kitty launch --type=tab || kitty --listen-on unix:/tmp/kitty"',
    code        = 'sh -c "kitty @ --to unix:/tmp/kitty launch --type=tab nvim || (kitty --listen-on unix:/tmp/kitty nvim &)"',
    wikid        = 'sh -c "kitty @ --to unix:/tmp/kitty launch --type=tab wikid || (kitty --listen-on unix:/tmp/kitty wikid &)"',
    filemanager = "nautilus --no-desktop",
    menu        = "tofi-drun --drun-launch=true",
}
