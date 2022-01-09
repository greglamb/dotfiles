set -g fish_greeting
status is-interactive || exit

set -x EDITOR nano

fish_add_path -mp $HOME/df.bin
