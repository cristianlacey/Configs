#!/bin/bash

sudo apt-get update

# Install packages in packages.list
cat packages.list | grep -v -E "#|^$" | xargs sudo apt-get -y install

# Install packages in python_packages.list
cat python_packages.list | grep -v -E "#|^$" | xargs pip3 install

# Install Atom
wget -O atom-amd64.deb https://atom.io/download/deb
sudo gdebi atom-amd64.deb
rm atom-amd64.deb

# To check for packages installed with apt, execute the following:
# zgrep 'Commandline: apt' /var/log/apt/history.log /var/log/apt/history.log.*.gz

# Add .icons and .emacs.d
mkdir ~/.icons
mkdir ~/.emacs.d
mkdir ~/.emacs.d/themes

cp emacs_themes/* ~/.emacs.d/themes
