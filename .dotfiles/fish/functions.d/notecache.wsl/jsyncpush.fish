function jsyncpush
    git -C $WINHOME/jrnl add work.txt
    git -C $WINHOME/jrnl commit -m "sync"
    git -C $WINHOME/jrnl push
end