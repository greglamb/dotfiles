#!/usr/bin/env bash

DFOS="unknown"
DFWSL="na"
DFDISTRO="na"

# did you clone to ~/dotfiles?
# ask if they switched fonts first
# add to git config
# [include]
# path = ~/.gitconfig.d/index

# prepare path

cd "$(dirname "${BASH_SOURCE[0]}")"

HOMEDIR="$(realpath ~)"
REPODIR="$(realpath ../../)"

# prepare git repository

git --git-dir=$REPODIR/.git --work-tree=$HOMEDIR reset --hard
git --git-dir=$REPODIR/.git config --local status.showUntrackedFiles no

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
    #echo /usr/local/bin/fish | sudo tee -a /etc/shells
    #chsh -s /usr/local/bin/fish
    #https://stackoverflow.com/a/20506404
elif [ $DFOS == "linux" ] && [ $DFDISTRO == "ubuntu" ]; then
    sudo apt-add-repository ppa:fish-shell/release-3
    sudo apt update
    sudo apt install fish
    chsh -s /usr/bin/fish
fi

# install handoff

source ./install.fish
