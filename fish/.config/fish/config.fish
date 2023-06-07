# fortune | cowsay
# sh ~/dotfiles/neofetch/nofetch --flex #nitch #download afetch fastfetch from aur
#use sh to run any bash scripts from the fish shell at startup 

# fish stuff -----------------------------------------------------------------
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
set -gx PATH /home/sunny/.nvm/versions/node/v18.15.0/bin $PATH

# set fish_history $XDG_DATA_HOME/fish/fish_history
# HISTSIZE=100000
# HISTFILESIZE=100000
# IntelliJ IdeaIC2022 path

set -gx PATH ~/Downloads/IntellijIdea-2023.1/idea-IC-231.8109.175/bin/ $PATH
set -gx PATH /home/sunny/Downloads/jdk-17.0.6/bin/ $PATH
set -gx PATH /home/sunny/Downloads/clangd_15.0.6/bin/ $PATH

# fish stuff -----------------------------------------------------------------


# Replace ls with exa
alias ll='exa -al --color=always --group-directories-first --icons' # preferred listing
alias ls='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias la='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l='exa -lah --color=always --group-directories-first --icons' # tree listing

if type -q exa
alias tree "exa --tree -g"
alias lr='ls -R'

# git
alias g='git'
alias gcl='git clone'
alias gl='git log'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'
alias grv='git remote -v'
alias gco='git checkout'
alias gb='git branch'
alias gbr='git branch -r'
alias gba='git branch -a' # list all the branches
alias gbd='git branch -D -r' # delete a branch
alias gr='git restore'
alias rm-index.lock-git=". ~/dotfiles/scripts-laptop/rm-index.lock-git.sh"

#ranger
alias ran "ranger"


#neovim
#alias v "nvim -u ~/dotfiles/nvim/.config/nvim/MyOwn-Config.lua"
alias v "nvim"
alias nv "neovide"
alias lv "lvim"
alias svim "vim -u ~/SpaceVim/vimrc "
alias lazy='NVIM_APPNAME=LazyVim nvim'
# neovim distro aliases
alias pv='NVIM_APPNAME=packer-nvim nvim'


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
alias hib  "sudo systemctl hibernate"

# config shortcut aliases
alias i3config "nvim ~/dotfiles/i3/.config/i3/config"
alias sxhkdrc "nvim ~/.config/sxhkd/sxhkdrc"
alias alacrittyconfig "nvim ~/dotfiles/alacritty/.config/alacritty/alacritty.yml"
alias bashconfig "nvim ~/dotfiles/.bashrc"
alias zshconfig "nvim ~/dotfiles/zsh/.config/zsh/.zshrc"
alias fishconfig "nvim ~/dotfiles/fish/.config/fish/config.fish"
alias nvimconfig "nvim ~/dotfiles/nvim/.config/nvim/init.lua"
alias picomconfig "nvim ~/dotfiles/picom/.config/picom/picom.conf"
alias hyprlconfig "nvim ~/dotfiles/hyprland/.config/hypr/hyprland.conf"
alias waybarconf "nvim ~/dotfiles/waybar/.config/waybar/config"
alias tmuxconfig "nvim ~/dotfiles/.tmux.conf"
alias kittyconfig "nvim ~/dotfiles/kitty/.config/kitty/kitty.conf"
alias tlpconfig "sudo nvim /etc/tlp.conf"

# source config files
alias sourceb "source ~/.bashrc"
alias sourcez "source ~/dotfiles/zsh/.config/zsh/.zshrc"
alias sourcef "source ~/dotfiles/fish/.config/fish/config.fish"
alias sourcet "source ~/dotfiles/.tmux.conf"

# pacman and paru aliases
#install with fzf  && remove with fzf  & aur fzf
alias psfzf "pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias prfzf "pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rnsc"
alias ysfzf "paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S" 

		#install
alias sps "sudo pacman -S "
#alias ysps "yes|sudo pacman -S "
alias spsy "sudo pacman -Sy "
alias spsyy "sudo pacman -Syy "
alias spsyyu  "sudo pacman -Syyu "
alias psyy  "paru -Syy "
alias psy  "paru -Sy "
alias ypsyyu  "yes|paru -Syyu "

#remove
alias pr  "paru -R "
alias ypr  "yes|paru -R "
alias prns  "paru -Rns "
alias yprns  "yes|paru -Rns "
alias clean " yes|sudo pacman -Scc && yes|yay -Scc && yes|paru -Scc && yes|sudo pacman -Rns $(pacman -Qtdq) "

# miscellaneous
alias cat "bat"
# alias idea ". /home/sunny/Downloads/IntellijIdea-2023.1/idea-IC-231.8109.175/bin/idea.sh"
alias emoji "rofi -modi emoji -show emoji -kb-custom-1 Ctrl+C"
alias gpg-check "gpg2 --keyserver-options auto-key-retrieve --verify"
alias update-grub "sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias install-grub-efi "sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi"
end
alias xev-keyb "xev -event keyboard  | egrep -o 'keycode.*)'"


#from chris@machine zsh aliases -----------------------------------------------------------------
# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Remarkable
alias remarkable_ssh='ssh root@10.11.99.1'
alias restream='restream -p'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# For when keys break
alias archlinx-fix-keys="sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys"
#-----------------------------------------------------------------------------------------------------

#spacemacs chemacs2 aliases
alias doom="emacs --with-profile=doom"
alias myemacs="emacs --with-profile=myemacs"
alias enw="emacs -nw"

#hyprland screenshot utility
alias grimblast=~/dotfiles/hyprland/.config/hypr/scripts/grimblast

# same like explorer alias
alias ex="thunar &"

#alias to update the browsers automatically
alias up-browsers="yes|paru -Syy firefox brave-bin google-chrome telegram-desktop discord"


# nnn stuff
export NNN_PLUG='f:finder;o:fzopen;p:mocq;d:diffs;t:nmount;v:imgview'
