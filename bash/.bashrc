#!/bin/sh

#z directory jumper
. ~/ghq/github.com/rupa/z/z.sh

# vi keybindings
set -o vi

#aliases
alias ls='exa -l -g --icons'
alias ll='ls -a'
alias lr='ls -R'
 
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

#config files
alias zshconfig="nvim  ~/.zshrc"
alias bashconfig="nvim  ~/.bashrc"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export TERM="xterm-256color"

