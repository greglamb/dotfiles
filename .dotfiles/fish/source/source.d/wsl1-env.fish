if [ $DFWSL = 1 ]
    if not test -e ~/bin/cmd.exe
        echo 'ERROR: Copy cmd.exe to the bin directory in your Users profile, and then create a symbolic link to it in ~/bin'
    else

        umask 022

        set -gx WINUSER (~/bin/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')
        set -gx WINHOME /mnt/c/Users/$WINUSER

        alias cmd="~/bin/cmd.exe /c"
        alias open="~/bin/explorer.exe"

        function code --wraps=code
            #cmd code $argv
            #$WINHOME/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code $argv
            /mnt/c/Program\ Files/Microsoft\ VS\ Code/bin/code $argv
        end

        function winhome
            cd $WINHOME
        end

        function noteshome
            cd $WINHOME/Dendron/
        end

        set -gx CONTAINERD_ADDRESS unix://var/run/docker.sock

        home

    end
end
