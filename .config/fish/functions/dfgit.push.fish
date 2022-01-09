function dfgit.push --wraps=git
    git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME" push
end