# Created by Zap installer
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zap-zsh/completions"
plug "zap-zsh/fzf"
plug "zsh-users/zsh-syntax-highlighting"


# SETTINGS
#
# source ~/dotfiles/zsh/.config/zsh/custom/spaceship-prompt/spaceship.zsh
# source ~/dotfiles/zsh/.config/zsh/custom/archcraft.zsh-theme
# fortune | cowsay
HISTSIZE=100000
SAVEHIST=100000
HISTSIZE=100000
HISTFILE=~/dotfiles/zsh/history
setopt autocd extendedglob nomatch menucomplete 
setopt interactive_comments
stty stop undef
zle_highlight=( 'paste:none' )
unsetopt BEEP
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'


# PROMPT
#
# prompt setup with vcs
# bindkey -v
# autoload -Uz vcs_info
# precmd() { vcs_info }
# zstyle ':vcs_info:git:*' formats '%b '
# setopt PROMPT_SUBST
# PROMPT='%F{green}%f %F{blue}%0~ ❯❯❯ %f%F{red}${vcs_info_msg_0_}%f'


# EXPORTS
#
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/bin:$PATH"
# export PATH="~/.cargo/env:$PATH"
export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='brave'
export MANPAGER='nvim +MAN!'
export TERM='xterm-256color'
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
#path for lunarvim
export PATH=$PATH:~/.local/bin/
export PATH=$PATH:~/Downloads/softwares/ghq_linux_amd64/
#for wsl2 in win 10 display gui apps using vcxsrv
#export DISPLAY=172.22.144.1:0.0
#export LIBGL_ALWAYS_INDIRECT=1


# BINDS
#
bindkey -s '^f' 'cd (find ~/ghq/github.com/ ~/ghq/gitlab.com/ ~/Downloads ~/Downloads/dotfiles-others/ ~/Downloads/softwares -mindepth 1 -maxdepth 2 -type d | fzf)'



# ALIASES
#
alias i3config="nvim ~/dotfiles/i3/.config/i3/config"
alias zshconfig="nvim  ~/dotfiles/zsh/.config/zsh/.zshrc"
alias sourcez="source  ~/dotfiles/zsh/.config/zsh/.zshrc"
alias fishconfig="nvim  ~/dotfiles/fish/.config/fish/config.fish"

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
alias pow= 'systemctl poweroff'
alias reb= 'systemctl reboot'

# to clean all the deps and junk
alias clean=' yes|sudo pacman -Scc && yes|yay -Scc && yes|paru -Scc && yes|sudo pacman -Rns $(pacman -Qtdq) '

# emacs alias
alias enw='emacs -nw'

# better cd and z.sh alternative
eval "$(zoxide init zsh)"

# from ellah majnor nvim switcher -------------------------------------------------------------------------------
alias pv='NVIM_APPNAME=packer-nvim nvim'
