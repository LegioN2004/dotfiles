#!/bin/bash

#z directory jumper
. ~/dotfiles/fish/z.sh

# vi keybindings
set -o vi

#aliases
alias ls='eza -aG --color=always --group-directories-first --icons'
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
alias lv='lvim'

#C++ run code alias
alias compile='g++'
alias run='./a.out'

#tmux
alias ide='./ide'

#config files
alias zshconfig="nvim ~/dotfiles/zsh/.config/zsh/.zshrc"
alias bashconfig="nvim ~/.bashrc"
alias fishconfig="nvim ~/dotfiles/fish/.config/fish/config.fish"
alias sourceb="source ~/.bashrc"

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export TERM="xterm-256color"

shopt -s autocd #Allows you to cd into directory merely by typing the directory name.

# get current branch in git repo
function parse_git_branch() {
	BRANCH=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	if [ ! "${BRANCH}" == "" ]; then
		STAT=$(parse_git_dirty)
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=$(git status 2>&1 | tee)
	dirty=$(
		echo -n "${status}" 2>/dev/null | grep "modified:" &>/dev/null
		echo "$?"
	)
	untracked=$(
		echo -n "${status}" 2>/dev/null | grep "Untracked files" &>/dev/null
		echo "$?"
	)
	ahead=$(
		echo -n "${status}" 2>/dev/null | grep "Your branch is ahead of" &>/dev/null
		echo "$?"
	)
	newfile=$(
		echo -n "${status}" 2>/dev/null | grep "new file:" &>/dev/null
		echo "$?"
	)
	renamed=$(
		echo -n "${status}" 2>/dev/null | grep "renamed:" &>/dev/null
		echo "$?"
	)
	deleted=$(
		echo -n "${status}" 2>/dev/null | grep "deleted:" &>/dev/null
		echo "$?"
	)
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

# export PS1="\[\e[31m\][\[\e[m\]\[\e[33;40m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[34;40m\]\h\[\e[m\]\[\e[40m\] \W\[\e[m\]\[\e[31m\]]\[\e[m\]\`parse_git_branch\` "
# PS1='\[\e[0;91m\][\[\e[0;38;5;220m\]\u\[\e[0;38;5;70m\]@\[\e[0;38;5;38m\]\h \[\e[0;38;5;175m\]\w\[\e[0;91m\]]\[\e[0;93m\](\[\e[0;1;38;5;130m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0;93m\])\[\e[0m\]'
PS1='\[\e[0;91m\][\[\e[0;38;5;220m\]\u\[\e[0;38;5;70m\]@\[\e[0;38;5;38m\]\h \[\e[0;1;38;5;130m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0;91m\]]\[\e[0;38;5;108m\](\[\e[0;2;38;5;175m\]\w\[\e[0;38;5;150m\]) \[\e[0m\]'
# . "$HOME/.cargo/env"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
