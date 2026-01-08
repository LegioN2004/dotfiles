zoxide init fish | source
alias z="zoxide"

#FiraCode fortune | cowsay
# sh ~/dotfiles/neofetch/nofetch --flex nitch afetch fastfetch etc download from aur
#use sh to run any bash scripts from the fish shell at startup 

# fish stuff -----------------------------------------------------------------
set fish_greeting ""
set -gx $EDITOR nvim
# set -gx $TERMINAL alacritty
# set -g theme_color_scheme terminal-dark

set TLP_ENABLE 1

set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.cargo/bin $PATH

# NodeJS
# set -gx PATH node_modules/.bin $PATH
# set -gx PATH /home/sunny/.nvm/versions/node/v22.13.0/bin $PATH
set -gx NVM_DIR ~/.nvm

# set fish_history $XDG_DATA_HOME/fish/fish_history
set HISTSIZE 100000
set HISTFILESIZE 100000

# FZF stuff
# Feed the output of fd into fzf
set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --hidden'
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"
# Setting fd as the default source for fzf
# set -gx FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
# To apply the command to CTRL-T as well
# set -gx FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


# ALIASES -----------------------------------------------------------------
alias tr='trash'

if type -q eza
    # Replace ls with exa
    alias ll='eza -al --color=always --group-directories-first --icons' # preferred listing
    alias ls='eza -aG --color=always --group-directories-first --icons' # all files and dirs
    alias la='eza -l --color=always --group-directories-first --icons' # long format
    alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
    alias l='eza -lah --color=always --group-directories-first --icons' # tree listing
    alias tree "eza --tree -g"
end
# alias xev-keyb "xev -event keyboard  | egrep -o 'keycode.*)'"
alias lr='ls -R'

# git
alias g='git'
alias gcl='git clone'
alias glg='git log'
alias gdf='git diff'
alias gsp='git stash pop'
alias gsc='git stash clear'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'
alias grv='git remote -v'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gb='git branch'
alias gbr='git branch -r'
alias gba='git branch -a' # list all the branches
alias gbd='git branch -D -r' # delete a branch
alias gr='git restore'
alias rm-index.lock-git=". ~/dotfiles/scripts-laptop/rm-index.lock-git.sh"

#neovim
alias v nvim
# alias nv neovide
# alias lv "lvim"
# alias sv="vim -u ~/SpaceVim/vimrc "

#iso details
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"

#tmux
alias ide "./ide"

# config shortcut aliases
alias zshconfig="nvim  ~/dotfiles/zsh/.config/zsh/.zshrc"
alias sourcez="source  ~/dotfiles/zsh/.config/zsh/.zshrc"
alias fishconfig="nvim  ~/dotfiles/fish/.config/fish/config.fish"
alias i3config="nvim ~/dotfiles/i3/.config/i3/config"
alias sxhkdrc="nvim ~/.config/sxhkd/sxhkdrc"
alias alacrittyconfig="nvim ~/dotfiles/alacritty/.config/alacritty/alacritty.toml"
alias bashconfig="nvim ~/dotfiles/.bashrc"
alias fishconfig="nvim ~/dotfiles/fish/.config/fish/config.fish"
alias nvimconfig="v ~/dotfiles/nvim/.config/nvim/init.lua"
alias picomconfig="nvim ~/dotfiles/picom/.config/picom/picom.conf"
alias hyprlconfig="nvim ~/.config/hypr/hyprland.conf"
alias waybarconf="nvim ~/dotfiles/waybar/.config/waybar/config"
alias tmuxconfig="nvim ~/dotfiles/.tmux.conf"
alias kittyconfig="nvim ~/dotfiles/kitty/.config/kitty/kitty.conf"
alias polybarconfig="nvim ~/dotfiles/polybar/.config/polybar/config"
alias tlpconfig="sudo nvim /etc/tlp.conf"


# source config files
alias sourceb "source ~/.bashrc"
alias sourcez "source ~/dotfiles/zsh/.config/zsh/.zshrc"
alias sourcef "source ~/dotfiles/fish/.config/fish/config.fish"
alias sourcet "source ~/dotfiles/.tmux.conf"

# Remarkable
alias remarkable_ssh='ssh root@10.11.99.1'
alias restream='restream -p'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
# alias cp="cp -i"
# alias mv='mv -i'
# alias rm='rm -i'

# easier to read disk
alias df='df -h' # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'


alias projs="cd (fd . --type directory -d=5  ~/ghq/ | fzf)"
alias allFolders="cd (fd . --type directory -d=3 ~ | fzf)"
# alias projs="cd (find ~/ghq/github.com/ ~/ghq/gitlab.com/ ~/Downloads ~/Downloads/dotfiles-others/ -type d -mindepth 2 -maxdepth 8 -not -path '*/.git/*' -not -path '*/node_modules/*') | fzf "
alias folders="cd (fd --type directory -d=3 | fzf)"
alias ff="nvim (fzf)"

## code stuff
alias formatC="find . -iname '*.h' -o -iname '*.cpp' | xargs clang-format -i"

# pnpm
set -gx PNPM_HOME "/home/sunny/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

