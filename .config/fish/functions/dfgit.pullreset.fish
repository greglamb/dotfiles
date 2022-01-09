function dfgit.pull --wraps=git
    dfgit fetch --all
    dfgit reset --hard origin/master
end