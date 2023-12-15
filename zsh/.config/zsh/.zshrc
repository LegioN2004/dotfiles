# Created by Zap installer
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
# plug "zap-zsh/zap-prompt"
plug "zap-zsh/completions"
plug "zap-zsh/fzf"
plug "zsh-users/zsh-syntax-highlighting"


# source ~/dotfiles/zsh/.config/zsh/custom/spaceship-prompt/spaceship.zsh
# source ~/dotfiles/zsh/.config/zsh/custom/archcraft.zsh-theme
# fortune | cowsay
HISTSIZE=100000
SAVEHIST=100000
HISTSIZE=100000
HISTFILE=~/dotfiles/zsh/history

#setup version control system as well as PROMPT
bindkey -v
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{green}%f %F{blue}%0~ ❯❯❯ %f%F{red}${vcs_info_msg_0_}%f'




## exports ##
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/bin:$PATH"
# export PATH="~/.cargo/env:$PATH"
export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='brave'
export MANPAGER='nvim +MAN!'
export TERM='xterm-256color'

# locale
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

#path for lunarvim
export PATH=$PATH:~/.local/bin/
export PATH=$PATH:/home/sunnyarch/Downloads/VSCode-linux-x64/bin/

#path for java
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
# export PATH=$JAVA_HOME/jre/bin:$PATH



autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'



## Aliases ##
#lunarvim alias
# alias -g [lvim]=”cd ~/.local/bin/ && ./lvim”

# Replace ls with eza
alias ll="eza -al --color=always --group-directories-first --icons" # preferred listing
alias ls="eza -a --color=always --group-directories-first --icons"  # all files and dirs
alias la="eza -l --color=always --group-directories-first --icons"  # long format
alias lt="eza -aT --color=always --group-directories-first --icons" # tree listing
alias l="eza -lah --color=always --group-directories-first --icons" # tree listing
alias lr="eza -R --color=always --group-directories-first --icons"
alias tree="eza --tree -g"

# some event stuff
alias xev-keyb "xev -event keyboard  | egrep -o 'keycode.*)'"

# git
alias g="git"
alias gcl="git clone"
alias gl="git log"
alias gi="git init"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gs="git status"
alias grv="git remote -v"
alias gco="git checkout"
alias gb="git branch"
alias gbr="git branch -r"
alias gba="git branch -a" # list all the branches
alias gbd="git branch -D -r" # delete a branch
alias gr="git restore"
alias rm-index.lock-git=". ~/dotfiles/scripts-laptop/rm-index.lock-git.sh"

#ranger
alias ran="ranger"

#C++ run code alias
alias compile="g++"
alias run="./a.out"

#tmux
alias ide="./ide"

#gotop
# alias htop="gotop"

#laptop power management aliases
alias pow="sudo systemctl poweroff"
alias sus="systemctl suspend"
alias hib="sudo systemctl hibernate"
alias reb="sudo systemctl reboot"

# to clean all the deps and junk
alias clean=" yes|sudo pacman -Scc && yes|yay -Scc && yes|paru -Scc && yes|sudo pacman -Rns $(pacman -Qtdq) "

# emacs alias
alias enw="emacs -nw"

# config shortcut aliases
alias zshconfig="nvim  ~/dotfiles/zsh/.config/zsh/.zshrc"
alias sourcez="source  ~/dotfiles/zsh/.config/zsh/.zshrc"
alias fishconfig="nvim  ~/dotfiles/fish/.config/fish/config.fish"
alias i3config="nvim ~/dotfiles/i3/.config/i3/config"
alias sxhkdrc="nvim ~/.config/sxhkd/sxhkdrc"
alias alacrittyconfig="nvim ~/dotfiles/alacritty/.config/alacritty/alacritty.yml"
alias bashconfig="nvim ~/dotfiles/.bashrc"
alias fishconfig="nvim ~/dotfiles/fish/.config/fish/config.fish"
alias nvimconfig="v ~/dotfiles/nvim/.config/nvim/init.lua"
alias picomconfig="nvim ~/dotfiles/picom/.config/picom/picom.conf"
alias hyprlconfig="nvim ~/dotfiles/hyprland/.config/hypr/hyprland.conf"
alias waybarconf="nvim ~/dotfiles/waybar/.config/waybar/config"
alias tmuxconfig="nvim ~/dotfiles/.tmux.conf"
alias kittyconfig="nvim ~/dotfiles/kitty/.config/kitty/kitty.conf"
alias tlpconfig="sudo nvim /etc/tlp.conf"

# source config files
alias sourceb="source ~/.bashrc"
alias sourcez="source ~/dotfiles/zsh/.config/zsh/.zshrc"
alias sourcef="source ~/dotfiles/fish/.config/fish/config.fish"
alias sourcet="source ~/dotfiles/.tmux.conf"

