function j
    set log (string replace -r  - . $argv)
    jrnl $log
end