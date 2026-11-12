# Ensure PATH includes user binaries
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# History Configuration
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY          # Write timestamp in history
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first
setopt HIST_IGNORE_DUPS          # Don't record duplicate entry
setopt HIST_IGNORE_SPACE         # Don't record lines starting with a space
setopt HIST_VERIFY               # Don't execute immediately upon history expansion
setopt SHARE_HISTORY             # Share history across sessions
setopt INTERACTIVE_COMMENTS      # Allow comments even in interactive shells

# Fast Cached Completion System (~10ms)
autoload -Uz compinit
if [ -n "$(find "${ZDOTDIR:-$HOME}/.zcompdump" -mtime -1 2>/dev/null)" ]; then
  compinit -C
else
  compinit
fi

# Load Git Aliases (Standalone, 100% compatible with Oh My Zsh git plugin)
[ -f "$HOME/.zsh_git_aliases" ] && source "$HOME/.zsh_git_aliases"

# User Aliases
alias zshconfig="nvim ~/.zshrc"
alias sshconfig="nvim ~/.ssh/config"
alias sourcez="source ~/.zshrc"
alias v="nvim"
alias nv="neovide"
alias icogni-zsh="fc -p"

alias projs='cd "$(fd . --type directory -d=5 ~/ghq/ 2>/dev/null | fzf)"'
alias allFolders="cd (fd . --type directory -d=3 ~ 2>/dev/null | fzf)"
alias folders="cd (fd --type directory -d=3 2>/dev/null | fzf)"
alias ff="nvim (fzf)"

# eza aliases
alias ll="eza -al --color=always --group-directories-first --icons"
alias la="eza -l --color=always --group-directories-first --icons"
alias lt="eza -aT --color=always --group-directories-first --icons"
alias l="eza -lah --color=always --group-directories-first --icons"
alias tree="eza --tree -g"
alias srcvenv="source venv/bin/activate"

# rust aliases
alias cr="cargo run"

# Linux Desktop & Window Manager Configs
alias kittyconfig="nvim ~/dotfiles/kitty/.config/kitty/kitty.conf"
alias i3config="nvim ~/dotfiles/i3/.config/i3/config"
alias hyprlconfig="nvim ~/dotfiles/hyprland/.config/hypr/hyprland.conf"
alias waybarconf="nvim ~/dotfiles/waybar/.config/waybar/config"
alias polybarconfig="nvim ~/dotfiles/polybar/.config/polybar/config"
alias picomconfig="nvim ~/dotfiles/picom/.config/picom/picom.conf"
alias sxhkdrc="nvim ~/dotfiles/sxhkd/.config/sxhkd/sxhkdrc"
alias tlpconfig="sudo nvim /etc/tlp.conf"
alias grimblast="~/dotfiles/hyprland/.config/hypr/scripts/grimblast"
alias ex="nautilus &"

# Linux System & Power Management
alias sus="systemctl suspend"
alias pow="poweroff"
alias reb="reboot"
alias hib="sudo systemctl hibernate"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias install-grub-efi="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi"

# Arch pacman & paru
alias sps="sudo pacman -S "
alias spsy="sudo pacman -Sy "
alias spsyy="sudo pacman -Syy "
alias psyy="paru -Syy "
alias psy="paru -Sy "
alias pr="paru -R "
alias prns="paru -Rns "
alias yprns="yes|paru -Rns "
alias ysfzf="paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -Syy"
alias prfzf="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rnsc"
alias clean="yes|sudo pacman -Scc && yes|paru -Scc && yes|sudo pacman -Rns \$(pacman -Qtdq)"

# Arch Mirrors & Keys
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
alias archlinx-fix-keys="sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys"
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
if [[ ":$PATH:" != *":$PNPM_HOME:"* ]]; then
  export PATH="$PNPM_HOME:$PATH"
fi
[ -d "$HOME/.local/share/pnpm/bin" ] && export PATH="$HOME/.local/share/pnpm/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
[ -d "$BUN_INSTALL/bin" ] && export PATH="$BUN_INSTALL/bin:$PATH"

# select fzf to work in zsh
source <(fzf --zsh)

# select pure as the prompt style
autoload -U promptinit; promptinit
prompt pure

# initialize zoxide
eval "$(zoxide init zsh)"

# initialize linuxbrew if present
if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Lazy-load NVM for instantaneous shell startup
export NVM_DIR="$HOME/.nvm"
_load_nvm() {
  unset -f nvm node npm npx yarn 2>/dev/null
  local nvm_prefix="/home/linuxbrew/.linuxbrew/opt/nvm"
  [ -d "$nvm_prefix" ] || nvm_prefix="/usr/share/nvm"
  [ -s "$nvm_prefix/nvm.sh" ] && \. "$nvm_prefix/nvm.sh"
  [ -s "$nvm_prefix/etc/bash_completion.d/nvm" ] && \. "$nvm_prefix/etc/bash_completion.d/nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}
nvm() { _load_nvm; nvm "$@"; }
node() { _load_nvm; node "$@"; }
npm() { _load_nvm; npm "$@"; }
npx() { _load_nvm; npx "$@"; }

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT/bin" ]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

# tmux-sessionizer stuff
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s '\eh' "tmux-sessionizer -s 0\n"
bindkey -s '\et' "tmux-sessionizer -s 1\n"
bindkey -s '\en' "tmux-sessionizer -s 2\n"
bindkey -s '\es' "tmux-sessionizer -s 3\n"
alias cleartmux="tmux clearhist"

# go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
