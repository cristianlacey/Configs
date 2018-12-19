#!/bin/bash

apt-get update

# Install packages in packages.list
cat packages.list | xargs sudo apt-get -y install
