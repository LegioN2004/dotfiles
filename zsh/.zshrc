# Ensure PATH includes user binaries
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

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

# Optional: Load autosuggestions & syntax-highlighting if installed via brew
[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User Aliases
alias zshconfig="nvim ~/.zshrc"
alias sshconfig="nvim ~/.ssh/config"
alias ghosttyconfig="nvim ~/dotfiles/ghostty/.config/ghostty/config"
alias sourcez="source ~/.zshrc"
alias v="nvim"
alias icogni-zsh="fc -p"

alias projs='cd "$(fd . --type directory -d=5 ~/ghq/ | fzf)"'
alias allFolders="cd (fd . --type directory -d=3 ~ | fzf)"
alias folders="cd (fd --type directory -d=3 | fzf)"
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

# initialize homebrew (fast check without spawning brew)
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Node.js & NVM Fast Path (~0.5ms resolution, zero slow framework overhead)
if [ -d "$HOME/.nvm/versions/node" ]; then
  _nvm_node_dirs=( "$HOME"/.nvm/versions/node/*(N/om[1]) )
  if [ -n "$_nvm_node_dirs" ] && [ -d "$_nvm_node_dirs/bin" ]; then
    export PATH="$_nvm_node_dirs/bin:$PATH"
  fi
fi

# Lazy-load NVM CLI (only executes heavy nvm.sh when 'nvm' command is run)
export NVM_DIR="$HOME/.nvm"
_load_nvm() {
  unset -f nvm 2>/dev/null
  local nvm_prefix="/opt/homebrew/opt/nvm"
  [ -d "$nvm_prefix" ] || nvm_prefix="/usr/local/opt/nvm"
  [ -d "/home/linuxbrew/.linuxbrew/opt/nvm" ] && nvm_prefix="/home/linuxbrew/.linuxbrew/opt/nvm"
  [ -s "$nvm_prefix/nvm.sh" ] && \. "$nvm_prefix/nvm.sh"
  [ -s "$nvm_prefix/etc/bash_completion.d/nvm" ] && \. "$nvm_prefix/etc/bash_completion.d/nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}
nvm() { _load_nvm; nvm "$@"; }

[ -d "/opt/homebrew/opt/openjdk/bin" ] && export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# LM Studio CLI (lms)
[ -d "$HOME/.lmstudio/bin" ] && export PATH="$PATH:$HOME/.lmstudio/bin"
[ -d "$HOME/ghq/chromium.googlesource.com/chromium/tools/depot_tools" ] && export PATH="$PATH:$HOME/ghq/chromium.googlesource.com/chromium/tools/depot_tools"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Antigravity CLI
[ -d "$HOME/.antigravity/antigravity/bin" ] && export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT/bin" ]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

[ -d "/opt/homebrew/opt/libpq/bin" ] && export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# local bin
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# tmux-sessionizer stuff
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s '\eh' "tmux-sessionizer -s 0\n"
bindkey -s '\et' "tmux-sessionizer -s 1\n"
bindkey -s '\en' "tmux-sessionizer -s 2\n"
bindkey -s '\es' "tmux-sessionizer -s 3\n"
# tmux alias
alias cleartmux="tmux clearhist"

# claude code nvidia nim 
export ANTHROPIC_AUTH_TOKEN="freecc"
export ANTHROPIC_BASE_URL="http://localhost:8082"

# go path (fast static check instead of slow $(brew --prefix golang))
export GOPATH=$HOME/go
if [ -d "/opt/homebrew/opt/golang/libexec" ]; then
  export GOROOT="/opt/homebrew/opt/golang/libexec"
elif [ -d "/usr/local/opt/golang/libexec" ]; then
  export GOROOT="/usr/local/opt/golang/libexec"
fi
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# Antigravity IDE
[ -d "$HOME/.antigravity-ide/antigravity-ide/bin" ] && export PATH="$HOME/.antigravity-ide/antigravity-ide/bin:$PATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
