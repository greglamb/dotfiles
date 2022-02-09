function jrnlget
    jrnl --format markdown $argv | glow -s ~/.dotfiles/glowstyles/jrnl.json -
end
