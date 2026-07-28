set -g fish_greeting
if status is-interactive
fish_vi_key_bindings

# aliases for aria2
alias ariamovies 'aria2c --conf-path=/home/sharkthak/.config/aria2/aria2.movies.conf'
alias ariatorrents 'aria2c --conf-path=/home/sharkthak/.config/aria2/aria2.torrent.conf'
alias ariasaul 'aria2c --conf-path=/home/sharkthak/.config/aria2/aria2.saul.conf'
alias ariahouse 'aria2c --conf-path=/home/sharkthak/.config/aria2/aria2.house.conf'

# aliases for git commands
alias dotfiles 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME/'
alias lazydot 'lazygit -g $HOME/.dotfiles/ -w $HOME/'
alias ds 'dotfiles st'
alias dd 'dotfiles diff'
alias da 'dotfiles add'
alias dc 'dotfiles commit -a -m'
alias dp 'dotfiles push'
alias dl 'dotfiles log --oneline -7'

alias notes 'git --git-dir=$HOME/Obsidian/.git --work-tree=$HOME/Obsidian/'
alias ns 'notes st'

alias ls 'eza'
alias tree 'eza -T'
alias grep 'grep --color=auto'

# aliases for pacman and yay
alias update 'haj jump'
alias install 'haj install'
alias remove 'haj toss'
alias clean 'yay -Scc --noconfirm'

alias icat 'kitten icat'
alias astrobhopal 'astroterm -a 23.2599 -o 77.4126 -Ccu'
alias lutcam 'lutgen apply -p camellia'

starship init fish | source
zoxide init fish | source

fish_add_path /home/sharkthak/.spicetify
fish_add_path "$HOME/spicetify"

# ssh for github
if type -q keychain
    set -l host (string split . (prompt_hostname))
    keychain --quiet githubkey
    if test -f ~/.keychain/$host[1]-sh
        for line in (string split ';' < ~/.keychain/$host[1]-sh)
            set -l kv (string match -r '^\s*([A-Z_]+)=(.*)$' -- $line)
            if test (count $kv) -eq 3
                set -gx $kv[2] $kv[3]
            end
        end
    end
end

# yazi
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

# man pages open in neovim
set -x MANPAGER 'nvim +Man!'

# created by `pipx`
set PATH $PATH /home/sharkthak/.local/bin
# suppress node.js warnings
set -x NODE_OPTIONS --no-deprecation

end

# cargo
set PATH $PATH /home/sharkthak/.cargo/bin

# pnpm
set -gx PNPM_HOME "/home/sharkthak/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

# Added by Antigravity CLI installer
set -gx PATH "/home/sharkthak/.local/bin" $PATH
