function dsyncpush
    for x in (find $HOME/Dendron -maxdepth 1 -type d)
        if test -d $x/.git
            git -C $x add -A
            git -C $x commit -m "sync"
            git -C $x push
        end
    end
end