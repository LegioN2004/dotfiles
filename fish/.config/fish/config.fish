# fortune | cowsay
sh ~/dotfiles/neofetch/nofetch --flex #nitch #download afetch fastfetch from aur
#use sh to run any bash scripts from the fish shell at startup 

set fish_greeting ""
set -gx EDITOR nvim
# set -g theme_color_scheme terminal-dark

set TLP_ENABLE 1

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

#fzf
set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --hidden'

# NodeJS
set -gx PATH node_modules/.bin $PATH
set -gx PATH /home/sunny/.nvm/versions/node/v18.12.1/bin $PATH

# IntelliJ IdeaIC2022 path
# set -gx PATH ~/Downloads/idea-IC-223.8214.52/bin/ $PATH

# Replace ls with exa
alias ll='exa -al --color=always --group-directories-first --icons' # preferred listing
alias ls='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias la='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l='exa -lah --color=always --group-directories-first --icons' # tree listing

if type -q exa
alias tree "exa --tree -g"
alias lr='ls -R'
alias g git

# git
alias g "git"
alias gcl "git clone"
alias gi "git init"
alias ga "git add"
alias gc "git commit -m"
alias gp "git push"
alias gpl "git pull"
alias gs "git status"
# alias ghq "ghq get"

#ranger
alias ran "ranger"

#neovim
#alias v "nvim -u ~/dotfiles/nvim/.config/nvim/MyOwn-Config.lua"
alias v "nvim"
alias nv "neovide"
alias lv "lvim"
alias lz "nvim -u ~/ghq/github.com/LegioN2004/some-other-stuff/lazy-vim-config/nvim/init.lua"

#C++ run code alias
alias compile "g++"
alias run "./a.out"

#iso details
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"

#tmux
alias ide "./ide"

#laptop power management aliases
alias sus  "systemctl suspend"
alias pow  "poweroff"
alias reb  "reboot"

# config shortcut aliases
alias i3config "nvim ~/.config/i3/config"
alias sxhkdrc "nvim ~/.config/sxhkd/sxhkdrc"
alias alacrittyconfig "nvim ~/.config/alacritty/alacritty.yml"
alias bashconfig "nvim ~/.bashrc"
alias zshconfig "nvim ~/.zshrc"
alias fishconfig "nvim ~/.config/fish/config.fish"
alias nvimconfig "nvim ~/.config/nvim/init.lua"
alias picomconfig "nvim ~/.config/picom/picom.conf"
alias hyprlconfig "nvim ~/.config/hypr/hyprland.conf"
alias hyprconfig "nvim ~/.config/hypr/hypr.conf"
alias tmuxconfig "nvim ~/.tmux.conf"
alias kittyconfig "nvim ~/.config/kitty/kitty.conf"

# source config files
alias sourceb "source ~/.bashrc"
alias sourcez "source ~/.zshrc"
alias sourcef "source ~/.config/fish/config.fish"
alias sourcet "source ~/.tmux.conf"

# pacman and paru/yay aliases
alias sp "sudo pacman "
alias sps "sudo pacman -S "
alias spsyy "sudo pacman -Syy "
alias spsyyu  "sudo pacman -Syyu "
alias ysyyu  "yay -Syyu "
alias yysyyu  "yes|yay -Syyu "
alias psyyu  "paru -Syyu "
alias ypsyyu  "yes|paru -Syyu "
alias psyu  "paru -Syu "
alias ps  "paru -S "
alias yps  "yes|paru -S "
alias psr  "paru -R "
alias prns  "paru -Rns "
alias yprns  "yes|paru -Rns "
alias yspr "sudo pacman -R "
alias sprs "sudo pacman -Rs "
alias sprns "sudo pacman -Rns "
alias ysprns "yes|sudo pacman -Rns "
alias ysprs "sudo pacman -Rs "
alias clean "yes|sudo pacman -Scc && yes|yay -Scc "

# miscellaneous
alias cat "bat"
alias idea "./home/sunny/Downloads/idea-IC-223.8214.52/bin/idea.sh"
alias emoji "rofi -modi emoji -show emoji -kb-custom-1 Ctrl+C"
alias gpg-check "gpg2 --keyserver-options auto-key-retrieve --verify"
alias update-grub "sudo grub-mkconfig -o /boot/grub/grub.cfg"
end
alias xev-keyb "xev -event keyboard  | egrep -o 'keycode.*)'"

