#!/bin/bash

# Run NAS backup

# Remember to mount the backups drive locally first!
read -p "CHECK YOU HAVE MOUNTED THE RECEIVING DRIVE FIRST! - press a key to continue"



# PRIMARY BACKUPS
# Sync Public directories
rsync -av --delete -e ssh vibri@192.168.1.5:/mnt/our_data/d_public/ /media/wd8tb_bak1/public
# sync the private directories
rsync -av --delete -e ssh vibri@192.168.1.5:/mnt/our_data/d_private/ /media/wd8tb_bak1/private


# our_media is now depreciated, our_files is the old version.

# NOTES
# a = archive
# v = verbose print to screen
# z = compress
# P = progress bars
# --delete = remove other folders in destination

read -p "Press a key to exit"
