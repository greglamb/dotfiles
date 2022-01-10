set -g fish_greeting
status is-interactive || exit

set -gx DFDIR $HOME/.dotfiles
source $DFDIR/fish/source/index.fish
set -a fish_function_path $DFDIR/fish/functions
fish_add_path -mp $DFDIR/bin