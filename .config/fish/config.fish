set -g -x fish_greeting ''

if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path -mp $HOME/df.bin
