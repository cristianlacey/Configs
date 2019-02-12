#!/bin/bash

# Run this script to remove config files currently in home directory
# and create hard links to files in ~/Configs.

rm ~/.bashrc
rm ~/.hgrc
rm ~/.emacs
rm ~/.gitconfig

ln ~/Configs/bashrc ~/.bashrc
ln ~/Configs/hgrc ~/.hgrc
ln ~/Configs/emacs ~/.emacs
ln ~/Configs/gitconfig ~/.gitconfig
