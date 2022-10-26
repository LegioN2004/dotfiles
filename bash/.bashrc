#!/bin/sh

#z directory jumper
. ~/ghq/github.com/rupa/z/z.sh

alias config='/usr/bin/git --git-dir=/home/sunny/mili-gitlab-repo --work-tree=/home/sunny'

#aliases
# ls
alias l='ls -lh'
# alias ll='ls -lah'
alias lla='ls -A'
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

#config files
alias zshconfig="nvim  ~/.zshrc"
alias bashconfig="nvim  ~/.bashrc"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#powerline-shell
# function _update_ps1() {
#     PS1=$(powerline-shell $?)
# }

# if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#     PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi

# # Powerline-status
# export PATH="$PATH:/home/sunny/.local/bin/"
# # export LC_ALL=en_US.UTF-8
# powerline-daemon -q 
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# source /home/sunny/.local/lib/python3.10/site-packages/powerline/bindings/bash/powerline.sh

# PS1='\w\$'
# . "$HOME/.cargo/env"


# fzf
#  if [ -x "$(command -v fzf)"  ]
 # then
 # 		source /usr/share/fzf/shell/key-bindings.bash
 # fi
 #
 
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

##-----------------------------------------------------
## synth-shell-prompt.sh
if [ -f /home/sunny/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/sunny/.config/synth-shell/synth-shell-prompt.sh
fi

##-----------------------------------------------------
## better-ls
if [ -f /home/sunny/.config/synth-shell/better-ls.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/sunny/.config/synth-shell/better-ls.sh
fi

##-----------------------------------------------------
## alias
if [ -f /home/sunny/.config/synth-shell/alias.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/sunny/.config/synth-shell/alias.sh
fi

##-----------------------------------------------------
## better-history
if [ -f /home/sunny/.config/synth-shell/better-history.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/sunny/.config/synth-shell/better-history.sh
fi

export TERM="xterm-256color"

neofetch
