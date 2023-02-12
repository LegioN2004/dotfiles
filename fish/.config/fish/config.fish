# fortune | cowsay
nitch #download afetch fastfetch from aur
#echo ".___                           _____ ___________________   ___ ___   _______________________      __  "
#echo "|   |  __ __  ______ ____     /  _  \\______   \_   ___ \ /   |   \  \______   \__    ___/  \    /  \ " 
#echo "|   | |  |  \/  ___// __ \   /  /_\  \|       _/    \  \//    ~    \  |    |  _/ |    |  \   \/\/   / "
#echo "|   | |  |  /\___ \\  ___/  /    |    \    |   \     \___\    Y    /  |    |   \ |    |   \        /  "
#echo "|___| |____//____  >\___  > \____|__  /____|_  /\______  /\___|_  /   |______  / |____|    \__/\  /   "
#echo "                 \/     \/          \/       \/        \/       \/           \/                 \/    "

set fish_greeting ""
set -gx EDITOR nvim
# set -g theme_color_scheme terminal-dark

set TLP_ENABLE 1

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

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
alias v "nvim"
alias nv "neovide"

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
alias fishconfig "nvim ~/.config/fish/config.fish"
alias sxhkdrc "nvim ~/.config/sxhkd/sxhkdrc"
alias alacrittyconfig "nvim ~/.config/alacritty/alacritty.yml"
alias bashrc "nvim ~/.bashrc"
alias zshrc "nvim ~/.zshrc"
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

# pacman aliases
alias install "sudo pacman -Syy "
alias update  "sudo pacman -Syyu "
alias remove "sudo pacman -R "
alias clean "yes|sudo pacman -Scc && yes|yay -Scc "

# miscellaneous
alias cat "bat"
alias idea "./home/sunny/Downloads/idea-IC-223.8214.52/bin/idea.sh"
alias emoji "rofi -modi emoji -show emoji -kb-custom-1 Ctrl+C"
alias gpg-check "gpg2 --keyserver-options auto-key-retrieve --verify"
alias update-grub "sudo grub-mkconfig -o /boot/grub/grub.cfg"
end

