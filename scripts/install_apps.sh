#!/bin/bash

# Linux apps
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

# Zsh
echo "Install Oh My Zsh?"
read yes
if [[ $yes == y* ]]; then
    cd ~/
    # Oh my zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "Not installing Oh My Zsh"
fi
