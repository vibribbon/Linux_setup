de#!/bin/bash

# ----------------------------------------------------------------------
### NOTES ###
# Debian setup
# Modular file - comment/uncomment as required for your setup.
# Install your Debian setup of choice first - use a STABLE version not testing (no security updates)
# recommended to run as setup_basics.sh as su, then run this script as sudo from main user account
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
echo 'Starting setup for the following user'
my_username=$(who | head -n 1 | cut -d ' ' -f 1)
echo $my_username
read -p "Enter y to continue: " response_yn
if [[ $response_yn == "y" || $response_yn == "Y" ]]
then
	echo 'Starting Install'
else
	exit 0
fi
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
### CONFIGURE REPOS ###
# Setup Apt repos to include non-free and contrib
# Add ' non-free contrib' to the lines starting 'deb http'
sed -i '/^deb http/ s/$/ non-free contrib/' /etc/apt/sources.list
# comment out the source lines.
sed -i 's/\(^deb-src http\)/# \1/g' /etc/apt/sources.list
apt-get update	# refresh repos
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### SETUP SUDO ###
# Install sudo and add user to sudoers / allow shutdown without password
# change 'vibri' to your username
apt-get install -y sudo
echo "${my_username}   ALL=(ALL:ALL) ALL" >> /etc/sudoers
echo "${my_username} ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown" >> /etc/sudoers
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### ENVIRONMENT ###
# add the path environment for sbin to ease typing
echo 'export PATH="/sbin:$PATH"' >> "/home/${my_username}/.profile"
# setup bashrc
cp "/home/${my_username}/openbox_setup/resources/.bashrc" "/home/${my_username}/.bashrc"
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### PACKAGE MANAGERS & REPOS ###
# Setup flatpak for cutting edge packages
apt-get install -y flatpak
# Add flathub repo to flatpak.
 flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
 sudo flatpak install flatseal # security tool for flatpak containers

# Setup git source code repo tool
apt-get install -y git # code project management
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### INSTALL APPS ###
# comment out those not required.

# TERMINAL APPS
# File Management
apt-get install -y p7zip-full p7zip-rar # compression manager (full package)
apt-get install -y ranger # cli file manager
# apt-get install -y tree # folder tree mapping
apt-get install -y ncdu # disk usage analyser
apt-get install -y rsync # backup and folder sync tool
# apt-get install -y mc # midnight commander file manager

# Networking
apt-get install -y ufw # simple firewall
apt-get install -y aria2 # wget alternative download manager
apt-get install -y curl # flexible download manager
apt-get install -y iftop # internet monitor
apt-get install -y nethogs # list apps using the most bandwidth
apt-get install -y ssh # remote terminal control
# apt-get install -y nmap # port mapper for diagnostics
# apt-get install -y nmon # networking package
# apt-get install -y traceroute # internet traceroute for diagnostics
# apt-get install -y whois # internet whois identification
# apt-get install -y w3m # terminal web browser
# apt-get install -y elinks # terminal browser
# apt-get install -y mutt # email client
# apt-get install -y alpine # email client
# apt-get install -y newsboat # rss tool
# apt-get install -y weechat # irc client

# System
apt-get install -y htop # system performance & jobs
apt-get install -y powertop # system energy usage
apt-get install -y cups # printer server
apt-get install -y radeontop # amd radeon monitoring toolkit
# apt-get install -y atop # system activity monitor

# Utilities
apt-get install -y ncal # basic calendar
# apt-get install -y calcurse # calendar app
apt-get install -y slock # simple screen locker
apt-get install -y icdiff # colorised text file compare (diff)
# apt-get install -y mupdf-tools # extract parts from PDF files
# apt-get install -y pandoc # text document converter
# apt-get install -y bc # basic interactive calculator
# apt-get install -y ttygif # create terminal gifs
# apt-get install -y exa # colorised file lister
# apt-get install -y peco # interactive filtering tool for file search.
# apt-get install -y akisaurus # cli thesaurus
# apt-get install -y stress-ng # hardware stress testing
# apt-get install -y fastboot # android system toolkit

# Media
# apt-get install -y moc # terminal music player
# apt-get install -y ffmpeg # audo & video converter
# apt-get install -y devede # comprehensive dvd creator
# apt-get install -y xfburn # basic dvd/cd creator

# Terminals
# apt-get install -y terminator # large feature rich terminal
# apt-get install -y guake # quake style drop down terminal
# apt-get install -y xfce4-terminal # alternative xfce terminal
# apt-get install -y tmux # multiple terminals within one window

