function gkeygit
    git -c core.sshCommand="ssh -i ~/.ssh/gregkey_rsa" $argv
end
