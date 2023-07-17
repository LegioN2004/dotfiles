#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

echo "Update packages list and update system "

if command -v pacman &> /dev/null
then
 yes|pacman -Syyu curl fish wget alacritty rofi feh base-devel python fish i3-wm i3blocks i3lock i3status ristretto zathura zathura-pdf-mupdf light lightdm gcc pactl playerctl ghq peco github-cli
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  #nvm
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" &&
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  # paru
  mkdir -p "/home/$username/Downloads/softwares"
  cd "/home/$username/Downloads/softwares" || return
  git clone https://aur.archlinux.org/paru.git
  cd paru || return 
  makepkg -si && paru -S nerd-fonts-hack brave-bin apple_cursors
  chmod +x /usr/bin/light
elif command -v apt-get &> /dev/null
then
  apt update && apt upgrade -y && apt-get install nala pactl playerctl git stow neovim tmux rofi build-essential light lightdm libx11-dev lm-sensors libxinerama-dev libxft-dev feh gcc  && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip && unzip Hack.zip && mkdir -p $HOME/.local/share/fonts/nerdfonts/Hack && mv *.ttf $HOME/.local/share/fonts/nerdfonts/Hack && fc-cache -f -v
  chmod +s /usr/bin/light
fi

# Making .config and Moving config files and background to Pictures
cd $builddir || cd
mkdir -p "/home/$username/.config"
mkdir -p "/home/$username/.local/share/fonts"
mkdir -p "/home/$username/Pictures"
mkdir -p "/home/$username/Documents"
mkdir -p "/home/$username/Pictures/wallpapers"

cd || return 

# clone https://github.com/LegioN2004/dotfiles.git
git clone https://github.com/LegioN2004/dotfiles.git ~/dotfiles
# do a good stow to symlink everything
cd dotfiles || return
stow .

cd 
mv user-dirs.dirs /home/$username/.config
chown -R $username:$username /home/$username


if command -v pacman &> /dev/null
then
# Installing Essential Programs 
yes|pacman -Syyu feh rofi picom thunar gnome-authentication-agent gnome-keyring gnome-polkit x11-xserver-utils unzip wget curl pulseaudio pavucontrol build-essential libx11-dev libxft-dev libxinerama-dev -y
# Installing Other less important Programs
yes|pacman -Syyu neofetch flameshot vim lxappearance papirus-icon-theme fonts-noto-color-emoji lightdm -y
elif command -v apt-get &> /dev/null
then
# Installing Essential Programs 
nala install feh rofi picom thunar gnome-authentication-agent gnome-keyring gnome-polkit x11-xserver-utils unzip wget curl pulseaudio pavucontrol build-essential libx11-dev libxft-dev libxinerama-dev -y
# Installing Other less important Programs
nala install neofetch flameshot vim lxappearance papirus-icon-theme fonts-noto-color-emoji lightdm -y
nala install fonts-font-awesome
# Install brave-browser
nala install apt-transport-https curl -y
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list
nala update
nala install brave-browser -y
fi


# Download Nordic Theme
cd /usr/share/themes/
git clone https://github.com/EliverLara/Nordic.git

# Installing fonts
cd $builddir 

# clone https://github.com/LegioN2004/dotfiles.git
# git clone https://github.com/LegioN2004/some-other-stuff.git
# cd some-other-stuff || return
# cp -r some-other-stuff/ /home/$username/.fonts
# mv dotfonts/fontawesome/otfs/*.otf /home/$username/.fonts/
# chown $username:$username /home/$username/.fonts/*

# Reloading Font
fc-cache -vf
# Removing zip Files
rm ./FiraCode.zip ./Meslo.zip

# Install Nordzy cursor
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors
./install.sh
cd $builddir
rm -rf Nordzy-cursors

# Enable graphical login and change target from CLI to GUI
systemctl enable lightdm
systemctl set-default graphical.target


