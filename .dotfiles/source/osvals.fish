#!/usr/bin/env fish

set -gx DFOS unknown
set -gx DFWSL na
set -gx DFDISTO na

switch (uname)
    case Linux
            set -gx DFOS linux

# https://fishshell.com/docs/current/cmds/string.html#
            switch (cat /etc/*-release | grep ^NAME= | sed 's/NAME=//' | sed 's/"//g')
                case Ubuntu
                    set -gx DFDISTO ubuntu
            end
            
            switch (uname -r)
                case '*microsoft-standard*'
                    set -gx DFWSL 2
                case '*Microsoft*'
                    set -gx DFWSL 1
            end

    case Darwin
            set -gx DFOS macos
end