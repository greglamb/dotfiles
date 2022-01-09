function dfgit --wraps=git --description 'Manage dotfiles repository with home as working directory'
    git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME" $argv
end

function dfgit.add --wraps=git
    git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME" add $argv
end

function dfgit.push --wraps=git
    git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME" push $argv
end

function dfgit.status --wraps=git
    git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME" status $argv
end