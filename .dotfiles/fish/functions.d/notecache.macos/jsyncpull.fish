function jsyncpull
    if test -d $HOME/jrnl/.git
        git -C $HOME/jrnl pull
    end
end
