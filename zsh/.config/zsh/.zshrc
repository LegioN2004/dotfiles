# Created by Zap installer
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zap-zsh/completions"
plug "zap-zsh/fzf"
plug "zsh-users/zsh-syntax-highlighting"


# source ~/dotfiles/zsh/.config/zsh/custom/spaceship-prompt/spaceship.zsh
# source ~/dotfiles/zsh/.config/zsh/custom/archcraft.zsh-theme
fortune | cowsay
HISTSIZE=100000
SAVEHIST=100000
HISTSIZE=100000
HISTFILE=~/dotfiles/zsh/history

#setup version control system as well as PROMPT
# autoload -Uz vcs_info
# precmd() { vcs_info }
# zstyle ':vcs_info:git:*' formats '%b '
# setopt PROMPT_SUBST
# PROMPT='%F{green}%f %F{blue}%0~ ❯❯❯ %f%F{red}${vcs_info_msg_0_}%f'

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/bin:$PATH"
# export PATH="~/.cargo/env:$PATH"

export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='brave'
export MANPAGER='nvim +MAN!'
export TERM='xterm-256color'

bindkey -v
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

alias zshconfig="nvim  ~/dotfiles/zsh/.config/zsh/.zshrc"
alias sourcez="source  ~/dotfiles/zsh/.config/zsh/.zshrc"
alias fishconfig="nvim  ~/dotfiles/fish/.config/fish/config.fish"

#path for lunarvim
export PATH=$PATH:~/.local/bin/

#lunarvim alias
# alias -g [lvim]=”cd ~/.local/bin/ && ./lvim”

# Replace ls with exa
alias ll='exa -al --color=always --group-directories-first --icons' # preferred listing
alias ls='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias la='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l='exa -lah --color=always --group-directories-first --icons' # tree listing
 
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
alias gbd='git branch -D -r'
alias gr='git restore'


#ranger
alias ran='ranger'

#neovim
alias v='nvim'
alias nv='neovide'
alias lv='lvim'

#C++ run code alias
alias compile='g++'
alias run='./a.out'

#tmux
alias ide='./ide'

#gotop
# alias htop='gotop'

#laptop power management aliases
alias sus= 'systemctl suspend'
alias pow= 'poweroff'
alias reb= 'reboot'


# emacs alias
alias e='emacs -nw'

# always clone this repo in Downloads dotfiles https://github.com/rupa/z.git and start using z directory jumper
#z change directory
. ~/dotfiles/fish/z.sh
$_Z_NO_RESOLVE_SYMLINKS

#for wsl2 in win 10 display gui apps using vcxsrv
#export DISPLAY=172.22.144.1:0.0
#export LIBGL_ALWAYS_INDIRECT=1

# from ellah majnor nvim switcher -------------------------------------------------------------------------------
# alias default="NVIM_APPNAME="
alias lazy='NVIM_APPNAME=LazyVim nvim'
alias astro='NVIM_APPNAME=AstroNvim nvim'

# fzf menu to load the above mentioned nvim distros
# function nvims() {
# 		items=("LazyVim")
# 		config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config » " --height=~50% --layout=reverse --border --exit-0)
# 		if [[ -z $config ]]; then
# 				echo "Nothing selected" 
# 				return 0
# 		elif [[ $config = "default" ]]; then
# 				config=""
# 		fi
# 		NVIM_APPNAME=$config nvim $@
# }

# bindkey -s ^s "nvims\n"
# -------------------------------------------------------------------------------

# for fixing keyb layout in gui programs from wsl
# setxkbmap us -variant colemak
