set -g fish_greeting

if status is-login
    if test -z "$DISPLAY" -a (tty) = "/dev/tty1"
        exec Hyprland
    end
end

if status is-interactive

alias dotfiles 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME/'
alias notes 'git --git-dir=$HOME/Obsidian/sharkthak/.git --work-tree=$HOME/Obsidian/sharkthak/'

alias ds 'dotfiles status -s'
alias dd 'dotfiles diff --output-indicator-new=" " --output-indicator-old=" "'
alias da 'dotfiles add'
alias dc 'dotfiles commit -m'
alias dp 'dotfiles push'
alias dl 'dotfiles log --oneline --decorate=no -7'

alias ns 'notes status -s'

alias ls 'ls --color=auto'
alias grep 'grep --color=auto'
alias nv 'nvim'

alias update 'sudo pacman -Syu && yay -Syu'

starship init fish | source

fish_add_path /home/sharkthak/.spicetify
fish_add_path "$HOME/spicetify"

set -x MANPAGER 'nvim +Man!'

fastfetch --logo arch_small --structure users:os:shell:wm:terminal --users-format "{1}" --os-format "{1}" --shell-format "{1}" --wm-format "{1}" --terminal-format "{1}"

end
