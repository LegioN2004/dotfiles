# Fast static Homebrew environment
if test -d /opt/homebrew
    set -gx HOMEBREW_PREFIX "/opt/homebrew"
    set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar"
    set -gx HOMEBREW_REPOSITORY "/opt/homebrew"
    ! contains "/opt/homebrew/bin" $PATH; and set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH
else if test -d /home/linuxbrew/.linuxbrew
    set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
    set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
    set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"
    ! contains "/home/linuxbrew/.linuxbrew/bin" $PATH; and set -gx PATH "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin" $PATH
end

# Fish defaults
set -g fish_greeting ""
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx GIT_PAGER delta

# PATH setup (only append if exists and not already in PATH)
for p in "$HOME/.local/bin" "$HOME/bin" "$HOME/.lmstudio/bin" "$HOME/.antigravity-ide/antigravity-ide/bin"
    if test -d $p; and not contains $p $PATH
        set -gx PATH $p $PATH
    end
end

# FZF configuration
set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --hidden'
set -gx fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

# -----------------------------------------------------------------------------
# Fast Fish Abbreviations (expanded on space/enter, zero startup overhead)
# -----------------------------------------------------------------------------

# Core utilities
abbr -a rm 'trash'
abbr -a v 'nvim'
abbr -a nv 'neovide'
abbr -a ran 'ranger'
abbr -a lg 'lazygit'
abbr -a cat 'bat'
abbr -a cr 'cargo run'
abbr -a srcvenv 'source venv/bin/activate.fish'

# eza (modern ls)
if test -x /opt/homebrew/bin/eza; or test -x /usr/bin/eza; or test -x /usr/local/bin/eza
    abbr -a ll 'eza -al --color=always --group-directories-first --icons'
    abbr -a ls 'eza -aG --color=always --group-directories-first --icons'
    abbr -a la 'eza -l --color=always --group-directories-first --icons'
    abbr -a lt 'eza -aT --color=always --group-directories-first --icons'
    abbr -a l  'eza -lah --color=always --group-directories-first --icons'
    abbr -a tree 'eza --tree -g'
end

# Git abbreviations
abbr -a g 'git'
abbr -a ga 'git add'
abbr -a gaa 'git add --all'
abbr -a gc 'git commit -m'
abbr -a gca 'git commit --amend'
abbr -a gp 'git push'
abbr -a gpf 'git push --force-with-lease'
abbr -a gl 'git pull'
abbr -a gs 'git status'
abbr -a gd 'git diff'
abbr -a gco 'git checkout'
abbr -a gcob 'git checkout -b'
abbr -a gb 'git branch'
abbr -a gba 'git branch -a'
abbr -a gbd 'git branch -d'
abbr -a gbD 'git branch -D'
abbr -a glg 'git log --oneline --graph --decorate'
abbr -a gsp 'git stash pop'
abbr -a gsc 'git stash clear'
abbr -a gr 'git restore'
abbr -a grv 'git remote -v'

# Config shortcuts
abbr -a zshconfig 'nvim ~/dotfiles/zsh/.zshrc'
abbr -a fishconfig 'nvim ~/dotfiles/fish/.config/fish/config.fish'
abbr -a nvimconfig 'nvim ~/dotfiles/nvim/.config/nvim/init.lua'
abbr -a tmuxconfig 'nvim ~/dotfiles/tmux/.tmux.conf'
abbr -a sourcef 'source ~/.config/fish/config.fish'
abbr -a sourcez 'source ~/.zshrc'

# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------
function projs --description 'Fuzzy search and cd into project'
    set -l target (fd . --type directory -d=5 ~/ghq/ 2>/dev/null | fzf)
    test -n "$target"; and cd "$target"
end

function folders --description 'Fuzzy search and cd into local directory'
    set -l target (fd --type directory -d=3 2>/dev/null | fzf)
    test -n "$target"; and cd "$target"
end

function ff --description 'Fuzzy search and open in Neovim'
    set -l target (fzf)
    test -n "$target"; and nvim "$target"
end

# -----------------------------------------------------------------------------
# Linux-only abbreviations
# -----------------------------------------------------------------------------
if test (uname) = "Linux"
    abbr -a sus "systemctl suspend"
    abbr -a pow "poweroff"
    abbr -a reb "reboot"
    abbr -a hib "sudo systemctl hibernate"
    abbr -a tlpconfig "sudo nvim /etc/tlp.conf"

    # Arch / pacman / paru
    abbr -a sps "sudo pacman -S "
    abbr -a spsy "sudo pacman -Sy "
    abbr -a spsyy "sudo pacman -Syy "
    abbr -a psyy "paru -Syy "
    abbr -a psy "paru -Sy "
    abbr -a pr "paru -R "
    abbr -a prns "paru -Rns "
    abbr -a yprns "yes|paru -Rns "
    abbr -a ysfzf "paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -Syy"
    abbr -a update-grub "sudo grub-mkconfig -o /boot/grub/grub.cfg"
end

# -----------------------------------------------------------------------------
# Runtime Environments (pnpm, bun)
# -----------------------------------------------------------------------------
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if test -d "$PNPM_HOME"; and not contains "$PNPM_HOME" $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end

set -gx BUN_INSTALL "$HOME/.bun"
if test -d "$BUN_INSTALL/bin"; and not contains "$BUN_INSTALL/bin" $PATH
    set -gx PATH "$BUN_INSTALL/bin" $PATH
end
