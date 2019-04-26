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

# Only link .bash_profile if passed "profile" arg.

case $1 in
    profile)
	rm ~/.bash_profile
	ln ~/Configs/bash_profile ~/.bash_profile
	;;
    *)
	echo 'Usage: $0 profile'
	;;
esac