# Text Editors
# apt-get install -y micro # mini text editor (nano alternative)
# apt-get install -y swpe # old school text editor
apt-get install -y nano # cli text editor (often installed by default)
	cp "/home/${my_username}/openbox_setup/resources/nano/nanorc" "/home/${my_username}/.nanorc"	# setup nanorc
# apt-get install -y vim # advanced cli text editor
#	cp "/home/${my_username}/openbox_setup/resources/.vimrc" "/home/${my_username}/.vimrc"	# setup vimrc
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
### LOCAL SCRIPTS ###
# Install local scrips from github repos
git clone https://github.com/vibribbon/bookmarks "/home/${my_username}/dev/bmark/"	# tdmenu bookmark launcher (browser independant)
git clone https://github.com/vibribbon/weather "/home/${my_username}/dev/weather/"	# show BBC weather for a location
git clone https://github.com/vibribbon/launcher "/home/${my_username}/dev/launcher/"	# dmenu quick launcher with history
git clone https://github.com/vibribbon/timezone "/home/${my_username}/dev/timezone/"	# timezone calculator
git clone https://github.com/vibribbon/rss_news "/home/${my_username}/dev/rss_news/"	# rss feed reader (browser & cli version available)
git clone https://github.com/vibribbon/pcinfo "/home/${my_username}/dev/pcinfo/"	# List PC specs and status
git clone https://github.com/vibribbon/recently_accessed "/home/${my_username}/dev/recent/"	# rile usage and modified history
git clone https://github.com/vibribbon/netscan "/home/${my_username}/dev/netscan/"	# portscan local network
git clone https://github.com/vibribbon/system_audit_and_cleanup "/home/${my_username}/dev/system_audit/"	# search for potentially removable files and permissions concerns
git clone https://github.com/vibribbon/list_manual_apps "/home/${my_username}/dev/list_manual_apps/"	# list all apps manually installed
git clone https://github.com/vibribbon/zip_all_folders_individual "/home/${my_username}/dev/zip_folders/"	# zip folders into individual 7zip files.
git clone https://github.com/vibribbon/apt_system_update "/home/${my_username}/dev/apt_system_update/"	# quick update and clean script using apt
git clone https://github.com/vibribbon/file_renamer "/home/${my_username}/dev/file_renamer/"	# rename camel case into snake case

# copy the files to usr/local for publis execution and remove their extension
find "/home/${my_username}/dev/" -type f | grep "\.sh" | xargs cp -t /usr/local/bin/

find /usr/local/bin/ -type f -name '*.sh' -exec sh -c '
    for pathname do
        mv -- "$pathname" "${pathname%.sh}"	# remove .sh
    done' sh {} +

