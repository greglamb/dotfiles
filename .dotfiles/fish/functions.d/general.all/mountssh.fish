function mountssh
    sudo sshfs -o allow_other,defer_permissions $argv
end