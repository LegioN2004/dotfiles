#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./crossInstall.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

echo "Update packages list and update system "

if command -v pacman &> /dev/null
then
 yes|pacman -Syyu amd-ucode fish curl wget alacritty dmenu base-devel python-pip python xorg i3 i3-wm i3blocks i3lock i3status xinput git light lightdm lightdm-gtk-greeter gcc pactl playerctl stow neovim tmux libx11 lm_sensors libxinerama libxft

 echo "get node version manager"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" &&
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

 echo "get paru aur helper"
  mkdir -p "/home/$username/Downloads/softwares"
  git clone https://aur.archlinux.org/paru.git
  cd paru || return 
  makepkg -si && paru -S nerd-fonts-hack brave-bin apple_cursors
  cd
  chmod +s /usr/bin/light

elif command -v apt-get &> /dev/null
then
  apt update -y && apt upgrade -y && apt-get install amd-microcode nala fish alacritty dmenu build-essential python3-pip xorg i3 i3-wm i3blocks i3lock i3pystatus i3status xinput git light lightdm lightdm-gtk-greeter gcc pactl playerctl stow neovim tmux libx11-dev lm-sensors libxinerama-dev libxft-dev 
  chmod +s /usr/bin/light
  wget http://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip && unzip Hack.zip && mkdir -p $HOME/.local/share/fonts/nerdfonts/Hack && mv *.ttf $HOME/.local/share/fonts/nerdfonts/Hack && fc-cache -f -v
  cd
fi


echo "Making .config and Moving config files and background to Pictures"
cd $builddir || cd
mkdir -p "/home/$username/.config"
mkdir -p "/home/$username/.local/share/fonts"
mkdir -p "/home/$username/Pictures"
mkdir -p "/home/$username/Documents"
mkdir -p "/home/$username/Pictures/wallpapers"
mkdir -p "/home/$username/dotfiles"
mkdir -p "/home/$username/Downloads/softwares"
cd

echo "Cloning all the dotfiles required for the minimal functioning of nvim, tmux, etc"
# clone https://github.com/LegioN2004/dotfiles.git

cd
git clone https://github.com/LegioN2004/dotfiles.git
cd dotfiles || return
git checkout Minimalist
rm -rf ~/.bahrc ~/.bash_history ~/.bash_profile ~/.zshrc ~/.zprofile ~/.config/fish ~/.config/zsh
echo "do a good stow to symlink everything"
stow .

cd 
mv user-dirs.dirs "/home/$username/.config"
chown -R $username:$username /home/$username


cd
if command -v pacman &> /dev/null
then
echo "Installing Essential Programs"
yes|pacman -Syyu rofi feh dunst libnotify thunar xfce4-settings networkmanager gnome-authentication-agent gnome-keyring gnome-polkit xorg-server unzip pulseaudio pavucontrol alsa-utils volumeicon libx11-dev libxft-dev libxinerama-dev ristretto zathura zathura-pdf-mupdf ghq peco github-cli
echo "Installing other less important Programs"
yes|pacman -Syyu neofetch htop flameshot redshift xclip maim vim lxappearance ranger papirus-icon-theme noto-fonts-emoji ttf-font-awesome jdk-openjdk exa ttf-ubuntu-mono-nerd bluez blueman
sudo systemctl enable bluetooth

elif command -v apt-get &> /dev/null
then
echo "Installing Essential Programs"
nala install rofi feh dunst libnotify-bin thunar xfce4-settings network-manager-gnome policykit1-1-gnome gnome-keyring x11-xserver-utils unzip pulseaudio pavucontrol alsa-utils volumeicon-alsa libx11-dev libxft-dev libxinerama-dev ristretto zathura zathura-pdf-poppler peco gh -y
echo "ghq stuff"
git clone https://github.com/x-motemen/ghq /home/$username/Downloads/softwares/
cd ghq
make install
cd
echo "Installing other less important Programs"
nala install neofetch htop flameshot redshift xclip maim vim lxappearance ranger papirus-icon-theme fonts-noto-color-emoji fonts-font-awesome openjdk-17-jdk exa fonts-ubuntu bluez blueman -y
sudo systemctl enable bluetooth
echo "Install brave-browser"
nala install apt-transport-https curl -y
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list
nala update
nala install brave-browser -y
fi
cd


