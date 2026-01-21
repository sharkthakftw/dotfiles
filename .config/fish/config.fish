set -g fish_greeting

if status is-interactive

fish_vi_key_bindings

# Aliases for aria2
alias ariahouse 'aria2c --conf-path=/home/sharkthak/.config/aria2/aria2.house.conf'
alias ariamovies 'aria2c --conf-path=/home/sharkthak/.config/aria2/aria2.movies.conf'
alias ariatorrents 'aria2c --conf-path=/home/sharkthak/.config/aria2/aria2.torrent.conf'
alias ariasaul 'aria2c --conf-path=/home/sharkthak/.config/aria2/aria2.saul.conf'


# Aliases for dotfiles git commands
alias dotfiles 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME/'
alias ds 'dotfiles status -s'
alias dd 'dotfiles diff --output-indicator-new=" " --output-indicator-old=" "'
alias da 'dotfiles add'
alias dc 'dotfiles commit -a -m'
alias dp 'dotfiles push'
alias dl 'dotfiles log --oneline --decorate=no -7'

alias notes 'git --git-dir=$HOME/Obsidian/sharkthak/.git --work-tree=$HOME/Obsidian/sharkthak/'
alias ns 'notes status -s'

alias ls 'eza'
alias tree 'eza -T'
alias grep 'grep --color=auto'
alias nv 'nvim'

# Aliases for pacman and yay
alias update 'yay -Syu'
alias pm 'sudo pacman -S'
alias pmr 'sudo pacman -Rns'
alias y 'yay -S'
alias yr 'yay -Rns'

alias clean 'yay -Scc --noconfirm'

alias astrobhopal 'astroterm -a 23.2599 -o 77.4126 -Ccu'

alias lutcam 'lutgen apply -p camellia'

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
function yz
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# gcc
function cexec
    gcc "$argv".c -o "$argv" && ./"$argv" && rm "$argv"
end

# g++
function gpp
    g++ "$argv".cpp -o "$argv" && ./"$argv" && rm "$argv"
end

# MAN pages open in Neovim
set -x MANPAGER 'nvim +Man!'

# Created by `pipx`
set PATH $PATH /home/sharkthak/.local/bin

# Suppress Node.js deprecation warnings for gemini-cli
set -x NODE_OPTIONS --no-deprecation

end

# pnpm
set -gx PNPM_HOME "/home/sharkthak/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
