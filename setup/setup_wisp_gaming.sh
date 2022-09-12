#!/bin/bash

# wisp Setup using debian only - lightweight setup
# Install your Debian setup of choice - use a STABLE version not testing (no security updates)


# CONFIGURE REPOS
cp /home/vibri/linux_setup/resources/apt/sources.list /etc/apt/
apt-get update


# install drivers / firmware (AMD only)
# apt-get install -y firmware-linux firmware-linux-nonfree libdrm-amdgpu1 xserver-xorg-video-amdgpu
# update kernel and install graphics drivers
apt-get install firmware-amd-graphics linux-image-amd64 -t bullseye-backports

# install vulkan
add-apt-repository ppa:oibaf/graphics-drivers
apt update
apt-get install libvulkan1 mesa-vulkan-drivers vulkan-tools

# INSTALL OS AND APPS
apt-get install -y sudo xorg openbox obconf
# if you want a lightweight login manager
apt-get install -y slim


# Command line apps
apt-get install -y p7zip-full p7zip-rar ranger ncdu tree nano aria2 htop powertop iftop nethogs ufw rsync cups flatpak git ncal curl vim ssh
# Utilities
apt-get install -y xsensors slock gnome-disk-utility bleachbit youtube-dl xarchiver arandr galculator gufw
apt-get install -y pulseaudio pavucontrol
# GUI Apps
apt-get install -y pcmanfm firefox-esr feh mupdf geany libreoffice-writer
# Optional apps
# apt-get install -y r-base moc stacer blender virtualbox nmon okular krita digikam darktable filezilla calibre pandoc clamav clamtk
# common alternative apps
# apt-get install -y chromium mirage vlc transmission notepadqq vim terminator abiword synaptic gparted mc thunar
# Add optional OS desktop objects
# apt-get install -y tint2 ivman
# Novelties
# apt-get install -y chafa conky buici-clock tickr parcellite

# build essential - needed for virtualbox
# apt install build-essential dkms linux-headers-$(uname -r)
# Rstudio deadbeef flatseal and heidisql are manual installs


# CONFIGURATION
# Add flathub to flatpak.
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# copy the openbox default configs to the local user folder.
mkdir /home/vibri/.config
cp -r /etc/xdg/openbox /home/vibri/.config
cp -r /home/vibri/linux_setup/resources/openbox /home/vibri/.config
# auto change the openbox resolution 1440p
echo 'exec xrandr --output HDMI-A-0 --mode 2560x1440 &' >> /home/vibri/.config/openbox/autostart
echo 'exec xrandr --output HDMI-1 --mode 2560x1440 &' >> /home/vibri/.config/openbox/autostart

# copy geany configs
mkdir /home/vibri/.config/geany
mkdir /home/vibri/.config/geany/colorschemes
cp /home/vibri/linux_setup/resources/geany/geany.conf /home/vibri/.config/geany
cp /home/vibri/linux_setup/resources/geany/spyder-dark.conf /home/vibri/.config/geany/colorschemes
# copy slim configs
cp /home/vibri/linux_setup/resources/slim/slim.conf /etc
cp /home/vibri/linux_setup/resources/slim/background.jpg /usr/share/slim/themes/default
# Change file ownership
chown -R vibri /home/vibri/.config
# Copy all scripts
cp -r /home/vibri/linux_setup/scripts/ /home/vibri
cp -r /home/vibri/linux_setup/setup/ /home/vibri/scripts/setup
cp -r /home/vibri/linux_setup/cheatsheets/ /home/vibri/scripts/cheatsheets
# setup pcmanfm
mkdir /home/vibri/linux_setup/resources/pcmanfm
cp -r /home/vibri/linux_setup/resources/pcmanfm/default/ /home/vibri/.config/pcmanfm/default
# setup bashrc
cp /home/vibri/linux_setup/resources/bashrc /home/vibri/.bashrc
# Setup nanorc
cp /home/vibri/linux_setup/resources/nano/nanorc /home/vibri/.nanorc
# Setup vimrc
cp /home/vibri/linux_setup/resources/.vimrc /home/vibri/.vimrc


# Add user to sudoers, and allow shutdown without password
echo 'vibri   ALL=(ALL:ALL) ALL' >> /etc/sudoers
echo 'vibri ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown' >> /etc/sudoers

# add the path for sbin to ease typing
echo 'export PATH="/sbin:$PATH"' >> /home/vibri/.profile

sudo flatpak install flatseal

# gaming software (APT)
install the i386 architecture (only used by steam)
dpkg --add-architecture i386
apt-get update
apt-get install -y steam

# Install Lutris
sudo flatpak install lutris


# Install heroic
# flatpak install heroic






