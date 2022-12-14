echo ".___                           _____ ___________________   ___ ___   _______________________      __  "
echo "|   |  __ __  ______ ____     /  _  \\______   \_   ___ \ /   |   \  \______   \__    ___/  \    /  \ " 
echo "|   | |  |  \/  ___// __ \   /  /_\  \|       _/    \  \//    ~    \  |    |  _/ |    |  \   \/\/   / "
echo "|   | |  |  /\___ \\  ___/  /    |    \    |   \     \___\    Y    /  |    |   \ |    |   \        /  "
echo "|___| |____//____  >\___  > \____|__  /____|_  /\______  /\___|_  /   |______  / |____|    \__/\  /   "
echo "                 \/     \/          \/       \/        \/       \/           \/                 \/    "


if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions vi-mode)
bindkey -v

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
 alias zshconfig="nvim  ~/.zshrc"
 alias bashconfig="nvim  ~/.bashrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add this to your .bashrc, .zshrc or equivalent.
# Run 'fff' with 'f' or whatever you decide to name the function.
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
 
#path for lunarvim
export PATH=$PATH:~/.local/bin/

#lunarvim alias
# alias -g [lvim]=???cd ~/.local/bin/ && ./lvim???

#aliases
# alias nv="nvim -u /home/sunny/.config/nvim/init.vim"

# ls
alias l='ls -lh'
# alias ll='ls -lah'
alias lla='ls -a'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# alias ll='exa -l -g --icons'
alias ls='exa -l -g --icons'
alias ll='exa -l -a --icons'
alias ld='exa -l -a -T --icons'
 
# git
alias g='git'
alias gcl='git clone'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'

#ranger
alias ran='ranger'

#neovim
alias v='nvim'
alias nv='neovide'

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

# always clone this repo in Downloads dotfiles https://github.com/rupa/z.git and start using z directory jumper
#z directory
. ~/Downloads/dotfiles/z/z.sh

# ~/.zshrc

#starship
# eval "$(starship init zsh)"
# export STARSHIP_CONFIG=~/.config/starship/starship.toml

# source ~/powerlevel10k/powerlevel10k.zsh-theme

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# setxkbmap -option caps:swapescape

#for wsl2 in win 10 display gui apps using vsxsrv
#export DISPLAY=172.22.144.1:0.0
#export LIBGL_ALWAYS_INDIRECT=1

export PATH="/usr/bin:$PATH"
