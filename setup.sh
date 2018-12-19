#!/bin/bash

sudo apt-get update

# Install packages in packages.list
cat packages.list | grep -v -E "#|^$" | xargs sudo apt-get -y install

# To check for packages installed with apt, execute the following:
# zgrep 'Commandline: apt' /var/log/apt/history.log /var/log/apt/history.log.*.gz
