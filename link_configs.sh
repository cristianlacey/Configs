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

# Only link .bash_profile if passed "tiger" arg.

case $1 in
    tiger)
	rm ~/.bash_profile
	ln ~/Configs/bash_profile ~/.bash_profile
	source ~/Configs/bash_profile
	;;
    *)
	source ~/Configs/bashrc
	printf 'To also link .bash_profile (on Tiger): %s tiger\n' $0
	;;
esac
