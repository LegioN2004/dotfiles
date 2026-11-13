# Linuxbrew environment (if installed on Linux)
if test -d /home/linuxbrew/.linuxbrew
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
for p in "$HOME/.local/bin" "$HOME/bin" "$HOME/.cargo/bin"
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
abbr -a ide './ide'
abbr -a lr 'ls -R'
abbr -a df 'df -h'
abbr -a free 'free -m'
abbr -a psmem 'ps auxf | sort -nr -k 4 | head -5'
abbr -a pscpu 'ps auxf | sort -nr -k 3 | head -5'
abbr -a grep 'grep --color=auto'
abbr -a egrep 'egrep --color=auto'
abbr -a fgrep 'fgrep --color=auto'

# eza (modern ls)
if test -x /usr/bin/eza; or test -x /usr/local/bin/eza; or test -x /home/linuxbrew/.linuxbrew/bin/eza
    abbr -a ll 'eza -al --color=always --group-directories-first --icons'
    abbr -a ls 'eza -aG --color=always --group-directories-first --icons'
    abbr -a la 'eza -l --color=always --group-directories-first --icons'
    abbr -a lt 'eza -aT --color=always --group-directories-first --icons'
    abbr -a l  'eza -lah --color=always --group-directories-first --icons'
    abbr -a tree 'eza --tree -g'
end

# Git abbreviations (complete set)
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
abbr -a gdf 'git diff'
abbr -a gcl 'git clone'
abbr -a gi 'git init'
abbr -a gco 'git checkout'
abbr -a gcob 'git checkout -b'
abbr -a gb 'git branch'
abbr -a gba 'git branch -a'
abbr -a gbd 'git branch -d'
abbr -a gbD 'git branch -D'
abbr -a gbr 'git branch -r'
abbr -a glg 'git log --oneline --graph --decorate'
abbr -a gsp 'git stash pop'
abbr -a gsc 'git stash clear'
abbr -a gr 'git restore'
abbr -a grv 'git remote -v'

# Config shortcuts (Linux / Kitty / Window Managers)
abbr -a zshconfig 'nvim ~/dotfiles/zsh/.zshrc'
abbr -a fishconfig 'nvim ~/dotfiles/fish/.config/fish/config.fish'
abbr -a nvimconfig 'nvim ~/dotfiles/nvim/.config/nvim/init.lua'
abbr -a tmuxconfig 'nvim ~/dotfiles/tmux/.tmux.conf'
abbr -a kittyconfig 'nvim ~/dotfiles/kitty/.config/kitty/kitty.conf'
abbr -a i3config 'nvim ~/dotfiles/i3/.config/i3/config'
abbr -a hyprlconfig 'nvim ~/dotfiles/hyprland/.config/hypr/hyprland.conf'
abbr -a waybarconf 'nvim ~/dotfiles/waybar/.config/waybar/config'
abbr -a polybarconfig 'nvim ~/dotfiles/polybar/.config/polybar/config'
abbr -a picomconfig 'nvim ~/dotfiles/picom/.config/picom/picom.conf'
abbr -a sxhkdrc 'nvim ~/dotfiles/sxhkd/.config/sxhkd/sxhkdrc'
abbr -a tlpconfig 'sudo nvim /etc/tlp.conf'
abbr -a sourcef 'source ~/.config/fish/config.fish'
abbr -a sourcez 'source ~/.zshrc'

# -----------------------------------------------------------------------------
# Linux System & Package Management
# -----------------------------------------------------------------------------
# Power & Systemd
abbr -a sus "systemctl suspend"
abbr -a pow "poweroff"
abbr -a reb "reboot"
abbr -a hib "sudo systemctl hibernate"
abbr -a update-grub "sudo grub-mkconfig -o /boot/grub/grub.cfg"
abbr -a install-grub-efi "sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi"

# Arch pacman & paru
abbr -a sps "sudo pacman -S "
abbr -a spsy "sudo pacman -Sy "
abbr -a spsyy "sudo pacman -Syy "
abbr -a psyy "paru -Syy "
abbr -a psy "paru -Sy "
abbr -a pr "paru -R "
abbr -a prns "paru -Rns "
abbr -a yprns "yes|paru -Rns "
abbr -a ysfzf "paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -Syy"
abbr -a prfzf "pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rnsc"
abbr -a clean "yes|sudo pacman -Scc && yes|paru -Scc && yes|sudo pacman -Rns (pacman -Qtdq)"

# Arch Mirrors & Keys
abbr -a mirror "sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
abbr -a mirrord "sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
abbr -a mirrors "sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
abbr -a mirrora "sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
abbr -a archlinx-fix-keys "sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys"
abbr -a gpg-check "gpg2 --keyserver-options auto-key-retrieve --verify"
abbr -a gpg-retrieve "gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# Desktop utils
abbr -a grimblast "~/dotfiles/hyprland/.config/hypr/scripts/grimblast"
abbr -a ex "nautilus &"

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
# Node.js & NVM Path Setup (<1ms startup, zero framework overhead)
# -----------------------------------------------------------------------------
if test -d "$HOME/.nvm/versions/node"
    set -l node_dirs $HOME/.nvm/versions/node/*
    if test -n "$node_dirs[-1]"; and test -d "$node_dirs[-1]/bin"
        if not contains "$node_dirs[-1]/bin" $PATH
            set -gx PATH "$node_dirs[-1]/bin" $PATH
        end
    end
end

# -----------------------------------------------------------------------------
# Runtime Environments (pnpm, bun)
# -----------------------------------------------------------------------------
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
for p in "$PNPM_HOME" "$PNPM_HOME/bin"
    if test -d "$p"; and not contains "$p" $PATH
        set -gx PATH "$p" $PATH
    end
end

set -gx BUN_INSTALL "$HOME/.bun"
if test -d "$BUN_INSTALL/bin"; and not contains "$BUN_INSTALL/bin" $PATH
    set -gx PATH "$BUN_INSTALL/bin" $PATH
end
