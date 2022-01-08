cd $HOME
git clone --bare git@github.com:greglamb/dotfiles.git $HOME/.dotfiles.git
function dtgit {
   /usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME $@
}
mkdir -p .predt-backup
dtgit checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    dtgit checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .predt-backup/{}
fi;
dtgit checkout
dtgit config status.showUntrackedFiles no