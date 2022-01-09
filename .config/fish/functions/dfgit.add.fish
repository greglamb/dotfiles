function dfgit.add --wraps=git
    git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME" add $argv
end