function dsyncpull
    for x in (find $WINHOME/Dendron -maxdepth 1 -type d)
        if test -d $x/.git
            git -C $x pull
        end
    end
end