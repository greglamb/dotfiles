function jsyncpush
    if test -d $HOME/jrnl/.git
        git -C $HOME/jrnl add work.txt
        git -C $HOME/jrnl commit -m sync
        git -C $HOME/jrnl push
    end
end
