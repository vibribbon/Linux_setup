#!/bin/bash


# unlock an encrypted drive (run with sudo)
cryptsetup luksOpen /dev/sdb bak_8tb

# add mount directory
# mkdir /media/wd8tb_bak1
mount /dev/mapper/bak_8tb /media/wd8tb_bak1/
