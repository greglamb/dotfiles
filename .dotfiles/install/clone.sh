#!/usr/bin/env bash

cd $HOME
git clone --bare git@github.com:greglamb/dotfiles.git $HOME/.dotfiles.git
dtgit() { /usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME $@ }
mvdir() { mkdir -p "${@: -1}" && mv "$@"; }
mkdir -p .predt-backup
dtgit checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    dtgit checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mvdir {} .predt-backup/{}
fi;
dtgit checkout
dtgit config status.showUntrackedFiles no