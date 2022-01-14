if [ $DFWSL = "1" ]
    if not test -e ~/cmd.exe
        echo 'ERROR: Copy cmd.exe to the bin directory in your Users profile, and then create a symbolic link to it in ~/bin'
    else

        umask 022

        set -gx WINUSER (~/bin/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')
        set -gx WINHOME /c/Users/(~/bin/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')

        function cmd --wraps=cmd.exe
            ~/bin/cmd.exe
        end

        function code --wraps=code
            cmd /c code
        end

        function winhome
            cd $WINHOME
        end

        #set-gx DOCKER_HOST=tcp://localhost:2375

        winhome

    end
end