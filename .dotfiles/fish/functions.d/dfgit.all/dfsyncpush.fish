function dfsyncpush
    dfgit add ~/.dotfiles
    dfgit.gc sync
    dfgit push --set-upstream origin master
end
