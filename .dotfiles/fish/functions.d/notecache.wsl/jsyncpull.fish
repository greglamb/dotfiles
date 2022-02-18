function jsyncpull
    if test -d $WINHOME/jrnl/.git
        git -C $WINHOME/jrnl pull
    end
end
