#!/bin/bash

# Linux apps
echo "Install apps?"
read yes
if [[ $yes == y* ]]; then
    echo "Adding Yarn repo"
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

    echo "Updating apt"
    sudo apt update

    echo "Installing apps"
    sudo apt install \
        acpi-call-dkms \
        apt-transport-https \
        bleachbit \
        build-essential \
        chromium-browser \
        gnome-tweaks \
        gnupg-agent \
        gpa \
        htop \
        hub \
        libssl-dev \
        neofetch \
        powertop \
        python3-dev \
        python3-venv \
        seahorse \
        tlp \
        tlp-rdw \
        ttf-mscorefonts-installer \
        ubuntu-restricted-extras \
        vim \
        vlc \
        zsh \
        -y

    echo "Installing apps that don't require installing recommendations"
    sudo apt install --no-install-recommends \
        libpq-dev \
        libxml2-dev \
        libxslt1-dev \
        libldap2-dev \
        libsasl2-dev \
        libffi-dev \
        yarn \
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

# Kitty
echo "Install Kitty terminal?"
read yes
if [[ $yes == y* ]]; then
    cd ~/
    sudo apt install kitty
else
    echo "Not installing Kitty"
fi

# Linuxbrew
echo "Install Linuxbrew?"
read yes
if [[ $yes == y* ]]; then
    cd ~/
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >>~/.zprofile
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    brew install gcc
    export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/isl@0.18/lib"
    export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/isl@0.18/include"
else
    echo "Not installing Linuxbrew"
fi

# Docker
echo "Install Docker?"
read yes
if [[ $yes == y* ]]; then
    cd ~/
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    # Replace disco with $(lsb_release -cs) once Docker has updated for 19.10
    # GH issue: https://github.com/docker/for-linux/issues/833#issuecomment-544257796
    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    disco \
    stable"

    sudo apt update

    echo "Installing docker"
    sudo apt install docker-ce docker-ce-cli containerd.io

    echo "Installing docker-compose"
    sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
else
    echo "Not installing Docker"
fi

# PostgreSQL
echo "Install PostgreSQL? (Linuxbrew recommended)"
read yes
if [[ $yes == y* ]]; then
    brew install postgresql
    sudo mkdir /usr/local/var
    sudo mkdir /usr/local/var/postgres
    sudo chmod 775 /usr/local/var/postgres
    sudo chown $(whoami) /usr/local/var/postgres
    initdb /usr/local/var/postgres
else
    echo "Not installing PostgreSQL"
fi

# GDAL
echo "Install GDAL?"
read yes
if [[ $yes == y* ]]; then
    sudo apt install gdal-bin
else
    echo "Not installing GDAL"
fi
