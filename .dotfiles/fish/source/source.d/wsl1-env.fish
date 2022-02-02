if [ $DFWSL = "1" ]
    if not test -e ~/bin/cmd.exe
        echo 'ERROR: Copy cmd.exe to the bin directory in your Users profile, and then create a symbolic link to it in ~/bin'
    else

        umask 022

        set -gx WINUSER (~/bin/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')
        set -gx WINHOME /mnt/c/Users/(~/bin/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')

        alias cmd="~/bin/cmd.exe /c"

        function code --wraps=code
            #cmd code $argv
            $WINHOME/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code $argv
        end

        function winhome
            cd $WINHOME
        end

        function noteshome
            cd $WINHOME/Dendron/
        end

        #set-gx DOCKER_HOST=tcp://localhost:2375

        home

    end
end