chmod 755 /usr/local/bin/*
chown root /usr/local/bin/*
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### CONVERT FOLDER OWNERSHIP ###
chown -R $my_username "/home/${my_username}"  # change to the required username (replace vibri)
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
# vv GUI SYSTEMS ONLY BELOW THIS POINT vv
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### DRIVERS & FIRMWARE ###
# apt-get install -y firmware-linux firmware-linux-nonfree	# non-free optional firmware if required for specific hardware

# AMD Graphics latest drivers - ONLY INSTALL ONE VERSION
apt-get install -y firmware-amd-graphics linux-image-amd64	# Standard desktop
# apt-get install -y firmware-amd-graphics linux-image-amd64 -t bookworm-backports	# cutting edge drivers for gaming systems only change debian version as required.
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### INSTALL XORG OPENBOX GUI ###
apt-get install -y xorg openbox obconf	# Install xorg display manager, openbox window manager, obconf utility
 mkdir "/home/${my_username}/.config"
 cp -r "/home/${my_username}/openbox_setup/resources/openbox" "/home/${my_username}/.config"
# set resolution to 1440p
 echo 'exec xrandr --output HDMI-A-0 --mode 2560x1440 &' >> "/home/${my_username}/.config/openbox/autostart"
 echo 'exec xrandr --output HDMI-1 --mode 2560x1440 &' >> "/home/${my_username}/.config/openbox/autostart"
# or set resolution to 1080p
# echo 'exec xrandr --output HDMI-A-0 --mode 1920x1080 &' >> "/home/${my_username}/.config/openbox/autostart"
# echo 'exec xrandr --output HDMI-1 --mode 1920x1080 &' >> "/home/${my_username}/.config/openbox/autostart"
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### INSTALL WAYLAND WESTON GUI ###
# apt-get install -y weston	# Install weston basic gui for wayland
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### GUI APPS ###
# File management
apt-get install -y pcmanfm # file manager
 cp -r "/home/${my_username}/openbox_setup/resources/pcmanfm/default" "/home/${my_username}/.config/pcmanfm/default"
apt-get install -y xarchiver # compression front end
# apt-get install -y thunar # file manager

# System
# apt-get install -y synaptic # visual package manager
# apt-get install -y gparted # partition manager
apt-get install -y gnome-disk-utility # partition manager

# Network
apt-get install -y firefox-esr # firefox browser
# apt-get install -y chromium # chromium browser
apt-get install -y gufw # ufw firewall front end (if using ufw)
# apt-get install -y transmission # download manager

# Media
apt-get install -y feh # frameless image viewer
# apt-get install -y sxiv # very lightweight image viewer
# apt-get install -y nomacs # larger image viewer and organiser
# apt-get install -y qimgv # another image viewer
# apt-get install -y mirage # another image viewer
# apt-get install -y viewnior # very basic image viewer
apt-get install -y mupdf # pdf viewer
apt-get install -y gimp # photo editor
# apt-get install -y inkscape # drawing package
# apt-get install -y krita # painting package
# apt-get install -y darktable # image viewer and organiser
# apt-get install -y digikam # image viewer and organiser
# apt-get install -y shotcut # non-linear video editor
# apt-get install -y kdenlive # non-linear video editor (using KDE)
# apt-get install -y handbrake # audio video encoder
# apt-get install -y vlc # media player
# apt-get install -y audacity # non-linear audio editor
# apt-get install -y blender # rendering and 3d printing
apt-get install -y youtube-dl # youtube downloader & media player

# Utilities
apt-get install -y pulseaudio pavucontrol # sound settings and volume control
apt-get install -y xsensors # system temperature monitoring
apt-get install -y bleachbit # system cleanup
apt-get install -y arandr # monitor resolution set
# apt-get install -y conky # system monitor
# apt-get install -y stacer # system monitor
# apt-get install -y galculator # calculator
apt-get install -y clamav clamtk # virus scanner and interface

# Production
apt-get install -y libreoffice-writer # document writing
apt-get install -y libreoffice-impress # slideshow design
apt-get install -y libreoffice-calc # spreadsheet creation
apt-get install -y scribus # desktop publishing layout creator
# apt-get install -y calibre # ebook mangement
# apt-get install -y r-base # r development
# sudo flatpak install rstudio # front end dev envirnment for r (flatpak)

# Text Editors
apt-get install -y geany # text editor IDE
 cp -r "/home/${my_username}/openbox_setup/resources/geany/" "/home/${my_username}/.config/"
# apt-get install -y notepadqq # text editor api (notepad++ port)

# Openbox Extensions
# apt-get install -y tint2 # simple task bar
# apt-get install -y ivman # mounts volumes
# apt-get install -y parcellite # clipboard manager
# apt-get install -y nitrogen # wallpaper manager if you dont like feh
# apt-get install -y plank # osx style launcher
# apt-get install -y slim # lightweight spartan login manager
#  cp "/home/${my_username}/openbox_setup/resources/slim/slim.conf" /etc
#  cp "/home/${my_username}/openbox_setup/resources/slim/background.jpg" /usr/share/slim/themes/default
# apt-get install -y lightdm # larger but more modern / better looking login manager
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### GAMING INFRASTRUCTURE AND DRIVERS ###
# dpkg --add-architecture i386	# install i386 architecture for steam
#  apt-get update
#  apt-get install -y steam	# steam gaming frontend
# sudo flatpak install lutris	# wine / proton emulation plus frontend and runners.
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### NON REPO APPS ###
# meowsql # port of heidisql available as appimage
# waybox # wayland port of openbox
# lightworks # commercial video editor
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### LOGIN OPTIONS ###
# Auto start GUI (startx) once correct password entered - if not using login manager.
echo '' >> "/home/${my_username}/.profile"
 echo '# run startx at login (/dev/tty1 is the default tty terminal)' >> "/home/${my_username}/.profile"
 echo '[ "$(tty)" = "/dev/tty1" ] && exec startx' >> "/home/${my_username}/.profile"

# Auto enter username at logon (password still required)
# mkdir /etc/systemd/system/getty@tty1.service.d
#  cp "/home/${my_username}/openbox_setup/resources/agetty/override.conf" /etc/systemd/system/getty@tty1.service.d/
# ----------------------------------------------------------------------
