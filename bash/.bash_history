ghq get git clone https://github.com/arcolinux/arcolinux-spices
fish
last_upgrade=$(grep -m 1 'full system upgrade' /var/log/pacman.log | cut -d ' ' -f 1 | tr -d '[]')
less /var/log/pacman.log 
less /var/log/pacman.log | grep pacman -Syyu
less /var/log/pacman.log | grep -Syu
less /var/log/pacman.log | grep "-Syu"
cat /var/log/pacman.log | grep "-Syu"
bat /var/log/pacman.log 
yay -Syyu
yay -Syyu
yes|yay -Syyu
exit
fish
cd
cd -
fish
g pull
v userChrome.css 
exit
cd
fish
exit
cd ..
ls
ls ../legion2004/
code .
cd "/home/sunny/ghq/github.com/LegioN2004/programs/book-practice/" && g++ pg145prog7-2.cpp -o pg145prog7-2 && "/home/sunny/ghq/github.com/LegioN2004/programs/book-practice/"pg145prog7-2
 pwd
ls
cp after/plugin/lsp.lua ~/ghq/github.com/LegioN2004/some-other-stuff/Main-Neovim-Config/
ls
gs
ls
pwd
remove gnome-photos && yes|install nomacs eog
sudo pacman -R gnome-photos && yes|sudo pacman -s nomacs eog
sudo pacman -R gnome-photos && yes|sudo pacman -S nomacs eog
legion
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y
lv
lvim
exit
ls
yay linux | grep "(Installed)"
exit
v .bashrc 
v .bashrc 
source .bashrc 
ls
v .bashrc 
source .bashrc 
ls
cd dotfiles/nvim/.config/nvim/
ls
cd
v .bashrc 
source .bashrc 
ls
cd dotfiles/nvim/.config/nvim/
cd
v .bashrc 
source .bashrc 
ls
cd dotfiles/nvim/.config/nvim/
gs
v .bashrc 
cd
v .bashrc 
source .bashrc 
ls
cd dotfiles/nvim/
ls
gs
cd
exit
v .bashrc 
source .bashrc 
cd dotfiles/
v .bashrc 
cd
v .bashrc 
source .bashrc 
ls
cd dotfiles/
ls
yay wezterm
remove yakuake
ls
ls
ll
polybar
cd .config/polybar/
ls
v config.ini 
polybar
v launch.sh 
cd ..
rm -rf polybar/
ls
cd
cd dotfiles/scripts-laptop/scripts/
ls
v chargingnotify 
ls
chmod +x batterynotify 
./batterynotify 
pkill batterynotify 
bash <(curl -L zellij.dev/launch)
bash <(curl -L zellij.dev/launch)
ls
ll
ls
exit
sudo pacman -Q | rg "amd"
sudo pacman -Q | rg "lib"
sudo pacman -Q | grep "lib"
fzf
cd
cd
ls
exit
ls
exit
ls
touch rollno.txt
ga . && gc "roll no added " 
v rollno.txt 
gs
ga . && gc "roll no modifined" 
g log
ls .git/
ls
exit
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
exit
sh <(curl -L https://nixos.org/nix/install) --no-daemon
ls
ll
exit
ls
cd
ls
cd -
ls
sl
sl
ls
exit
ls
v .bashrc 
sourceb
ls
source .bashrc 
ls
z some
ls
cd
exit
if command -v curl >/dev/null 2>&1; then   sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"; else   sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"; fi
if command -v curl >/dev/null 2>&1; then   sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"; else   sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"; fi
exit
ls
chmod +x i3-swallow.py 
ls
ls
pwd
ls
ls
ls
emacs --with-profile=myconfig
 exit
ls
mv .emacs-profiles.el dotfiles/fish/
cd dotfiles/fish/
cd ../
stow fish
cd
ls
fish
zsh
zsh
cd Downloads/i3-alternating-layout/
g
gs
gpl
g pull
g log
doom
exit
fish
ls
sourceb
source .bashrc 
sourceb
fishconfig 
sourceb
fishconfig 
zshconfig 
bashconfig 
ls
rm -rf config.def.h && sudo make clean install
hyprctl reload
z nvim
ls
v lua/legion/toggleterm.lua 
cd
exit
exit
ls
idea .
ls
cd Downloads/IntellijIdea-2023.1/idea-IC-231.8109.175/bin/
ls
./idea.sh 
./restart.py 
./inspect.sh 
./idea.sh 
./idea.sh 
./idea.sh 
./idea.sh 
./idea.sh 
clear
cd
ls
cd dotfiles/
gs
exit
sudo wireshark
exit
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) -y
exit
find ~/Pictures/wallpapers/wallpapers-stuff2/* -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \)
find ~/Pictures/wallpapers-stuff2/* -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \)
				images=($(find ~/Pictures//wallpapers-stuff2/* -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \)))
images=($(find ~/Pictures//wallpapers-stuff2/* -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \)))  						random_image=$(shuf -e "${images[@]}" -n 1)
images=($(find ~/Pictures//wallpapers-stuff2/* -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \)))
random_image=$(shuf -e "${images[@]}" -n 1)
swaymsg output "*" bg "$random_image" fill
export SWAYSOCK=(ls /run/user/1000/sway-ipc.* | sed -n 2p)
export SWAYSOCK=(ls /run/user/1000/sway-ipc.* | sed -n 2p)
export SWAYSOCK=(ls /run/user/1000/sway-ipc.* | head -n 1)
sway --get-socketpath
ls /run/user/sway-ipc..sock | head -n 1
yay swaysock
yay sock
yay sock | grep "sway"
yay sway
ls /run/user/1000/sway-ipc.* | head -n 1
ls /run/user/1000/sway-ipc.* 
gwd
pwd
ls
cd
cd dotfiles/feh/
ls
./watch2
yay swaymsg
export SWAYSOCK=$(sway --get-socketpath)
find /run/user -name "sway-ipc.*.sock"
sudo find /run/user -name "sway-ipc.*.sock"
cd
Sway
sway
cd
ls
cd dotfiles/feh/
ls
v watch3
chmod +x watch3 
./watch3 
v watch
v watch3
v watch
ls
gs
exit
hyperfine "nvim --headless +qa" --warmup 10
zsh
yes|paru -Syyu
clean
exit
ls
cd ../../config/
ls
mv autoformat.lua autoformat.lua.old
exit
v
cd
exit
sl
pwd
ls
cd
exit
grep -r "lsp" .
ls
v init.lua 
v init.lua 
v init.lua 
v init.lua 
v init.lua 
v init.lua 
v init.lua 
v init.lua 
v init.lua 
v init.lua 
v init.lua 
v init.lua 
v init.lua 
v init.lua 
v init.lua 
v init.lua 
v init.lua 
v init.lua 
v init.lua 
v init.lua 
 in
v init.lua 
v
v init.lua 
v init.lua 
exit
ls
cd ..
cd assignments/
ls
fish
ls
live-server
npm start live-server
ls
exit
rustc --version
exit
ls
sudo nvim
exit
sudo nvim
exit
fzf --preview='
  if file --mime-type {} | grep -qF image/; then
    kitty icat --clear --transfer-mode=memory --stdin=no --place=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0 {} | sed \$d
  else
    bat --color=always {}
  fi
'
exit
ls
ll
cd dotfiles/**
cd
exit
v
nvim
<<<<<<< Updated upstream
nvm
npm
node
=======
gh repo clone 
gh repo clone git@github.com:LegioN2004/dotfiles.git
gh repo clone git@github.com:LegioN2004/dotfiles.git
gh repo clone git@github.com:LegioN2004/dotfiles.git
gh auth status
gh auth 
gh auth refresh
gh repo clone git@github.com:LegioN2004/dotfiles.git
git clone https://github.com/LegioN2004/dotfiles.git
git clone https://github.com/LegioN2004/dotfiles.git
cd dott
cd dotfiles/
gs
git status
cp -r ~/random/bash .
cp -r ~/random/backup/bash .
ls
git status
source .bashrc
stow bash
source .bashrc
source ~/.bashrc
ls
gs
g add . && gc "nothing much" && g push
gh auth logoug
gh auth setup-git
g add . && gc "nothing much" && g push
g push
stow fish
fish
fish
cd nvim/.config/nvim/lua/
rg "find_files"
v config/keymaps.lua 
cd
exit
ls
source .bashrc
ls
cd dot
cd
ls
source .bashrc
ls
v .bash_profile 
v .bash_logout 
rg "/home/legion/.cargo/env"
sourceb
v .bashrc 
exit
ls
cd
sourceb
source ~/.bashrc 
ls
ls
v .bashrc 
ls
v
v
v .config/nvim/lua/legion/lazy.lua 
v
exit
source .bashrc
ls
fish
source .bashrc
ls
z nvim
ls
cd lua/el
source .bashrc 
v .bashrc 
exit
source .bashrc 
ls
v .bashrc 
hyperfine "nvim --headless +qa" --warmup 5
v
v
z nvim
ls
cd lua/legion/
ls
v plugins/alpha.lua 
v
v
bun
cd
bun
ls
cd pro
cd PR
cd Pr
ls
ghq
projs
projects
cd ghq/github.com/LegioN2004/
ls
cd Programs/
ls
g pull --rebase
shutdown
exit
sudo chsh
exit
zsh
exit
ls
>>>>>>> Stashed changes
exit
ls
cd dotfiles/
ls
gs
stow fish
psfzf
exit
fc-list
ls
v
hyperfine "nvim --headless +qa" --warmup 5
ls
nvim
z RUST
ls
zig
go
java
gcc
rustc
cargo
zsh
exit
pow
fish