# pacman and paru aliases
#install with fzf  && remove with fzf  & aur fzf
alias psfzf="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias prfzf="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rnsc"
alias ysfzf="paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S"

# install
alias sps="sudo pacman -S "
alias spsy="sudo pacman -Sy "
alias spsyy="sudo pacman -Syy "
alias psyy="paru -Syy "
alias psy="paru -Sy "

#remove
alias pr="paru -R "
alias prns="paru -Rns "
alias yprns="yes|paru -Rns "
alias clean=" yes|sudo pacman -Scc && yes|yay -Scc && yes|paru -Scc && yes|sudo pacman -Rns $(pacman -Qtdq) "

# miscellaneous
# alias cat "bat"
# alias idea ". /home/sunny/Downloads/IntellijIdea-2023.1/idea-IC-231.8109.175/bin/idea.sh"
alias emoji="rofi -modi emoji -show emoji -kb-custom-1 Ctrl+C"
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias install-grub-efi="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi"

#from chris@machine zsh aliases -----------------------------------------------------------------
# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Remarkable
alias remarkable_ssh="ssh root@10.11.99.1"
alias restream="restream -p"

# Colorize grep output (good for log files)
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# easier to read disk
alias df="df -h" # human-readable sizes
alias free="free -m" # show sizes in MB

# get top process eating memory
alias psmem="ps auxf | sort -nr -k 4 | head -5"

# get top process eating cpu ##
alias pscpu="ps auxf | sort -nr -k 3 | head -5"

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# For when keys break
alias archlinx-fix-keys="sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys"
#-----------------------------------------------------------------------------------------------------

# chemacs2 aliases
alias doom="emacs --with-profile=doom"
alias myemacs="emacs --with-profile=myemacs"
alias enw="emacs -nw"

#hyprland screenshot utility
alias grimblast=~/dotfiles/hyprland/.config/hypr/scripts/grimblast

# same like explorer alias
alias ex="thunar &"

#alias to update the browsers automatically
alias up-browsers="yes|paru -Syy firefox brave-bin google-chrome telegram-desktop kitty alacritty neovim kitty emacs"

# TODO: clone all the required git dirs : doom-emacs, chemacs2, rvaiya-keyd
alias clone-all="mkdir ~/doomemacs && git clone https://github.com/doomemacs/doomemacs ~/doomemacs && mkdir ~/.emacs.d && git clone https://github.com/plexus/chemacs2 ~/.emacs.d"

# Fidn projects
alias projects="cd (find ~/ghq/github.com/ ~/ghq/gitlab.com/ ~/Downloads ~/Downloads/dotfiles-others/ -mindepth 1 -maxdepth 2 -type d | fzf)"
alias files="cd (fd --type directory | fzf)"

# pnpm
# set -gx PNPM_HOME "/home/sunny/.local/share/pnpm"
# if not string match -q -- $PNPM_HOME $PATH
#     set -gx PATH "$PNPM_HOME" $PATH
# end
# pnpm end


# always clone this repo in Downloads dotfiles https://github.com/rupa/z.git and start using z directory jumper
#z change directory
. ~/dotfiles/fish/z.sh
$_Z_NO_RESOLVE_SYMLINKS

#for wsl2 in win 10 display gui apps using vcxsrv
#export DISPLAY=172.22.144.1:0.0
#export LIBGL_ALWAYS_INDIRECT=1


#neovim
# from ellah majnor nvim switcher -------------------------------------------------------------------------------
alias v="nvim"
# alias nv "neovide"
# alias lv "lvim"
# alias sv="vim -u ~/SpaceVim/vimrc "

# neovim distro aliases
### alias default="NVIM_APPNAME="
# alias lazy='NVIM_APPNAME=LazyVim nvim'
# alias astro='NVIM_APPNAME=AstroNvim nvim'
alias pv="NVIM_APPNAME=packer-nvim nvim"
alias m="NVIM_APPNAME=minimalist nvim"
# alias av='NVIM_APPNAME=alexis-nvim nvim'
# alias nvc='NVIM_APPNAME=nvchad nvim'
# alias v='NVIM_APPNAME=lazyvim nvim'
# fzf menu to load the above mentioned nvim distros
function nvims() {
		items=("packer-nvim" "minimalist")
		config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config » " --height=~50% --layout=reverse --border --exit-0)
		if [[ -z $config ]]; then
				echo "Nothing selected" 
				return 0
		elif [[ $config = "default" ]]; then
				config=""
		fi
		NVIM_APPNAME=$config nvim $@
}

bindkey -s "^N" "nvims\n"
# -------------------------------------------------------------------------------

# for fixing keyb layout in gui programs from wsl
# setxkbmap us -variant colemak
