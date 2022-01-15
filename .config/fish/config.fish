set -g fish_greeting
status is-interactive || exit

set -gx DFDIR $HOME/.dotfiles

source $DFDIR/fish/source/detect-os.fish
for x in (find $DFDIR/fish/source/source.d -type f -name '*.fish')
    source $x
end

fish_add_path -mp $DFDIR/bin
fish_add_path -mp $HOME/bin
fish_add_path -mp /opt/local/bin
