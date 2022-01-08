cd $HOME
git clone --bare git@github.com:greglamb/dotfiles.git $HOME/.dotfiles.git
function dtgit {
   /usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME $@
}
function mvp ()
{
    dir="$2" # Include a / at the end to indicate directory (not filename)
    tmp="$2"; tmp="${tmp: -1}"
    [ "$tmp" != "/" ] && dir="$(dirname "$2")"
    [ -a "$dir" ] ||
    mkdir -p "$dir" &&
    mv "$@"
}
mkdir -p .predt-backup
dtgit checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    dtgit checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mvp {} .predt-backup/{}
fi;
dtgit checkout
dtgit config status.showUntrackedFiles no