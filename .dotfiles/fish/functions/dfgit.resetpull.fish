function dfgit.resetpull --wraps=git
    dfgit reset --hard HEAD
    dfgit pull
end
