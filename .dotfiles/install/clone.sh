#!/usr/bin/env bash

function dtimvdir {
  echo moving "$1"
  mkdir -p "${@: -1}" && mv "$@"
}

function dtgit {
  /usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME "$@"
}

dtibackupdir="$HOME/.dotfiles.backup-"`date +"%Y%m%d_%H%M%S"`
cd $HOME
mkdir -p $dtibackupdir
mv $HOME/.dotfiles.git $dtibackupdir/
git clone --bare git@github.com:greglamb/dotfiles.git $HOME/.dotfiles.git
dtgit checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    export -f dtimvdir
    export dtibackupdir
    dtgit checkout 2>&1 | egrep "^\s" | awk {'print $1'} | xargs -I{} bash -c 'dtimvdir "{}" "$dtibackupdir"/"{}"'
fi;
dtgit checkout
dtgit config status.showUntrackedFiles no
