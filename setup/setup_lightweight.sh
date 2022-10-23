#!/bin/bash

# Minimal Setup
# Install your Debian setup of choice first - use a STABLE version not testing (no security updates)
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### CONFIGURE REPOS ###
# this file contains all the non-open repos and backports
cp /home/vibri/linux_setup/resources/apt/sources.list /etc/apt/
apt-get update
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### SETUP SUDO ###
# Install sudo and add user to sudoers / allow shutdown without password
apt-get install -y sudo
echo 'vibri   ALL=(ALL:ALL) ALL' >> /etc/sudoers
echo 'vibri ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown' >> /etc/sudoers
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### SETUP ENVIRONMENT ###
# add the path environment for sbin to ease typing
echo 'export PATH="/sbin:$PATH"' >> /home/vibri/.profile
# setup bashrc
cp /home/vibri/linux_setup/resources/.bashrc /home/vibri/.bashrc
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### INSTALL & SETUP CLI APPS ###
apt-get install -y p7zip-full p7zip-rar # full 7zip package
apt-get install -y ranger # cli file manager
apt-get install -y tree # folder tree mapping
apt-get install -y ncdu # disk usage analyser

apt-get install -y ufw # simple firewall
apt-get install -y aria2 # wget alternative download manager
apt-get install -y curl # flexible download manager
apt-get install -y iftop # internet monitor
apt-get install -y nethogs # list apps using the most bandwidth
apt-get install -y ssh # remote terminal

apt-get install -y htop # system performance
apt-get install -y powertop # system energy usage
apt-get install -y rsync # backup and folder sync tool
apt-get install -y cups # printer server
apt-get install -y ncal # basic calendar
apt-get install -y slock # simple screen locker

apt-get install -y nano # cli text editor (often installed by default)
# Setup nanorc
 cp /home/vibri/linux_setup/resources/nano/nanorc /home/vibri/.nanorc

apt-get install -y vim # advanced cli text editor
# Setup vimrc
 cp /home/vibri/linux_setup/resources/.vimrc /home/vibri/.vimrc

apt-get install -y flatpak # flatpak package manager
# Add flathub repo to flatpak.
 flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

apt-get install -y git # code project management

# optional extras
# apt-get install -y bc # basic interactive calculator
# apt-get install -y mc # midnight commander file manager
# apt-get install -y nmap # port mapper for diagnostics
# apt-get install -y traceroute # internet traceroute for diagnostics
# apt-get install -y xfce4-terminal # alternative xfce terminal
# apt-get install -y moc # terminal music player
# apt-get install -y w3m # terminal web browser
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### SCRIPTS ###
# setup local scripts folder and make executable (requires git)
git clone https://github.com/vibribbon/scripts
chown -R vibri /home/vibri/scripts/
chmod -R 744 /home/vibri/scripts/
# ----------------------------------------------------------------------



# ----------------------------------------------------------------------
# ----------------------------------------------------------------------
### INSTALL BASIC OS GUI ###
apt-get install -y xorg openbox obconf
 mkdir /home/vibri/.config
 cp -r /etc/xdg/openbox /home/vibri/.config
 cp -r /home/vibri/linux_setup/resources/openbox /home/vibri/.config
# set resolution to 1440p
# echo 'exec xrandr --output HDMI-A-0 --mode 2560x1440 &' >> /home/vibri/.config/openbox/autostart
# echo 'exec xrandr --output HDMI-1 --mode 2560x1440 &' >> /home/vibri/.config/openbox/autostart

# if you want a lightweight login manager & configs
# apt-get install -y slim
#  cp /home/vibri/linux_setup/resources/slim/slim.conf /etc
#  cp /home/vibri/linux_setup/resources/slim/background.jpg /usr/share/slim/themes/default

### CONVENTIONAL DESKTOP ADDITIONS ###
# apt-get install -y tint2 # task bar
# apt-get install -y ivman # mounts volumes
# apt-get install -y parcellite # clipboard manager
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### INSTALL GUI APPS ###
apt-get install -y pcmanfm # file manager
 cp -r /home/vibri/linux_setup/resources/pcmanfm/default /home/vibri/.config/pcmanfm/default
apt-get install -y feh # frameless image viewer
apt-get install -y mupdf # pdf viewer
apt-get install -y geany # text editor IDE
 cp -r /home/vibri/linux_setup/resources/geany/ /home/vibri/.config/
apt-get install -y firefox-esr # firefox browser
apt-get install -y libreoffice-writer # document writing
# apt-get install -y libreoffice-impress # slideshow design
apt-get install -y libreoffice-calc # spreadsheet creation
# apt-get install -y scribus # desktop publishing layout creator
# apt-get install -y calibre # ebook mangement
# apt-get install -y pandoc # document conversion
# apt-get install -y r-base # r development
# apt-get install -y gimp # photo editor
# apt-get install -y inkscape # technical drawing package
# apt-get install -y shotcut # non-linear video editor
# apt-get install -y handbrake # audio video encoder
# apt-get install -y audacity # non-linear audio editor
# apt-get install -y blender # rendering and 3d printing
# apt-get install -y krita # painting package
# apt-get install -y darktable # image viewer and organiser

### UTILITIES ###
apt-get install -y pulseaudio pavucontrol # sound settings and volume control
apt-get install -y xsensors # system temperature monitoring
apt-get install -y gnome-disk-utility # partition manager
apt-get install -y bleachbit # system cleanup
apt-get install -y youtube-dl # youtube downloader & media player
apt-get install -y xarchiver # compression front end
apt-get install -y arandr # monitor resolution set
apt-get install -y gufw # ufw firewall front end
apt-get install -y galculator # calculator
apt-get install -y clamav clamtk # virurs scanner and interface

### FLATPAK APPS ###
sudo flatpak install flatseal # security for flatpak containers
# sudo flatpak install rstudio # front end dev envirnment for r

### COMMON OPTIONAL ALTERNATIVES ###
# apt-get install -y chromium # chromium browser
# apt-get install -y mirage # image viewer
# apt-get install -y vlc # media player
# apt-get install -y notepadqq # text editor api (notepad++ port)
# apt-get install -y synaptic # visual package manager
# apt-get install -y gparted # partition manager
# apt-get install -y thunar # file manager
# apt-get install -y transmission # download manager
# apt-get install -y digikam # image viewer and organiser
# apt-get install -y conky # system monitor
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### PROGRAMMING ENVIROMNENTS ###
apt-get install -y python3 python3-pip # install python
# apt-get install -y build-essential ccache # install c/c++ compiler
# apt-get install -y mariadb-server
#  sudo mysql_secure_installation # config for mariadb
# apt-get install -y apache2 #www server
# apt-get install -y php libapache2-mod-php pch-cli php-mysql php-zip php-curl php-xml #php and addons
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### DRIVERS & FIRMWARE ###
# non-free firmware if required for specific hardware
# apt-get install -y firmware-linux firmware-linux-nonfree

# AMD latest drivers
# Standard edition
# apt-get install -y firmware-amd-graphics linux-image-amd64
# bleeding edge version for gaming only
# apt-get install -y firmware-amd-graphics linux-image-amd64 -t bullseye-backports

# install vulkan drivers (generic to all cards)
# add-apt-repository ppa:oibaf/graphics-drivers
# apt update
# apt-get install libvulkan1 mesa-vulkan-drivers vulkan-tools
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### GAMING RELATED APPS ###
# install steam (requires the i386 architecture)
# dpkg --add-architecture i386
# apt-get update
# apt-get install -y steam

# Install Lutris
# sudo flatpak install lutris
# ----------------------------------------------------------------------


