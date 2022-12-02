fortune | cowsay

set fish_greeting ""
set -gx EDITOR nvim
set -g theme_color_scheme terminal-dark

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

set -gx PATH /home/sunny/.nvm/versions/node/v19.0.0/bin $PATH

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# aliases
if type -q exa
  alias ll "exa -l -a -g --icons"
  alias llt "exa --tree -g --icons"
  alias lla "ll -a"
	alias la "ls -A"
  alias tree "exa --tree -g"
	alias g git
	#command -qv nvim && alias  nvim

#my aliases
	alias l "ls -lh"
	alias lm "ls -m"
	alias lr "ls -R"
	alias lg "ls -l --group-directories-first"
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


end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
