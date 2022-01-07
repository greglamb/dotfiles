#!/usr/bin/env bash

OS="unknown"
WSLV="na"
DISTRO="na"

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
  darwin*)  OS="macos" ;; 
  linux*)   OS="linux" ;;
  *)        echo "Unsupported OS: $OSTYPE"; exit ;;
esac

# detect linux distribution and wsl

if [ $OS == "linux" ]; then
    case "`cat /etc/*-release | grep ^NAME= | sed 's/NAME=//' | sed 's/"//g'`" in
    Ubuntu)   DISTRO="ubuntu" ;;
    *)        echo "Unsupported distribution" ;;
    esac

    case "`uname -r`" in
        *microsoft-standard*) WSLV="2" ;;
        *Microsoft*)          WSLV="1" ;;
        *)                    echo "WSL not detected" ;;
    esac
fi

# install fish

if [ $OS == "macos" ]; then
    source ./components/macos/install_fish.sh
elif [ $OS == "linux" ] && [ $DISTRO == "ubuntu" ]; then
    source ./components/linux/ubuntu/install_fish.sh
fi

# install omf

source ./components/install_omf.fish

# install tide

source ./components/install_tide.fish

# install the latest git-completion script for bash"
#curl --create-dirs --location --output ~/.config/bash/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

