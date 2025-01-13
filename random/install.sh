sudo pacman -S github-cli tmux stow gimp kdenlive i3 base-devel ffmpeg yt-dlp freedownloadmanager fzf gcc python lf
paru -S ghq ripgrep fd ag jq nvm gh brave-bin google-chrome-bin github-cli github-desktop-bin visual-studio-code-bin vlc gparted imagemagick alacritty meld neovim-nightly obs-studio okular pace spotify spotify-adblock sublime-text telegram-desktop tlpui tlp-rdw tlp timeshift ventoy-bin zsh zsh-autosuggestions-git zsh-completions zsh-fast-syntax-highlighting zsh-history-substring-search-git zsh-syntax-highlighting-git zsh-theme-powerlevel10k-git zoom
gh auth
gh auth login
gh clone legion2004/dotfiles
gh repo clone legion2004/dotfiles
paru -S fastfetch
paru -S pamac-classic pamac-aur
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install --lts
npm install -g pnpm
git clone https://github.com/rvaiya/keyd\ncd keyd\nmake && sudo make install\nsudo systemctl enable --now keyd && sudo systemctl enable keyd --now
sudo nvim /etc/keyd/default.conf
sudo keyd reload
