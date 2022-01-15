for x in (find $DFDIR/fish/functions.d -maxdepth 1 -type d)
    set y (string split . $x)
    set t $y[-1]

    if test $t = d
        continue
    end

    if test $t = all
        set -a fish_function_path $x
    end

    if test $t = macos; and test $DFOS = macos
        set -a fish_function_path $x
    end

    if test $t = linux; and test $DFOS = linux
        set -a fish_function_path $x
    end

    if test $t = ubuntu; and test $DFDISTO = ubuntu
        set -a fish_function_path $x
    end

    if test $t = wsl1; and test $DFWSL = 1
        set -a fish_function_path $x
    end

    if test $t = wsl; and test $DFWSL = 1
        set -a fish_function_path $x
    end

    if test $t = wsl2; and test $DFWSL = 2
        set -a fish_function_path $x
    end

    if test $t = wsl; and test $DFWSL = 2
        set -a fish_function_path $x
    end

end
