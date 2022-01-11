function folderfiletypes
    find . -type f | sed 's/.*\.//' | sort | uniq -c
end