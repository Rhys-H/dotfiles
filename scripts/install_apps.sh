#!/bin/bash

echo "Install apps?"
read yes
if [[ $yes == y* ]]; then
    sudo apt install \
        acpi-call-dkms \
        arc-theme \
        bleachbit \
        build-essential \
        chromium-browser \
        gnome-tweaks \
        gpa \
        htop \
        hub \
        neofetch \
        powertop \
        seahorse \
        tlp \
        tlp-rdw \
        ttf-mscorefonts-installer \
        ubuntu-restricted-extras \
        vim \
        vlc \
        zsh \
        -y
else
    echo "Not installing apps"
fi