echo "Download Nordic Theme"
cd /usr/share/themes/
git clone https://github.com/EliverLara/Nordic.git
cd

# clone https://github.com/LegioN2004/dotfiles.git
# git clone https://github.com/LegioN2004/some-other-stuff.git
# cd some-other-stuff || return
# cp -r some-other-stuff/ /home/$username/.fonts
# mv dotfonts/fontawesome/otfs/*.otf /home/$username/.fonts/
# chown $username:$username /home/$username/.fonts/*

echo "Reloading Font"
fc-cache -vf

echo "installing cursors:" 
echo "1. Nordzy cursor"
cd /home/$username/Downloads/softwares
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors
./install.sh
rm -rf Nordzy-cursors
echo "2. macOS cursor"
cd /home/$username/Downloads/softwares
wget https://github.com/ful1e5/apple_cursor/releases/download/v2.0.0/macOS-BigSur.tar.gz
# for install the cursors
tar -xvf macOS-Bigsur.tar.gz                # extract `.tar.gz`
mv macOS-* ~/.icons/                        # Install to local users
mv macOS-* /usr/share/icons/           # Install to all users
cd
# Uninstallation of the cursors
# rm ~/.icons/macOS-*                         # Remove from local users
# sudo rm /usr/share/icons/macOS-*            # Remove from all users

# Enable LightDM graphical login and change target from CLI to GUI
# systemctl enable lightdm
# systemctl set-default graphical.target

echo" ^ instead of that I am using the ly console display manager"
cd /home/$username/Downloads/softwares
git clone --recurse-submodules https://github.com/nullgem/ly.git
cd ly
make && make install
cd



# TODO: setup power saving properly in linux
echo "# powersave and firewall settings"
# firewall stuff is from this website https://christitus.com/linux-security-mistakes/
if command -v pacman &> /dev/null
then
yes|pacman -Syyu ufw powertop tlp tlp-rdw fail2ban
echo "ufw rules"
ufw limit 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
ufw enable
# All configuration files are in /etc/fail2ban Configuration file examples and defaults are in two main files /etc/fail2ban/fail2ban.conf and /etc/fail2ban/jail.conf
cp -r "/home/$username/dotfiles/scripts-laptop/fail2ban/jail.conf" /etc/fail2ban/jail.local
echo "Enabling Fail2Ban"
systemctl enable fail2ban
systemctl start fail2ban

# again trying the auto-cpu freq to do this
cd /home/$username/Downloads/softwares
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && ./auto-cpufreq-installer
auto-cpufreq --install
cd

elif command -v apt-get &> /dev/null
then
nala install ufw powertop tlp tlp-rdw fail2ban -y
echo "ufw rules"
ufw limit 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
ufw enable
# All configuration files are in /etc/fail2ban Configuration file examples and defaults are in two main files /etc/fail2ban/fail2ban.conf and /etc/fail2ban/jail.conf
mkdir -p /etc/fail2ban
cp -r "/home/$username/dotfiles/scripts-laptop/fail2ban/jail.conf" /etc/fail2ban/jail.local
echo "Enabling Fail2Ban"
systemctl enable fail2ban
systemctl start fail2ban

# again trying the auto-cpu freq to do this
cd /home/$username/Downloads/softwares
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && ./auto-cpufreq-installer
auto-cpufreq --install

cd
cd

echo "adding the auto-cpufreq config file"
cp -r "/home/$username/dotfiles/scripts-laptop/auto-cpufreq config/auto-cpufreq.conf" /etc/auto-cpufreq.conf

# XSessions and i3.desktop
if [[ ! -d /usr/share/xsessions ]]; then
       mkdir /usr/share/xsessions
fi

cat > ./temp << "EOF"
[Desktop Entry]
Encoding=UTF-8
Name=i3
Comment=Dynamic window manager
Exec=i3
Icon=i3
Type=XSession
EOF
cp ./temp /usr/share/xsessions/i3.desktop;rm ./temp

########################################################
# End of script for default config
#

apt autoremove
exit

# now goes all the normal user settings script
# sh <(curl -L https://nixos.org/nix/install) --no-daemon



