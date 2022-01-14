#!/usr/bin/env bash

DFOS="unknown"
DFWSL="na"
DFDISTRO="na"

echo "Did you install the fonts?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) exit;;
    esac
done

# did you clone to ~/dotfiles?
# ask if they switched fonts first
# add to git config
# [include]
# path = ~/.gitconfig.d/index

# prepare path

cd "$(dirname "${BASH_SOURCE[0]}")"

HOMEDIR="$(realpath ~)"
REPODIR="$(realpath ../../)"

# detect mac vs linux

case "$OSTYPE" in
  darwin*)  DFOS="macos" ;; 
  linux*)   DFOS="linux" ;;
  *)        echo "Unsupported OS: $OSTYPE"; exit ;;
esac

# detect linux distribution and wsl

if [ $DFOS == "linux" ]; then
    case "`cat /etc/*-release | grep ^NAME= | sed 's/NAME=//' | sed 's/"//g'`" in
    Ubuntu)   DFDISTRO="ubuntu" ;;
    *)        echo "Unsupported distribution" ;;
    esac

    case "`uname -r`" in
        *microsoft-standard*) DFWSL="2" ;;
        *Microsoft*)          DFWSL="1" ;;
        *)                    echo "WSL not detected" ;;
    esac
fi

# install fish

if [ $DFOS == "macos" ]; then
    sudo port install fish
    sudo chpass -s /opt/local/bin/fish glamb
    sudo sh -c 'echo /opt/local/bin/fish >> /etc/shells'
    #sudo port install xsel
elif [ $DFOS == "linux" ] && [ $DFDISTRO == "ubuntu" ]; then
    sudo apt-add-repository ppa:fish-shell/release-3
    sudo apt update
    sudo apt install fish
    chsh -s /usr/bin/fish
fi

# install handoff

source ./install.fish
