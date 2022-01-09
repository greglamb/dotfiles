function dfgit.pull --wraps=git
    dfgit reset --hard HEAD
    dfgit pull
end