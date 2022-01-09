function dfgit.pull --wraps=git
    git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME" pull
end