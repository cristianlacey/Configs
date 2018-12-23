#!/bin/bash

# Update Ubuntu to latest packages
sudo apt update && sudo apt upgrade

# These dependencies were noted by me on default Ubuntu 18.04
sudo apt install build-essential git pkg-config libmtdev-dev mtdev-tools xserver-xorg-dev xutils-dev

# execute line by line:
cd /tmp
git clone https://github.com/p2rkw/xf86-input-mtrack.git
cd xf86-input-mtrack
./configure --with-xorg-module-dir=/usr/lib/xorg/modules
sudo make
sudo make install

# Link config file to destination
cd /usr/share/X11/xorg.conf.d/
sudo ln ~/Configs/touch_driver/50-mtrack.conf 50-mtrack.conf

# Add self to user group
sudo adduser "`whoami`" input
