function dfsyncpush
    dfgit add ~/.dotfiles
    dfgit add ~/.gitconfig.d
    dfgit.gc sync
    dfgit push --set-upstream origin master
end
