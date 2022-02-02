if [ $DFWSL = "2" ]
    if not test -e ~/bin/cmd.exe
        echo 'ERROR: Copy cmd.exe to the bin directory in your Users profile, and then create a symbolic link to it in ~/bin'
    else

        function code --wraps=code
            $WINHOME/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code $argv
        end

    end
end
