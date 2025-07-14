set -g fish_greeting

if status is-interactive

fish_vi_key_bindings

alias clear 'clear && nitch -n'

# Aliases for aria2
alias ariahouse 'aria2c --conf-path=/home/sharkthak/.config/aria2/aria2.House'
alias ariamovies 'aria2c --conf-path=/home/sharkthak/.config/aria2/aria2.movies'

alias dotfiles 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME/'
alias notes 'git --git-dir=$HOME/Obsidian/sharkthak/.git --work-tree=$HOME/Obsidian/sharkthak/'

# Aliases for dotfiles git commands
alias ds 'dotfiles status -s'
alias dd 'dotfiles diff --output-indicator-new=" " --output-indicator-old=" "'
alias da 'dotfiles add'
alias dc 'dotfiles commit -a -m'
alias dp 'dotfiles push'
alias dl 'dotfiles log --oneline --decorate=no -7'

alias ns 'notes status -s'

alias ls 'ls --color=auto'
alias grep 'grep --color=auto'
alias nv 'nvim'

# Aliases for pacman and yay
alias update 'sudo pacman -Syu && yay -Syu'
alias pm 'sudo pacman -S'
alias pmr 'sudo pacman -Rns'
alias y 'yay -S'
alias yr 'yay -Rns'

alias clean 'sudo pacman -Scc --noconfirm && yay -Scc --noconfirm'

# Starship
starship init fish | source

# Zoxide
zoxide init fish | source

fish_add_path /home/sharkthak/.spicetify
fish_add_path "$HOME/spicetify"

# SSH for GitHub
if type -q keychain
    set -l host (string split . (prompt_hostname))
    keychain --quiet githubkey
    source ~/.keychain/$host[1]-fish
end

# Yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# MAN pages open in Neovim
set -x MANPAGER 'nvim +Man!'

# Nitch
nitch -n

end
