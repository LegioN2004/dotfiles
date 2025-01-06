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
ncspot
ncspot
ls
ls
ls
touch filename.c
so
clear
code .
clear
let's say you do everything in the terminal only and touch nothing else, then do the following
ls
mkdir cse-23-21
cd cse-23-21/
ls
touch to create files
ls
touch cse-23.c
rm -r create files to 
ls
touch 1.c 2.c 3.c
ls
vim .
vim e nai one sec
paru -S vim
vim .
ls
vim cse-23.c
vim cse-23.c
gcc cse-23.c 
ls
./a.out
clear
my vim looks different again due to customizations I did from my side
exit
gedit
not in mine, let me install it haa
paru -S gedit
clear
ls
rm -r cse-23-21/
now
nautilus .
mkdir cse-23-21
cd cse-23-21/
cd ..
cd cse-23-21/
ls
touch 1.c 2.c 3.c cse-23.c ll.c
ls
cat to see contents of files
cat cse-23.c 
vim cse-23.c 
cat cse-23.c 
gcc cse-23.c 
./a.out
cd ..
ls
nautilus .
cd cse-23-21
ls
cd ..
cd cse-23-21/
ls
mkdir new-directory
cd new-directory/
ls
cd ..
cd ..
cd cse-23-21/new-directory/
ls
clear
ls
cd ../
ls
cd
clear
how to navigate
cd ~/Documents/cse-23-21-guggi/
ls
gedit filename.c 
code filename.c 
cd
we are in home
ls
cd ~/Documents/cse-23-21-guggi/
ls
or
cd
cd ~/cse-23-21/
ls
cd
cd docu
cd Documents/cse-23-21-guggi/
ls
cd cse-23-2
cd cse-23-21
cd ~/cse-23-21
ls
here we are
cd
exit
exit
