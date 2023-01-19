 # fortune | cowsay
 afetch #download afetch fastfetch from aur
#echo ".___                           _____ ___________________   ___ ___   _______________________      __  "
#echo "|   |  __ __  ______ ____     /  _  \\______   \_   ___ \ /   |   \  \______   \__    ___/  \    /  \ " 
#echo "|   | |  |  \/  ___// __ \   /  /_\  \|       _/    \  \//    ~    \  |    |  _/ |    |  \   \/\/   / "
#echo "|   | |  |  /\___ \\  ___/  /    |    \    |   \     \___\    Y    /  |    |   \ |    |   \        /  "
#echo "|___| |____//____  >\___  > \____|__  /____|_  /\______  /\___|_  /   |______  / |____|    \__/\  /   "
#echo "                 \/     \/          \/       \/        \/       \/           \/                 \/    "

set fish_greeting ""
set -gx EDITOR nvim
set -g theme_color_scheme terminal-dark

set TLP_ENABLE 1

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

set -gx PATH /home/sunny/.nvm/versions/node/v18.12.1/bin $PATH

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# aliases
if type -q exa
	alias ls='ls -a'
#	alias ls='exa -l -g --icons'
  alias ll "exa -l -a -g --icons"
  alias llt "exa --tree -g --icons"
  alias lla "ll -a"
  alias tree "exa --tree -g"
	alias lr='ls -R'
	alias g git
	#command -qv nvim && alias  nvim

# git
	alias g "git"
	alias gcl "git clone"
	alias gi "git init"
	alias ga "git add"
	alias gc "git commit -m"
	alias gp "git push"
	alias gs "git status"

#ranger
	alias ran "ranger"

#neovim
	alias v "nvim"
	alias nv "neovide"

#C++ run code alias
	alias compile "g++"
	alias run "./a.out"

#tmux
	alias ide "./ide"

#gotop
# alias htop "gotop"

#laptop power management aliases
	alias sus  "systemctl suspend"
	alias pow  "poweroff"
	alias reb  "reboot"

# config shortcut aliases
		alias i3config "nvim ~/.config/i3/config"
		alias fishconfig "nvim ~/.config/fish/config.fish"

# pacman aliases
  alias install "sudo pacman -S "
  alias update  "sudo pacman -Syu "
  alias remove "sudo pacman -R "
  alias clean "yes|sudo pacman -Scc && yes|yay -Scc "

# miscellaneous
 alias cat "bat"
end

