function dfgit --wraps=git
    git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME" $argv
end