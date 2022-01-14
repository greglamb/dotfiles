function dfsyncpush
    dfgit add ~/.dotfiles
    dfgit add ~/.gitconfig.d
    dfgit.gc sync
    dfgit push
end
