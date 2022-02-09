function j
    set log (string replace --regex ' - ' '. ' $argv)
    jrnl $log
end