#!/bin/bash


# unlock an encrypted drive (run with sudo)
cryptsetup luksOpen /dev/sdb1 bak_4tb

# add mount directory
# mkdir /media/wd8tb_bak1
mount /dev/mapper/bak_4tb /media/wd4tb_bak2/
